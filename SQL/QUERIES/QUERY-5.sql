-- The company owner wants to compare the performance of all bus operators.
	--For each operator, display:

--Operator Name
--Total Number of Buses
--Total Number of Trips
--Total Revenue Generated
--Total Passengers Travelled
--Sort the report by highest revenue
SELECT 
o.operator_name,
COUNT(DISTINCT b.bus_id) AS total_buses,
COUNT(DISTINCT(
   t.bus_id,t.route_id,t.departure_date_time
)) AS total_trips,
COUNT(tv.passenger_id) AS total_passengers,
SUM(tv.passenger_fare) AS total_revenue

FROM operator o
JOIN bus b 
ON b.operator_id=o.operator_id

LEFT JOIN trip t 
ON b.bus_id=t.bus_id

LEFT JOIN ticket ti
ON ti.bus_id=t.bus_id 
AND ti.route_id=t.route_id
AND ti.departure_date_time=t.departure_date_time

LEFT JOIN travels_on tv
ON tv.pnr=ti.pnr
GROUP BY 
o.operator_name,
o.operator_id
ORDER BY
    total_revenue DESC;
