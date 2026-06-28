
BEGIN
    -- Only log when status actually changes
    IF OLD.booking_status != NEW.booking_status THEN
        INSERT INTO booking_audit_log 
               (booking_id, old_status, new_status, changed_at)
        VALUES (OLD.booking_id, OLD.booking_status, 
                NEW.booking_status, NOW());
    END IF;

    RETURN NEW;
END;
