-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2024 at 07:32 PM
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
-- Table structure for table `t_adr_classifications`
--

CREATE TABLE `t_adr_classifications` (
  `id` tinyint(4) NOT NULL,
  `class` float NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_adr_classifications`
--

INSERT INTO `t_adr_classifications` (`id`, `class`, `name`) VALUES
(1, 1, 'Explosive substance'),
(2, 2, 'Flammable gas'),
(3, 3, 'Flammable liquid'),
(4, 4.1, 'Flammable solid'),
(5, 4.2, 'Spontaneously combustible material'),
(6, 4.3, 'Water reactive substance'),
(7, 5.1, 'Oxidizer'),
(8, 5.2, 'Organic peroxide'),
(9, 6.1, 'Toxic substance'),
(10, 6.2, 'Infectious substance'),
(11, 7, 'Radioactive compound'),
(12, 8, 'Corrosive material'),
(13, 9, 'Miscalaneous dangerous component');

-- --------------------------------------------------------

--
-- Table structure for table `t_clients`
--

CREATE TABLE `t_clients` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_added` date NOT NULL DEFAULT current_timestamp(),
  `client_identifier_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_clients`
--

INSERT INTO `t_clients` (`id`, `name`, `phone_number`, `email`, `date_added`, `client_identifier_id`) VALUES
(1, 'Bordó Amanda', '+36201234567', 'amandabordo@citromail.com', '2024-10-03', 1),
(2, 'CupsAndMugs Ltd.', '+36505554433', 'ugyvezeto@cupsmugs.com', '2024-10-03', 1),
(3, 'Stiefel Eurocart Kft.', '+3614151020', 'suli@stiefel.hu', '2024-10-03', 1),
(4, 'Alpha Logistics', '+36123456789', 'contact@alphalogistics.com', '2024-10-03', 1),
(5, 'Beta Freight', '+441234567890', 'info@betafreight.co.uk', '2024-10-03', 1),
(6, 'Gamma Transport', '+33123456789', 'support@gammatransport.fr', '2024-10-03', 1),
(7, 'Delta Carriers', '+4915123456789', 'service@deltacarriers.de', '2024-10-03', 1),
(8, 'Epsilon Shipping', '+42123456789', 'hello@epsilonshipping.sk', '2024-10-03', 1),
(9, 'Zeta Movers', '+36201234567', 'info@zetamovers.com', '2024-10-03', 1),
(10, 'Eta Logistics', '+45123456789', 'contact@etalogistics.dk', '2024-10-03', 1),
(11, 'Theta Freight', '+35123456789', 'info@thetafreight.pt', '2024-10-03', 1),
(12, 'Iota Transport', '+35123456789', 'support@iotatransport.pt', '2024-10-03', 1),
(13, 'Kappa Delivery', '+35912345678', 'service@kappadelivery.bg', '2024-10-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_client_identifier`
--

CREATE TABLE `t_client_identifier` (
  `id` smallint(6) NOT NULL,
  `tax_identification_number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_client_identifier`
--

INSERT INTO `t_client_identifier` (`id`, `tax_identification_number`) VALUES
(1, 'asdasd123');

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
  `yearly_leave_allowance` smallint(6) NOT NULL,
  `login_password_enc` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_drivers`
--

INSERT INTO `t_drivers` (`id`, `id_card_number`, `full_name`, `dob`, `phone_number`, `email`, `home_address`, `medical_exam_result`, `start_of_employment`, `end_of_employment`, `yearly_leave_allowance`, `login_password_enc`) VALUES
(1, 'HU123456789', 'John Doe', '1985-07-15', '+36123456789', 'john.doe@gmail.com', '123 Main St, Budapest, Hungary', b'1', '2015-04-01', NULL, 20, ''),
(2, 'DE987654321', 'Anna Schmidt', '1990-02-20', '+491234567890', 'anna.schmidt@gmail.com', '45 Bahnhofstrasse, Berlin, Germany', b'1', '2017-06-10', NULL, 35, ''),
(3, 'FR654321987', 'Pierre Dubois', '1978-09-12', '+33123456789', 'pierre.dubois@hotmail.com', '22 Rue Lafayette, Paris, France', b'0', '2010-11-05', '2023-07-30', 31, ''),
(4, 'PL123789456', 'Maria Kowalska', '1988-05-30', '+48123456789', 'maria.kowalska@gmail.com', '67 Aleja Niepodległości, Warsaw, Poland', b'1', '2018-01-25', NULL, 11, ''),
(5, 'ES321654987', 'Carlos García', '1982-12-05', '+34123456789', 'carlos.garcia@gmail.com', '12 Calle Mayor, Madrid, Spain', b'1', '2013-03-18', NULL, 0, ''),
(6, 'IT456789123', 'Giulia Rossi', '1995-03-22', '+39123456789', 'giulia.rossi@freemail.hu', '23 Via Roma, Milan, Italy', b'0', '2019-08-10', NULL, 31, ''),
(7, 'UK789123456', 'James Smith', '1987-11-03', '+441234567890', 'james.smith@gmail.com', '50 High St, London, UK', b'1', '2016-09-12', NULL, 31, ''),
(8, 'SE987321654', 'Lars Johansson', '1983-04-14', '+46123456789', 'lars.johansson@citromail.hu', '89 Drottninggatan, Stockholm, Sweden', b'1', '2012-05-01', NULL, 40, ''),
(9, 'NL159753456', 'Sophie de Vries', '1992-08-17', '+31123456789', 'sophie.devries@gmail.com', '34 Prinsengracht, Amsterdam, Netherlands', b'0', '2020-02-15', NULL, 21, ''),
(10, 'FI852963741', 'Mikko Virtanen', '1986-10-09', '+358123456789', 'mikko.virtanen@hotmail.com', '19 Mannerheimintie, Helsinki, Finland', b'1', '2014-11-22', '2021-08-01', 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_adr_assignments`
--

CREATE TABLE `t_driver_adr_assignments` (
  `id` smallint(6) NOT NULL,
  `driver_id` smallint(6) DEFAULT NULL,
  `adr_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_clock_inout`
--

CREATE TABLE `t_driver_clock_inout` (
  `id` smallint(6) NOT NULL,
  `driver_id` smallint(6) DEFAULT NULL,
  `break_time` datetime DEFAULT NULL,
  `type` enum('in','out') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_license_assignments`
--

CREATE TABLE `t_driver_license_assignments` (
  `id` mediumint(9) NOT NULL,
  `driver_id` smallint(6) NOT NULL,
  `license_type_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_driver_license_assignments`
--

INSERT INTO `t_driver_license_assignments` (`id`, `driver_id`, `license_type_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 5),
(5, 3, 1),
(6, 3, 6),
(7, 4, 2),
(8, 4, 7),
(9, 5, 4),
(10, 5, 8),
(11, 6, 5),
(12, 6, 9),
(13, 7, 1),
(14, 7, 10),
(15, 8, 3),
(16, 8, 11),
(17, 9, 2),
(18, 9, 12),
(19, 10, 1),
(20, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `t_driver_license_types`
--

CREATE TABLE `t_driver_license_types` (
  `id` tinyint(4) NOT NULL,
  `type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_driver_license_types`
--

INSERT INTO `t_driver_license_types` (`id`, `type`) VALUES
(1, 'A'),
(2, 'A1'),
(3, 'B'),
(4, 'BE'),
(5, 'C1'),
(6, 'C1E'),
(7, 'C'),
(8, 'CE'),
(9, 'D1'),
(10, 'D1E'),
(11, 'D'),
(12, 'DE');

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

--
-- Dumping data for table `t_driver_taken_leaves`
--

INSERT INTO `t_driver_taken_leaves` (`id`, `driver_id`, `leave_start`, `leave_end`, `is_paid`) VALUES
(1, 1, '2023-01-10', '2023-01-15', b'1'),
(2, 2, '2023-02-05', '2023-02-10', b'0'),
(3, 3, '2023-03-20', '2023-03-25', b'1'),
(4, 4, '2023-04-15', '2023-04-20', b'0'),
(5, 5, '2023-05-01', '2023-05-05', b'1'),
(6, 6, '2023-06-10', '2023-06-12', b'0'),
(7, 7, '2023-07-05', '2023-07-10', b'1'),
(8, 8, '2023-08-01', '2023-08-03', b'0'),
(9, 9, '2023-09-15', '2023-09-20', b'1'),
(10, 10, '2023-10-05', '2023-10-08', b'1'),
(11, 1, '2023-11-10', '2023-11-15', b'0'),
(12, 3, '2023-12-01', '2023-12-05', b'1');

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

--
-- Dumping data for table `t_driver_violations`
--

INSERT INTO `t_driver_violations` (`id`, `driver_id`, `location`, `violation_date`, `violation_type`, `description`) VALUES
(1, 1, 'Budapest, Hungary', '2023-01-15 14:32:00', 'Speeding', 'Exceeding the speed limit by 20 km/h in a residential area'),
(2, 1, 'Budapest, Hungary', '2023-03-12 09:50:00', 'Failure to Stop', 'Failed to stop at a stop sign'),
(3, 2, 'Berlin, Germany', '2022-12-05 09:15:00', 'Illegal Parking', NULL),
(4, 4, 'Warsaw, Poland', '2022-07-10 11:10:00', 'Distracted Driving', 'Using a mobile phone while driving'),
(5, 4, 'Warsaw, Poland', '2023-04-18 17:45:00', 'Speeding', 'Exceeding speed limit in a highway construction zone'),
(6, 5, 'Madrid, Spain', '2023-08-30 20:20:00', 'Reckless Driving', 'Overtaking vehicles in an unsafe manner on a busy highway'),
(7, 6, 'Milan, Italy', '2023-04-15 10:00:00', 'Driving without a Seatbelt', NULL),
(8, 7, 'London, UK', '2021-11-19 13:25:00', 'Speeding', 'Exceeding the speed limit by 15 km/h in a school zone'),
(9, 9, 'Amsterdam, Netherlands', '2023-06-28 12:40:00', 'Failure to Yield', 'Failed to yield at a pedestrian crossing'),
(10, 9, 'Amsterdam, Netherlands', '2023-06-29 18:15:00', 'Illegal U-turn', 'Made an illegal U-turn at a restricted intersection'),
(11, 10, 'Helsinki, Finland', '2023-05-03 17:30:00', 'Speeding', NULL);

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

--
-- Dumping data for table `t_insurance`
--

INSERT INTO `t_insurance` (`id`, `insurer_id`, `insured_vehicle_id`, `insurance_start_date`, `insurance_end_date`, `insurance_cost_month_eur`) VALUES
(1, 1, 1, '2024-01-01', '2025-01-01', 100),
(2, 4, 2, '2024-01-15', '2025-01-15', 120),
(3, 2, 3, '2024-02-01', '2025-02-01', 110),
(4, 4, 4, '2024-03-10', '2025-03-10', 130),
(5, 1, 5, '2024-04-05', '2025-04-05', 140),
(6, 3, 6, '2024-05-20', '2025-05-20', 115),
(7, 3, 7, '2024-06-15', '2025-06-15', 125),
(8, 4, 8, '2024-07-10', '2025-07-10', 135),
(9, 1, 9, '2024-08-01', '2025-08-01', 150),
(10, 2, 10, '2024-09-12', '2025-09-12', 160),
(11, 1, 11, '2024-10-20', '2025-10-20', 155),
(12, 4, 12, '2024-11-30', '2025-11-30', 165);

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

--
-- Dumping data for table `t_insurer_info`
--

INSERT INTO `t_insurer_info` (`id`, `insurer_company_name`, `insurer_phone`, `insurer_email`) VALUES
(1, 'SafeGuard Insurance', '+36123456789', 'contact@safeguard.co'),
(2, 'SecureLife Insurance Co.', '+441234567890', 'info@securelife.com'),
(3, 'Premier Insurers Group', '+4915123456789', 'support@premierinsur'),
(4, 'Global Coverage Corp.', '+33123456789', 'hello@globalcoverage'),
(5, 'Trusty Insurance Services', '+3615550199', 'sales@trustyinsuranc');

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
  `delivery_address` varchar(100) NOT NULL,
  `cargo_total_weight_t` float DEFAULT NULL,
  `cargo_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jobs`
--

INSERT INTO `t_jobs` (`id`, `time_accounted`, `time_pickup`, `time_completed`, `jit_expected_from`, `jit_expected_by`, `client_id`, `notes`, `haul_completed`, `pickup_address`, `delivery_address`, `cargo_total_weight_t`, `cargo_name`) VALUES
(1, '2023-08-10 08:30:00', '2023-08-10 09:00:00', '2023-08-10 16:45:00', '2023-08-10 14:00:00', '2023-08-10 18:00:00', 2, 'Fragile goods, handle with care', b'1', '12 Warehouse St, Budapest, Hungary', '45 Industrial Rd, Vienna, Austria', 3.1, 'Cabbage'),
(2, '2023-09-12 07:45:00', '2023-09-12 08:15:00', NULL, NULL, NULL, 5, 'Urgent delivery, no delays', b'0', '34 Factory Ave, Warsaw, Poland', '22 Business St, Berlin, Germany', 0.6, 'Electronics'),
(3, '2023-07-25 10:00:00', '2023-07-25 10:30:00', '2023-07-25 18:20:00', '2023-07-25 15:00:00', '2023-07-25 19:00:00', 3, NULL, b'1', '89 Logistics Dr, Madrid, Spain', '27 Market Ln, Paris, France', 12, 'Galvanized square st'),
(4, '2023-10-03 11:20:00', '2023-10-03 11:45:00', NULL, '2023-10-03 12:00:00', '2023-10-03 16:00:00', 1, 'High-value cargo, secure transport', b'0', '100 Freight St, Rotterdam, Netherlands', '56 Commerce Blvd, Brussels, Belgium', 2.1, 'Eco-friendly wood ve'),
(5, '2023-11-01 09:15:00', '2023-11-01 09:45:00', '2023-11-01 17:10:00', '2023-11-01 14:00:00', '2023-11-01 18:00:00', 4, NULL, b'1', '23 Loading Dock, Milan, Italy', '78 Shipping Blvd, Zurich, Switzerland', 7.5, 'Milk'),
(6, '2023-08-28 08:50:00', '2023-08-28 09:20:00', NULL, NULL, NULL, 2, 'Heavy load, multiple stops', b'0', '12 Cargo St, Prague, Czech Republic', '90 Distribution Rd, Bratislava, Slovakia', 1.25, 'Hay'),
(7, '2023-09-20 07:30:00', '2023-09-20 08:00:00', '2023-09-20 14:50:00', '2023-09-20 13:00:00', '2023-09-20 15:00:00', 6, 'Weather delays expected', b'1', '45 Harbor Rd, Hamburg, Germany', '34 Transport Ln, Copenhagen, Denmark', 9.2, 'Liquid waste'),
(8, '2023-06-18 10:10:00', '2023-06-18 10:40:00', '2023-06-18 19:30:00', NULL, NULL, 3, NULL, b'1', '101 Warehouse Blvd, Lisbon, Portugal', '67 Factory Ln, Madrid, Spain', 2.8, 'Liquid nitrogen'),
(9, '2023-09-05 09:45:00', '2023-09-05 10:15:00', NULL, '2023-09-05 11:00:00', '2023-09-05 13:00:00', 7, 'Awaiting customs clearance', b'0', '50 Export Dr, London, UK', '80 Trade Ave, Dublin, Ireland', 6.1, 'Gasoline'),
(10, '2023-05-14 08:20:00', '2023-05-14 08:50:00', '2023-05-14 17:00:00', '2023-05-14 13:00:00', '2023-05-14 15:00:00', 8, 'Large volume, extra handling required', b'1', '32 Dock St, Helsinki, Finland', '92 Distribution Ave, Stockholm, Sweden', 3.1, 'Lithium');

-- --------------------------------------------------------

--
-- Table structure for table `t_jobs_midway_dropoffs`
--

CREATE TABLE `t_jobs_midway_dropoffs` (
  `id` smallint(6) NOT NULL,
  `job_id` smallint(6) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `weight_to_dropoff_t` float NOT NULL,
  `completed` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_job_adr_assignments`
--

CREATE TABLE `t_job_adr_assignments` (
  `id` smallint(6) NOT NULL,
  `job_id` smallint(6) DEFAULT NULL,
  `adr_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_job_vehicle_driver_assignments`
--

CREATE TABLE `t_job_vehicle_driver_assignments` (
  `id` smallint(6) NOT NULL,
  `job_id` smallint(6) NOT NULL,
  `vehicle_id` smallint(6) NOT NULL,
  `driver_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_job_vehicle_trailer_assignments`
--

CREATE TABLE `t_job_vehicle_trailer_assignments` (
  `id` smallint(6) NOT NULL,
  `job_id` smallint(6) NOT NULL,
  `vehicle_id` smallint(6) NOT NULL,
  `trailer_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_job_vehicle_trailer_assignments`
--

INSERT INTO `t_job_vehicle_trailer_assignments` (`id`, `job_id`, `vehicle_id`, `trailer_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, 4),
(3, 2, 3, 8),
(4, 3, 3, NULL),
(5, 4, 5, 8),
(6, 5, 6, NULL),
(7, 6, 7, 9),
(8, 7, 11, NULL),
(9, 8, 1, 9),
(10, 8, 3, 10),
(11, 8, 8, 12),
(12, 9, 3, 12),
(13, 10, 11, NULL);

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

--
-- Dumping data for table `t_leasing`
--

INSERT INTO `t_leasing` (`id`, `leaser_id`, `leased_vehicle_id`, `lease_start_date`, `lease_end_date`, `lease_cost_day_eur`, `lease_terms`) VALUES
(1, 1, 2, '2024-01-10', '2024-01-20', 150, 'Standard lease agreement with full coverage.'),
(2, 2, 5, '2024-02-05', '2024-02-15', 200, 'Includes maintenance and insurance.'),
(3, 3, 8, '2024-03-01', '2024-03-10', 120, 'No mileage limits; return with full tank.');

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

--
-- Dumping data for table `t_lender_info`
--

INSERT INTO `t_lender_info` (`id`, `lender_company_name`, `lender_phone`, `lender_email`) VALUES
(1, 'QuickLease Trucks', '+36123456789', 'info@quickleasetruck'),
(2, 'Reliable Rentals', '+441234567890', 'contact@reliablerent'),
(3, 'EasyTrailers Inc.', '+4915123456789', 'support@easytrailers');

-- --------------------------------------------------------

--
-- Table structure for table `t_manager_logins`
--

CREATE TABLE `t_manager_logins` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password_enc` varchar(64) NOT NULL
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

--
-- Dumping data for table `t_parameter_assignments`
--

INSERT INTO `t_parameter_assignments` (`id`, `vehicle_id`, `param_type_id`, `value`) VALUES
(1, 1, 1, 'LXC-064'),
(2, 1, 3, '1814'),
(3, 1, 4, '22500'),
(4, 1, 5, '650'),
(5, 2, 1, 'CE-1812'),
(6, 2, 3, '5800'),
(7, 2, 5, '410'),
(8, 2, 2, '(1.9,4.0,2.4)'),
(9, 3, 1, 'XJFS-843'),
(10, 3, 3, '6200'),
(11, 3, 5, '450'),
(12, 3, 2, '(2.45,8.20,2.70)'),
(13, 4, 1, 'JF-4661'),
(14, 4, 3, '3100'),
(15, 4, 4, '21700'),
(16, 4, 2, '(2.1,14.6,1.52)');

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

--
-- Dumping data for table `t_parameter_list`
--

INSERT INTO `t_parameter_list` (`id`, `param_name`, `param_type_id`, `param_unit_id`, `param_min_value`, `param_max_value`) VALUES
(1, 'license_plate', 2, NULL, 4, 10),
(2, 'dimensions', 5, NULL, NULL, NULL),
(3, 'base_weight', 4, 1, NULL, NULL),
(4, 'maximum_load_weight', 4, 1, NULL, NULL),
(5, 'engine_power', 4, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_types`
--

CREATE TABLE `t_parameter_types` (
  `id` smallint(6) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_parameter_types`
--

INSERT INTO `t_parameter_types` (`id`, `name`) VALUES
(3, 'BOOLEAN'),
(4, 'FLOAT'),
(1, 'INTEGER'),
(2, 'STRING'),
(5, 'VECTOR3');

-- --------------------------------------------------------

--
-- Table structure for table `t_parameter_units`
--

CREATE TABLE `t_parameter_units` (
  `id` smallint(6) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_parameter_units`
--

INSERT INTO `t_parameter_units` (`id`, `unit`) VALUES
(6, 'cm'),
(7, 'cm2'),
(8, 'cm3'),
(10, 'hp'),
(1, 'kg'),
(2, 'l'),
(5, 'm'),
(4, 'm2'),
(3, 'm3'),
(9, 't');

-- --------------------------------------------------------

--
-- Table structure for table `t_trailer_adr_assignmens`
--

CREATE TABLE `t_trailer_adr_assignmens` (
  `id` smallint(6) NOT NULL,
  `trailer_id` smallint(6) DEFAULT NULL,
  `adr_id` tinyint(4) DEFAULT NULL
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

--
-- Dumping data for table `t_vehicles`
--

INSERT INTO `t_vehicles` (`id`, `type_id`, `vin`) VALUES
(1, 1, '1HGCM82633A123456'),
(2, 2, '1FTRX18W8YNA12345'),
(3, 2, '1FTNE24L8YHA12345'),
(4, 4, '1C4BJWFG4CL123456'),
(5, 1, '5XYKT3A69DG123456'),
(6, 2, '1GCRCREC2FZ123456'),
(7, 3, 'JH4DB8580NS123456'),
(8, 9, '1D7RB1CP6AS123456'),
(9, 8, 'WA1CFAFP0AA123456'),
(10, 4, '2C3CDXCTXFH123456'),
(11, 3, '5N1AR2MM1EC123456'),
(12, 4, '1FTSW21R61EB12345');

-- --------------------------------------------------------

--
-- Table structure for table `t_vehicle_types`
--

CREATE TABLE `t_vehicle_types` (
  `id` tinyint(4) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_vehicle_types`
--

INSERT INTO `t_vehicle_types` (`id`, `type`) VALUES
(2, 'box_truck'),
(3, 'chassis_cab_truck'),
(5, 'trailer_dumper'),
(11, 'trailer_flatbed'),
(6, 'trailer_jumbo'),
(7, 'trailer_lowbed'),
(8, 'trailer_open'),
(9, 'trailer_open_jumbo'),
(10, 'trailer_roadtrain'),
(4, 'trailer_straightframe'),
(1, 'truck');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_adr_classifications`
--
ALTER TABLE `t_adr_classifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `t_clients`
--
ALTER TABLE `t_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_identifier_id` (`client_identifier_id`);

--
-- Indexes for table `t_client_identifier`
--
ALTER TABLE `t_client_identifier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_identification_number` (`tax_identification_number`);

--
-- Indexes for table `t_drivers`
--
ALTER TABLE `t_drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_card_number` (`id_card_number`);

--
-- Indexes for table `t_driver_adr_assignments`
--
ALTER TABLE `t_driver_adr_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `adr_id` (`adr_id`);

--
-- Indexes for table `t_driver_clock_inout`
--
ALTER TABLE `t_driver_clock_inout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `license_id` (`license_type_id`);

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
  ADD KEY `fk_jobs_clients_id` (`client_id`);

--
-- Indexes for table `t_jobs_midway_dropoffs`
--
ALTER TABLE `t_jobs_midway_dropoffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `t_job_adr_assignments`
--
ALTER TABLE `t_job_adr_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `adr_id` (`adr_id`);

--
-- Indexes for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `t_job_vehicle_trailer_assignments`
--
ALTER TABLE `t_job_vehicle_trailer_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `trailer_id` (`trailer_id`);

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
-- Indexes for table `t_manager_logins`
--
ALTER TABLE `t_manager_logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

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
-- Indexes for table `t_trailer_adr_assignmens`
--
ALTER TABLE `t_trailer_adr_assignmens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`trailer_id`),
  ADD KEY `adr_id` (`adr_id`);

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
-- AUTO_INCREMENT for table `t_adr_classifications`
--
ALTER TABLE `t_adr_classifications`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_clients`
--
ALTER TABLE `t_clients`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_client_identifier`
--
ALTER TABLE `t_client_identifier`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_drivers`
--
ALTER TABLE `t_drivers`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_driver_adr_assignments`
--
ALTER TABLE `t_driver_adr_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_clock_inout`
--
ALTER TABLE `t_driver_clock_inout`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_driver_license_types`
--
ALTER TABLE `t_driver_license_types`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_driver_taken_leaves`
--
ALTER TABLE `t_driver_taken_leaves`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_driver_violations`
--
ALTER TABLE `t_driver_violations`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_insurance`
--
ALTER TABLE `t_insurance`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_insurer_info`
--
ALTER TABLE `t_insurer_info`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_jobs`
--
ALTER TABLE `t_jobs`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_jobs_midway_dropoffs`
--
ALTER TABLE `t_jobs_midway_dropoffs`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_job_adr_assignments`
--
ALTER TABLE `t_job_adr_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_job_vehicle_trailer_assignments`
--
ALTER TABLE `t_job_vehicle_trailer_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_leasing`
--
ALTER TABLE `t_leasing`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_lender_info`
--
ALTER TABLE `t_lender_info`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_manager_logins`
--
ALTER TABLE `t_manager_logins`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_parameter_assignments`
--
ALTER TABLE `t_parameter_assignments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `t_parameter_list`
--
ALTER TABLE `t_parameter_list`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_parameter_types`
--
ALTER TABLE `t_parameter_types`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_parameter_units`
--
ALTER TABLE `t_parameter_units`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_trailer_adr_assignmens`
--
ALTER TABLE `t_trailer_adr_assignmens`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_vehicles`
--
ALTER TABLE `t_vehicles`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_vehicle_types`
--
ALTER TABLE `t_vehicle_types`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_clients`
--
ALTER TABLE `t_clients`
  ADD CONSTRAINT `t_clients_ibfk_1` FOREIGN KEY (`client_identifier_id`) REFERENCES `t_client_identifier` (`id`);

--
-- Constraints for table `t_driver_adr_assignments`
--
ALTER TABLE `t_driver_adr_assignments`
  ADD CONSTRAINT `t_driver_adr_assignments_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`),
  ADD CONSTRAINT `t_driver_adr_assignments_ibfk_2` FOREIGN KEY (`adr_id`) REFERENCES `t_adr_classifications` (`id`);

--
-- Constraints for table `t_driver_clock_inout`
--
ALTER TABLE `t_driver_clock_inout`
  ADD CONSTRAINT `t_driver_clock_inout_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`);

--
-- Constraints for table `t_driver_license_assignments`
--
ALTER TABLE `t_driver_license_assignments`
  ADD CONSTRAINT `t_driver_license_assignments_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`),
  ADD CONSTRAINT `t_driver_license_assignments_ibfk_2` FOREIGN KEY (`license_type_id`) REFERENCES `t_driver_license_types` (`id`);

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
  ADD CONSTRAINT `fk_jobs_clients_id` FOREIGN KEY (`client_id`) REFERENCES `t_clients` (`id`);

--
-- Constraints for table `t_jobs_midway_dropoffs`
--
ALTER TABLE `t_jobs_midway_dropoffs`
  ADD CONSTRAINT `t_jobs_midway_dropoffs_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `t_jobs` (`id`);

--
-- Constraints for table `t_job_adr_assignments`
--
ALTER TABLE `t_job_adr_assignments`
  ADD CONSTRAINT `t_job_adr_assignments_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `t_jobs` (`id`),
  ADD CONSTRAINT `t_job_adr_assignments_ibfk_2` FOREIGN KEY (`adr_id`) REFERENCES `t_adr_classifications` (`id`);

--
-- Constraints for table `t_job_vehicle_driver_assignments`
--
ALTER TABLE `t_job_vehicle_driver_assignments`
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `t_jobs` (`id`),
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_job_vehicle_driver_assignments_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `t_drivers` (`id`);

--
-- Constraints for table `t_job_vehicle_trailer_assignments`
--
ALTER TABLE `t_job_vehicle_trailer_assignments`
  ADD CONSTRAINT `t_job_vehicle_trailer_assignments_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `t_jobs` (`id`),
  ADD CONSTRAINT `t_job_vehicle_trailer_assignments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_job_vehicle_trailer_assignments_ibfk_3` FOREIGN KEY (`trailer_id`) REFERENCES `t_vehicles` (`id`);

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
-- Constraints for table `t_trailer_adr_assignmens`
--
ALTER TABLE `t_trailer_adr_assignmens`
  ADD CONSTRAINT `t_trailer_adr_assignmens_ibfk_1` FOREIGN KEY (`trailer_id`) REFERENCES `t_vehicles` (`id`),
  ADD CONSTRAINT `t_trailer_adr_assignmens_ibfk_2` FOREIGN KEY (`adr_id`) REFERENCES `t_adr_classifications` (`id`);

--
-- Constraints for table `t_vehicles`
--
ALTER TABLE `t_vehicles`
  ADD CONSTRAINT `t_vehicles_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `t_vehicle_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
