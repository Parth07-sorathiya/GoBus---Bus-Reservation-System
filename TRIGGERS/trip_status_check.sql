
DECLARE
    v_trip_status TEXT;
BEGIN
    SELECT trip_status INTO v_trip_status
    FROM TRIP
    WHERE bus_id             = NEW.bus_id
      AND route_id           = NEW.route_id
      AND departure_date_time = NEW.departure_date_time;

    IF v_trip_status IS NULL THEN
        RAISE EXCEPTION 'Trip does not exist for Bus %, Route %, Departure %.', 
                         NEW.bus_id, NEW.route_id, NEW.departure_date_time;
    END IF;

    IF v_trip_status != 'SCHEDULED' THEN
        RAISE EXCEPTION 'Cannot book ticket. Trip status is % for Bus %, Route %, Departure %.', 
                         v_trip_status, NEW.bus_id, NEW.route_id, NEW.departure_date_time;
    END IF;

    RETURN NEW;
END;
