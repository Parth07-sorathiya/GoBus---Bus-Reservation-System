-- GoBus Reservation System
-- Seed Data Script
-- PostgreSQL
-- Note: Uses OVERRIDING SYSTEM VALUE for identity columns
-- Run DDL_script.sql before running this file

-- -----------------------------------------------
-- OPERATOR
-- -----------------------------------------------

INSERT INTO operator (operator_id, operator_name, email, contact_no, area, city, pincode)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'GSRTC',              'gsrtc@gobus.com',   '9876500001', 'Paldi',        'Ahmedabad', '380007'),
(2, 'Patel Travels',      'patel@gobus.com',   '9876500002', 'Kalavad Road', 'Rajkot',    '360005'),
(3, 'Shree Maruti Travels','maruti@gobus.com',  '9876500003', 'Athwa',        'Surat',     '395001');

-- -----------------------------------------------
-- BUS
-- -----------------------------------------------

INSERT INTO bus (bus_id, operator_id, reg_no, bus_type, bus_status)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'GJ01AB1234', 'SEATER',      'ACTIVE'),
(2, 1, 'GJ01AB5678', 'SLEEPER',     'ACTIVE'),
(3, 2, 'GJ03CD1122', 'SEMI_SLEEPER','ACTIVE'),
(4, 2, 'GJ03CD3344', 'SEATER',      'UNDER_MAINTENANCE'),
(5, 3, 'GJ05EF7788', 'SLEEPER',     'ACTIVE'),
(6, 3, 'GJ05EF9900', 'SEATER',      'ACTIVE');

-- -----------------------------------------------
-- SEAT
-- -----------------------------------------------

