
BEGIN
    IF EXISTS (
        SELECT 1
        FROM TRAVELS_ON tr
        JOIN TICKET tk ON tk.pnr = tr.pnr
        WHERE tr.bus_id  = NEW.bus_id
          AND tr.seat_no = NEW.seat_no
          AND tk.departure_date_time = (
              SELECT departure_date_time
              FROM TICKET
              WHERE pnr = NEW.pnr
          )
    ) THEN
        RAISE EXCEPTION 'Seat % on Bus % is already booked for this trip.', 
                         NEW.seat_no, NEW.bus_id;
    END IF;
    RETURN NEW;
END;
