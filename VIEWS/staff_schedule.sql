 SELECT s.staff_id,
    s.name,
    s.role,
    s.contact_no,
    s.staff_status,
    t.bus_id,
    b.reg_no,
    b.bus_type,
    r.route_name,
    st1.station_name AS source_station,
    st2.station_name AS destination_station,
    t.departure_date_time,
    t.arrival_date_time,
    t.trip_status,
    EXTRACT(epoch FROM t.arrival_date_time - t.departure_date_time) / 3600::numeric AS trip_duration_hours
   FROM staff s
     JOIN trip_staff ts ON ts.staff_id = s.staff_id
     JOIN trip t ON t.bus_id = ts.bus_id AND t.route_id = ts.route_id AND t.departure_date_time = ts.departure_date_time
     JOIN bus b ON b.bus_id = t.bus_id
     JOIN route r ON r.route_id = t.route_id
     JOIN route_station rs1 ON rs1.route_id = r.route_id AND rs1.stop_no = 1
     JOIN station st1 ON st1.station_id = rs1.station_id
     JOIN route_station rs2 ON rs2.route_id = r.route_id AND rs2.stop_no = (( SELECT max(route_station.stop_no) AS max
           FROM route_station
          WHERE route_station.route_id = r.route_id))
     JOIN station st2 ON st2.station_id = rs2.station_id
  ORDER BY s.staff_id, t.departure_date_time;