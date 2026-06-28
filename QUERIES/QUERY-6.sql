
-- Find users who were referred by someone, and have spent more than the person who referred them
SELECT u.user_id, u.user_name,
       SUM(b.total_amount - b.discount_amount)  AS referred_user_spent,
       ref.user_id                               AS referrer_id,
       ref.user_name                             AS referrer_name,
       SUM(b2.total_amount - b2.discount_amount) AS referrer_spent
FROM users u
JOIN users ref ON ref.user_id = u.referred_by
JOIN BOOKING b  ON b.user_id  = u.user_id
               AND b.booking_status = 'CONFIRMED'
JOIN BOOKING b2 ON b2.user_id = ref.user_id
               AND b2.booking_status = 'CONFIRMED'
GROUP BY u.user_id, u.user_name, ref.user_id, ref.user_name
HAVING SUM(b.total_amount - b.discount_amount) > 
       SUM(b2.total_amount - b2.discount_amount)
ORDER BY referred_user_spent DESC;
