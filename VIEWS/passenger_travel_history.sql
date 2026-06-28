 SELECT p.passenger_id,
    p.name,
    p.gender,
    p.passenger_type,
    tr.pnr,
    tr.seat_no,
    tr.passenger_fare,
    tk.booking_id,
    tk.ticket_status,
    r.route_name,
    s1.station_name AS source_station,
    s2.station_name AS destination_station,
    b.bus_type,
    b.reg_no,
    t.departure_date_time,
    t.arrival_date_time,
    t.trip_status
   FROM passenger p
     JOIN travels_on tr ON tr.passenger_id = p.passenger_id
     JOIN ticket tk ON tk.pnr::text = tr.pnr::text
     JOIN trip t ON t.bus_id = tk.bus_id AND t.route_id = tk.route_id AND t.departure_date_time = tk.departure_date_time
     JOIN route r ON r.route_id = t.route_id
     JOIN bus b ON b.bus_id = t.bus_id
     JOIN route_station rs1 ON rs1.route_id = r.route_id AND rs1.stop_no = 1
     JOIN station s1 ON s1.station_id = rs1.station_id
     JOIN route_station rs2 ON rs2.route_id = r.route_id AND rs2.stop_no = (( SELECT max(route_station.stop_no) AS max
           FROM route_station
          WHERE route_station.route_id = r.route_id))
     JOIN station s2 ON s2.station_id = rs2.station_id
  ORDER BY p.passenger_id, t.departure_date_time;