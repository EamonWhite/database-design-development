-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2019 at 06:23 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignmentdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentNumber` int(11) NOT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `patientNumber` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentNumber`, `appointmentDate`, `appointmentTime`, `patientNumber`) VALUES
(1, '29/04/2019', '15:00', 4),
(2, '30/04/2019', '11:00', 2),
(3, '03/05/2019', '09:30', 1),
(4, '05/05/2019', '16:30', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_ID_Number` int(11) NOT NULL,
  `patientNumber` int(4) NOT NULL,
  `treatmentID_Number` int(4) NOT NULL,
  `treatmentPrice` decimal(6,2) DEFAULT NULL,
  `cancelledApptNumber` int(4) DEFAULT NULL,
  `cancellationCost` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_ID_Number`, `patientNumber`, `treatmentID_Number`, `treatmentPrice`, `cancelledApptNumber`, `cancellationCost`) VALUES
(1, 2, 104, '65.00', NULL, NULL),
(2, 3, 115, '225.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientNumber` int(11) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `eircode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientNumber`, `lastName`, `firstName`, `phone`, `addressLine1`, `addressLine2`, `eircode`) VALUES
(1, 'Lennon', 'John', '+353874163749', '9 Abbey Road', 'Newtown', 'X91 KXP7'),
(2, 'McCartney', 'Paul', '+353864270374', '15 Abbey Close', 'Newtown', 'X91 KXP9'),
(3, 'Harrison', 'George', '+353837249739', '62 Abbey Place', 'Newtown', 'X91 KZF7'),
(4, 'Starr', 'Ringo', '+353856364499', '22 Abbey Terrace', 'Newtown', 'X91 KXR5');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID_Number` int(11) NOT NULL,
  `bill_ID_Number` int(4) NOT NULL,
  `paymentDate` varchar(255) DEFAULT NULL,
  `billTotal` decimal(6,2) DEFAULT NULL,
  `paymentReceived` decimal(6,2) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `paymentOutstanding` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID_Number`, `bill_ID_Number`, `paymentDate`, `billTotal`, `paymentReceived`, `paymentMethod`, `paymentOutstanding`) VALUES
(1, 2, '25/04/2019', '225.00', '100.00', 'Cash', '125.00'),
(2, 1, '22/04/2019', '65.00', '65.00', 'Credit Card', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `specialistID_Number` varchar(255) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `eircode` varchar(255) DEFAULT NULL,
  `specialistArea` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`specialistID_Number`, `lastName`, `firstName`, `phone`, `addressLine1`, `addressLine2`, `eircode`, `specialistArea`) VALUES
('COL101', 'Collins', 'Sarah', '+353212263094', '144 McCurtain Street', 'Cork', 'T10 PF03', 'Root Canals'),
('MUR101', 'Murphy', 'Peter', '+353212834467', '25 Patricks Hill', 'Cork', 'T12 PD58', 'Periodontal Treatment'),
('PHE103', 'Phelan', 'Andrew', '+353212095566', '105 Western Road', 'Cork', 'T15 RD16', 'Bridges & Implants');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentID_Number` int(11) NOT NULL,
  `treatmentDescription` varchar(255) DEFAULT NULL,
  `specialistTreatmentRequired` varchar(255) DEFAULT NULL,
  `specialistID_Number` varchar(255) DEFAULT NULL,
  `appointmentNumber` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentID_Number`, `treatmentDescription`, `specialistTreatmentRequired`, `specialistID_Number`, `appointmentNumber`) VALUES
(104, 'Scale & Polish', 'No', NULL, 2),
(115, 'Tooth Whitening', 'No', NULL, 4),
(225, 'Periodontal Treatment', 'Yes', 'MUR101', 3),
(240, 'Root Canal', 'Yes', 'COL101', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentNumber`),
  ADD KEY `patientNumber` (`patientNumber`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_ID_Number`),
  ADD KEY `patientNumber` (`patientNumber`),
  ADD KEY `treatmentID_Number` (`treatmentID_Number`),
  ADD KEY `cancelledApptNumber` (`cancelledApptNumber`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientNumber`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID_Number`),
  ADD KEY `bill_ID_Number` (`bill_ID_Number`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`specialistID_Number`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentID_Number`),
  ADD KEY `appointmentNumber` (`appointmentNumber`),
  ADD KEY `specialistID_Number` (`specialistID_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_ID_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patient` (`patientNumber`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patient` (`patientNumber`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`treatmentID_Number`) REFERENCES `treatment` (`treatmentID_Number`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`cancelledApptNumber`) REFERENCES `appointment` (`appointmentNumber`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_ID_Number`) REFERENCES `bill` (`bill_ID_Number`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`appointmentNumber`) REFERENCES `appointment` (`appointmentNumber`),
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`specialistID_Number`) REFERENCES `specialist` (`specialistID_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
