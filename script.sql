--creating tables
CREATE TABLE Venue (
  HallNo INT NOT NULL PRIMARY KEY,
  city VARCHAR(20) NOT NULL,
  area VARCHAR(20) NOT NULL,
  STno VARCHAR(20) NOT NULL,
  Bno VARCHAR(20) NOT NULL,
  period INT NOT NULL,
  hallCap INT NOT NULL,
  available CHAR(1) NOT NULL,
  parkingCap INT NOT NULL,
  catering CHAR(4) NOT NULL,
  decor CHAR(4) NOT NULL
);

CREATE TABLE customers (
  CustomerID INT NOT NULL PRIMARY KEY,
  email VARCHAR(50),
  phone CHAR(10) NOT NULL,
  first VARCHAR(20) NOT NULL,
  last VARCHAR(20) NOT NULL,
  middle VARCHAR(20) NOT NULL
);

CREATE TABLE event (
  EventID INT NOT NULL PRIMARY KEY,
  dateOfEvent DATE NOT NULL,
  HallNo INT NOT NULL,
  CustomerID INT NOT NULL,
  FOREIGN KEY (HallNo) REFERENCES Venue(HallNo) ON DELETE SET NULL,
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID) ON DELETE SET NULL
);

CREATE TABLE Employees (
  SSN INT NOT NULL PRIMARY KEY,
  bdate DATE NOT NULL,
  fname VARCHAR(20) NOT NULL,
  mname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL,
  city VARCHAR(20),
  area VARCHAR(20),
  STno VARCHAR(20),
  Bno VARCHAR(20),
  salary FLOAT NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone CHAR(10) NOT NULL,
  hiredate DATE NOT NULL,
  supervisor_SSN INT,
  FOREIGN KEY (supervisor_SSN) REFERENCES Employees(SSN) ON DELETE SET NULL
);

CREATE TABLE department (
  name VARCHAR(20) NOT NULL PRIMARY KEY,
  location_ VARCHAR(20) NOT NULL,
  estdate DATE NOT NULL,
  SSN INT NOT NULL,
  FOREIGN KEY (SSN) REFERENCES Employees(SSN) ON DELETE SET NULL
);

CREATE TABLE works_in (
  SSN INT NOT NULL,
  name VARCHAR(20) NOT NULL,
  PRIMARY KEY (SSN, name),
  FOREIGN KEY (SSN) REFERENCES Employees(SSN) ON DELETE SET NULL,
  FOREIGN KEY (name) REFERENCES department(name) ON DELETE SET NULL
);

CREATE TABLE works_on (
  SSN INT NOT NULL,
  EventID INT NOT NULL,
  PRIMARY KEY (SSN, EventID),
  FOREIGN KEY (SSN) REFERENCES Employees(SSN) ON DELETE SET NULL,
  FOREIGN KEY (EventID) REFERENCES event(EventID) ON DELETE SET NULL
);

--inserting records

--venue

INSERT INTO Venue (city, area, STno, Bno, period, hallCap, available, parkingCap, HallNo, catering, decor)
VALUES('Amman', 'Jubeiha', '5b', '343', 8, 300, 'Y', 40, 1, 'N', 'Y');

INSERT INTO Venue (city, area, STno, Bno, period, hallCap, available, parkingCap, HallNo, catering, decor)
VALUES('Amman', 'Jabal Amman', '5b', '341', 5, 150, 'Y', 10, 2, 'Y', 'Y');

INSERT INTO Venue (city, area, STno, Bno, period, hallCap, available, parkingCap, HallNo, catering, decor)
VALUES('Amman', 'Al-Kursi', '7c', '789', 6, 400, 'N', 90, 3, 'Y', 'N');

INSERT INTO Venue (city, area, STno, Bno, period, hallCap, available, parkingCap, HallNo, catering, decor)
VALUES('Amman', 'Al-Abdali', '4d', '147', 4, 200, 'Y', 50, 4, 'Y', 'Y');
  
INSERT INTO Venue (city, area, STno, Bno, period, hallCap, available, parkingCap, HallNo, catering, decor)
VALUES('Amman', 'Shmeisani', '2b', '332', 6, 300, 'N', 100, 5, 'N', 'Y');


--customers

INSERT INTO customers (email, phone, first, last, middle, CustomerID)
VALUES('mohabdu3@gmail.com', '0791234567', 'Mohammad', 'Abdullah', 'Ali', 1);

INSERT INTO customers (email, phone, first, last, middle, CustomerID)
VALUES('lriyad3@gmail.com', '0792345678', 'Luma', 'Sabri', 'riyad', 2);

INSERT INTO customers (email, phone, first, last, middle, CustomerID)
VALUES('nfaraj22@hotmail.com', '0793456789', 'Nour', 'Faraj', 'Ahmad', 3);

INSERT INTO customers (email, phone, first, last, middle, CustomerID)
VALUES('abdullahahmad@live.com', '0794567890', 'Abdullah', 'Tawabeini', 'Ahmad', 4);

INSERT INTO customers (email, phone, first, last, middle, CustomerID)
VALUES('leenmq1@gmail.com', '0795678901', 'Leen', 'Qteish', 'Mohammad', 5);


--event
INSERT INTO event (dateOfEvent, EventID, HallNo, CustomerID)
VALUES(TO_DATE('2023-05-10','YYYY-MM-DD'), 1, 1, 1);

