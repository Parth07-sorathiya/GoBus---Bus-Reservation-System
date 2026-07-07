 -- Find stations that are a SOURCE (stop_no = 1) for one route but a MID/END stop on another route.
 SELECT s.station_id, s.station_name,
       SUM(CASE WHEN rs.stop_no = 1 THEN 1 ELSE 0 END) AS times_as_source,
       SUM(CASE WHEN rs.stop_no > 1 THEN 1 ELSE 0 END) AS times_as_mid_or_end
FROM STATION s
JOIN ROUTE_STATION rs ON rs.station_id = s.station_id
GROUP BY s.station_id, s.station_name
HAVING SUM(CASE WHEN rs.stop_no = 1 THEN 1 ELSE 0 END) >= 1
   AND SUM(CASE WHEN rs.stop_no > 1 THEN 1 ELSE 0 END) >= 1
ORDER BY s.station_id;
