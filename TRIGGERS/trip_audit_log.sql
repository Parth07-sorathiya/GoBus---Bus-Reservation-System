
BEGIN
    -- Only log when status actually changes
    IF OLD.trip_status != NEW.trip_status THEN
        INSERT INTO trip_audit_log
               (bus_id, route_id, departure_date_time,
                old_status, new_status, changed_at)
        VALUES (OLD.bus_id, OLD.route_id, OLD.departure_date_time,
                OLD.trip_status, NEW.trip_status, NOW());
    END IF;

    RETURN NEW;
END;
