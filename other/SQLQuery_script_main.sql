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

-- using MD5 as basic hash for passwords (in study) - then column password using 32 chars
-- using word "password" (with no quotes of course) for rassword for all users
-- '5f4dcc3b5aa765d61d8327deb882cf99'

CREATE TABLE client
(
  client_ID           INT      NOT NULL PRIMARY KEY IDENTITY (1,1),
  lastname        NVARCHAR(20) NOT NULL,
  firstname       NVARCHAR(10) NOT NULL,
  titleofcourtesy NVARCHAR(25) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  email           NVARCHAR(50) NOT NULL UNIQUE,
  password        VARCHAR(32)  NOT NULL,
  typeOfUser      NVARCHAR(128) NOT NULL
  );

CREATE TABLE clients_groups
(
  groups_ID           INT      NOT NULL IDENTITY,
  email           NVARCHAR(50) NOT NULL UNIQUE,
);

CREATE TABLE groups
(
   groups_ID      int          NOT NULL PRIMARY KEY IDENTITY (1,1),
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


--SET IDENTITY_INSERT client ON;
INSERT INTO client(lastname, firstname, titleofcourtesy, phone, email, password, typeOfUser)
  VALUES
  (N'Admin', N'Admin', N'Mr.', N'(206) 555-5263', N'admin@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'administrator'),
  (N'Davis', N'Sara', N'Ms.', N'(206) 555-0101', N'Davis@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Funk', N'Don', N'Dr.', N'(206) 555-0100', N'Funk@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Lew', N'Judy', N'Ms.', N'(206) 555-0103', N'Lew@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Peled', N'Yael', N'Mrs.', N'(206) 555-0104', N'Peled@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Buck', N'Sven', N'Mr.', N'(71) 234-5678', N'Buck@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Suurs', N'Paul', N'Mr.', N'(71) 345-6789', N'Suurs@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'King', N'Russell', N'Mr.', N'(71) 123-4567', N'King@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Cameron', N'Maria', N'Ms.', N'(206) 555-0102', N'Cameron@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser'),
  (N'Dolgopyatova', N'Zoya', N'Ms.', N'(71) 456-7890', N'Dolgopyatova@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'simpleuser');
--SET IDENTITY_INSERT client OFF;

--SET IDENTITY_INSERT groups ON;
INSERT INTO groups (name, description)
VALUES
  ('USERS', 'Users of the app'),
  ('ADMINS', 'Administrators of the app');
--SET IDENTITY_INSERT groups OFF;

SET IDENTITY_INSERT clients_groups ON;
INSERT INTO clients_groups (groups_id,email)
VALUES
  (1,'Davis@gmail.com'),
  (2,'admin@gmail.com'),
  (1,'Funk@gmail.com'),
  (1,'Lew@gmail.com'),
  (1,'Peled@gmail.com'),
  (1,'Buck@gmail.com'),
  (1,'Suurs@gmail.com'),
  (1,'King@gmail.com'),
  (1,'Cameron@gmail.com'),
  (1,'Dolgopyatova@gmail.com');
SET IDENTITY_INSERT clients_groups OFF;
