 SELECT b.bus_id,
    b.reg_no,
    b.bus_type,
    b.bus_status,
    o.operator_name,
    count(DISTINCT t.departure_date_time) AS total_trips,
    count(DISTINCT tk.pnr) AS total_tickets,
    count(DISTINCT tr.passenger_id) AS total_passengers,
    sum(tr.passenger_fare) AS total_fare_collected,
    count(DISTINCT s.seat_no) AS total_seats,
        CASE
            WHEN count(DISTINCT s.seat_no) = 0 THEN 0::numeric
            ELSE round(count(DISTINCT tr.passenger_id)::numeric / (count(DISTINCT s.seat_no) * NULLIF(count(DISTINCT t.departure_date_time), 0))::numeric * 100::numeric, 2)
        END AS occupancy_percentage
   FROM bus b
     JOIN operator o ON o.operator_id = b.operator_id
     JOIN seat s ON s.bus_id = b.bus_id
     LEFT JOIN trip t ON t.bus_id = b.bus_id
     LEFT JOIN ticket tk ON tk.bus_id = t.bus_id AND tk.route_id = t.route_id AND tk.departure_date_time = t.departure_date_time
     LEFT JOIN travels_on tr ON tr.pnr::text = tk.pnr::text
  GROUP BY b.bus_id, b.reg_no, b.bus_type, b.bus_status, o.operator_name
  ORDER BY (count(DISTINCT tr.passenger_id)) DESC NULLS LAST;