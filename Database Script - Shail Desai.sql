/* Name: Shail Desai 
 Course: CIT 38800 - 20013 
 Assignment: Project Proposal Dataset 
 Date: 02/12/2024 */




-- This query will retrieve all usernames and passwords from the Campus_Users table.
-- SELECT Username, Password FROM Campus_Users;

-- This query will get the first and last names of all students along with their email addresses from the Student_Details table.
-- SELECT FirstName, LastName, EmailID FROM Student_Details;

-- This query will list all payment IDs and corresponding card types from the Payment_Details table.
-- SELECT PaymentID, CardType FROM Payment_Details;

-- This query will display all transport card IDs and whether they are generated or not from the Transport_Card table.
-- SELECT CardID, CASE WHEN CardGenerated = 1 THEN 'Yes' ELSE 'No' END AS Generated FROM Transport_Card;

-- This query will retrieve all barcode data along with the corresponding card IDs from the Barcodes table.
-- SELECT BarcodeData, CardID FROM Barcodes;

/* More data will be inserted into this database once development of the Java Program commences*/



/* DATABASE SCRIPT */


-- CAMPUS_USERS TABLE
CREATE TABLE Campus_Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- SAMPLE DATA FOR CAMPUS_USERS TABLE
INSERT INTO Campus_Users (UserID, Username, Password) VALUES (1, 'JohnDoe1', 'user1_password1');  -- Sample Username and Password is provided
INSERT INTO Campus_Users (UserID, Username, Password) VALUES (2, 'JaneSmith2', 'user2_password2');
INSERT INTO Campus_Users (UserID, Username, Password) VALUES (3, 'MichaelJohnson3', 'user3_password3');
INSERT INTO Campus_Users (UserID, Username, Password) VALUES (4, 'EmilyBrown4', 'user4_password4');
INSERT INTO Campus_Users (UserID, Username, Password) VALUES (5, 'DavidLee5', 'user5_password5');

-- SELECT * FROM CAMPUS_USERS


-- STUDENTS_DETAILS TABLE
CREATE TABLE Student_Details (
    StudentID INT PRIMARY KEY,
    UserID INT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
	EmailID VARCHAR(255) NOT NULL,
    CampusID VARCHAR(255) NOT NULL,
    PackageType VARCHAR(255),
    RefillAmount DECIMAL(10, 2),
    RouteID VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Campus_Users(UserID)
);

-- SAMPLE DATA FOR STUDENT_DETAILS TABLE
INSERT INTO Student_Details (StudentID, UserID, FirstName, LastName, EmailID, CampusID, PackageType, RefillAmount, RouteID)
VALUES (1234567890, 1, 'John', 'Doe', 'john.doe@example.com', 'CST1', 'Standard', 100.00, 'ROUTE1');

INSERT INTO Student_Details (StudentID, UserID, FirstName, LastName, EmailID, CampusID, PackageType, RefillAmount, RouteID)
VALUES (2345678901, 2, 'Jane', 'Smith', 'jane.smith@example.com', 'CIT1', 'Premium', 150.50, 'ROUTE2');

INSERT INTO Student_Details (StudentID, UserID, FirstName, LastName, EmailID, CampusID, PackageType, RefillAmount, RouteID)
VALUES (3456789012, 3, 'Michael', 'Johnson', 'michael.johnson@example.com', 'DSA1', 'Standard', 120.75, 'ROUTE3');

INSERT INTO Student_Details (StudentID, UserID, FirstName, LastName, EmailID, CampusID, PackageType, RefillAmount, RouteID)
VALUES (4567890123, 4, 'Emily', 'Brown', 'emily.brown@example.com', 'CST1', 'Premium', 200.25, 'ROUTE1');

INSERT INTO Student_Details (StudentID, UserID, FirstName, LastName, EmailID, CampusID, PackageType, RefillAmount, RouteID)
VALUES (5678901234, 5, 'David', 'Lee', 'david.lee@example.com', 'CIT1', 'Standard', 180.50, 'ROUTE2');


-- SELECT * FROM STUDENT_DETAILS;



-- PAYMENT_DETAILS TABLE
CREATE TABLE Payment_Details (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    CardType VARCHAR(255),
    CardNumber VARCHAR(255),
    CVV INT,
    ExpDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student_Details(StudentID)
);


-- SAMPLE DATA FOR PAYMENT_DETAILS TABLE
INSERT INTO Payment_Details (PaymentID, StudentID, CardType, CardNumber, CVV, ExpDate)
VALUES (4321, 1234567890,'Visa', '1234567890123456', 123, TO_DATE('2025-12-01', 'YYYY-MM-DD'));

INSERT INTO Payment_Details (PaymentID, StudentID, CardType, CardNumber, CVV, ExpDate)
VALUES (5678, 2345678901,'MasterCard', '9876543210987654', 456, TO_DATE('2024-11-01', 'YYYY-MM-DD'));

