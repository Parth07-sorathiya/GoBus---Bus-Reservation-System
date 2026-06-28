
DECLARE
    v_trip_status TEXT;
BEGIN
    -- Only fire when booking_status changes TO CANCELLED
    IF NEW.booking_status = 'CANCELLED' AND OLD.booking_status != 'CANCELLED' THEN

        -- STEP 1: Check trip status via ticket
        SELECT t.trip_status INTO v_trip_status
        FROM TRIP t
        JOIN TICKET tk ON tk.bus_id             = t.bus_id
                      AND tk.route_id           = t.route_id
                      AND tk.departure_date_time = t.departure_date_time
        WHERE tk.booking_id = NEW.booking_id
        LIMIT 1;

        -- STEP 2: Block if trip is COMPLETED or IN_PROGRESS
        IF v_trip_status = 'COMPLETED' THEN
            RAISE EXCEPTION 'Cannot cancel booking %. Trip is already COMPLETED.', 
                             NEW.booking_id;
        END IF;

        IF v_trip_status = 'IN_PROGRESS' THEN
            RAISE EXCEPTION 'Cannot cancel booking %. Trip is IN PROGRESS.', 
                             NEW.booking_id;
        END IF;

        -- STEP 3: Update all tickets of this booking to CANCELLED
        UPDATE TICKET
        SET ticket_status = 'CANCELLED'
        WHERE booking_id = NEW.booking_id;

        -- STEP 4: Set is_active = FALSE for all passengers under this booking
        UPDATE PASSENGER
        SET is_active = FALSE
        WHERE passenger_id IN (
            SELECT tr.passenger_id
            FROM TRAVELS_ON tr
            JOIN TICKET tk ON tk.pnr = tr.pnr
            WHERE tk.booking_id = NEW.booking_id
        );

    END IF;

    RETURN NEW;
END;