INSERT INTO seat (bus_id, seat_no, seat_type) VALUES
(1, 'A01', 'WINDOW-SEATER'),
(2, 'A01', 'WINDOW-SEATER'),
(3, 'A01', 'WINDOW-SEATER'),
(4, 'A01', 'WINDOW-SEATER'),
(5, 'A01', 'WINDOW-SEATER'),
(6, 'A01', 'WINDOW-SEATER'),
(1, 'A02', 'AISLE-SEATER'),
(2, 'A02', 'AISLE-SEATER'),
(3, 'A02', 'AISLE-SEATER'),
(4, 'A02', 'AISLE-SEATER'),
(5, 'A02', 'AISLE-SEATER'),
(6, 'A02', 'AISLE-SEATER'),
(1, 'A03', 'MIDDLE-SEATER'),
(2, 'A03', 'MIDDLE-SEATER'),
(3, 'A03', 'MIDDLE-SEATER'),
(4, 'A03', 'MIDDLE-SEATER'),
(5, 'A03', 'MIDDLE-SEATER'),
(6, 'A03', 'MIDDLE-SEATER'),
(1, 'A04', 'WINDOW-SEATER'),
(2, 'A04', 'WINDOW-SEATER'),
(3, 'A04', 'WINDOW-SEATER'),
(4, 'A04', 'WINDOW-SEATER'),
(5, 'A04', 'WINDOW-SEATER'),
(6, 'A04', 'WINDOW-SEATER'),
(1, 'A05', 'AISLE-SEATER'),
(2, 'A05', 'AISLE-SEATER'),
(3, 'A05', 'AISLE-SEATER'),
(4, 'A05', 'AISLE-SEATER'),
(5, 'A05', 'AISLE-SEATER'),
(6, 'A05', 'AISLE-SEATER'),
(1, 'A06', 'MIDDLE-SEATER'),
(2, 'A06', 'MIDDLE-SEATER'),
(3, 'A06', 'MIDDLE-SEATER'),
(4, 'A06', 'MIDDLE-SEATER'),
(5, 'A06', 'MIDDLE-SEATER'),
(6, 'A06', 'MIDDLE-SEATER'),
(1, 'A07', 'WINDOW-SEATER'),
(2, 'A07', 'WINDOW-SEATER'),
(3, 'A07', 'WINDOW-SEATER'),
(4, 'A07', 'WINDOW-SEATER'),
(5, 'A07', 'WINDOW-SEATER'),
(6, 'A07', 'WINDOW-SEATER'),
(1, 'A08', 'AISLE-SEATER'),
(2, 'A08', 'AISLE-SEATER'),
(3, 'A08', 'AISLE-SEATER'),
(4, 'A08', 'AISLE-SEATER'),
(5, 'A08', 'AISLE-SEATER'),
(6, 'A08', 'AISLE-SEATER'),
(1, 'A09', 'MIDDLE-SEATER'),
(2, 'A09', 'MIDDLE-SEATER'),
(3, 'A09', 'MIDDLE-SEATER'),
(4, 'A09', 'MIDDLE-SEATER'),
(5, 'A09', 'MIDDLE-SEATER'),
(6, 'A09', 'MIDDLE-SEATER'),
(1, 'A10', 'WINDOW-SEATER'),
(2, 'A10', 'WINDOW-SEATER'),
(3, 'A10', 'WINDOW-SEATER'),
(4, 'A10', 'WINDOW-SEATER'),
(5, 'A10', 'WINDOW-SEATER'),
(6, 'A10', 'WINDOW-SEATER'),
(1, 'A11', 'WINDOW-SLEEPER'),
(2, 'A11', 'WINDOW-SLEEPER'),
(3, 'A11', 'WINDOW-SLEEPER'),
(4, 'A11', 'WINDOW-SLEEPER'),
(5, 'A11', 'WINDOW-SLEEPER'),
(6, 'A11', 'WINDOW-SLEEPER'),
(1, 'A12', 'AISLE-SLEEPER'),
(2, 'A12', 'AISLE-SLEEPER'),
(3, 'A12', 'AISLE-SLEEPER'),
(4, 'A12', 'AISLE-SLEEPER'),
(5, 'A12', 'AISLE-SLEEPER'),
(6, 'A12', 'AISLE-SLEEPER'),
(1, 'A13', 'MIDDLE-SLEEPER'),
(2, 'A13', 'MIDDLE-SLEEPER'),
(3, 'A13', 'MIDDLE-SLEEPER'),
(4, 'A13', 'MIDDLE-SLEEPER'),
(5, 'A13', 'MIDDLE-SLEEPER'),
(6, 'A13', 'MIDDLE-SLEEPER'),
(1, 'A14', 'WINDOW-SLEEPER'),
(2, 'A14', 'WINDOW-SLEEPER'),
(3, 'A14', 'WINDOW-SLEEPER'),
(4, 'A14', 'WINDOW-SLEEPER'),
(5, 'A14', 'WINDOW-SLEEPER'),
(6, 'A14', 'WINDOW-SLEEPER'),
(1, 'A15', 'AISLE-SLEEPER'),
(2, 'A15', 'AISLE-SLEEPER'),
(3, 'A15', 'AISLE-SLEEPER'),
(4, 'A15', 'AISLE-SLEEPER'),
(5, 'A15', 'AISLE-SLEEPER'),
(6, 'A15', 'AISLE-SLEEPER'),
(1, 'A16', 'MIDDLE-SLEEPER'),
(2, 'A16', 'MIDDLE-SLEEPER'),
(3, 'A16', 'MIDDLE-SLEEPER'),
(4, 'A16', 'MIDDLE-SLEEPER'),
(5, 'A16', 'MIDDLE-SLEEPER'),
(6, 'A16', 'MIDDLE-SLEEPER'),
(1, 'A17', 'WINDOW-SLEEPER'),
(2, 'A17', 'WINDOW-SLEEPER'),
(3, 'A17', 'WINDOW-SLEEPER'),
(4, 'A17', 'WINDOW-SLEEPER'),
(5, 'A17', 'WINDOW-SLEEPER'),
(6, 'A17', 'WINDOW-SLEEPER'),
(1, 'A18', 'AISLE-SLEEPER'),
(2, 'A18', 'AISLE-SLEEPER'),
(3, 'A18', 'AISLE-SLEEPER'),
(4, 'A18', 'AISLE-SLEEPER'),
(5, 'A18', 'AISLE-SLEEPER'),
(6, 'A18', 'AISLE-SLEEPER'),
(1, 'A19', 'MIDDLE-SLEEPER'),
(2, 'A19', 'MIDDLE-SLEEPER'),
(3, 'A19', 'MIDDLE-SLEEPER'),
(4, 'A19', 'MIDDLE-SLEEPER'),
(5, 'A19', 'MIDDLE-SLEEPER'),
(6, 'A19', 'MIDDLE-SLEEPER'),
(1, 'A20', 'WINDOW-SLEEPER'),
(2, 'A20', 'WINDOW-SLEEPER'),
(3, 'A20', 'WINDOW-SLEEPER'),
(4, 'A20', 'WINDOW-SLEEPER'),
(5, 'A20', 'WINDOW-SLEEPER'),
(6, 'A20', 'WINDOW-SLEEPER');

