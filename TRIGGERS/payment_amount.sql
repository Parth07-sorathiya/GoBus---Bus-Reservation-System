
DECLARE
    v_total_amount      NUMERIC(10,2);
    v_discount_amount   NUMERIC(10,2);
    v_expected_amount   NUMERIC(10,2);
BEGIN
    -- Get total and discount from booking
    SELECT total_amount, discount_amount
    INTO v_total_amount, v_discount_amount
    FROM booking
    WHERE booking_id = NEW.booking_id;

    -- Calculate expected payment amount
    v_expected_amount := v_total_amount - v_discount_amount;

    -- Check if payment amount matches expected amount
    IF NEW.amount != v_expected_amount THEN
        RAISE EXCEPTION 'Payment amount % does not match expected amount % for booking %. (Total=% Discount=%)',
                         NEW.amount, v_expected_amount, NEW.booking_id,
                         v_total_amount, v_discount_amount;
    END IF;

    RETURN NEW;
END;
