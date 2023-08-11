CREATE DATABASE ExerciseDb;
USE ExerciseDb;

CREATE TABLE Publisher (
    PID INT PRIMARY KEY,
    Publisher VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Publisher (PID, Publisher)VALUES
(1, 'Publisher1'),(2, 'Publisher2');
select * from Publisher


CREATE TABLE Category (
    CID INT PRIMARY KEY,
    Category VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Category (CID, Category)VALUES
(1, 'Fiction'),(2, 'Non-Fiction'), (3, 'Mystery');



CREATE TABLE Author (
    AID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Author (AID, AuthorName)VALUES
(1, 'Shashank'),(2, 'Sadashiva'),(3, 'Lakshmi');



CREATE TABLE Book (
    BID INT PRIMARY KEY,
    BName VARCHAR(255) NOT NULL,
    BPrice DECIMAL(10, 2),
    Author INT,
    Publisher INT,
    Category INT,
    FOREIGN KEY (Author) REFERENCES Author(AID),
    FOREIGN KEY (Publisher) REFERENCES Publisher(PID),
    FOREIGN KEY (Category) REFERENCES Category(CID)
);


INSERT INTO Book (BID, BName, BPrice, Author, Publisher, Category)
VALUES
    (1, 'Book1', 19.99, 1, 1, 1),
    (2, 'Book2', 12.99, 2, 2, 2),
    (3, 'Book3', 29.99, 3, 1, 1),
    (4, 'Book4', 9.99, 1, 2, 3),
    (5, 'Book5', 15.99, 2, 1, 2),
    (6, 'Book6', 24.99, 3, 2, 1);

SELECT B.BID,B.BName,B.BPrice,A.AuthorName AS Author,P.Publisher AS Publisher,C.Category AS Category
FROM Book B
JOIN Author A ON B.Author = A.AID
JOIN Publisher P ON B.Publisher = P.PID
JOIN Category C ON B.Category = C.CID;