-- -----------------------------------------------
-- STATION
-- -----------------------------------------------

INSERT INTO station (station_id, station_name, area, city, pincode)
OVERRIDING SYSTEM VALUE
VALUES
(1,  'Ahmedabad',     'Geeta Mandir', 'Ahmedabad',     '380022'),
(2,  'Nadiad',        'Central',      'Nadiad',         '387001'),
(3,  'Anand',         'V V Nagar',    'Anand',          '388001'),
(4,  'Vadodara',      'Central',      'Vadodara',       '390001'),
(5,  'Rajkot',        'Central',      'Rajkot',         '360001'),
(6,  'Bhavnagar',     'Central',      'Bhavnagar',      '364001'),
(7,  'Bhuj',          'Central',      'Bhuj',           '370001'),
(8,  'Surat',         'Central',      'Surat',          '395001'),
(9,  'Junagadh',      'Central',      'Junagadh',       '362001'),
(10, 'Mehsana',       'Central',      'Mehsana',        '384001'),
(11, 'Gandhinagar',   'Sector 11',    'Gandhinagar',    '382011'),
(12, 'Morbi',         'Central',      'Morbi',          '363641'),
(13, 'Surendranagar', 'Central',      'Surendranagar',  '363001'),
(14, 'Palanpur',      'Central',      'Palanpur',       '385001'),
(15, 'Himmatnagar',   'Central',      'Himmatnagar',    '383001');

-- -----------------------------------------------
-- ROUTE
-- -----------------------------------------------

INSERT INTO route (route_id, route_name)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Ahmedabad → Rajkot'),
(2, 'Ahmedabad → Bhuj'),
(3, 'Surat → Ahmedabad'),
(4, 'Rajkot → Bhavnagar'),
(5, 'Ahmedabad → Gandhinagar'),
(6, 'Rajkot → Morbi → Surendranagar'),
(7, 'Mehsana → Palanpur → Himmatnagar');

-- -----------------------------------------------
-- ROUTE_STATION
-- -----------------------------------------------

INSERT INTO route_station (route_id, station_id, stop_no, duration_from_source) VALUES
(1, 1,  1,   0),
(1, 2,  2,  60),
(1, 3,  3,  90),
(1, 4,  4, 150),
(1, 5,  5, 300),
(2, 1,  1,   0),
(2, 4,  2, 150),
(2, 5,  3, 300),
(2, 7,  4, 480),
(3, 8,  1,   0),
(3, 4,  2, 150),
(3, 1,  3, 270),
(4, 5,  1,   0),
(4, 6,  2, 120),
(5, 1,  1,   0),
(5, 11, 2,  30),
(6, 5,  1,   0),
(6, 12, 2,  90),
(6, 13, 3, 180),
(7, 10, 1,   0),
(7, 14, 2,  75),
(7, 15, 3, 150);

-- -----------------------------------------------
-- TRIP
-- -----------------------------------------------

