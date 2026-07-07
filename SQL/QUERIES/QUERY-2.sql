-- Display the complete passenger manifest for a particular trip having:
--  PNR,passenger Name ,Seat Number, Seat Type,Passenger Fare,Booking Date,Ticket Status,User Name (who booked the ticket)
SELECT
    t.pnr,
    u.user_name,
    p.name AS passenger_name,
    tv.seat_no,
    s.seat_type,
    tv.passenger_fare,
    b.booking_date,
    t.ticket_status
FROM ticket t

JOIN booking b
ON t.booking_id = b.booking_id

JOIN users u
ON b.user_id = u.user_id

JOIN travels_on tv
ON t.pnr = tv.pnr

JOIN passenger p
ON tv.passenger_id = p.passenger_id

JOIN seat s
ON tv.bus_id = s.bus_id
AND tv.seat_no = s.seat_no

ORDER BY tv.seat_no;
