# GoBus - Bus Reservation System

GoBus is a relational database project built using PostgreSQL. It manages the complete process of bus reservation including operators, buses, routes, trips, bookings, payments, passengers, staff and cancellations. The goal of this project is to apply real world database concepts like schema design, normalization, triggers, views and analytical SQL queries.

---

## Tech Stack

- PostgreSQL 15 or above
- pgAdmin 4

---

## Project Overview

This database handles the following operations:

- Operator and bus management
- Route and station setup with stop details
- Trip scheduling and staff assignment
- User registration and passenger booking
- Payment processing and ticket generation
- Cancellation and refund handling
- Driver and staff schedule tracking

---

## Database Schema

The database has 15 tables organized into 4 groups.

**Operator and Bus**
- OPERATOR - stores bus company details
- BUS - buses owned by each operator
- SEAT - seats available on each bus

**Route and Trip**
- STATION - bus stations across cities
- ROUTE - routes connecting stations
- ROUTE_STATION - stops on each route with duration from source
- TRIP - scheduled trips on a route with a bus
- STAFF - drivers, conductors and helpers
- TRIP_STAFF - which staff is assigned to which trip

**Booking and Payment**
- USERS - registered users on the platform
- BOOKING - bookings created by users
- PAYMENT - payment record for each booking
- TICKET - ticket issued against a booking

**Passenger and Cancellation**
- PASSENGER - passenger details like name, age, type,etc.
- TRAVELS_ON - links passengers to tickets with seat and fare
- CANCELLATION - cancellation record with refund details

---

## Triggers

11 triggers are implemented across 4 categories.

**Data Validation**
- T1 check_bus_availability - before inserting a trip, checks if the bus_type is ACTIVE. Blocks if bus is UNDER_MAINTENANCE or INACTIVE
- T2 check_seat_availability - before inserting into TRAVELS_ON, checks if that seat is already taken on the same trip
- T3 check_trip_status_before_ticket - before issuing a ticket, checks if the trip status is SCHEDULED. Blocks if COMPLETED, CANCELLED or DELAYED
- T4 check_passenger_age_type - before inserting a passenger, validates that age matches the type. CHILD must be under 18, ADULT between 18 and 59, SENIOR_CITIZEN 60 and above

**Auto Update**
- T5 master_cancellation - when a booking status is changed to CANCELLED, this trigger automatically cancels all tickets under that booking and sets is_active to false for all passengers linked to those tickets. Also blocks cancellation if the trip is already COMPLETED or IN_PROGRESS

**Business Rules**
- T6 check_duplicate_passenger_on_trip - before inserting into TRAVELS_ON, checks if the same passenger is already booked on the same trip under a different PNR
- T7 check_refund_amount - before inserting a cancellation, checks that the refund amount does not exceed the actual amount paid by the user
- T8 check_staff_overlap - before assigning staff to a trip, checks if the same staff member already has another trip whose timings overlap. Applies to all roles including driver, conductor and helper
- T9 check_payment_amount - before inserting a payment, checks that the payment amount equals booking total amount minus discount amount

**Audit Logs**
- T10 log_booking_status_change - after every booking status update, records the old status, new status and timestamp in a separate booking_audit_log table
- T11 log_trip_status_change - after every trip status update, records the old status, new status and timestamp in a separate trip_audit_log table

---

## Views

5 views are created for easy access to commonly needed information.

- active_trips_view - shows all trips with status SCHEDULED, DELAYED or IN_PROGRESS along with bus details, operator name, route name and total tickets booked on that trip
- booking_summary_view - shows complete booking information per user including payment method, payment status, ticket PNR, ticket status, route name and trip details
- passenger_travel_history_view - shows full travel history of every passenger including which route they travelled, which bus, which seat, how much fare they paid and the trip status
- bus_utilization_view - shows each bus with total trips done, total passengers carried, total seats available and occupancy percentage across all trips
- staff_schedule_view - shows every staff member with their assigned trips, bus details, route name, source and destination station, trip timings and total duration in hours

---

## Queries

- Find all routes where total number of stops is more than 2
- Display complete passenger manifest for a trip showing PNR, passenger name, seat number, seat type, passenger fare, booking date, ticket status and user name who booked ticket
- Find stations that are a source stop on one route but a mid or end stop on another route
- Display for every trip the bus registration number, route name, departure time, total seats, booked seats and available seats
- Compare performance of all operators showing total buses, total trips, total revenue and total passengers
- Find users who were referred by someone and have spent more than the person who referred them
- Find users whose total spending is more than the average spending of all users
- Find all routes for which no ticket has ever been booked
- Find passengers who have travelled on more than one route
- Find users who registered but never made a booking
- Find which seat type is most preferred by passengers
- For each operator find the bus that carried the most passengers
- Find users whose every single booking is CONFIRMED with no cancellations or pending bookings
- Find routes where total fare from ADULT passengers is more than fare from non-adult passengers

---
## How to Run

Prerequisites: PostgreSQL 15 or above and pgAdmin 4 must be installed.

1. Open pgAdmin and create a new database named gobus
```sql
CREATE DATABASE gobus;
```

2. Open the query tool and run schema/DDL_script.sql to create all tables, enums, constraints.

3. Run data/seed_data.sql to insert sample data. Note that identity columns require OVERRIDING SYSTEM VALUE during insert

4. Run each trigger file inside the triggers folder one by one in order from T1 to T11. Each file contains the trigger function and the trigger itself

5. Run each view file inside the views folder. Views can be run in any order

6. Open queries/queries.sql and run any query to see results

---

## Key Highlights

- 13 ENUM types are used to control valid values for status fields
- Composite primary keys are used in TRIP, ROUTE_STATION, TRAVELS_ON and TRIP_STAFF
- Foreign key constraints use ON UPDATE CASCADE and ON DELETE RESTRICT or CASCADE based on relationship
- Audit log tables track full history of booking and trip status changes
- Triggers cover validation, automation, business rules and logging
- Views simplify access to complex multi-table information
- Queries range from medium to hard level covering joins, subqueries, aggregation, CASE WHEN and NOT EXISTS

---

## Sample Data

- OPERATOR: 3 records
- BUS: 6 records
- STATION: 15 records
- ROUTE: 7 records
- TRIP: 10 records
- STAFF: 10 records
- USERS: 13 records
- PASSENGER: 20+ records
- BOOKING: 15 records
- PAYMENT: 15 records
- TICKET: 15 records

---

## Author

**Parth sorathiya**
GitHub: https://github.com/Parth07-sorathiya