INSERT INTO trip (bus_id, route_id, departure_date_time, arrival_date_time, trip_status) VALUES
(2, 2, '2026-07-20 09:00:00', '2026-07-20 17:00:00', 'SCHEDULED'),
(5, 4, '2026-07-20 10:00:00', '2026-07-20 12:30:00', 'SCHEDULED'),
(6, 1, '2026-07-21 08:00:00', '2026-07-21 13:00:00', 'SCHEDULED'),
(1, 2, '2026-07-22 06:30:00', '2026-07-22 14:30:00', 'SCHEDULED'),
(3, 4, '2026-07-22 11:00:00', '2026-07-22 13:30:00', 'DELAYED'),
(5, 3, '2026-07-23 15:00:00', '2026-07-23 19:30:00', 'SCHEDULED'),
(4, 5, '2026-07-25 06:00:00', '2026-07-25 06:45:00', 'SCHEDULED'),
(6, 6, '2026-07-26 08:00:00', '2026-07-26 11:00:00', 'SCHEDULED'),
(3, 3, '2026-07-20 07:30:00', '2026-07-20 12:00:00', 'SCHEDULED'),
(1, 1, '2026-07-20 08:00:00', '2026-07-20 13:00:00', 'SCHEDULED');

-- -----------------------------------------------
-- STAFF
-- -----------------------------------------------

INSERT INTO staff (staff_id, name, role, contact_no, licence_no, staff_status)
OVERRIDING SYSTEM VALUE
VALUES
(1,  'Ramesh Patel',   'DRIVER',    '9876501001', 'DL-GJ-1001', 'ACTIVE'),
(2,  'Mahesh Shah',    'DRIVER',    '9876501002', 'DL-GJ-1002', 'ACTIVE'),
(3,  'Suresh Parmar',  'DRIVER',    '9876501003', 'DL-GJ-1003', 'ACTIVE'),
(4,  'Ketan Joshi',    'CONDUCTOR', '9876501004', NULL,         'ACTIVE'),
(5,  'Vipul Mehta',    'CONDUCTOR', '9876501005', NULL,         'ACTIVE'),
(6,  'Nilesh Solanki', 'CONDUCTOR', '9876501006', NULL,         'ACTIVE'),
(7,  'Amit Rana',      'HELPER',    '9876501007', NULL,         'ACTIVE'),
(8,  'Jay Desai',      'HELPER',    '9876501008', NULL,         'ACTIVE'),
(9,  'Hitesh Vora',    'HELPER',    '9876501009', NULL,         'ON_LEAVE'),
(10, 'Ravi Chauhan',   'DRIVER',    '9876501010', 'DL-GJ-1010', 'ACTIVE');

-- -----------------------------------------------
-- TRIP_STAFF
-- -----------------------------------------------

INSERT INTO trip_staff (bus_id, route_id, departure_date_time, staff_id) VALUES
(1, 1, '2026-07-20 08:00:00', 1),
(1, 1, '2026-07-20 08:00:00', 4),
(1, 1, '2026-07-20 08:00:00', 7),
(2, 2, '2026-07-20 09:00:00', 2),
(2, 2, '2026-07-20 09:00:00', 5),
(2, 2, '2026-07-20 09:00:00', 8),
(3, 3, '2026-07-20 07:30:00', 3),
(3, 3, '2026-07-20 07:30:00', 6),
(3, 3, '2026-07-20 07:30:00', 7),
(5, 4, '2026-07-20 10:00:00', 10),
(5, 4, '2026-07-20 10:00:00', 4),
(5, 4, '2026-07-20 10:00:00', 8),
(6, 1, '2026-07-21 08:00:00', 1),
(6, 1, '2026-07-21 08:00:00', 5),
(6, 1, '2026-07-21 08:00:00', 7),
(1, 2, '2026-07-22 06:30:00', 2),
(1, 2, '2026-07-22 06:30:00', 6),
(1, 2, '2026-07-22 06:30:00', 8),
(3, 4, '2026-07-22 11:00:00', 3),
(3, 4, '2026-07-22 11:00:00', 4),
(3, 4, '2026-07-22 11:00:00', 7),
(5, 3, '2026-07-23 15:00:00', 10),
(5, 3, '2026-07-23 15:00:00', 5),
(5, 3, '2026-07-23 15:00:00', 8);

-- -----------------------------------------------
-- USERS
-- -----------------------------------------------

