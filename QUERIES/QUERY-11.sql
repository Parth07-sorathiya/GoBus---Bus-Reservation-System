-- Find which seat type is preferred the most by passengers.

SELECT
    s.seat_type,
    COUNT(*) AS total_bookings
FROM seat s
JOIN travels_on t
ON s.bus_id = t.bus_id
AND s.seat_no = t.seat_no
GROUP BY
    s.seat_type
ORDER BY
    total_bookings DESC;
