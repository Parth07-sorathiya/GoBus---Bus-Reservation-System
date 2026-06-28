-- Find users whose every single booking is CONFIRMED (no cancellation, no pending at all

SELECT u.user_id, u.user_name,
       COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN BOOKING b ON b.user_id = u.user_id
GROUP BY u.user_id, u.user_name
HAVING COUNT(b.booking_id) = SUM(
    CASE WHEN b.booking_status = 'CONFIRMED' THEN 1 ELSE 0 END
)
ORDER BY total_bookings DESC;