INSERT INTO users (user_id, user_name, email, contact_no, referred_by)
OVERRIDING SYSTEM VALUE
VALUES
(1,  'Rahul Sharma', 'rahul@gmail.com', '9876510001', NULL),
(2,  'Priya Patel',  'priya@gmail.com', '9876510002', 1),
(3,  'Amit Shah',    'amit@gmail.com',  '9876510003', 1),
(4,  'Neha Joshi',   'neha@gmail.com',  '9876510004', 2),
(5,  'Karan Mehta',  'karan@gmail.com', '9876510005', NULL),
(6,  'Riya Desai',   'riya@gmail.com',  '9876510006', 5),
(7,  'Jay Modi',     'jay@gmail.com',   '9876510007', 3),
(8,  'Nidhi Trivedi','nidhi@gmail.com', '9876510008', NULL),
(9,  'Dev Trivedi',  'dev@gmail.com',   '9876510009', NULL),
(10, 'Pooja Mehta',  'pooja@gmail.com', '9876510010', 2),
(11, 'Raj Solanki',  'raj@gmail.com',   '9876510011', NULL),
(12, 'Meera Kapoor', 'meera@gmail.com', '9876510012', 5),
(13, 'Arjun Desai',  'arjun@gmail.com', '9876510013', NULL);

-- -----------------------------------------------
-- BOOKING
-- -----------------------------------------------

INSERT INTO booking (booking_id, user_id, booking_date, booking_status, total_amount, discount_amount)
OVERRIDING SYSTEM VALUE
VALUES
(1,  1, '2026-07-15', 'CONFIRMED', 2200.00, 200.00),
(2,  2, '2026-07-15', 'CONFIRMED', 1200.00,   0.00),
(3,  3, '2026-07-16', 'CONFIRMED', 3500.00, 300.00),
(4,  4, '2026-07-16', 'CONFIRMED',  700.00,   0.00),
(5,  5, '2026-07-17', 'CANCELLED', 1800.00, 100.00),
(6,  6, '2026-07-17', 'CONFIRMED', 2500.00, 250.00),
(7,  7, '2026-07-18', 'PENDING',    900.00,   0.00),
(8,  8, '2026-07-18', 'CONFIRMED', 1500.00, 100.00),
(9,  1, '2026-07-19', 'CONFIRMED', 3200.00, 200.00),
(10, 3, '2026-07-19', 'CONFIRMED', 1100.00,   0.00),
(14, 4, '2026-07-21', 'CANCELLED',  950.00,   0.00),
(15, 6, '2026-07-22', 'CANCELLED', 1750.00, 100.00),
(12, 3, '2026-07-20', 'CONFIRMED', 2600.00, 200.00),
(13, 2, '2026-07-21', 'CONFIRMED', 1400.00,   0.00);

-- -----------------------------------------------
-- PAYMENT
-- -----------------------------------------------

INSERT INTO payment (payment_id, booking_id, transaction_id, payment_method, payment_date_time, amount, payment_status)
OVERRIDING SYSTEM VALUE
VALUES
(1,  1,  'TXN100001', 'UPI',         '2026-07-15 09:15:00',        2000.00, 'SUCCESS'),
(2,  2,  'TXN100002', 'CREDIT_CARD', '2026-07-15 10:00:00',        1200.00, 'SUCCESS'),
(3,  3,  'TXN100003', 'NET_BANKING', '2026-07-16 11:10:00',        3200.00, 'SUCCESS'),
(4,  4,  'TXN100004', 'DEBIT_CARD',  '2026-07-16 15:20:00',         700.00, 'SUCCESS'),
(5,  5,  'TXN100005', 'UPI',         '2026-07-17 08:30:00',        1700.00, 'REFUNDED'),
(6,  6,  'TXN100006', 'CREDIT_CARD', '2026-07-17 14:40:00',        2250.00, 'SUCCESS'),
(7,  7,  'TXN100007', 'UPI',         '2026-07-18 10:50:00',         900.00, 'PENDING'),
(8,  8,  'TXN100008', 'NET_BANKING', '2026-07-18 16:00:00',        1400.00, 'SUCCESS'),
(9,  9,  'TXN100009', 'DEBIT_CARD',  '2026-07-19 12:15:00',        3000.00, 'SUCCESS'),
(10, 10, 'TXN100010', 'UPI',         '2026-07-19 17:35:00',        1100.00, 'SUCCESS'),
(11, 12, 'TXN100012', 'CREDIT_CARD', '2026-07-20 11:30:00',        2400.00, 'SUCCESS'),
(12, 14, 'TXN100014', 'DEBIT_CARD',  '2026-07-21 14:00:00',         950.00, 'REFUNDED'),
(13, 15, 'TXN100015', 'UPI',         '2026-07-22 10:30:00',        1650.00, 'REFUNDED'),
(14, 13, 'TXN999901', 'UPI',         '2026-06-28 11:23:26.897507', 1400.00, 'SUCCESS');

