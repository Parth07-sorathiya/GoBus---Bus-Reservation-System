--Find Passengers Who Have Travelled on More Than One Route
--Display the following information:

--Passenger ID
--Passenger Name
--Number of Different Routes Travelled

--Only show passengers who have travelled on more than one route.

--Sort by highest number of routes travelled.

SELECT
    p.passenger_id,
    p.name,

    COUNT(DISTINCT t.route_id) AS total_routes

FROM passenger p

JOIN travels_on tv
ON p.passenger_id = tv.passenger_id

JOIN ticket t
ON tv.pnr = t.pnr

GROUP BY
    p.passenger_id,
    p.name

HAVING
    COUNT( t.route_id) > 1

ORDER BY
    total_routes DESC;
