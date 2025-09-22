
CREATE TABLE Customers (
    customerId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    customerName VARCHAR(50) NOT NULL,
    customerUsername VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    mobile VARCHAR(15),
    address VARCHAR(100)
);

INSERT INTO Customers (customerName, customerUsername, password, email, mobile, address) 
VALUES ('John Doe', 'john123', 'Secure@123', 'john.doe@example.com', '+1-9876543210', '123 Main St, City, ZIP');

SELECT * FROM CUSTOMERS;

CREATE TABLE Officers (
    officer_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL
);

DROP TABLE officers
DROP TABLE bookings
DROP TABLE customers


CREATE TABLE bookings (
    BookingID INT NOT NULL PRIMARY KEY,
    UserID VARCHAR(50),
    SenderName VARCHAR(255),
    SenderMobileNumber VARCHAR(10),
    RecName VARCHAR(255),
    RecAddress VARCHAR(255),
    RecPin VARCHAR(6),
    RecMobileNumber VARCHAR(10),
    ParWeight DOUBLE,
    ParContents VARCHAR(255),
    ParDelivery VARCHAR(255),
    parPackingPreference VARCHAR(255),
    ParPickupTime TIMESTAMP,
    ParDropoffTime TIMESTAMP,
    ParServiceCost DOUBLE,
    ParStatus VARCHAR(255),
    DateOfBooking DATE
   
);


select * from BOOKINGS;
select * from customers;
select * from OFFICERS;
select * from USERS;

INSERT INTO Officers (username, password) VALUES ('officer', 'Password123!');

INSERT INTO USERS VALUES( '234567', 'romanstyles', 'nodia',   'aj@tcs.com', '1234512345',   'Aj@12345', 'Customer')
INSERT INTO USERS VALUES( 'officer', 'officer', 'nodia',   'aj@tcs.com', '1234512345',   'Aj@12345', 'Customer')

SELECT CONSTRAINT_NAME
FROM
INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA='MyDB' AND TABLE_NAME='bookings' AND CONSTRAINT_TYPE='FOREIGN KEY';


SELECT c.CONSTRAINTNAME
FROM SYS.SYSCONSTRAINTS c
JOIN SYS.SYSFOREIGNKEYS f ON c.CONSTRAINTID = f.CONSTRAINTID
JOIN SYS.SYSTABLES t ON c.TABLEID = t.TABLEID
WHERE t.TABLENAME = 'BOOKINGS';

 SQL241023191325801

 ALTER TABLE bookings DROP CONSTRAINT SQL241023191325801