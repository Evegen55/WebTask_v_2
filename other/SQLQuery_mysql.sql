CREATE DATABASE IF NOT EXISTS paymentsDB_v_1_3_SQLExpress;

/****** Object:  Table [client]    Script Date: 16.04.2016 23:53:05 ******/
USE paymentsDB_v_1_3_SQLExpress;
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
USE paymentsDB_v_1_3_SQLExpress;
CREATE TABLE IF NOT EXISTS clients_groups
(
  groups_ID           INT      NOT NULL AUTO_INCREMENT,
  email           NVARCHAR(50) NOT NULL UNIQUE,
);
/****** Object:  Table [groups]    Script Date: 16.04.2016 23:53:05 ******/
CREATE TABLE IF NOT EXISTS groups
(
   groups_ID      int          NOT NULL PRIMARY KEY AUTO_INCREMENT,
   name          VARCHAR(50)   NOT NULL,
   description   VARCHAR(300)
);
