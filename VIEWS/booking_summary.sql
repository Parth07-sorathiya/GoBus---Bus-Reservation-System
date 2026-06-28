 SELECT u.user_id,
    u.user_name,
    u.email,
    b.booking_id,
    b.booking_date,
    b.booking_status,
    b.total_amount,
    b.discount_amount,
    b.total_amount - b.discount_amount AS amount_paid,
    p.transaction_id,
    p.payment_method,
    p.payment_status,
    tk.pnr,
    tk.ticket_status,
    r.route_name,
    t.departure_date_time,
    t.arrival_date_time,
    t.trip_status
   FROM users u
     JOIN booking b ON b.user_id = u.user_id
     LEFT JOIN payment p ON p.booking_id = b.booking_id
     LEFT JOIN ticket tk ON tk.booking_id = b.booking_id
     LEFT JOIN trip t ON t.bus_id = tk.bus_id AND t.route_id = tk.route_id AND t.departure_date_time = tk.departure_date_time
     LEFT JOIN route r ON r.route_id = t.route_id
  ORDER BY b.booking_date DESC, u.user_id;