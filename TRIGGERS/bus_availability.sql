
BEGIN
    IF (SELECT bus_status FROM BUS WHERE bus_id = NEW.bus_id) != 'ACTIVE' THEN
        RAISE EXCEPTION 'Bus % is not ACTIVE. Cannot schedule a trip.', NEW.bus_id;
    END IF;
    RETURN NEW;
END;
