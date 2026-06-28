-- GoBus Reservation System
-- DDL Script
-- PostgreSQL

-- -----------------------------------------------
-- ENUM TYPES
-- -----------------------------------------------

CREATE TYPE bus_type_enum AS ENUM
(
    'SEATER',
    'SLEEPER',
    'SEMI_SLEEPER'
);

CREATE TYPE bus_status_enum AS ENUM
(
    'ACTIVE',
    'UNDER_MAINTENANCE',
    'INACTIVE'
);

CREATE TYPE gender_enum AS ENUM
(
    'MALE',
    'FEMALE',
    'OTHER'
);

CREATE TYPE passenger_type_enum AS ENUM
(
    'ADULT',
    'CHILD',
    'SENIOR_CITIZEN'
);

CREATE TYPE booking_status_enum AS ENUM
(
    'PENDING',
    'CONFIRMED',
    'CANCELLED'
);

CREATE TYPE payment_method_enum AS ENUM
(
    'UPI',
    'CREDIT_CARD',
    'DEBIT_CARD',
    'NET_BANKING',
    'CASH'
);

CREATE TYPE payment_status_enum AS ENUM
(
    'PENDING',
    'SUCCESS',
    'FAILED',
    'REFUNDED'
);

CREATE TYPE ticket_status_enum AS ENUM
(
    'ACTIVE',
    'CANCELLED',
    'COMPLETED'
);

CREATE TYPE trip_status_enum AS ENUM
(
    'SCHEDULED',
    'DELAYED',
    'IN_PROGRESS',
    'COMPLETED',
    'CANCELLED'
);

CREATE TYPE refund_status_enum AS ENUM
(
    'PENDING',
    'COMPLETED',
    'FAILED'
);

CREATE TYPE cancelled_by_enum AS ENUM
(
    'USER',
    'OPERATOR',
    'SYSTEM'
);

CREATE TYPE cancellation_policy_enum AS ENUM
(
    'FULL_REFUND',
    'PARTIAL_REFUND',
    'NO_REFUND'
);

CREATE TYPE staff_role_enum AS ENUM
(
    'DRIVER',
    'CONDUCTOR',
    'HELPER'
);

CREATE TYPE staff_status_enum AS ENUM
(
    'ACTIVE',
    'ON_LEAVE',
    'INACTIVE'
);

-- -----------------------------------------------
-- OPERATOR
-- -----------------------------------------------

CREATE TABLE operator
(
    operator_id        INTEGER GENERATED ALWAYS AS IDENTITY,
    operator_name      VARCHAR(100) NOT NULL,
    email              VARCHAR(100) NOT NULL,
    contact_no         VARCHAR(15)  NOT NULL,
    area               VARCHAR(100) NOT NULL,
    city               VARCHAR(50)  NOT NULL,
    pincode            CHAR(6)      NOT NULL,

    CONSTRAINT pk_operator
        PRIMARY KEY (operator_id),

    CONSTRAINT uq_operator_email
        UNIQUE (email),

    CONSTRAINT uq_operator_contact
        UNIQUE (contact_no),

    CONSTRAINT chk_operator_pincode
        CHECK (pincode ~ '^[0-9]{6}$')
);

-- -----------------------------------------------
-- BUS
-- -----------------------------------------------

