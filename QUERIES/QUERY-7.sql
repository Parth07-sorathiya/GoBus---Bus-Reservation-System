--Display all users whose total amount spent is greater than the average amount spent by all users

SELECT
    u.user_id,
    u.user_name,
    SUM(b.total_amount - b.discount_amount) AS total_spent
FROM users u
JOIN booking b
ON u.user_id = b.user_id
WHERE b.booking_status = 'CONFIRMED'
GROUP BY
    u.user_id,
    u.user_name
HAVING
    SUM(b.total_amount - b.discount_amount) >
(
    SELECT
        AVG(total_spent)
    FROM
    (
        SELECT
            SUM(total_amount - discount_amount) AS total_spent
        FROM booking
        WHERE booking_status = 'CONFIRMED'
        GROUP BY user_id
    ) AS avg_table
);
