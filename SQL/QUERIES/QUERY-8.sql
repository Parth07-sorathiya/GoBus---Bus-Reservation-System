--Display all routes for which no ticket has ever been booked.
SELECT
    r.route_id,
    r.route_name
FROM route r
WHERE NOT EXISTS
(
    SELECT 1
    FROM ticket t
    WHERE t.route_id = r.route_id
);
