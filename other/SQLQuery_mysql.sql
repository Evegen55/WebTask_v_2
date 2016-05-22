DROP database paymentsDB_v_1_3_SQLExpress;

CREATE DATABASE IF NOT EXISTS paymentsDB_v_1_3_SQLExpress;

USE paymentsDB_v_1_3_SQLExpress;

/****** Object:  Table [client]    Script Date: 16.04.2016 23:53:05 ******/
CREATE TABLE IF NOT EXISTS client 
(
  client_ID           INT      NOT NULL PRIMARY KEY AUTO_INCREMENT,
  lastname        NVARCHAR(20) NOT NULL,
  firstname       NVARCHAR(10) NOT NULL,
  titleofcourtesy NVARCHAR(25) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  email           NVARCHAR(50) NOT NULL UNIQUE,
  password        VARCHAR(32)  NOT NULL,
  typeOfUser      NVARCHAR(128) NOT NULL
  );
  
/****** Object:  Table [clients_groups]    Script Date: 16.04.2016 23:53:05 ******/
CREATE TABLE IF NOT EXISTS clients_groups
(
  groups_ID       INT      NOT NULL,
  email           NVARCHAR(50) NOT NULL UNIQUE
);
/****** Object:  Table [groups]    Script Date: 16.04.2016 23:53:05 ******/
CREATE TABLE IF NOT EXISTS groups
(
   groups_ID     INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
   name          VARCHAR(50)   NOT NULL,
   description   VARCHAR(300)
);
/****** create keys and dependencies    Script Date: 16.04.2016 23:53:05 ******/
CREATE UNIQUE INDEX SQL_PERSON_EMAIL_INDEX ON client(email);

CREATE UNIQUE INDEX SQL_PERSON_ID_INDEX ON client(client_ID);

CREATE INDEX SQL_PERSONGROUPS_EMAIL_INDEX ON clients_groups(email);

CREATE INDEX SQL_PERSONGROUPS_ID_INDEX ON clients_groups(groups_ID);

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

/****** populate tables    Script Date: 16.04.2016 23:53:05 ******/
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

INSERT INTO groups (name, description)
VALUES
  ('USERS', 'Users of the app'),
  ('ADMINS', 'Administrators of the app');  
  
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
  
CREATE VIEW v_user_role AS
SELECT u.email, g.name, u.password 
FROM client u, groups g, clients_groups ug 
WHERE u.email = ug.email and g.groups_ID = ug.groups_ID;

/******Create tables for using it as storage for data: bank accounts, credit cards etc. Some tables 
will be created as sql-dump from first database

******/

/****** Object:  Table [bankAccount]    Script Date: 16.04.2016 23:53:05 ******/

CREATE TABLE bankAccount(
	account_ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	client_ID int NOT NULL,
	currentBalance float NOT NULL,
	status BOOL NOT NULL
);

ALTER TABLE bankAccount
ADD  CONSTRAINT FK_bankAccount_client 
FOREIGN KEY(client_ID)
REFERENCES client (client_ID);

INSERT INTO bankAccount (client_ID,currentBalance, status)
VALUES
  (1, 10000, 0),
  (2, 10000, 0),
  (3, 10000, 0),
  (4, 10000, 0),
  (5, 10000, 0),
  (6, 10000, 0),
  (7, 10000, 0),
  (8, 10000, 0),
  (9, 10000, 0),
  (10, 10000, 0);
INSERT INTO bankAccount (client_ID,currentBalance, status)
VALUES
  (1, 8000, 0),
  (2, 8000, 0),
  (3, 8000, 0),
  (4, 8000, 0),
  (5, 8000, 0),
  (6, 8000, 0),
  (7, 8000, 0),
  (8, 8000, 0),
  (9, 8000, 0),
  (10, 8000, 0);


/****** Object:  Table creditCards    Script Date: 17.04.2016 0:32:23 ******/

CREATE TABLE creditCards(
	card_ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	account_ID int NOT NULL,
	client_ID int NOT NULL,
	PAN nchar(16) NOT NULL,
	secureCode int NOT NULL,
	validDate date NOT NULL,
	status BOOL NOT NULL
);

ALTER TABLE creditCards
ADD  CONSTRAINT FK_creditCards_bankAccount
FOREIGN KEY(account_ID)
REFERENCES bankAccount (account_ID);

ALTER TABLE creditCards
ADD  CONSTRAINT FK_creditCards_client FOREIGN KEY(client_ID)
REFERENCES client (client_ID);

INSERT INTO creditCards (account_ID, client_ID, PAN, secureCode, validDate, status)
VALUES
  (1, 1, 5100479905639871, 1939, '2017-01-01', 0),
  (2, 2, 5100479905639872, 2939, '2017-01-01', 0),
  (3, 3, 5100479905639873, 3939, '2017-01-01', 0),
  (4, 4, 5100479905639874, 4939, '2017-01-01', 0),
  (5, 5, 5100479905639875, 5939, '2017-01-01', 0),
  (6, 6, 5100479905639876, 6939, '2017-01-01', 0),
  (7, 7, 5100479905639877, 7939, '2017-01-01', 0),
  (8, 8, 5100479905639878, 8939, '2017-01-01', 0),
  (9, 9, 5100479905639879, 9939, '2017-01-01', 0),
  (10, 10, 5100479905639870, 0939, '2017-01-01', 0),
  (11, 1, 5689479905639871, 3931, '2017-01-01', 0),
  (12, 2, 5689479905639872, 3932, '2017-01-01', 0),
  (13, 3, 5689479905639873, 3933, '2017-01-01', 0),
  (14, 4, 5689479905639874, 3934, '2017-01-01', 0),
  (15, 5, 5689479905639875, 3935, '2017-01-01', 0),
  (16, 6, 5689479905639876, 3936, '2017-01-01', 0),
  (17, 7, 5689479905639877, 3937, '2017-01-01', 0),
  (18, 8, 5689479905639878, 3938, '2017-01-01', 0),
  (19, 9, 5689479905639879, 3939, '2017-01-01', 0),
  (20, 10, 5689479905639870, 3930, '2017-01-01', 0);
/****** Object:  Table [dbo].[paymentsHistory]    Script Date: 17.04.2016 1:15:31 ******/
CREATE TABLE paymentsHistory (
	payment_ID int NOT NULL PRIMARY KEY,
	client_ID int NOT NULL,
	clientAccount_ID int NOT NULL,
	amount float NOT NULL,
	beneficiarClienst_ID int NOT NULL,
	beneficiarAccount_ID int NOT NULL
);

ALTER TABLE paymentsHistory
ADD  CONSTRAINT FK_paymentsHistory_bankAccount
FOREIGN KEY(clientAccount_ID)
REFERENCES bankAccount (account_ID);

ALTER TABLE paymentsHistory
ADD  CONSTRAINT FK_paymentsHistory_bankAccount1
FOREIGN KEY(beneficiarAccount_ID)
REFERENCES bankAccount (account_ID);

ALTER TABLE paymentsHistory 
ADD  CONSTRAINT FK_paymentsHistory_client 
FOREIGN KEY(client_ID)
REFERENCES client (client_ID);

ALTER TABLE paymentsHistory
ADD  CONSTRAINT FK_paymentsHistory_client1
FOREIGN KEY(beneficiarClienst_ID)
REFERENCES client (client_ID);