DROP DATABASE IF EXISTS Medical_Shop_DB;
CREATE DATABASE Medical_Shop_DB;
USE Medical_Shop_DB;
CREATE TABLE Supplier(
S_ID INT PRIMARY KEY,
S_Name VARCHAR(50),
S_Phone_No VARCHAR(15),
S_Address VARCHAR(100),
S_Emergency_Helpline VARCHAR(15)
);

CREATE TABLE Medicine(
M_ID INT PRIMARY KEY,
Scientific_Name VARCHAR(50),
Dosage VARCHAR(20),
Storage_Temp VARCHAR(20),
Stock_Available_Quantity INT,
Expiry_Date DATE,
Cost DECIMAL(10,2),
Is_Prescription_Req BOOLEAN
);

CREATE TABLE Customer(
C_ID INT PRIMARY KEY,
C_Name VARCHAR(50),
C_Age INT,
C_Gender VARCHAR(10),
C_Phone_No VARCHAR(15),
C_Membership VARCHAR(20)
);

CREATE TABLE Employee(
E_ID INT PRIMARY KEY,
E_Name VARCHAR(50),
Specialization VARCHAR(50),
Salary DECIMAL(10,2),
Contact VARCHAR(15),
Shift_Timings VARCHAR(20)
);

CREATE TABLE Invoice(
Inv_ID INT PRIMARY KEY,
Date DATE,
I_Quantity INT,
Discount_Amount DECIMAL(10,2),
Applied_Tax DECIMAL(10,2),
Final_Price DECIMAL(10,2),
C_ID INT,
E_ID INT,
FOREIGN KEY (C_ID) REFERENCES Customer(C_ID),
FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Invoice_Item(
Item_ID INT PRIMARY KEY,
Serial_No INT,
Inv_ID INT,
M_ID INT,
Inv_Quantity INT,
Inv_Price DECIMAL(10,2),
FOREIGN KEY (Inv_ID) REFERENCES Invoice(Inv_ID),
FOREIGN KEY (M_ID) REFERENCES Medicine(M_ID)
);

CREATE TABLE Purchase_Order(
PO_ID INT PRIMARY KEY,
Order_Date DATE,
Expected_Arrival DATE,
Total_Cost DECIMAL(10,2),
S_ID INT,
E_ID INT,
FOREIGN KEY (S_ID) REFERENCES Supplier(S_ID),
FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Payment(
Payment_ID INT PRIMARY KEY,
Amount DECIMAL(10,2),
Payment_Mode VARCHAR(20),
Payment_Date DATE,
Digital_Transaction_Ref VARCHAR(50),
Inv_ID INT,
FOREIGN KEY (Inv_ID) REFERENCES Invoice(Inv_ID)
);

CREATE TABLE Supplies(
S_ID INT,
M_ID INT,
PRIMARY KEY(S_ID, M_ID),
FOREIGN KEY (S_ID) REFERENCES Supplier(S_ID),
FOREIGN KEY (M_ID) REFERENCES Medicine(M_ID)
);

CREATE TABLE contains(
PO_ID INT,
M_ID INT,
Quantity INT,
PRIMARY KEY(PO_ID, M_ID),
FOREIGN KEY (PO_ID) REFERENCES Purchase_Order(PO_ID),
FOREIGN KEY (M_ID) REFERENCES Medicine(M_ID)
);

INSERT INTO Supplier VALUES
(1,'ABC Pharma','9001','Hyd','1801'),
(2,'XYZ Meds','9002','Warangal','1802'),
(3,'HealthCorp','9003','Nizamabad','1803'),
(4,'MedPlus','9004','Delhi','1804'),
(5,'Apollo','9005','Chennai','1805'),
(6,'LifeCare','9006','Mumbai','1806'),
(7,'CarePlus','9007','Pune','1807'),
(8,'BioMed','9008','Kolkata','1808'),
(9,'PharmaLine','9009','BLR','1809'),
(10,'Wellness','9010','Vizag','1810');

INSERT INTO Medicine VALUES
(1,'Paracetamol','500mg','Room',100,'2027-01-01',10,0),
(2,'Amoxicillin','250mg','Cool',80,'2026-05-01',20,1),
(3,'Ibuprofen','400mg','Room',70,'2026-09-01',15,0),
(4,'Cetrizine','10mg','Room',60,'2026-12-01',12,0),
(5,'Metformin','500mg','Cool',90,'2027-02-01',25,1),
(6,'Aspirin','100mg','Room',110,'2027-03-01',8,0),
(7,'Azithromycin','500mg','Cool',50,'2026-06-01',30,1),
(8,'Vitamin C','500mg','Room',120,'2027-08-01',18,0),
(9,'Dolo','650mg','Room',100,'2027-10-01',12,0),
(10,'Insulin','10ml','Cold',40,'2026-04-01',150,1);

INSERT INTO Customer VALUES
(1,'Ravi',25,'Male','90001','Gold'),
(2,'Sita',30,'Female','90002','Silver'),
(3,'Suresh',22,'Male','90003','None'),
(4,'Rajani',28,'Female','90004','Gold'),
(5,'Koushik',35,'Male','90005','Silver'),
(6,'Neha',27,'Female','90006','None'),
(7,'Kiran',40,'Male','90007','Gold'),
(8,'Divya',23,'Female','90008','None'),
(9,'Manoj',31,'Male','90009','Silver'),
(10,'Anita',29,'Female','90010','Gold');

INSERT INTO Employee VALUES
(1,'Ajay','Pharmacist',20000,'8001','Morning'),
(2,'Vijay','Manager',30000,'8002','Evening'),
(3,'Ramesh','Sales',18000,'8003','Morning'),
(4,'Suresh','Pharmacist',22000,'8004','Night'),
(5,'Kavya','Sales',17000,'8005','Morning'),
(6,'Meena','Manager',32000,'8006','Evening'),
(7,'Arun','Sales',16000,'8007','Night'),
(8,'Deepa','Pharmacist',21000,'8008','Morning'),
(9,'Rohit','Sales',19000,'8009','Evening'),
(10,'Pooja','Manager',35000,'8010','Night');

INSERT INTO Invoice VALUES
(1,'2026-03-01',2,5,2,50,1,1),
(2,'2026-03-02',3,0,3,80,2,2),
(3,'2026-03-03',1,2,1,30,3,3),
(4,'2026-03-04',4,5,4,120,4,4),
(5,'2026-03-05',2,3,2,60,5,5),
(6,'2026-03-06',3,4,3,90,6,6),
(7,'2026-03-07',2,1,2,40,7,7),
(8,'2026-03-08',5,6,5,150,8,8),
(9,'2026-03-09',1,0,1,20,9,9),
(10,'2026-03-10',3,2,3,70,10,10);

INSERT INTO Invoice_Item VALUES
(1,1,1,1,2,20),
(2,2,2,2,1,20),
(3,3,3,3,3,45),
(4,4,4,4,2,24),
(5,5,5,5,1,25),
(6,6,6,6,2,16),
(7,7,7,7,1,30),
(8,8,8,8,3,54),
(9,9,9,9,2,24),
(10,10,10,10,1,150);

INSERT INTO Purchase_Order VALUES
(1,'2026-01-01','2026-01-10',1000,1,1),
(2,'2026-01-02','2026-01-11',1200,2,2),
(3,'2026-01-03','2026-01-12',800,3,3),
(4,'2026-01-04','2026-01-13',900,4,4),
(5,'2026-01-05','2026-01-14',1100,5,5),
(6,'2026-01-06','2026-01-15',950,6,6),
(7,'2026-01-07','2026-01-16',1050,7,7),
(8,'2026-01-08','2026-01-17',1150,8,8),
(9,'2026-01-09','2026-01-18',1250,9,9),
(10,'2026-01-10','2026-01-19',1300,10,10);

INSERT INTO Payment VALUES
(1,50,'Cash','2026-03-01','TXN1',1),
(2,80,'UPI','2026-03-02','TXN2',2),
(3,30,'Card','2026-03-03','TXN3',3),
(4,120,'Cash','2026-03-04','TXN4',4),
(5,60,'UPI','2026-03-05','TXN5',5),
(6,90,'Card','2026-03-06','TXN6',6),
(7,40,'Cash','2026-03-07','TXN7',7),
(8,150,'UPI','2026-03-08','TXN8',8),
(9,20,'Card','2026-03-09','TXN9',9),
(10,70,'Cash','2026-03-10','TXN10',10);

INSERT INTO Supplies VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO contains VALUES
(1,1,50),(2,2,40),(3,3,30),(4,4,20),(5,5,25),(6,6,35),(7,7,15),(8,8,60),(9,9,45),(10,10,10);




SELECT * FROM Medicine WHERE Cost > 20;


SELECT * FROM Customer ORDER BY C_Name;


SELECT Payment_Mode, COUNT(*) FROM Payment GROUP BY Payment_Mode;


SELECT Payment_Mode, COUNT(*) 
FROM Payment 
GROUP BY Payment_Mode 
HAVING COUNT(*) > 2;


SELECT C.C_Name, I.Inv_ID FROM Customer C JOIN Invoice I ON C.C_ID = I.C_ID;


SELECT C.C_Name, M.Scientific_Name
FROM Customer C
JOIN Invoice I ON C.C_ID = I.C_ID
JOIN Invoice_Item II ON I.Inv_ID = II.Inv_ID
JOIN Medicine M ON II.M_ID = M.M_ID;


SELECT * FROM Medicine
WHERE Cost > (SELECT AVG(Cost) FROM Medicine);


UPDATE Medicine SET Cost = Cost + 5 WHERE M_ID = 1;

SELECT * FROM Medicine WHERE M_ID = 1;
SELECT * FROM Medicine;

DELETE FROM contains WHERE M_ID = 1;

SELECT * FROM contains ;



INSERT INTO Customer VALUES (11,'Test',20,'Male','9999','None');
SELECT * FROM Customer ;