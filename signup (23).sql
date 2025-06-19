-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 08:22 AM
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
-- Database: `signup`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocations`
--

CREATE TABLE `allocations` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `allocated_to_name` varchar(255) NOT NULL,
  `allocated_to_username` varchar(255) NOT NULL,
  `campus` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `allocation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `resource_type` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allocations`
--

INSERT INTO `allocations` (`id`, `request_id`, `resource_id`, `allocated_to_name`, `allocated_to_username`, `campus`, `building`, `floor`, `room_number`, `allocation_date`, `resource_type`, `status`) VALUES
(0, 46, 31, 'Admasu sewale mulualem', 'admin', 'Main', '34', 1, 1, '2025-04-11 19:56:14', NULL, NULL),
(0, 47, 21, 'kalkidan sewale mulualem', 'kalkidan', 'Main', 'buildings 003', 1, 1, '2025-04-11 19:56:14', NULL, NULL),
(0, 51, 32, 'Admasu sewale muluale', 'admasu', 'Main', '34', 1, 2, '2025-04-14 18:45:13', NULL, NULL),
(0, 46, 31, 'Admasu sewale mulualem', 'admin', 'Main', '34', 1, 1, '2025-04-11 19:56:14', NULL, NULL),
(0, 47, 21, 'kalkidan sewale mulualem', 'kalkidan', 'Main', 'buildings 003', 1, 1, '2025-04-11 19:56:14', NULL, NULL),
(0, 51, 32, 'Admasu sewale muluale', 'admasu', 'Main', '34', 1, 2, '2025-04-14 18:45:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `allocation_requests`
--

CREATE TABLE `allocation_requests` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `campus` varchar(50) NOT NULL,
  `prefered_type` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `academic_rank` varchar(50) DEFAULT NULL,
  `work_range` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `disability` varchar(50) DEFAULT NULL,
  `soamu` varchar(50) DEFAULT NULL,
  `current_location` varchar(50) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allocation_requests`
--

INSERT INTO `allocation_requests` (`id`, `username`, `date`, `campus`, `prefered_type`, `status`, `name`, `gender`, `academic_rank`, `work_range`, `marital_status`, `disability`, `soamu`, `current_location`, `children`, `score`, `rank`) VALUES
(48, 'elsa', '0000-00-00', 'Sawula', 'one_bedroom', 'Pending', 'elsabet sewale mulualem', 'female', 'professor', '>8', 'unmarried', 'no', '>4', NULL, NULL, 82, 1),
(49, 'aye', '0000-00-00', 'Abaya', 'three_bedroom', 'Pending', 'aye sewale mulualem', 'female', 'professor', '>8', 'married', 'no', '1-4', NULL, NULL, 87, 1),
(50, 'sew', '0000-00-00', 'Chamo', 'studio', 'Pending', 'sewale mulualem', 'male', 'msc', '>8', 'married', 'no', '1-4', NULL, NULL, 69, 1),
(62, 'kalkidan', '2025-04-22', 'Main', 'three_bedroom', 'Pending', 'kalkidan sewale mulualem', 'male', 'professor', '3', 'married', 'no', '3', 'outside_university', 4, 76, 2),
(64, 'admasu', '2025-04-26', 'Main', 'three_bedroom', 'Pending', 'Admasu sewale mulualem', 'male', 'professor', '3', 'married', 'no', '3', 'in_university', 3, 76, 3);

-- --------------------------------------------------------

--
-- Table structure for table `appeals`
--

CREATE TABLE `appeals` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `appeal_reason` text NOT NULL,
  `allocation_type` enum('Residence','Office') NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `resolution_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appeals`
--

