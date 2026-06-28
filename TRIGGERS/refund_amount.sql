
DECLARE
    v_total_amount NUMERIC(10,2);
    v_discount_amount NUMERIC(10,2);
    v_actual_paid NUMERIC(10,2);
BEGIN
    -- Get total and discount amount from booking
    SELECT total_amount, discount_amount 
    INTO v_total_amount, v_discount_amount
    FROM BOOKING
    WHERE booking_id = NEW.booking_id;

    -- Actual paid = total - discount
    v_actual_paid := v_total_amount - v_discount_amount;

    -- Check refund amount does not exceed actual paid
    IF NEW.refund_amount > v_actual_paid THEN
        RAISE EXCEPTION 'Refund amount % cannot exceed actual paid amount % for booking %.',
                         NEW.refund_amount, v_actual_paid, NEW.booking_id;
    END IF;

    -- Check refund amount is not negative
    IF NEW.refund_amount < 0 THEN
        RAISE EXCEPTION 'Refund amount cannot be negative for booking %.', 
                         NEW.booking_id;
    END IF;

    RETURN NEW;
END;
