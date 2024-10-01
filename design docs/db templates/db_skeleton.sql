-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 01:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfuvar`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_clients`
--

CREATE TABLE `t_clients` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_drivers`
--

CREATE TABLE `t_drivers` (
  `id` smallint(6) NOT NULL,
  `id_card_number` varchar(25) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `home_address` varchar(100) NOT NULL,
  `medical_exam_result` bit(1) DEFAULT b'0',
  `start_of_employment` date NOT NULL,
  `end_of_employment` date DEFAULT NULL,
  `yearly_leave_allowance` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_license_assignments`
--

CREATE TABLE `t_driver_license_assignments` (
  `id` mediumint(9) NOT NULL,
  `driver_id` smallint(6) NOT NULL,
  `license_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_license_types`
--

CREATE TABLE `t_driver_license_types` (
  `id` tinyint(4) NOT NULL,
  `type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_taken_leaves`
--

CREATE TABLE `t_driver_taken_leaves` (
  `id` smallint(6) NOT NULL,
  `driver_id` smallint(6) NOT NULL,
  `leave_start` date NOT NULL,
  `leave_end` date NOT NULL,
  `is_paid` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_violations`
--

CREATE TABLE `t_driver_violations` (
  `id` smallint(6) NOT NULL,
  `driver_id` smallint(6) NOT NULL,
  `location` varchar(100) NOT NULL,
  `violation_date` datetime NOT NULL,
  `violation_type` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_insurance`
--

CREATE TABLE `t_insurance` (
  `id` smallint(6) NOT NULL,
  `insurer_id` smallint(6) NOT NULL,
  `insured_vehicle_id` smallint(6) NOT NULL,
  `insurance_start_date` date NOT NULL,
  `insurance_end_date` date NOT NULL,
  `insurance_cost_month_eur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_insurer_info`
--

CREATE TABLE `t_insurer_info` (
  `id` smallint(6) NOT NULL,
  `insurer_company_name` varchar(50) NOT NULL,
  `insurer_phone` varchar(15) NOT NULL,
  `insurer_email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_jobs`
--

CREATE TABLE `t_jobs` (
  `id` smallint(6) NOT NULL,
  `time_accounted` datetime NOT NULL DEFAULT current_timestamp(),
  `time_pickup` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL,
  `jit_expected_from` datetime DEFAULT NULL,
  `jit_expected_by` datetime DEFAULT NULL,
  `client_id` smallint(6) NOT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `haul_completed` bit(1) NOT NULL DEFAULT b'0',
  `pickup_address` varchar(100) NOT NULL,
  `delivery_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_job_vehicle_driver_assignments`
--

CREATE TABLE `t_job_vehicle_driver_assignments` (
  `id` smallint(6) NOT NULL,
  `job_id` smallint(6) NOT NULL,
  `vehicle_id` smallint(6) NOT NULL,
  `trailer_id` smallint(6) DEFAULT NULL,
  `driver_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_leasing`
--

CREATE TABLE `t_leasing` (
  `id` smallint(6) NOT NULL,
  `leaser_id` smallint(6) NOT NULL,
  `leased_vehicle_id` smallint(6) NOT NULL,
  `lease_start_date` date NOT NULL,
  `lease_end_date` date DEFAULT NULL,
  `lease_cost_day_eur` int(11) NOT NULL,
  `lease_terms` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_lender_info`
--

CREATE TABLE `t_lender_info` (
  `id` smallint(6) NOT NULL,
  `lender_company_name` varchar(50) NOT NULL,
  `lender_phone` varchar(15) NOT NULL,
  `lender_email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_assignments`
--

CREATE TABLE `t_parameter_assignments` (
  `id` smallint(6) NOT NULL,
  `vehicle_id` smallint(6) NOT NULL,
  `param_type_id` smallint(6) NOT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_list`
--

CREATE TABLE `t_parameter_list` (
  `id` smallint(6) NOT NULL,
  `param_name` varchar(50) NOT NULL,
  `param_type_id` smallint(6) NOT NULL,
  `param_unit_id` smallint(6) DEFAULT NULL,
  `param_min_value` int(11) DEFAULT NULL,
  `param_max_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_types`
--

CREATE TABLE `t_parameter_types` (
  `id` smallint(6) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_units`
--

CREATE TABLE `t_parameter_units` (
  `id` smallint(6) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_vehicles`
--

CREATE TABLE `t_vehicles` (
  `id` smallint(6) NOT NULL,
  `type_id` tinyint(4) NOT NULL,
  `vin` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_vehicle_types`
--

CREATE TABLE `t_vehicle_types` (
  `id` tinyint(4) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_clients`
--
ALTER TABLE `t_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_drivers`
--
ALTER TABLE `t_drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_card_number` (`id_card_number`);

--
-- Indexes for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `t_driver_license_types`
--
ALTER TABLE `t_driver_license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_driver_taken_leaves`
--
ALTER TABLE `t_driver_taken_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `t_driver_violations`
--
ALTER TABLE `t_driver_violations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `t_insurance`
--
ALTER TABLE `t_insurance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insurer_id` (`insurer_id`),
  ADD KEY `insured_vehicle_id` (`insured_vehicle_id`);

--
-- Indexes for table `t_insurer_info`
--
ALTER TABLE `t_insurer_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `insurer_company_name` (`insurer_company_name`);

--
-- Indexes for table `t_jobs`
--
ALTER TABLE `t_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `trailer_id` (`trailer_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `t_leasing`
--
ALTER TABLE `t_leasing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaser_id` (`leaser_id`),
  ADD KEY `leased_vehicle_id` (`leased_vehicle_id`);

--
-- Indexes for table `t_lender_info`
--
ALTER TABLE `t_lender_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_parameter_assignments`
--
ALTER TABLE `t_parameter_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `param_type_id` (`param_type_id`);

--
-- Indexes for table `t_parameter_list`
--
ALTER TABLE `t_parameter_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_type_id` (`param_type_id`),
  ADD KEY `param_unit_id` (`param_unit_id`);

--
-- Indexes for table `t_parameter_types`
--
ALTER TABLE `t_parameter_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `t_parameter_units`
--
ALTER TABLE `t_parameter_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit` (`unit`);

--
-- Indexes for table `t_vehicles`
--
ALTER TABLE `t_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `t_vehicle_types`
--
ALTER TABLE `t_vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_clients`
--
ALTER TABLE `t_clients`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_drivers`
--
ALTER TABLE `t_drivers`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_license_types`
--
ALTER TABLE `t_driver_license_types`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_taken_leaves`
--
ALTER TABLE `t_driver_taken_leaves`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_violations`
--
ALTER TABLE `t_driver_violations`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_insurance`
--
ALTER TABLE `t_insurance`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_insurer_info`
--
ALTER TABLE `t_insurer_info`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_jobs`
--
ALTER TABLE `t_jobs`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_leasing`
--
ALTER TABLE `t_leasing`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_lender_info`
--
ALTER TABLE `t_lender_info`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parameter_assignments`
--
ALTER TABLE `t_parameter_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parameter_list`
--
ALTER TABLE `t_parameter_list`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parameter_types`
--
ALTER TABLE `t_parameter_types`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parameter_units`
--
ALTER TABLE `t_parameter_units`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_vehicles`
--
ALTER TABLE `t_vehicles`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_vehicle_types`
--
ALTER TABLE `t_vehicle_types`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  ADD CONSTRAINT `t_driver_license_assignments_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`),
  ADD CONSTRAINT `t_driver_license_assignments_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `t_driver_license_types` (`id`);

--
-- Constraints for table `t_driver_taken_leaves`
--
ALTER TABLE `t_driver_taken_leaves`
  ADD CONSTRAINT `t_driver_taken_leaves_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`);

--
-- Constraints for table `t_driver_violations`
--
ALTER TABLE `t_driver_violations`
  ADD CONSTRAINT `t_driver_violations_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`);

--
-- Constraints for table `t_insurance`
--
ALTER TABLE `t_insurance`
  ADD CONSTRAINT `t_insurance_ibfk_1` FOREIGN KEY (`insurer_id`) REFERENCES `t_insurer_info` (`id`),
  ADD CONSTRAINT `t_insurance_ibfk_2` FOREIGN KEY (`insured_vehicle_id`) REFERENCES `t_vehicles` (`id`);

--
-- Constraints for table `t_jobs`
--
ALTER TABLE `t_jobs`
  ADD CONSTRAINT `t_jobs_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `t_clients` (`id`);

--
-- Constraints for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `t_jobs` (`id`),
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_3` FOREIGN KEY (`trailer_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`);

--
-- Constraints for table `t_leasing`
--
ALTER TABLE `t_leasing`
  ADD CONSTRAINT `t_leasing_ibfk_1` FOREIGN KEY (`leaser_id`) REFERENCES `t_lender_info` (`id`),
  ADD CONSTRAINT `t_leasing_ibfk_2` FOREIGN KEY (`leased_vehicle_id`) REFERENCES `t_vehicles` (`id`);

--
-- Constraints for table `t_parameter_assignments`
--
ALTER TABLE `t_parameter_assignments`
  ADD CONSTRAINT `t_parameter_assignments_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_parameter_assignments_ibfk_2` FOREIGN KEY (`param_type_id`) REFERENCES `t_parameter_list` (`id`);

--
-- Constraints for table `t_parameter_list`
--
ALTER TABLE `t_parameter_list`
  ADD CONSTRAINT `t_parameter_list_ibfk_1` FOREIGN KEY (`param_type_id`) REFERENCES `t_parameter_types` (`id`),
  ADD CONSTRAINT `t_parameter_list_ibfk_2` FOREIGN KEY (`param_unit_id`) REFERENCES `t_parameter_units` (`id`);

--
-- Constraints for table `t_vehicles`
--
ALTER TABLE `t_vehicles`
  ADD CONSTRAINT `t_vehicles_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `t_vehicle_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
