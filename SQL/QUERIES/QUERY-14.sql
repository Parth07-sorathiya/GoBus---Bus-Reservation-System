-- Find routes where the total fare collected from ADULT passengers is more than the total fare
--collected from NON-ADULT passengers on that same route
SELECT tk.route_id, r.route_name,
       SUM(CASE WHEN p.passenger_type = 'ADULT' 
                THEN tr.passenger_fare ELSE 0 END) AS adult_fare,
       SUM(CASE WHEN p.passenger_type != 'ADULT' 
                THEN tr.passenger_fare ELSE 0 END) AS non_adult_fare
FROM TICKET tk
JOIN ROUTE r        ON r.route_id        = tk.route_id
JOIN TRAVELS_ON tr  ON tr.pnr            = tk.pnr
JOIN PASSENGER p    ON p.passenger_id    = tr.passenger_id
GROUP BY tk.route_id, r.route_name
HAVING SUM(CASE WHEN p.passenger_type = 'ADULT' 
                THEN tr.passenger_fare ELSE 0 END)
     > SUM(CASE WHEN p.passenger_type != 'ADULT' 
                THEN tr.passenger_fare ELSE 0 END)
ORDER BY adult_fare DESC;
