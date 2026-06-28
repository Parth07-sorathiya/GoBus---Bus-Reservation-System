
DECLARE
    v_bus_id                INTEGER;
    v_route_id              INTEGER;
    v_departure_date_time   TIMESTAMP;
BEGIN
    -- Get trip details from ticket of new PNR
    SELECT tk.bus_id, tk.route_id, tk.departure_date_time
    INTO v_bus_id, v_route_id, v_departure_date_time
    FROM ticket tk
    WHERE tk.pnr = NEW.pnr;

    -- Check if same passenger already exists on same trip
    -- under different PNR
    IF EXISTS (
        SELECT 1
        FROM travels_on tr
        JOIN ticket tk ON tk.pnr = tr.pnr
        WHERE tr.passenger_id          = NEW.passenger_id
          AND tk.bus_id                = v_bus_id
          AND tk.route_id              = v_route_id
          AND tk.departure_date_time   = v_departure_date_time
          AND tr.pnr                  != NEW.pnr
    ) THEN
        RAISE EXCEPTION 'Passenger % is already booked on this trip (Bus %, Route %, Departure %).',
                         NEW.passenger_id, v_bus_id, 
                         v_route_id, v_departure_date_time;
    END IF;

    RETURN NEW;
END;