INSERT INTO event (dateOfEvent, EventID, HallNo, CustomerID)
VALUES(TO_DATE('2023-09-15','YYYY-MM-DD'), 2, 2, 2);

INSERT INTO event (dateOfEvent, EventID, HallNo, CustomerID)
VALUES(TO_DATE('2023-06-20','YYYY-MM-DD'), 3, 3, 3);

INSERT INTO event (dateOfEvent, EventID, HallNo, CustomerID)
VALUES(TO_DATE('2023-08-02','YYYY-MM-DD'), 4, 4, 4);

INSERT INTO event (dateOfEvent, EventID, HallNo, CustomerID)
VALUES(TO_DATE('2023-12-31','YYYY-MM-DD'), 5, 1, 5);

--Employees
INSERT INTO Employees (SSN, bdate, fname, mname, lname, city, area, STno, Bno, salary, email, phone, hiredate, supervisor_SSN)
VALUES(111111111, TO_DATE('1995-04-15','YYYY-MM-DD'), 'Raghda', 'Ali', 'Hriez', 'Amman', 'Al-Abdali', '2', '13', 500, 'employee1@example.com', '0791111111', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Employees (SSN, bdate, fname, mname, lname, city, area, STno, Bno, salary, email, phone, hiredate, supervisor_SSN)
VALUES (222222222, TO_DATE('1999-07-25','YYYY-MM-DD'), 'Sarah', 'Khalid', 'Atteli', 'Amman', 'Shmeisani', '5', '22', 250, 'employee2@example.com', '0791111111', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Employees (SSN, bdate, fname, mname, lname, city, area, STno, Bno, salary, email, phone, hiredate, supervisor_SSN)
VALUES(333333333, TO_DATE('1990-12-31','YYYY-MM-DD'), 'Mohammad', 'Nasser', 'Hammad', 'Amman', 'Jabal Amman', '3', '5', 300, 'employee3@example.com', '0791111111', TO_DATE('2020-01-01','YYYY-MM-DD'), 111111111);

INSERT INTO Employees (SSN, bdate, fname, mname, lname, city, area, STno, Bno, salary, email, phone, hiredate, supervisor_SSN)
VALUES(444444444, TO_DATE('1985-04-09','YYYY-MM-DD'), 'Dana', 'Omar', 'Qaqish', 'Amman', 'Abdoun', '7', '11', 400, 'employee4@example.com', '0791111111', TO_DATE('2020-01-01','YYYY-MM-DD'), 111111111);

INSERT INTO Employees (SSN, bdate, fname, mname, lname, city, area, STno, Bno, salary, email, phone, hiredate, supervisor_SSN)
VALUES(555555555, TO_DATE('1989-10-22','YYYY-MM-DD'), 'Ali', 'Hani', 'Akroush', 'Amman', 'Tla Al-Ali', '9', '15', 500, 'employee5@example.com', '0791111111', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL);

--department
INSERT INTO department (name, location_, estdate, SSN)
VALUES('Sales', 'Amman', TO_DATE('2015-01-01','YYYY-MM-DD'), 111111111);

INSERT INTO department (name, location_, estdate, SSN)
VALUES('HR', 'Amman', TO_DATE('2015-01-01','YYYY-MM-DD'), 222222222);

INSERT INTO department (name, location_, estdate, SSN)
VALUES('Decoration', 'Amman', TO_DATE('2015-01-01','YYYY-MM-DD'), 333333333);

INSERT INTO department (name, location_, estdate, SSN)
VALUES('Marketing', 'Amman', TO_DATE('2015-01-01','YYYY-MM-DD'), 444444444);

INSERT INTO department (name, location_, estdate, SSN)
VALUES('Accounting', 'Amman', TO_DATE('2015-01-01','YYYY-MM-DD'), 555555555);

--works_in rs
INSERT INTO works_in(SSN,name)
VALUES(111111111,'Sales');

INSERT INTO works_in(SSN,name)
VALUES(222222222,'HR');

INSERT INTO works_in(SSN,name)
VALUES(333333333,'Decoration');

INSERT INTO works_in(SSN,name)
VALUES(444444444,'Marketing');

INSERT INTO works_in(SSN,name)
VALUES(555555555,'Accounting');

--works_on rs
INSERT INTO works_on(SSN,EventID)
VALUES(111111111,1);

INSERT INTO works_on(SSN,EventID)
VALUES(222222222,1);

INSERT INTO works_on(SSN,EventID)
VALUES(333333333,1);

INSERT INTO works_on(SSN,EventID)
VALUES(444444444,2);

INSERT INTO works_on(SSN,EventID)
VALUES(555555555,1);

--update statement
UPDATE department 
SET location_ = 'Irbid'
WHERE name = 'Sales';

--delete statement
DELETE from event
where EventID = '1';

--retrieve using join
SELECT customers.phone
FROM event, customers
WHERE event.CustomerID = customers.CustomerID
  AND event.dateOfEvent >= TO_DATE('2023-05-01','YYYY-MM-DD');

--retrieve using join AND agg functions
SELECT customers.CustomerID, COUNT(*) AS "Number Of Events"
FROM event, customers
WHERE event.CustomerID = customers.CustomerID
  AND event.dateOfEvent >= TO_DATE('2023-05-01','YYYY-MM-DD')
GROUP BY customers.CustomerID;
