USE ELEVATE;

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    City TEXT
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate TEXT,
    Amount REAL,
    CustomerID INTEGER,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'Rohan', 'Amravati'),
(2, 'Sujata', 'Pune'),
(3, 'Lokesh', 'Delhi'),
(4, 'Rani', 'Akola');


INSERT INTO Orders (OrderID, OrderDate, Amount, CustomerID)
VALUES
(101, '2024-06-01', 1200, 1),
(102, '2024-06-05', 2500, 2),
(103, '2024-06-10', 1800, 1),
(104, '2024-06-12', 3000, 3);


SELECT C.CustomerID, C.CustomerName, C.City, O.OrderID, O.Amount
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID;


SELECT C.CustomerID, C.CustomerName, C.City, O.OrderID, O.Amount
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID;


SELECT C.CustomerID, C.CustomerName, C.City, O.OrderID, O.Amount
FROM Customers C
RIGHT JOIN Orders O
ON C.CustomerID = O.CustomerID
ORDER BY O.OrderID;


SELECT C.CustomerID, C.CustomerName, C.City, O.OrderID, O.Amount
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID

UNION

SELECT C.CustomerID, C.CustomerName, C.City, O.OrderID, O.Amount
FROM Customers C
RIGHT JOIN Orders O
ON C.CustomerID = O.CustomerID
ORDER BY CustomerID;


SELECT C.CustomerName AS Customer, O.OrderID AS OrderCode
FROM Customers C
CROSS JOIN Orders O
ORDER BY C.CustomerID, O.OrderID;
