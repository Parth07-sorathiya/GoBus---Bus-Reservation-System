
# Database Normalization

Database normalization is the process of organizing relations to reduce redundancy, eliminate anomalies, and improve data integrity.

---
# Functional Dependencies

Functional Dependency (FD) is a relationship between attributes in a relation where the value of one attribute (or a set of attributes) uniquely determines the value of another attribute (or set of attributes). Functional dependencies play a crucial role in identifying candidate keys and performing database normalization.

The following sections describe the functional dependencies for each relation in the GoBus database.

---

## 1. USER

### Relation

```text
USER(
    User_ID,
    User_Name,
    Email,
    Contact_No,
    Referred_By
)
```

### Primary Key

```text
User_ID
```

### Functional Dependencies

```text
User_ID → User_Name,
          Email,
          Contact_No,
          Referred_By
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).
 
---

## 2. OPERATOR

### Relation

```text
OPERATOR(
    Operator_ID,
    Operator_Name,
    Email,
    Contact_No,
    Area,
    City,
    Pincode
)
```

### Primary Key

```text
Operator_ID
```

### Functional Dependencies

```text
Operator_ID → Operator_Name,
              Email,
              Contact_No,
              Area,
              City,
              Pincode
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 3. BUS

### Relation

```text
BUS(
    Bus_ID,
    Operator_ID,
    Reg_No,
    Bus_Type,
    Bus_Status
)
```

### Primary Key

```text
Bus_ID
```

### Candidate Keys

```text
Bus_ID
Reg_No
```

### Functional Dependencies

```text
Bus_ID → Operator_ID,
         Reg_No,
         Bus_Type,
         Bus_Status

Reg_No → Bus_ID,
         Operator_ID,
         Bus_Type,
         Bus_Status
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 4. SEAT

### Relation

```text
SEAT(
    Bus_ID,
    Seat_No,
    Seat_Type
)
```

### Primary Key

```text
(Bus_ID, Seat_No)
```


### Functional Dependencies

```text
(Bus_ID, Seat_No) → Seat_Type
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 5. STATION

### Relation

```text
STATION(
    Station_ID,
    Station_Name,
    Area,
    City,
    Pincode
)
```

### Primary Key

```text
Station_ID
```

### Functional Dependencies

```text
Station_ID → Station_Name,
             Area,
             City,
             Pincode
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 6. ROUTE

### Relation

```text
ROUTE(
    Route_ID,
    Route_Name
)
```

### Primary Key

```text
Route_ID
```

### Functional Dependencies

```text
Route_ID → Route_Name
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 7. ROUTE_STATION

### Relation

```text
ROUTE_STATION(
    Route_ID,
    Station_ID,
    Stop_No,
    Duration_From_Source
)
```

### Primary Key

```text
(Route_ID, Station_ID)
```

### Candidate Keys

```text
(Route_ID, Station_ID)

(Route_ID, Stop_No)
```

### Functional Dependencies

```text
(Route_ID, Station_ID)
        → Stop_No,
          Duration_From_Source

(Route_ID, Stop_No)
        → Station_ID,
          Duration_From_Source
```

> **Note:** The second functional dependency assumes that the stop number is unique within a route. This is a valid assumption as each station occupies a unique stop position in a particular route.


### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 8. TRIP

### Relation

```text
TRIP(
    Bus_ID,
    Route_ID,
    Departure_Date_Time,
    Arrival_Date_Time,
    Trip_Status
)
```

### Primary Key

```text
(Bus_ID, Route_ID, Departure_Date_Time)
```

### Functional Dependencies

```text
(Bus_ID, Route_ID, Departure_Date_Time)
        → Arrival_Date_Time,
          Trip_Status
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 9. STAFF

### Relation

```text
STAFF(
    Staff_ID,
    Name,
    Role,
    Contact_No,
    Licence_No,
    Staff_Status
)
```

### Primary Key

```text
Staff_ID
```

### Functional Dependencies

```text
Staff_ID → Name,
           Role,
           Contact_No,
           Licence_No,
           Staff_Status