-- -----------------------------------------------
-- TICKET
-- -----------------------------------------------

INSERT INTO ticket (pnr, booking_id, bus_id, route_id, departure_date_time, ticket_status, issue_date_time) VALUES
('PNR100001', 1,  1, 1, '2026-07-20 08:00:00', 'ACTIVE',     '2026-07-15 09:20:00'),
('PNR100002', 2,  2, 2, '2026-07-20 09:00:00', 'ACTIVE',     '2026-07-15 10:05:00'),
('PNR100003', 3,  3, 3, '2026-07-20 07:30:00', 'ACTIVE',     '2026-07-16 11:15:00'),
('PNR100004', 4,  5, 4, '2026-07-20 10:00:00', 'ACTIVE',     '2026-07-16 15:25:00'),
('PNR100005', 5,  6, 1, '2026-07-21 08:00:00', 'CANCELLED',  '2026-07-17 08:35:00'),
('PNR100006', 6,  1, 2, '2026-07-22 06:30:00', 'ACTIVE',     '2026-07-17 14:45:00'),
('PNR100007', 7,  3, 4, '2026-07-22 11:00:00', 'ACTIVE',     '2026-07-18 10:55:00'),
('PNR100008', 8,  5, 3, '2026-07-23 15:00:00', 'ACTIVE',     '2026-07-18 16:05:00'),
('PNR100009', 9,  1, 1, '2026-07-20 08:00:00', 'ACTIVE',     '2026-07-19 12:20:00'),
('PNR100010', 10, 2, 2, '2026-07-20 09:00:00', 'ACTIVE',     '2026-07-19 17:40:00'),
('PNR2026014',14, 5, 4, '2026-07-20 10:00:00', 'CANCELLED',  '2026-07-21 14:10:00'),
('PNR2026015',15, 1, 2, '2026-07-22 06:30:00', 'CANCELLED',  '2026-07-22 10:35:00'),
('PNR2026012',12, 3, 3, '2026-07-20 07:30:00', 'COMPLETED',  '2026-07-20 11:35:00'),
('PNR2026013',13, 2, 2, '2026-07-20 09:00:00', 'CANCELLED',  '2026-07-21 09:05:00');

-- -----------------------------------------------
-- PASSENGER
-- -----------------------------------------------

