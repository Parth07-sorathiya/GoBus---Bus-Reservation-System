-- find users who have registered on the plateform but have never booked a ticket 

	SELECT
    u.user_id,
    u.user_name,
    u.email,
    u.contact_no
FROM users u
WHERE NOT EXISTS
(
    SELECT 1
    FROM booking b
    WHERE b.user_id = u.user_id
);