```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 10. TRIP_STAFF

### Relation

```text
TRIP_STAFF(
    Bus_ID,
    Route_ID,
    Departure_Date_Time,
    Staff_ID
)
```

### Primary Key

```text
(Bus_ID, Route_ID, Departure_Date_Time, Staff_ID)
```

### Functional Dependencies

```text
(Bus_ID, Route_ID, Departure_Date_Time, Staff_ID)
        → ∅
```

> **Note:** This relation is a junction (associative) table used to assign staff members to trips. Since it contains only key attributes and no non-key attributes, it has no non-trivial functional dependencies.

### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 11. BOOKING

### Relation

```text
BOOKING(
    Booking_ID,
    User_ID,
    Booking_Date,
    Booking_Status,
    Total_Amount,
    Discount_Amount
)
```

### Primary Key

```text
Booking_ID
```

### Functional Dependencies

```text
Booking_ID → User_ID,
             Booking_Date,
             Booking_Status,
             Total_Amount,
             Discount_Amount
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 12. PAYMENT

### Relation

```text
PAYMENT(
    Payment_ID,
    Booking_ID,
    Transaction_ID,
    Payment_Method,
    Payment_Date_Time,
    Amount,
    Payment_Status
)
```

### Primary Key

```text
Payment_ID
```

### Candidate Keys

```text
Payment_ID
Transaction_ID
```

### Functional Dependencies

```text
Payment_ID → Booking_ID,
             Transaction_ID,
             Payment_Method,
             Payment_Date_Time,
             Amount,
             Payment_Status

Transaction_ID → Payment_ID,
                 Booking_ID,
                 Payment_Method,
                 Payment_Date_Time,
                 Amount,
                 Payment_Status
```

> **Note:** `Transaction_ID` is considered an alternate candidate key because every payment transaction is assigned a unique transaction identifier by the payment gateway, and it is mandatory (NOT NULL) for every payment record.

### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---

## 13. TICKET

### Relation

```text
TICKET(
    PNR,
    Booking_ID,
    Bus_ID,
    Route_ID,
    Departure_Date_Time,
    Ticket_Status,
    Issue_Date_Time
)
```

### Primary Key

```text
PNR
```

### Functional Dependencies

```text
PNR → Booking_ID,
      Bus_ID,
      Route_ID,
      Departure_Date_Time,
      Ticket_Status,
      Issue_Date_Time
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 14. PASSENGER

### Relation

```text
PASSENGER(
    Passenger_ID,
    Name,
    Gender,
    Phone_No,
    DOB,
    Passenger_Type,
    Is_Active
)
```

### Primary Key

```text
Passenger_ID
```

### Functional Dependencies

```text
Passenger_ID → Name,
               Gender,
               Phone_No,
               DOB,
               Passenger_Type,
               Is_Active
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---

## 15. TRAVELS_ON

### Relation

```text
TRAVELS_ON(
    PNR,
    Passenger_ID,
    Bus_ID,
    Seat_No,
    Passenger_Fare
)
```

### Primary Key

```text
(PNR, Passenger_ID)
```

### Functional Dependencies

```text
(PNR, Passenger_ID)
        → Bus_ID,
          Seat_No,
          Passenger_Fare

```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
## 16. CANCELLATION

### Relation

```text
CANCELLATION(
    Cancellation_ID,
    Booking_ID,
    Cancellation_Date_Time,
    Refund_Amount,
    Refund_Status,
    Reason,
    Cancelled_By,
    Cancellation_Policy
)
```

### Primary Key

```text
Cancellation_ID
```

### Functional Dependencies

```text
Cancellation_ID → Booking_ID,
                  Cancellation_Date_Time,
                  Refund_Amount,
                  Refund_Status,
                  Reason,
                  Cancelled_By,
                  Cancellation_Policy
```
### BCNF Verification 
Since every determinant is a candidate key, the relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

---
##  Conclusion

Each relation in the database was analyzed using its corresponding functional dependencies and candidate keys. For every non-trivial functional dependency, the determinant was verified to be either a primary key or an alternate candidate key. Therefore, every relation satisfies the requirements of Boyce–Codd Normal Form (BCNF).

Since every relation is in BCNF, the entire GoBus database schema automatically satisfies Third Normal Form (3NF), Second Normal Form (2NF), and First Normal Form (1NF). Hence, the database schema is fully normalized, free from partial and transitive dependencies, minimizes redundancy, and does not require any further decomposition.

















