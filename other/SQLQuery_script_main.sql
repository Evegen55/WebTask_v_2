--  Run the following code to create an empty database called paymentsDB_v_1_3_SQLExpress
USE master;

-- Drop database
IF DB_ID('paymentsDB_v_1_3_SQLExpress') IS NOT NULL DROP DATABASE paymentsDB_v_1_3_SQLExpress;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

-- Create database
CREATE DATABASE paymentsDB_v_1_3_SQLExpress;

USE paymentsDB_v_1_3_SQLExpress;
GO

-- 3. Proceed to section C

CREATE TABLE client
(
  client_ID           INT      NOT NULL IDENTITY,
  lastname        NVARCHAR(20) NOT NULL,
  firstname       NVARCHAR(10) NOT NULL,
  titleofcourtesy NVARCHAR(25) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  email           NVARCHAR(50) NOT NULL UNIQUE,
  password        VARCHAR(100),
  typeOfUser      NVARCHAR(20) NOT NULL
  );

CREATE TABLE clients_groups
(
  groups_ID           INT      NOT NULL IDENTITY,
  email           NVARCHAR(50) NOT NULL UNIQUE,
);

CREATE TABLE groups
(
   groups_ID      int          NOT NULL PRIMARY KEY IDENTITY, 
   name          VARCHAR(50)   NOT NULL,
   description   VARCHAR(300)
);

CREATE UNIQUE INDEX SQL_PERSON_EMAIL_INDEX ON client(email)

CREATE UNIQUE INDEX SQL_PERSON_ID_INDEX ON client(client_ID)

CREATE INDEX SQL_PERSONGROUPS_EMAIL_INDEX ON clients_groups(email)

CREATE INDEX SQL_PERSONGROUPS_ID_INDEX ON clients_groups(groups_ID)

ALTER TABLE clients_groups 
ADD CONSTRAINT FK_clients_groups_clients
FOREIGN KEY (email)
REFERENCES client(email)
;
ALTER TABLE clients_groups
ADD CONSTRAINT FK_clients_groups_groups
FOREIGN KEY (groups_ID)
REFERENCES groups(groups_ID)
;


SET IDENTITY_INSERT client ON;
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(1, N'Admin', N'Admin', N'Mr.', N'(206) 555-5263', N'admin@gmail.com', NULL, 'administrator');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(2, N'Davis', N'Sara', N'Ms.', N'(206) 555-0101', N'Davis@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(3, N'Funk', N'Don', N'Dr.', N'(206) 555-0100', N'Funk@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(4, N'Lew', N'Judy', N'Ms.', N'(206) 555-0103', N'Lew@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(5, N'Peled', N'Yael', N'Mrs.', N'(206) 555-0104', N'Peled@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(6, N'Buck', N'Sven', N'Mr.', N'(71) 234-5678', N'Buck@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(7, N'Suurs', N'Paul', N'Mr.', N'(71) 345-6789', N'Suurs@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(8, N'King', N'Russell', N'Mr.', N'(71) 123-4567', N'King@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(9, N'Cameron', N'Maria', N'Ms.', N'(206) 555-0102', N'Cameron@gmail.com', NULL, 'simpleuser');
INSERT INTO client(client_ID, lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES(10, N'Dolgopyatova', N'Zoya', N'Ms.', N'(71) 456-7890', N'Dolgopyatova@gmail.com', NULL, 'simpleuser');
SET IDENTITY_INSERT client OFF;

SET IDENTITY_INSERT groups ON;
INSERT INTO groups (groups_ID, name, description) 
VALUES (1, 'USERS', 'Users of the app');
INSERT INTO groups (groups_ID, name, description) 
VALUES (2, 'ADMINS', 'Administrators of the app');
SET IDENTITY_INSERT groups OFF;

SET IDENTITY_INSERT clients_groups ON;
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Davis@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (2,'admin@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Funk@gmail.com');
INSERT INTO clients_groups (groups_id,email)  
VALUES (1,'Lew@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Peled@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Buck@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Suurs@gmail.com');
INSERT INTO clients_groups (groups_id,email)  
VALUES (1,'King@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Cameron@gmail.com');
INSERT INTO clients_groups (groups_id,email) 
VALUES (1,'Dolgopyatova@gmail.com');
SET IDENTITY_INSERT clients_groups OFF;