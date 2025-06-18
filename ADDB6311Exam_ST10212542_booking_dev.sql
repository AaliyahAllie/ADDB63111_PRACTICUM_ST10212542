CREATE OR REPLACE TRIGGER trg_prevent_invalid_booking
BEFORE INSERT ON BOOKINGS
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
BEGIN
    v_day := TO_CHAR(:NEW.BOOKING_DATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');

    IF v_day IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Bookings cannot be made on weekends.');
    END IF;
END;
/
