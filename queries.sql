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