INSERT INTO `appeals` (`id`, `username`, `appeal_reason`, `allocation_type`, `status`, `resolved_at`, `resolution_message`, `created_at`) VALUES
(3, 'admasu', 'not fair', 'Residence', 'Rejected', '2025-03-29 10:55:21', 'its fair', '2025-03-29 10:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(2, 'admarry', 'admarry@gmail.com', 'hello', '2025-04-12 22:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `critical_allocation_requests`
--

CREATE TABLE `critical_allocation_requests` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `resource_type` enum('residence','office') NOT NULL,
  `preferred_residence` varchar(255) DEFAULT NULL,
  `preferred_office` varchar(255) DEFAULT NULL,
  `reason` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `resource_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_permissions`
--

CREATE TABLE `form_permissions` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `allow_updates` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form_permissions`
--

INSERT INTO `form_permissions` (`id`, `start_date`, `end_date`, `allow_updates`) VALUES
(24, '2025-04-11', '2025-04-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `bfno` varchar(50) NOT NULL,
  `request_by` varchar(100) NOT NULL,
  `work_required` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `work_type` varchar(50) NOT NULL,
  `material_list` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `bfno`, `request_by`, `work_required`, `location`, `date`, `work_type`, `material_list`, `status`) VALUES
(4, '1', 'admasu', 'adsf', 'main', '2025-04-17', 'Plumbing', 'dcs', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `username`, `message`, `is_read`, `created_at`) VALUES
(26, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-13 15:27:04'),
(27, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-13 15:31:30'),
(28, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-14 11:54:23'),
(29, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-14 11:54:30'),
(30, 'admin', 'The allocation committee added a new resource.', 1, '2025-03-14 12:26:06'),
(31, 'aye', 'Your residence allocation request has been successfully processed.', 1, '2025-03-14 14:26:09'),
(32, 'elsa', 'Your residence allocation request has been successfully processed.', 1, '2025-03-14 14:26:26'),
(33, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-14 14:26:29'),
(34, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-14 14:26:29'),
(35, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-14 14:26:32'),
(36, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-14 14:26:36'),
(37, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-14 14:27:02'),
(38, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-14 15:01:32'),
(39, 'admin', 'The allocation committee added a new resource.', 1, '2025-03-14 19:46:46'),
(40, 'admin', 'The allocation committee added a new resource.', 1, '2025-03-14 19:46:50'),
(41, 'admasu', 'The allocation committee added a new resource.', 1, '2025-03-16 11:22:17'),
(42, 'director', 'The allocation committee added a new resource.', 0, '2025-03-16 11:45:40'),
(43, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 11:50:57'),
(44, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:32:35'),
(45, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:32:36'),
(46, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:32:39'),
(47, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:33:15'),
(48, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:33:36'),
(49, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:37:38'),
(50, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:37:50'),
(51, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:38:57'),
(52, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:45:01'),
(53, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:45:15'),
(54, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:46:05'),
(55, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:46:10'),
(56, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:48:13'),
(57, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:48:18'),
(58, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:48:18'),
(59, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:48:24'),
(60, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:48:59'),
(61, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:49:00'),
(62, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:49:00'),
(63, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:49:00'),
(64, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:49:10'),
(65, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:50:32'),
(66, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:50:33'),
(67, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:50:33'),
(68, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:50:37'),
(69, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:51:52'),
(70, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:51:52'),
(71, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:51:53'),
(72, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:51:53'),
(73, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:57:12'),
(74, 'committee', 'The allocation committee added a new resource.', 1, '2025-03-17 12:57:23'),
(75, 'committee', 'Your residence allocation request has been successfully processed.', 0, '2025-03-18 12:43:44'),
(76, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 19:49:10'),
(77, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 20:32:44'),
(78, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 20:54:04'),
(79, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 20:54:26'),
(80, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 20:59:10'),
(81, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 21:00:19'),
(82, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-22 21:01:40'),
(83, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 09:26:23'),
(84, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 09:26:35'),
(85, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-23 09:26:43'),
(86, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 15:54:55'),
(87, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:19:53'),
(88, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:19:58'),
(89, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:07'),
(90, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:15'),
(91, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:21'),
(92, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:27'),
(93, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:31'),
(94, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-23 19:20:52'),
(95, 'committee', 'Your residence allocation has been deallocated.', 0, '2025-03-24 19:49:13'),
(96, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-24 20:36:47'),
(97, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-24 20:37:24'),
(98, 'admasu', 'Your appeal for Office has been rejected. because the allocation result correctly so the appeal is rejected', 1, '2025-03-26 14:54:00'),
(99, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 18:01:23'),
(100, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 18:02:28'),
(101, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 18:27:13'),
(102, 'elsa', 'Your office allocation request has been rejected.', 1, '2025-03-27 19:03:28'),
(103, 'admasu', 'Your office allocation request has been rejected.', 1, '2025-03-27 19:10:26'),
(104, 'admasu', 'Your office allocation request has been successfully processed.', 1, '2025-03-27 19:43:27'),
(105, 'kalkidan', 'Your office allocation request has been successfully processed.', 1, '2025-03-27 19:43:27'),
(106, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 19:44:22'),
(107, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 19:44:50'),
(108, 'kalkidan', 'Your office allocation has been deallocated.', 1, '2025-03-27 19:51:54'),
(109, 'kalkidan', 'Your office allocation request has been successfully processed.', 1, '2025-03-27 19:52:19'),
(110, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 19:53:30'),
(111, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-27 19:53:51'),
(112, 'sew', 'Your office allocation request has been successfully processed.', 1, '2025-03-27 19:53:59'),
(113, 'aye', 'Your office allocation request has been successfully processed.', 1, '2025-03-27 19:53:59'),
(114, 'admasu', 'Your office allocation has been deallocated.', 1, '2025-03-28 17:30:41'),
(115, 'kalkidan', 'Your office allocation has been deallocated.', 1, '2025-03-28 17:30:41'),
(116, 'sew', 'Your office allocation has been deallocated.', 1, '2025-03-28 17:30:41'),
(117, 'aye', 'Your office allocation has been deallocated.', 1, '2025-03-28 17:30:41'),
(118, 'aye', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 17:42:54'),
(119, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 17:42:54'),
(120, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 17:42:54'),
(121, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-03-28 17:43:03'),
(122, 'aye', 'Your residence allocation has been deallocated.', 1, '2025-03-28 17:43:03'),
(123, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-03-28 17:43:03'),
(124, 'elsa', 'Your residence allocation request has been rejected.', 1, '2025-03-28 19:08:34'),
(125, 'elsa', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:07:16'),
(126, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:07:16'),
(127, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:07:16'),
(128, 'sew', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:07:16'),
(129, 'elsa', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:11:08'),
(130, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:11:09'),
(131, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:11:09'),
(132, 'sew', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:11:09'),
(133, 'elsa', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:11:55'),
(134, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:11:55'),
(135, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:11:55'),
(136, 'sew', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:11:55'),
(137, 'elsa', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:15:10'),
(138, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:15:10'),
(139, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:15:10'),
(140, 'sew', 'Your residence allocation has been deallocated.', 1, '2025-03-28 21:15:10'),
(141, 'elsa', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:15:44'),
(142, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:16:48'),
(143, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:16:48'),
(144, 'sew', 'Your residence allocation request has been successfully processed.', 1, '2025-03-28 21:16:48'),
(145, 'admasu', 'Your appeal for Residence has been rejected. its fair', 1, '2025-03-29 10:55:21'),
(146, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 10:58:39'),
(147, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:12:19'),
(148, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:12:50'),
(149, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:16:08'),
(150, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:16:56'),
(151, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:17:16'),
(152, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:18:00'),
(153, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:18:12'),
(154, 'elsa', 'Your residence allocation has been deallocated.', 1, '2025-03-29 11:23:11'),
(155, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-03-29 11:23:11'),
(156, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-03-29 11:23:11'),
(157, 'sew', 'Your residence allocation has been deallocated.', 0, '2025-03-29 11:23:11'),
(158, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:29:26'),
(159, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:30:47'),
(160, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:31:28'),
(161, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:42:53'),
(162, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:46:23'),
(163, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:46:53'),
(164, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:00'),
(165, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:20'),
(166, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:21'),
(167, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:21'),
(168, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:21'),
(169, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:47:21'),
(170, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-29 11:54:02'),
(171, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-30 12:09:10'),
(172, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-30 12:29:40'),
(173, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-30 12:30:15'),
(174, 'committee', 'The allocation committee added a new resource.', 0, '2025-03-30 18:36:23'),
(175, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-04 18:46:23'),
(176, 'elsa', 'Your residence allocation request has been successfully processed.', 1, '2025-04-04 18:52:13'),
(177, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-04 18:52:13'),
(178, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-04-04 18:52:13'),
(179, 'sew', 'Your residence allocation request has been successfully processed.', 0, '2025-04-04 18:52:13'),
(180, 'elsa', 'Your residence allocation has been deallocated.', 1, '2025-04-04 18:54:34'),
(181, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-04-04 18:54:34'),
(182, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-04-04 18:54:34'),
(183, 'sew', 'Your residence allocation has been deallocated.', 0, '2025-04-04 18:54:34'),
(184, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:22:45'),
(185, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:26:34'),
(186, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:26:45'),
(187, 'admasu', 'Your office allocation request has been successfully processed.', 1, '2025-04-06 20:28:42'),
(188, 'kalkidan', 'Your office allocation request has been successfully processed.', 1, '2025-04-06 20:28:42'),
(189, 'sew', 'Your office allocation request has been successfully processed.', 0, '2025-04-06 20:28:42'),
(190, 'aye', 'Your office allocation request has been successfully processed.', 1, '2025-04-06 20:28:42'),
(191, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:28:59'),
(192, 'admasu', 'Your office allocation has been deallocated.', 1, '2025-04-06 20:29:28'),
(193, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:29:32'),
(194, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:37:06'),
(195, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:37:23'),
(196, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:37:47'),
(197, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:38:09'),
(198, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:38:13'),
(199, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:38:29'),
(200, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:38:48'),
(201, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-06 20:39:12'),
(202, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 06:17:41'),
(203, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 06:23:47'),
(204, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 06:23:51'),
(205, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 10:52:57'),
(206, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 10:53:02'),
(207, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:00:03'),
(208, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:00:04'),
(209, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:00:04'),
(210, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:00:04'),
(211, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:01:09'),
(212, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:01:22'),
(213, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:01:28'),
(214, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:02:21'),
(215, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:02:21'),
(216, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:02:21'),
(217, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:02:22'),
(218, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:02:43'),
(219, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-07 11:15:27'),
(220, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:46:53'),
(221, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:46:56'),
(222, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:05'),
(223, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:11'),
(224, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:15'),
(225, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:17'),
(226, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:21'),
(227, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:24'),
(228, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:26'),
(229, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:31'),
(230, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:35'),
(231, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:40'),
(232, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:45'),
(233, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:49'),
(234, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:47:55'),
(235, 'c', 'The allocation committee added a new resource.', 0, '2025-04-11 17:50:16'),
(236, 'aye', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:48:09'),
(237, 'admin', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:48:09'),
(238, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:48:09'),
(239, 'aye', 'Your residence allocation has been deallocated.', 1, '2025-04-11 19:49:27'),
(240, 'admin', 'Your residence allocation has been deallocated.', 0, '2025-04-11 19:49:27'),
(241, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-04-11 19:49:27'),
(242, 'aye', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:50:53'),
(243, 'admin', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:50:53'),
(244, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:50:53'),
(245, 'aye', 'Your residence allocation has been deallocated.', 0, '2025-04-11 19:55:31'),
(246, 'admin', 'Your residence allocation has been deallocated.', 0, '2025-04-11 19:55:31'),
(247, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-04-11 19:55:31'),
(248, 'aye', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:55:42'),
(249, 'admin', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:55:42'),
(250, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:55:42'),
(251, 'aye', 'Your residence allocation has been deallocated.', 0, '2025-04-11 19:56:07'),
(252, 'admin', 'Your residence allocation has been deallocated.', 0, '2025-04-11 19:56:07'),
(253, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-04-11 19:56:07'),
(254, 'aye', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:56:14'),
(255, 'admin', 'Your residence allocation request has been successfully processed.', 0, '2025-04-11 19:56:14'),
(256, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-11 19:56:14'),
(257, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:15:33'),
(258, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:26:29'),
(259, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:26:52'),
(260, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:26:56'),
(261, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:28:30'),
(262, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:28:30'),
(263, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:28:30'),
(264, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:28:30'),
(265, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:34:17'),
(266, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-11 20:34:34'),
(267, 'kalkidan', 'Your office allocation request has been successfully processed.', 1, '2025-04-11 21:17:13'),
(268, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-12 18:49:08'),
(269, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-12 18:50:43'),
(270, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-12 18:53:42'),
(271, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-13 18:08:05'),
(272, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-13 18:08:10'),
(273, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-04-14 18:45:13'),
(274, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-14 20:37:41'),
(275, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-14 20:41:19'),
(276, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-17 06:13:25'),
(277, 'kalkidan', 'Your residence allocation request has been successfully processed.', 1, '2025-04-17 07:02:59'),
(278, 'admasu', 'Your residence allocation request has been successfully processed.', 1, '2025-04-17 07:02:59'),
(279, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-17 07:06:30'),
(280, 'aye', 'Your residence allocation has been deallocated.', 0, '2025-04-17 19:59:42'),
(281, 'admasu', 'Your residence allocation has been deallocated.', 1, '2025-04-17 19:59:42'),
(282, 'kalkidan', 'Your residence allocation has been deallocated.', 1, '2025-04-17 19:59:42'),
(283, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-23 08:36:07'),
(284, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-24 18:11:53'),
(285, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-26 10:35:21'),
(286, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-26 10:35:25'),
(287, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-26 10:36:52'),
(288, 'committee', 'The allocation committee added a new resource.', 0, '2025-04-26 10:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `office_allocation`
--

CREATE TABLE `office_allocation` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `allocated_to_name` varchar(255) NOT NULL,
  `allocated_to_username` varchar(255) NOT NULL,
  `campus` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `allocation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office_allocation`
--

INSERT INTO `office_allocation` (`id`, `request_id`, `resource_id`, `allocated_to_name`, `allocated_to_username`, `campus`, `building`, `floor`, `room_number`, `allocation_date`) VALUES
(15, 14, 1, 'kalkidan sewale mulualem', 'kalkidan', 'Main', 'registral', 1, 1, '2025-04-11 21:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `office_allocation_requests`
--

CREATE TABLE `office_allocation_requests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `date` date NOT NULL,
  `campus` varchar(50) NOT NULL,
  `office_type` enum('private','shared','open_space') NOT NULL,
  `academic_rank` varchar(50) NOT NULL,
  `work_range` varchar(50) NOT NULL,
  `disability` enum('no','yes') NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `score` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office_allocation_requests`
--

INSERT INTO `office_allocation_requests` (`id`, `name`, `username`, `gender`, `date`, `campus`, `office_type`, `academic_rank`, `work_range`, `disability`, `status`, `score`, `rank`, `created_at`) VALUES
(14, 'kalkidan sewale mulualem', 'kalkidan', 'female', '0000-00-00', 'Main', 'private', 'phd', '5-8', 'no', '', 86, 1, '2025-04-11 21:16:36'),
(15, 'Admasu sewale mulualem', 'admasu', 'male', '2025-04-26', 'Main', 'private', 'professor', '3-5', 'no', 'Pending', 85, 1, '2025-04-26 10:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `office_reports`
--

CREATE TABLE `office_reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_to_director` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office_reports`
--

INSERT INTO `office_reports` (`id`, `title`, `data`, `created_at`, `sent_to_director`) VALUES
(11, 'Maintenance Issue Report', '[]', '2025-04-13 17:56:51', 0),
(12, 'Track Resource Report', '[{\"campus\":\"Chamo\",\"building\":\"12\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"12\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"12\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"12\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"5\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"6\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"7\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"8\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"9\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"10\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"11\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"12\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"13\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"14\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"15\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"16\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"17\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"18\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"19\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"20\",\"resource_type\":\"shared\",\"status\":\"Available\"}]', '2025-04-13 17:56:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `office_resource`
--

CREATE TABLE `office_resource` (
  `id` int(11) NOT NULL,
  `campus` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `resource_type` enum('private','shared') NOT NULL,
  `status` enum('Available','Allocated') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office_resource`
--

INSERT INTO `office_resource` (`id`, `campus`, `building`, `floor`, `room_number`, `resource_type`, `status`) VALUES
(1, 'Main', 'registral', 1, 1, 'private', 'Allocated'),
(2, 'Main', 'registral', 1, 2, 'private', 'Available'),
(3, 'Main', 'registral', 1, 3, 'private', 'Available'),
(4, 'Main', 'registral', 1, 4, 'private', 'Available'),
(5, 'Main', 'registral', 1, 5, 'private', 'Available'),
(6, 'Main', 'registral', 1, 6, 'private', 'Available'),
(7, 'Main', 'registral', 1, 7, 'private', 'Available'),
(8, 'Main', 'registral', 1, 8, 'private', 'Available'),
(9, 'Main', 'registral', 1, 9, 'private', 'Available'),
(10, 'Main', 'registral', 1, 10, 'private', 'Available'),
(11, 'Main', 'registral', 1, 11, 'private', 'Available'),
(12, 'Main', 'registral', 1, 12, 'private', 'Available'),
(13, 'Main', 'registral', 2, 13, 'shared', 'Available'),
(14, 'Main', 'registral', 2, 14, 'shared', 'Available'),
(15, 'Main', 'registral', 2, 15, 'shared', 'Available'),
(16, 'Main', 'registral', 2, 16, 'shared', 'Available'),
(17, 'Main', 'registral', 2, 17, 'shared', 'Available'),
(18, 'Main', 'registral', 2, 18, 'shared', 'Available'),
(19, 'Main', 'registral', 2, 19, 'shared', 'Available'),
(20, 'Main', 'registral', 2, 20, 'shared', 'Available'),
(21, 'Chamo', '12', 1, 1, 'private', 'Available'),
(22, 'Chamo', '12', 1, 2, 'private', 'Available'),
(23, 'Chamo', '12', 1, 3, 'private', 'Available'),
(24, 'Chamo', '12', 1, 4, 'private', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `sent_to_director` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `data`, `sent_to_director`, `created_at`) VALUES
(1, 'Track Resource Report', '[{\"campus\":\"Abaya\",\"building\":\"buildings 001 abaya\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"buildings 001 chamo\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"one_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"3\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"two_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"studio\",\"status\":\"Available\"}]', 1, '2025-03-18 16:01:02'),
(2, 'About Allocation Report', '[{\"allocated_to_name\":\"Admasu sewale muluale\",\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"}]', 1, '2025-03-18 16:08:16'),
(3, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 1, '2025-03-18 16:16:41'),
(6, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 0, '2025-03-18 19:23:51'),
(7, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 0, '2025-03-18 19:23:52'),
(8, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 0, '2025-03-18 19:23:53'),
(9, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 0, '2025-03-18 19:24:11'),
(10, 'Track Resource Report', '[{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"5\",\"resource_type\":\"private\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"6\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"7\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"8\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"9\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"10\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"11\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"12\",\"resource_type\":\"private\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"13\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"14\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"15\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"16\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"17\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"18\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"19\",\"resource_type\":\"shared\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"2\",\"room_number\":\"20\",\"resource_type\":\"shared\",\"status\":\"Available\"}]', 0, '2025-03-18 20:54:57'),
(11, 'About Allocation Report', '[{\"allocated_to_name\":\"aye tamiru chekol\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"elsabet sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"kalkidan sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"Admasu sewale muluale\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"5\",\"resource_type\":\"private\",\"status\":\"\"}]', 0, '2025-03-18 20:55:18'),
(12, 'About Allocation Report', '[{\"allocated_to_name\":\"aye tamiru chekol\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"elsabet sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"kalkidan sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"Admasu sewale muluale\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"5\",\"resource_type\":\"private\",\"status\":\"\"}]', 0, '2025-03-18 20:58:36'),
(13, 'About Allocation Report', '[{\"allocated_to_name\":\"aye tamiru chekol\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"elsabet sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"kalkidan sewale mulualem\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"4\",\"resource_type\":\"private\",\"status\":\"\"},{\"allocated_to_name\":\"Admasu sewale muluale\",\"campus\":\"Main\",\"building\":\"registral\",\"floor\":\"1\",\"room_number\":\"5\",\"resource_type\":\"private\",\"status\":\"\"}]', 1, '2025-03-18 20:58:59'),
(14, 'Maintenance Issue Report', '[{\"bfno\":\"BA\",\"request_by\":\"adma\",\"work_required\":\"SDAF\",\"location\":\"AVV\",\"date\":\"2025-03-08\",\"work_type\":\"Plumbing\",\"material_list\":\"DDFFFD\",\"status\":\"Completed\"}]', 0, '2025-03-20 18:18:44'),
(15, 'Track Resource Report', '[{\"campus\":\"Abaya\",\"building\":\"buildings 001 abaya\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"buildings 001 chamo\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"one_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"3\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"two_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"studio\",\"status\":\"Available\"}]', 0, '2025-03-23 13:50:01'),
(16, 'Track Resource Report', '[{\"campus\":\"Abaya\",\"building\":\"buildings 001 abaya\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"buildings 001 chamo\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"one_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"3\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"two_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"studio\",\"status\":\"Available\"}]', 1, '2025-03-27 18:02:06'),
(17, 'Maintenance Issue Report', '[]', 0, '2025-04-04 20:17:39'),
(18, 'Maintenance Issue Report', '[]', 0, '2025-04-04 20:17:43'),
(19, 'Track Resource Report', '[{\"campus\":\"Abaya\",\"building\":\"buildings 001 abaya\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"buildings 001 chamo\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"one_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Chamo\",\"building\":\"chamo buildings 001\",\"floor\":\"2\",\"room_number\":\"3\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"34\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"three_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 001\",\"floor\":\"2\",\"room_number\":\"2\",\"resource_type\":\"three_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"two_bedroom\",\"status\":\"Allocated\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Main\",\"building\":\"buildings 003\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"two_bedroom\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"1\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"2\",\"resource_type\":\"studio\",\"status\":\"Available\"},{\"campus\":\"Sawula\",\"building\":\"sawula building 001\",\"floor\":\"1\",\"room_number\":\"3\",\"resource_type\":\"studio\",\"status\":\"Available\"}]', 0, '2025-04-04 20:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `campus` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `resource_type` enum('three_bedroom','two_bedroom','one_bedroom','studio','service') NOT NULL,
  `status` enum('Available','Allocated') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `campus`, `building`, `floor`, `room_number`, `resource_type`, `status`) VALUES
(18, 'Main', 'buildings 001', 1, 1, 'three_bedroom', 'Available'),
(19, 'Chamo', 'chamo buildings 001', 1, 1, 'three_bedroom', 'Available'),
(20, 'Main', 'buildings 001', 2, 2, 'three_bedroom', 'Available'),
(21, 'Main', 'buildings 003', 1, 1, 'two_bedroom', 'Allocated'),
(22, 'Main', 'buildings 003', 1, 2, 'two_bedroom', 'Available'),
(23, 'Main', 'buildings 003', 1, 3, 'two_bedroom', 'Available'),
(24, 'Abaya', 'buildings 001 abaya', 1, 1, 'three_bedroom', 'Available'),
(25, 'Chamo', 'buildings 001 chamo', 1, 1, 'one_bedroom', 'Available'),
(26, 'Chamo', 'chamo buildings 001', 2, 2, 'three_bedroom', 'Available'),
(27, 'Chamo', 'chamo buildings 001', 2, 3, 'three_bedroom', 'Available'),
(28, 'Sawula', 'sawula building 001', 1, 1, 'studio', 'Available'),
(29, 'Sawula', 'sawula building 001', 1, 2, 'studio', 'Available'),
(30, 'Sawula', 'sawula building 001', 1, 3, 'studio', 'Available'),
(31, 'Main', '34', 1, 1, 'three_bedroom', 'Allocated'),
(32, 'Main', '34', 1, 2, 'three_bedroom', 'Allocated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','allocation_committee','staff_member','managing_director') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'nsr.480.14', 'AMU/AD003', 'admin'),
(2, 'committee', 'Committee@123', 'allocation_committee'),
(4, 'director', 'director123', 'managing_director'),
(8, 'admasu', 'admasu', 'staff_member'),
(9, 'kalkidan', 'kalkidan', 'staff_member'),
(10, 'elsa', 'elsa', 'staff_member'),
(24, 'committee1', 'AMU/A003', 'allocation_committee'),
(25, 'debe1', '1234', 'managing_director'),
(27, 'esey', 'AMU/D005', 'managing_director'),
(29, 'admin', 'admin', 'admin'),
(30, 'aye', 'aye', 'staff_member'),
(31, 'sew', 'sew', 'staff_member');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `college` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `employment_date` date NOT NULL,
  `academic_rank` enum('Professor','Researcher','PhD','MSc','BSc') NOT NULL,
  `work_range` enum('>8','5-8','3-5','1-3') NOT NULL,
  `marital_status` enum('married','unmarried','divorced') NOT NULL,
  `children` int(11) DEFAULT 0,
  `spouse` enum('yes','no') NOT NULL,
  `spouse_name` varchar(255) DEFAULT NULL,
  `disability` enum('yes','no') NOT NULL,
  `soamu` enum('1-4','>4') NOT NULL,
  `current_address` enum('private','university') NOT NULL,
  `unit_type` enum('three_bedroom','two_bedroom','one_bedroom','studio','service') NOT NULL,
  `email` varchar(255) NOT NULL,
  `alt_email` varchar(255) DEFAULT NULL,
  `phone_home` varchar(20) DEFAULT NULL,
  `phone_mobile` varchar(20) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL COMMENT 'Path to profile photo thumbnail',
  `work_experience_cert` varchar(255) DEFAULT NULL COMMENT 'Path to work experience certificate',
  `academic_progression_cert` varchar(255) DEFAULT NULL COMMENT 'Path to academic progression certificate',
  `marriage_cert` varchar(255) DEFAULT NULL COMMENT 'Path to marriage certificate',
  `status` enum('Pending','Approved','Rejected','Deferred') DEFAULT 'Pending',
  `score` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 0,
  `is_rejected` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `user_id`, `name`, `gender`, `college`, `department`, `employment_date`, `academic_rank`, `work_range`, `marital_status`, `children`, `spouse`, `spouse_name`, `disability`, `soamu`, `current_address`, `unit_type`, `email`, `alt_email`, `phone_home`, `phone_mobile`, `profile_photo`, `work_experience_cert`, `academic_progression_cert`, `marriage_cert`, `status`, `score`, `rank`, `created_at`, `updated_at`, `is_approved`, `is_rejected`) VALUES
(9, 8, 'Admasu sewale mulualem', 'male', 'AMIT', 'information technology', '2025-04-22', 'Professor', '', 'married', 0, 'no', '', 'no', '1-4', 'private', 'three_bedroom', 'admasusewale66@gmail.com', 'admin1@gmail.com', '0909794287', '0988170739', 'uploads/profile_photos/thumb_user_8_1744646010.jpg', 'uploads/work_experience/work_experience_cert_8_1745271447.jpg', 'uploads/academic_progression/academic_progression_cert_8_1745271447.pdf', 'uploads/marriage/marriage_cert_8_1745272050.jpg', 'Pending', 0, 0, '2025-04-14 15:53:30', '2025-04-21 21:47:30', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation_requests`
--
ALTER TABLE `allocation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appeals`
--
ALTER TABLE `appeals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `critical_allocation_requests`
--
ALTER TABLE `critical_allocation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_permissions`
--
ALTER TABLE `form_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_allocation`
--
ALTER TABLE `office_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_allocation_requests`
--
ALTER TABLE `office_allocation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_reports`
--
ALTER TABLE `office_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_resource`
--
ALTER TABLE `office_resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_room` (`campus`,`building`,`floor`,`room_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation_requests`
--
ALTER TABLE `allocation_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `appeals`
--
ALTER TABLE `appeals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `critical_allocation_requests`
--
ALTER TABLE `critical_allocation_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `form_permissions`
--
ALTER TABLE `form_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `office_allocation`
--
ALTER TABLE `office_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `office_allocation_requests`
--
ALTER TABLE `office_allocation_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `office_reports`
--
ALTER TABLE `office_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `office_resource`
--
ALTER TABLE `office_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
