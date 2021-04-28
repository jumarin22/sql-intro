-- Create a table: Employees.
CREATE TABLE "Employees" ( 
 "FullName" TEXT NOT NULL, 
 "Salary" INT, 
 "JobPosition" TEXT NOT NULL, 
 "PhoneExtension" INT, 
 "IsPartTime" BOOLEAN 
 );

 -- Create a few employees. 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Adam Apple', '10000', 'Apple Eater', '1234', 'true'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Brenda Berry', '20000', 'Berry Basher', '2345', 'true'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Charlie Cooker', '30000', 'Chef', '3456', 'false'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Della Donut', '40000', 'Lunch Stealer', '4567', 'true'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Eddie Egger', '50000', 'Egg Thrower', '5678', 'true'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Francine Forker', '60000', 'Stew Skewer', '7890', 'false'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Gilian Golfer', '70000', 'Time Waster', '8901', 'false'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Homer Honker', '80000', 'Honker Hater', '9012', 'true'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Indie Idler', '90000', 'Procrastinator', '1230', 'false'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Jimmy Jingles', '100000', 'Noise Maker', '9999', 'true');
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Lazy Larry', '100000', 'Sleep Walker', '7777', 'false');


-- Select all columns for all employees.
SELECT * FROM "Employees"; 

-- Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") 
VALUES ('Noobie Noobster', '10', 'Hazing Receiver', '9876', 'true');

-- Update all employees that are cooks to have a salary of 500.
UPDATE "Employees"
SET "Salary" = '500'
WHERE "JobPosition" = 'Chef';

-- Delete all employees that have the full name of "Lazy Larry".
DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

-- Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.
ALTER TABLE "Employees"
ADD "ParkingSpot" varchar(10); 

--
-- Begin 03-03 - Foreign Keys - The SQL.
--

-- Add a table named Departments.
CREATE TABLE "Departments" ( 
 "Id" SERIAL PRIMARY KEY, 
 "DepartmentName" TEXT, 
 "Building" TEXT 
 );

-- Add a Foreign key DepartmentId to your Employees Table.
ALTER TABLE "Employees" 
ADD COLUMN "DepartmentId" INTEGER NULL 
REFERENCES "Departments" ("Id");

-- Add table named Products.
CREATE TABLE "Products" (
  "Id" SERIAL PRIMARY KEY,
  "Price" MONEY,
  "Name" TEXT,
  "Description" TEXT,
  "QuantityInStock" INTEGER
);

-- Add table named Orders.
CREATE TABLE "Orders" (
"Id" SERIAL PRIMARY KEY,
"OrderNumber" TEXT,
"DatePlaced" TIMESTAMP,
"Email" TEXT
);

-- Create table "ProductOrders".
CREATE TABLE "ProductOrders" (
  "Id" SERIAL PRIMARY KEY,
  "OrderId" INTEGER REFERENCES "Orders" ("Id"),
  "ProductId" INTEGER REFERENCES "Products" ("Id")
  "OrderQuantity" INTEGER;
);

-- Insert Departments.
INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Development', 'Main');
INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Marketing', 'North');

-- Insert Employees.
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tim Smith', '40000', 'Programmer', '123', 'false', '1'); 
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Barbara Ramsey', '80000', 'Manager', '234', 'false', '1');
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tom Jones', '32000', 'Admin', '456', 'true', '2');

-- Insert Products.
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES ('12.45', 'Widget', 'The Original Widget', '100');
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES ('99.99', 'Flowbee', 'Perfect for haircuts', '3');

-- Insert a new order with order number X529.
INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email") VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

-- Add Quantity to Widget order.
INSERT INTO "ProductOrders" ("OrderId","ProductId", "OrderQuantity") VALUES ('1', '1', '3');

-- Add Quantity to Flowbee order.
INSERT INTO "ProductOrders" ("OrderId","ProductId", "OrderQuantity") VALUES ('1', '2', '2');

-- Given a building, return all employees that work in that building. 
-- Show this query for buildings named North Side, East Side, 
-- NOTE this means you can't manually look up Ids and use them, you have to let SQL do that work. (Hint: JOIN)

SELECT * FROM "Employees"
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."Building" = 'North Side';

SELECT * FROM "Employees"
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."Building" = 'East Side';

-- and finally a building that you actually have in your data 
-- even if your data doesn't have any departments in those buildings. 
SELECT * FROM "Employees"
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."Building" = 'Main';

-- Find all orders that contain the product id of 2.
SELECT * From "Orders"
JOIN "ProductOrders" ON "Orders"."Id" = "ProductOrders"."OrderId"
WHERE "ProductOrders"."ProductId" = '2';

-- Find the Flowbee.
SELECT "Orders"."OrderNumber", "Products"."Name", "ProductOrders"."OrderQuantity"
FROM "ProductOrders"
JOIN "Products" ON "Products"."Id" = "ProductOrders"."ProductId"
JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."OrderId"
WHERE ("Products"."Name" = 'Flowbee');