INSERT INTO Payment_Details (PaymentID, StudentID, CardType, CardNumber, CVV, ExpDate)
VALUES (9876, 3456789012, 'American Express', '1111222233334444', 789, TO_DATE('2023-10-01', 'YYYY-MM-DD'));

INSERT INTO Payment_Details (PaymentID, StudentID, CardType, CardNumber, CVV, ExpDate)
VALUES (3456, 4567890123, 'Discover', '4444333322221111', 234, TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO Payment_Details (PaymentID, StudentID, CardType, CardNumber, CVV, ExpDate)
VALUES (6789, 5678901234, 'Visa', '5555666677778888', 567, TO_DATE('2024-08-01', 'YYYY-MM-DD'));


-- SELECT * FROM PAYMENT_DETAILS

-- TRANSPORT_CARD TABLE
CREATE TABLE Transport_Card (
    CardID VARCHAR2(255) PRIMARY KEY,
    StudentID INT,
    CardGenerated NUMBER(1,0) DEFAULT 0 NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student_Details(StudentID)
);

-- SAMPLE DATA FOR TRANSPORT_CARD TABLE
INSERT INTO Transport_Card (CardID, StudentID, CardGenerated)
VALUES ('CARD001', 1234567890, 0);

INSERT INTO Transport_Card (CardID, StudentID, CardGenerated)
VALUES ('CARD002', 2345678901, 0);

INSERT INTO Transport_Card (CardID, StudentID, CardGenerated)
VALUES ('CARD003', 3456789012, 0);

INSERT INTO Transport_Card (CardID, StudentID, CardGenerated)
VALUES ('CARD004', 4567890123, 0);

INSERT INTO Transport_Card (CardID, StudentID, CardGenerated)
VALUES ('CARD005', 5678901234, 0);

-- SELECT * FROM TRANSPORT_CARD;

-- BARCODES TABLE
CREATE TABLE Barcodes (
    BarcodeID INT PRIMARY KEY,
    BarcodeData VARCHAR(255) NOT NULL,
    CardID VARCHAR(255),
    FOREIGN KEY (CardID) REFERENCES Transport_Card(CardID)
);

-- SAMPLE DATA FOR BARCODES TABLE
INSERT INTO Barcodes (BarcodeID, BarcodeData, CardID)
VALUES (1, 'BARCODE001', 'CARD001');

INSERT INTO Barcodes (BarcodeID, BarcodeData, CardID)
VALUES (2, 'BARCODE002','CARD002');

INSERT INTO Barcodes (BarcodeID, BarcodeData, CardID)
VALUES (3, 'BARCODE003','CARD003');

INSERT INTO Barcodes (BarcodeID, BarcodeData, CardID)
VALUES (4, 'BARCODE004','CARD004');

INSERT INTO Barcodes (BarcodeID, BarcodeData, CardID)
VALUES (5, 'BARCODE005', 'CARD005');

-- SELECT * FROM BARCODES TABLE

-- USER_POINTS TABLE
CREATE TABLE User_Points (
    PointID INT PRIMARY KEY,
    UserID INT,
    Points INT,
    FOREIGN KEY (UserID) REFERENCES Campus_Users(UserID)
);

-- SAMPLE DATA FOR USER_POINTS TABLE
INSERT INTO User_Points (PointID, UserID, Points) VALUES (1, 1, 100);
INSERT INTO User_Points (PointID, UserID, Points) VALUES (2, 2, 150);
INSERT INTO User_Points (PointID, UserID, Points) VALUES (3, 3, 120);
INSERT INTO User_Points (PointID, UserID, Points) VALUES (4, 4, 200);
INSERT INTO User_Points (PointID, UserID, Points) VALUES (5, 5, 180);

-- SELECT * FROM USER_POINTS;

-- USER_RECEIPTS TABLE
CREATE TABLE User_Receipts (
    ReceiptID INT PRIMARY KEY,
    BarcodeID INT,
    StudentID INT NOT NULL,
    ReceiptDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (BarcodeID) REFERENCES Barcodes(BarcodeID),
    FOREIGN KEY (StudentID) REFERENCES Student_Details(StudentID)
);

-- SAMPLE DATA FOR USER_RECEIPTS TABLE
INSERT INTO User_Receipts (ReceiptID, BarcodeID, StudentID, ReceiptDate, Amount, Description)
VALUES (1001, 1, 1234567890, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 50.00, 'Standard Package Transaction');

INSERT INTO User_Receipts (ReceiptID, BarcodeID, StudentID, ReceiptDate, Amount, Description)
VALUES (1002, 2, 2345678901, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 75.00, 'Premium Package Transaction');

-- SELECT * FROM USER_RECEIPTS;






