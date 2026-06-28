
DECLARE
    v_departure     TIMESTAMP;
    v_arrival       TIMESTAMP;
BEGIN
    -- Get departure and arrival of the new trip
    SELECT departure_date_time, arrival_date_time
    INTO v_departure, v_arrival
    FROM trip
    WHERE bus_id              = NEW.bus_id
      AND route_id            = NEW.route_id
      AND departure_date_time = NEW.departure_date_time;

    -- Check if same staff already has overlapping trip
    IF EXISTS (
        SELECT 1
        FROM trip_staff ts
        JOIN trip t ON t.bus_id              = ts.bus_id
                   AND t.route_id            = ts.route_id
                   AND t.departure_date_time = ts.departure_date_time
        WHERE ts.staff_id = NEW.staff_id
          AND t.trip_status NOT IN ('COMPLETED', 'CANCELLED')
          AND (
              -- New trip starts during existing trip
              (v_departure >= t.departure_date_time AND v_departure < t.arrival_date_time)
              OR
              -- New trip ends during existing trip
              (v_arrival > t.departure_date_time AND v_arrival <= t.arrival_date_time)
              OR
              -- New trip completely covers existing trip
              (v_departure <= t.departure_date_time AND v_arrival >= t.arrival_date_time)
          )
    ) THEN
        RAISE EXCEPTION 'Staff % already has an overlapping trip during this time window.',
                         NEW.staff_id;
    END IF;

    RETURN NEW;
END;
