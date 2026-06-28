 SELECT t.bus_id,
    t.route_id,
    r.route_name,
    b.reg_no,
    b.bus_type,
    o.operator_name,
    t.departure_date_time,
    t.arrival_date_time,
    t.trip_status,
    count(tk.pnr) AS total_tickets_booked
   FROM trip t
     JOIN route r ON r.route_id = t.route_id
     JOIN bus b ON b.bus_id = t.bus_id
     JOIN operator o ON o.operator_id = b.operator_id
     LEFT JOIN ticket tk ON tk.bus_id = t.bus_id AND tk.route_id = t.route_id AND tk.departure_date_time = t.departure_date_time
  WHERE t.trip_status = ANY (ARRAY['SCHEDULED'::trip_status_enum, 'DELAYED'::trip_status_enum, 'IN_PROGRESS'::trip_status_enum])
  GROUP BY t.bus_id, t.route_id, r.route_name, b.reg_no, b.bus_type, o.operator_name, t.departure_date_time, t.arrival_date_time, t.trip_status
  ORDER BY t.departure_date_time;