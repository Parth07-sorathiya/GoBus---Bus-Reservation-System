-- Display the following information for every trip:
--Bus Registration Number
--Route Name
--Departure Date & Time
--Total Seats
--Booked Seats
--Available Seats
--Sort the result by departure time.

SELECT
    b.reg_no,
    r.route_name,
    t.departure_date_time,

    COUNT(DISTINCT s.seat_no) AS total_seats,

    COUNT(DISTINCT tv.seat_no) AS booked_seats,

    COUNT(DISTINCT s.seat_no) - COUNT(DISTINCT tv.seat_no)
        AS available_seats

FROM trip t

JOIN bus b
ON t.bus_id = b.bus_id

JOIN route r
ON t.route_id = r.route_id

JOIN seat s
ON t.bus_id = s.bus_id

LEFT JOIN ticket ti
ON t.bus_id = ti.bus_id
AND t.route_id = ti.route_id
AND t.departure_date_time = ti.departure_date_time

LEFT JOIN travels_on tv
ON ti.pnr = tv.pnr
AND s.bus_id = tv.bus_id
AND s.seat_no = tv.seat_no

GROUP BY
    b.reg_no,
    r.route_name,
    t.departure_date_time

ORDER BY
    t.departure_date_time;

