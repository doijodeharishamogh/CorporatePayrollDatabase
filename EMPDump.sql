CREATE DATABASE  IF NOT EXISTS `employeepayrollmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `employeepayrollmanagement`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: employeepayrollmanagement
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Permanent','Regular employee of the company'),(2,'Contract','Third Party contract Employee');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `deductions` (
  `DeductionID` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `DeductionType` varchar(45) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `DeductionDate` date NOT NULL,
  PRIMARY KEY (`DeductionID`),
  KEY `fk_deduc_emp_idx` (`EmpID`),
  CONSTRAINT `fk_deduc_emp` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
INSERT INTO `deductions` VALUES (1,1,'cab',15,'2018-12-12'),(2,1,'rec',14,'2018-12-15'),(3,1,'newyear party',13,'2019-01-01'),(4,2,'Cab',20,'2018-12-13'),(5,3,'Monitor',30,'2018-12-13');
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Deptdesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'S4HANA','BLR04','HANA DB Dept'),(2,'STE','BLR02','Suit test engineer'),(3,'CRM','BLR05','Customer relationship management');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `DeptID` int(11) DEFAULT NULL,
  `JobID` int(11) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `LevelID` int(11) DEFAULT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `SSN` char(9) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zipcode` char(5) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `EmailID` varchar(45) NOT NULL,
  `Cellphone` char(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `fk_jobTable_idx` (`JobID`),
  KEY `fk_employee_cat_idx` (`CategoryID`),
  KEY `fk_employee_type_idx` (`TypeID`),
  KEY `fk_employee_dept_idx` (`DeptID`),
  KEY `fk_em_level_idx` (`LevelID`),
  CONSTRAINT `fk_em_level` FOREIGN KEY (`LevelID`) REFERENCES `level` (`levelid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_cat` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_dept` FOREIGN KEY (`DeptID`) REFERENCES `department` (`deptid`),
  CONSTRAINT `fk_employee_type` FOREIGN KEY (`TypeID`) REFERENCES `employeetype` (`TypeID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_jobTable` FOREIGN KEY (`JobID`) REFERENCES `jobtitle` (`jobid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,1,1,1,2,'John','Smith','111223333','1994-01-19','M','1191 Boylston','Boston','MA','02215','USA','johnsmith@gmail.com','8578698729'),(2,2,2,2,2,2,'Kendall','Jenner','222334444','1991-04-13','F','1171,Park Drive','Parsipenny','NewJersy','02115','USA','Jenner@gmail.com','9448824586'),(3,3,3,1,1,2,'Suresh','Kumar','555334444','1999-05-19','M','64,Mt. Hope St','Lowell','MA','02665','USA','suresh@gmail.com','9481277192');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
INSERT INTO employeetablelog VALUES(user(),NEW.EmployeeID,NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employeedetails`
--

DROP TABLE IF EXISTS `employeedetails`;
/*!50001 DROP VIEW IF EXISTS `employeedetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `employeedetails` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `DeptName`,
 1 AS `JobTitle`,
 1 AS `CategoryName`,
 1 AS `LevelName`,
 1 AS `NetPay`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employeetablelog`
--

DROP TABLE IF EXISTS `employeetablelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employeetablelog` (
  `User` varchar(45) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetablelog`
--

LOCK TABLES `employeetablelog` WRITE;
/*!40000 ALTER TABLE `employeetablelog` DISABLE KEYS */;
INSERT INTO `employeetablelog` VALUES ('root@localhost',2,'2018-12-12 15:54:19'),('root@localhost',2,'2018-12-13 02:27:15'),('root@localhost',3,'2018-12-13 02:32:18');
/*!40000 ALTER TABLE `employeetablelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetype`
--

DROP TABLE IF EXISTS `employeetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employeetype` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetype`
--

LOCK TABLES `employeetype` WRITE;
/*!40000 ALTER TABLE `employeetype` DISABLE KEYS */;
INSERT INTO `employeetype` VALUES (1,'Full Time','Rugular full time employee'),(2,'Part Time','Student on an internship');
/*!40000 ALTER TABLE `employeetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hourly`
--

DROP TABLE IF EXISTS `hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hourly` (
  `HourID` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `HourRate` int(11) NOT NULL,
  PRIMARY KEY (`HourID`),
  UNIQUE KEY `EmpID_UNIQUE` (`EmpID`),
  KEY `fk_hour_emp_idx` (`EmpID`),
  CONSTRAINT `fk_hour_emp` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hourly`
--

LOCK TABLES `hourly` WRITE;
/*!40000 ALTER TABLE `hourly` DISABLE KEYS */;
INSERT INTO `hourly` VALUES (1,1,100),(2,2,150),(3,3,125);
/*!40000 ALTER TABLE `hourly` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hourly_BEFORE_INSERT` BEFORE INSERT ON `hourly` FOR EACH ROW BEGIN
SELECT COUNT(*) INTO @cnt FROM hourly WHERE EmpID=NEW.EmpID;
IF (@cnt>0) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "An Entry already exists for this employee";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jobtitle`
--

DROP TABLE IF EXISTS `jobtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobtitle` (
  `JobID` int(11) NOT NULL,
  `JobTitle` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobtitle`
--

LOCK TABLES `jobtitle` WRITE;
/*!40000 ALTER TABLE `jobtitle` DISABLE KEYS */;
INSERT INTO `jobtitle` VALUES (1,'Software Developer','Full Stack Engineer'),(2,'Quallity Engineer','Test Engineer'),(3,'Software Architect','Baap Role');
/*!40000 ALTER TABLE `jobtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `level` (
  `LevelID` int(11) NOT NULL,
  `LevelName` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'T1','Starter'),(2,'T2','Senior'),(3,'T3','Master');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payroll` (
  `PayrollID` int(11) NOT NULL AUTO_INCREMENT,
  `EmpID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `GrossPay` int(11) DEFAULT NULL,
  `Deductions` int(11) DEFAULT NULL,
  `NetPay` int(11) DEFAULT NULL,
  PRIMARY KEY (`PayrollID`),
  KEY `fk_payroll_employee_idx` (`EmpID`),
  CONSTRAINT `fk_payroll_employee` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payroll_BEFORE_INSERT` BEFORE INSERT ON `payroll` FOR EACH ROW BEGIN
SELECT COUNT(*) INTO @cnt FROM payroll WHERE EmpID=NEW.EmpID AND MONTH(StartDate)=MONTH(NEW.StartDate) AND YEAR(StartDate)=YEAR(NEW.StartDate);
IF(@cnt>0) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Entry for this employee already exists for this month";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payroll_BEFORE_INSERT_1` BEFORE INSERT ON `payroll` FOR EACH ROW BEGIN
IF DATEDIFF(NEW.EndDate,NEW.StartDate)<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "EndDate cannot be earlier than StartDate";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sickday`
--

DROP TABLE IF EXISTS `sickday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sickday` (
  `SickID` int(11) NOT NULL,
  `EmpID` int(11) DEFAULT NULL,
  `SickDate` date DEFAULT NULL,
  PRIMARY KEY (`SickID`),
  KEY `fk_sick_emp_idx` (`EmpID`),
  CONSTRAINT `fk_sick_emp` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sickday`
--

LOCK TABLES `sickday` WRITE;
/*!40000 ALTER TABLE `sickday` DISABLE KEYS */;
INSERT INTO `sickday` VALUES (1,1,'2018-12-05'),(2,2,'2018-12-05');
/*!40000 ALTER TABLE `sickday` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sickday_BEFORE_INSERT` BEFORE INSERT ON `sickday` FOR EACH ROW BEGIN
SELECT count(*) INTO @cnt FROM sickday WHERE EmpID=NEW.EmpID AND SickDate=NEW.SickDate;
IF (@cnt>0) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "An Entry already exists for this employee for the corresponding date";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timesheet` (
  `TstampID` int(11) NOT NULL,
  `Empid` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Checkin` time NOT NULL,
  `Checkout` time DEFAULT NULL,
  PRIMARY KEY (`TstampID`),
  KEY `fk_time_employee_idx` (`Empid`),
  CONSTRAINT `fk_time_employee` FOREIGN KEY (`Empid`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,1,'2018-12-12','17:05:00','18:10:00'),(2,1,'2018-12-13','09:00:00','17:00:00'),(3,2,'2018-12-13','09:00:00','17:00:00'),(4,2,'2018-12-12','09:00:00','17:30:00'),(5,3,'2018-12-12','09:00:00','17:30:00'),(6,3,'2018-12-13','09:00:00','17:00:00');
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `timesheet_BEFORE_INSERT` BEFORE INSERT ON `timesheet` FOR EACH ROW BEGIN
IF TIMEDIFF(NEW.Checkout,NEW.Checkin)<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Checkout time cannot be less than checkin time";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `timesheet_BEFORE_INSERT_1` BEFORE INSERT ON `timesheet` FOR EACH ROW BEGIN
SELECT count(*) INTO @cnt FROM timesheet WHERE EmpID=NEW.EmpID AND `Date`=NEW.`Date`;
IF (@cnt)>0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Entry for this employee already exists for this selected date";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'employeepayrollmanagement'
--

--
-- Dumping routines for database 'employeepayrollmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `CalculateSalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateSalary`(IN EmplID INT,IN FromDate DATE,IN ToDate DATE,OUT Salary INT)
BEGIN
SELECT @HourlyRate:=HourRate FROM hourly WHERE EmpID=EmplID;
SELECT @TotalDeduction:=IFNULL(SUM(Amount),0) FROM deductions WHERE EmpID=EmplID AND MONTH(DeductionDate)=MONTH(FromDate) AND YEAR(DeductionDate)=YEAR(FromDate);
SELECT @TotalHours:=HOUR(SUM(TIMEDIFF(Checkout,checkin))) FROM timesheet WHERE EmpID=EmplID AND MONTH(`Date`)=MONTH(FromDate) AND YEAR(`Date`)=YEAR(FromDate);
SELECT ((@TotalHours*@HourlyRate)-@TotalDeduction) INTO Salary;
INSERT INTO payroll(EmpID,StartDate,EndDate,GrossPay,Deductions,NetPay) VALUES(EmplID,FromDate,ToDate,@TotalHours*@HourlyRate,@TotalDeduction,Salary);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employeedetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employeedetails`(IN EmpID INT)
BEGIN
SELECT * FROM EmployeeDetails WHERE EmployeeID=EmpID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `promoteemployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promoteemployee`(IN EmpID INT,IN Plevel INT)
BEGIN
SELECT @curlevel:=LevelID FROM employee WHERE EmployeeID=EmpID;
IF (@curlevel=Plevel) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Cannot Promote!Employee in the same level";
ELSEIF (Plevel<@curlevel) THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "Demotion of an employee is not allowed";
ELSEIF (Plevel>@curlevel) THEN
UPDATE employee SET LevelID=Plevel WHERE EmployeeID=EmpID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `employeedetails`
--

/*!50001 DROP VIEW IF EXISTS `employeedetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeedetails` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`e`.`LastName` AS `LastName`,`d`.`DeptName` AS `DeptName`,`j`.`JobTitle` AS `JobTitle`,`c`.`CategoryName` AS `CategoryName`,`l`.`LevelName` AS `LevelName`,`p`.`NetPay` AS `NetPay` from (((((`employee` `e` join `department` `d` on((`e`.`DeptID` = `d`.`DeptID`))) join `jobtitle` `j` on((`e`.`JobID` = `j`.`JobID`))) join `category` `c` on((`e`.`CategoryID` = `c`.`CategoryID`))) join `level` `l` on((`e`.`LevelID` = `l`.`LevelID`))) left join `payroll` `p` on((`e`.`EmployeeID` = `p`.`EmpID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:26:57