INSERT INTO passenger (passenger_id, name, gender, phone_no, dob, passenger_type, is_active)
OVERRIDING SYSTEM VALUE
VALUES
(1,  'Rahul Sharma',    'MALE',   '9876600001', '1998-02-10', 'ADULT',          true),
(2,  'Pooja Sharma',    'FEMALE', '9876600002', '2000-08-14', 'ADULT',          false),
(3,  'Amit Shah',       'MALE',   '9876600003', '1995-04-18', 'ADULT',          true),
(4,  'Neha Shah',       'FEMALE', '9876600004', '1997-12-21', 'ADULT',          true),
(5,  'Riya Patel',      'FEMALE', NULL,         '2017-03-11', 'CHILD',          true),
(6,  'Karan Mehta',     'MALE',   '9876600005', '1962-06-02', 'SENIOR_CITIZEN', true),
(7,  'Jay Modi',        'MALE',   '9876600006', '1999-01-25', 'ADULT',          true),
(8,  'Nidhi Modi',      'FEMALE', '9876600007', '2001-05-12', 'ADULT',          true),
(9,  'Vivek Joshi',     'MALE',   '9876600008', '1996-09-09', 'ADULT',          true),
(10, 'Sneha Joshi',     'FEMALE', '9876600009', '1998-10-15', 'ADULT',          true),
(11, 'Harsh Patel',     'MALE',   '9876600010', '1994-07-01', 'ADULT',          true),
(12, 'Komal Patel',     'FEMALE', '9876600011', '1995-11-17', 'ADULT',          true),
(13, 'Dhruv Shah',      'MALE',   '9876600012', '2002-03-05', 'ADULT',          true),
(14, 'Ishita Shah',     'FEMALE', '9876600013', '2003-04-08', 'ADULT',          true),
(15, 'Parth Sorathiya', 'MALE',   '9876600014', '2004-01-01', 'ADULT',          true),
(16, 'Meet Patel',      'MALE',   '9876600015', '2004-05-05', 'ADULT',          true),
(17, 'Krisha Patel',    'FEMALE', '9876600016', '2005-07-07', 'ADULT',          true),
(18, 'Mihir Desai',     'MALE',   '9876600017', '1990-09-09', 'ADULT',          true),
(19, 'Anaya Desai',     'FEMALE', '9876600018', '1992-08-08', 'ADULT',          true),
(20, 'Rohan Trivedi',   'MALE',   '9876600019', '1993-12-12', 'ADULT',          true);

-- -----------------------------------------------
-- TRAVELS_ON
-- -----------------------------------------------

INSERT INTO travels_on (pnr, passenger_id, bus_id, seat_no, passenger_fare) VALUES
('PNR100001', 1,  1, 'A01', 1100.00),
('PNR100001', 2,  1, 'A02', 1100.00),
('PNR100002', 3,  2, 'A01', 1200.00),
('PNR100003', 4,  3, 'A01', 1200.00),
('PNR100003', 5,  3, 'A02', 1100.00),
('PNR100003', 6,  3, 'A03', 1200.00),
('PNR100004', 7,  5, 'A01',  700.00),
('PNR100005', 8,  6, 'A01',  900.00),
('PNR100005', 9,  6, 'A02',  900.00),
('PNR100006', 10, 1, 'A03', 1250.00),
('PNR100006', 11, 1, 'A04', 1250.00),
('PNR100007', 12, 3, 'A04',  900.00),
('PNR100008', 13, 5, 'A02',  700.00),
('PNR100008', 14, 5, 'A03',  800.00),
('PNR100009', 15, 1, 'A05', 1000.00),
('PNR100009', 16, 1, 'A06', 1000.00),
('PNR100009', 17, 1, 'A07', 1200.00),
('PNR100010', 18, 2, 'A02',  550.00),
('PNR100010', 19, 2, 'A03',  550.00),
('PNR100010', 20, 2, 'A04',  400.00),
('PNR2026014', 4, 5, 'A06',  950.00),
('PNR2026015', 6, 1, 'A07', 1750.00),
('PNR2026012', 3, 3, 'A04', 1300.00),
('PNR2026012',10, 3, 'A05', 1300.00),
('PNR2026013', 2, 2, 'A05', 1400.00);

-- -----------------------------------------------
-- CANCELLATION
-- -----------------------------------------------

INSERT INTO cancellation (cancellation_id, booking_id, cancellation_date_time, refund_amount, refund_status, reason, cancelled_by, cancellation_policy)
OVERRIDING SYSTEM VALUE
VALUES
(1, 5,  '2026-07-18 09:00:00', 1700.00, 'COMPLETED', 'Passenger requested cancellation', 'USER', 'PARTIAL_REFUND'),
(2, 14, '2026-07-21 15:00:00',  855.00, 'PENDING',   'Change of travel plans',           'USER', 'PARTIAL_REFUND'),
(3, 15, '2026-07-22 11:00:00', 1650.00, 'PENDING',   'Emergency cancellation',           'USER', 'FULL_REFUND');