CREATE TABLE bus
(
    bus_id             INTEGER GENERATED ALWAYS AS IDENTITY,
    operator_id        INTEGER NOT NULL,
    reg_no             VARCHAR(20) NOT NULL,
    bus_type           bus_type_enum NOT NULL,
    bus_status         bus_status_enum NOT NULL,

    CONSTRAINT pk_bus
        PRIMARY KEY (bus_id),

    CONSTRAINT uq_bus_registration
        UNIQUE (reg_no),

    CONSTRAINT fk_bus_operator
        FOREIGN KEY (operator_id)
        REFERENCES operator(operator_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- -----------------------------------------------
-- SEAT
-- -----------------------------------------------

CREATE TABLE seat
(
    bus_id      INTEGER NOT NULL,
    seat_no     VARCHAR(10) NOT NULL,
    seat_type   VARCHAR(30) NOT NULL,

    CONSTRAINT pk_seat
        PRIMARY KEY (bus_id, seat_no),

    CONSTRAINT fk_seat_bus
        FOREIGN KEY (bus_id)
        REFERENCES bus(bus_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_seat_type
        CHECK
        (
            seat_type IN
            (
                'WINDOW-SEATER',
                'AISLE-SEATER',
                'MIDDLE-SEATER',
                'WINDOW-SLEEPER',
                'AISLE-SLEEPER',
                'MIDDLE-SLEEPER',
                'WINDOW-SEMI_SLEEPER',
                'AISLE-SEMI_SLEEPER',
                'MIDDLE-SEMI_SLEEPER'
            )
        )
);

-- -----------------------------------------------
-- STATION
-- -----------------------------------------------

CREATE TABLE station
(
    station_id         INTEGER GENERATED ALWAYS AS IDENTITY,
    station_name       VARCHAR(100) NOT NULL,
    area               VARCHAR(100) NOT NULL,
    city               VARCHAR(50)  NOT NULL,
    pincode            CHAR(6)      NOT NULL,

    CONSTRAINT pk_station
        PRIMARY KEY (station_id),

    CONSTRAINT chk_station_pincode
        CHECK (pincode ~ '^[0-9]{6}$')
);

-- -----------------------------------------------
-- ROUTE
-- -----------------------------------------------

CREATE TABLE route
(
    route_id           INTEGER GENERATED ALWAYS AS IDENTITY,
    route_name         VARCHAR(100),

    CONSTRAINT pk_route
        PRIMARY KEY (route_id)
);

-- -----------------------------------------------
-- ROUTE_STATION
-- -----------------------------------------------

CREATE TABLE route_station
(
    route_id                 INTEGER NOT NULL,
    station_id               INTEGER NOT NULL,
    stop_no                  SMALLINT NOT NULL,
    duration_from_source     INTEGER NOT NULL,

    CONSTRAINT pk_route_station
        PRIMARY KEY (route_id, station_id),

    CONSTRAINT uq_route_stop
        UNIQUE (route_id, stop_no),

    CONSTRAINT fk_rs_route
        FOREIGN KEY (route_id)
        REFERENCES route(route_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_rs_station
        FOREIGN KEY (station_id)
        REFERENCES station(station_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_stop_no
        CHECK (stop_no > 0),

    CONSTRAINT chk_duration
        CHECK (duration_from_source >= 0)
);

-- -----------------------------------------------
-- TRIP
-- -----------------------------------------------

CREATE TABLE trip
(
    bus_id                  INTEGER NOT NULL,
    route_id                INTEGER NOT NULL,
    departure_date_time     TIMESTAMP NOT NULL,
    arrival_date_time       TIMESTAMP NOT NULL,
    trip_status             trip_status_enum NOT NULL,

    CONSTRAINT pk_trip
        PRIMARY KEY (bus_id, route_id, departure_date_time),

    CONSTRAINT fk_trip_bus
        FOREIGN KEY (bus_id)
        REFERENCES bus(bus_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_trip_route
        FOREIGN KEY (route_id)
        REFERENCES route(route_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_trip_time
        CHECK (arrival_date_time > departure_date_time)
);

-- -----------------------------------------------
-- STAFF
-- -----------------------------------------------

CREATE TABLE staff
(
    staff_id             INTEGER GENERATED ALWAYS AS IDENTITY,
    name                 VARCHAR(100) NOT NULL,
    role                 staff_role_enum NOT NULL,
    contact_no           VARCHAR(15) NOT NULL,
    licence_no           VARCHAR(20),
    staff_status         staff_status_enum NOT NULL,

    CONSTRAINT pk_staff
        PRIMARY KEY (staff_id),

    CONSTRAINT uq_staff_contact
        UNIQUE (contact_no),

    CONSTRAINT uq_staff_licence
        UNIQUE (licence_no)
);

-- -----------------------------------------------
-- TRIP_STAFF
-- -----------------------------------------------

CREATE TABLE trip_staff
(
    bus_id                   INTEGER NOT NULL,
    route_id                 INTEGER NOT NULL,
    departure_date_time      TIMESTAMP NOT NULL,
    staff_id                 INTEGER NOT NULL,

    CONSTRAINT pk_trip_staff
        PRIMARY KEY (bus_id, route_id, departure_date_time, staff_id),

    CONSTRAINT fk_ts_trip
        FOREIGN KEY (bus_id, route_id, departure_date_time)
        REFERENCES trip (bus_id, route_id, departure_date_time)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_ts_staff
        FOREIGN KEY (staff_id)
        REFERENCES staff(staff_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- -----------------------------------------------
-- USERS
-- -----------------------------------------------

CREATE TABLE users
(
    user_id              INTEGER GENERATED ALWAYS AS IDENTITY,
    user_name            VARCHAR(100) NOT NULL,
    email                VARCHAR(100) NOT NULL,
    contact_no           VARCHAR(15) NOT NULL,
    referred_by          INTEGER,

    CONSTRAINT pk_users
        PRIMARY KEY (user_id),

    CONSTRAINT uq_user_email
        UNIQUE (email),

    CONSTRAINT uq_user_contact
        UNIQUE (contact_no),

    CONSTRAINT fk_user_referral
        FOREIGN KEY (referred_by)
        REFERENCES users(user_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- -----------------------------------------------
-- BOOKING
-- -----------------------------------------------

CREATE TABLE booking
(
    booking_id            INTEGER GENERATED ALWAYS AS IDENTITY,
    user_id               INTEGER NOT NULL,
    booking_date          DATE NOT NULL,
    booking_status        booking_status_enum NOT NULL,
    total_amount          DECIMAL(10,2) NOT NULL,
    discount_amount       DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT pk_booking
        PRIMARY KEY (booking_id),

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_total_amount
        CHECK (total_amount >= 0),

    CONSTRAINT chk_discount
        CHECK
        (
            discount_amount >= 0
            AND
            discount_amount <= total_amount
        )
);

-- -----------------------------------------------
-- PAYMENT
-- -----------------------------------------------

CREATE TABLE payment
(
    payment_id            INTEGER GENERATED ALWAYS AS IDENTITY,
    booking_id            INTEGER NOT NULL,
    transaction_id        VARCHAR(100) NOT NULL,
    payment_method        payment_method_enum NOT NULL,
    payment_date_time     TIMESTAMP NOT NULL,
    amount                DECIMAL(10,2) NOT NULL,
    payment_status        payment_status_enum NOT NULL,

    CONSTRAINT pk_payment
        PRIMARY KEY (payment_id),

    CONSTRAINT uq_payment_booking
        UNIQUE (booking_id),

    CONSTRAINT uq_transaction
        UNIQUE (transaction_id),

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_payment_amount
        CHECK (amount >= 0)
);

-- -----------------------------------------------
-- TICKET
-- -----------------------------------------------

CREATE TABLE ticket
(
    pnr                     VARCHAR(20),
    booking_id              INTEGER NOT NULL,
    bus_id                  INTEGER NOT NULL,
    route_id                INTEGER NOT NULL,
    departure_date_time     TIMESTAMP NOT NULL,
    ticket_status           ticket_status_enum NOT NULL,
    issue_date_time         TIMESTAMP NOT NULL,

    CONSTRAINT pk_ticket
        PRIMARY KEY (pnr),

    CONSTRAINT uq_ticket_booking
        UNIQUE (booking_id),

    CONSTRAINT fk_ticket_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_ticket_trip
        FOREIGN KEY (bus_id, route_id, departure_date_time)
        REFERENCES trip (bus_id, route_id, departure_date_time)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- -----------------------------------------------
-- PASSENGER
-- -----------------------------------------------

CREATE TABLE passenger
(
    passenger_id           INTEGER GENERATED ALWAYS AS IDENTITY,
    name                   VARCHAR(100) NOT NULL,
    gender                 gender_enum NOT NULL,
    phone_no               VARCHAR(15),
    dob                    DATE NOT NULL,
    passenger_type         passenger_type_enum NOT NULL,
    is_active              BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_passenger
        PRIMARY KEY (passenger_id)
);

-- -----------------------------------------------
-- TRAVELS_ON
-- -----------------------------------------------

CREATE TABLE travels_on
(
    pnr                    VARCHAR(20),
    passenger_id           INTEGER,
    bus_id                 INTEGER NOT NULL,
    seat_no                VARCHAR(10) NOT NULL,
    passenger_fare         DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_travels_on
        PRIMARY KEY (pnr, passenger_id),

    CONSTRAINT fk_to_ticket
        FOREIGN KEY (pnr)
        REFERENCES ticket(pnr)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_to_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES passenger(passenger_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_to_seat
        FOREIGN KEY (bus_id, seat_no)
        REFERENCES seat (bus_id, seat_no)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_passenger_fare
        CHECK (passenger_fare >= 0)
);

-- -----------------------------------------------
-- CANCELLATION
-- -----------------------------------------------

CREATE TABLE cancellation
(
    cancellation_id            INTEGER GENERATED ALWAYS AS IDENTITY,
    booking_id                 INTEGER NOT NULL,
    cancellation_date_time     TIMESTAMP NOT NULL,
    refund_amount              DECIMAL(10,2) NOT NULL,
    refund_status              refund_status_enum NOT NULL,
    reason                     VARCHAR(255) NOT NULL,
    cancelled_by               cancelled_by_enum NOT NULL,
    cancellation_policy        cancellation_policy_enum NOT NULL,

    CONSTRAINT pk_cancellation
        PRIMARY KEY (cancellation_id),

    CONSTRAINT uq_cancellation_booking
        UNIQUE (booking_id),

    CONSTRAINT fk_cancellation_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_refund_amount
        CHECK (refund_amount >= 0)
);


