-- For each operator, find the bus that carried the most passengers across all trips

SELECT o.operator_id, o.operator_name,
       b.bus_id, b.reg_no,
       COUNT(tr.passenger_id) AS total_passengers
FROM OPERATOR o
JOIN BUS b ON b.operator_id = o.operator_id
JOIN TRIP t ON t.bus_id = b.bus_id
JOIN TICKET tk ON tk.bus_id = t.bus_id
             AND tk.route_id = t.route_id
             AND tk.departure_date_time = t.departure_date_time
JOIN TRAVELS_ON tr ON tr.pnr = tk.pnr
GROUP BY o.operator_id, o.operator_name, b.bus_id, b.reg_no
HAVING COUNT(tr.passenger_id) = (
    SELECT MAX(passenger_count)
    FROM (
        SELECT b2.bus_id,
               COUNT(tr2.passenger_id) AS passenger_count
        FROM BUS b2
        JOIN TRIP t2 ON t2.bus_id = b2.bus_id
        JOIN TICKET tk2 ON tk2.bus_id = t2.bus_id
                       AND tk2.route_id = t2.route_id
                       AND tk2.departure_date_time = t2.departure_date_time
        JOIN TRAVELS_ON tr2 ON tr2.pnr = tk2.pnr
        WHERE b2.operator_id = o.operator_id
        GROUP BY b2.bus_id
    ) AS bus_counts
);
