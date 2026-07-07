-- find all routs where total number of routes  is more than 2 
SELECT r.route_id, r.route_name, 
       COUNT(rs.station_id) AS total_stops
FROM ROUTE r
JOIN ROUTE_STATION rs ON rs.route_id = r.route_id
GROUP BY r.route_id, r.route_name
HAVING COUNT(rs.station_id) > 2
ORDER BY total_stops DESC;