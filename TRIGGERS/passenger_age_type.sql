
DECLARE
    v_age INT;
BEGIN
    -- Calculate age from DOB
    v_age := EXTRACT(YEAR FROM AGE(NOW(), NEW.dob));

    IF NEW.passenger_type = 'CHILD' AND v_age >= 18 THEN
        RAISE EXCEPTION 'Passenger age is %. Cannot assign CHILD type (must be under 18).', v_age;
    END IF;

    IF NEW.passenger_type = 'ADULT' AND (v_age < 18 OR v_age >= 60) THEN
        RAISE EXCEPTION 'Passenger age is %. Cannot assign ADULT type (must be between 18 and 59).', v_age;
    END IF;

    IF NEW.passenger_type = 'SENIOR_CITIZEN' AND v_age < 60 THEN
        RAISE EXCEPTION 'Passenger age is %. Cannot assign SENIOR_CITIZEN type (must be 60 or above).', v_age;
    END IF;

    RETURN NEW;
END;
