-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2026 at 04:04 PM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yaftom_mis-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_type` varchar(50) NOT NULL DEFAULT 'office',
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `opening_balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `current_balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `name`, `account_type`, `bank_name`, `account_number`, `currency`, `opening_balance`, `current_balance`, `status`, `notes`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'be8f90dd-a7fc-4995-bf3f-8aed6353c92a', 'General Office', 'general', 'GH3242', 'Gh234223', 'USD', 100.00, 5200.00, 'active', 'this is some descr', NULL, '2026-05-05 05:05:35', '2026-05-05 05:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `direction` varchar(10) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `currency_code` varchar(10) NOT NULL DEFAULT 'USD',
  `exchange_rate_snapshot` decimal(16,6) DEFAULT NULL,
  `amount_usd` decimal(14,2) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `reference_uuid` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'posted',
  `reversal_of_id` bigint(20) UNSIGNED DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `uuid`, `account_id`, `direction`, `amount`, `currency_code`, `exchange_rate_snapshot`, `amount_usd`, `module`, `reference_type`, `reference_uuid`, `description`, `payment_method`, `transaction_date`, `created_by_user_id`, `status`, `reversal_of_id`, `metadata`, `created_at`, `updated_at`) VALUES
(1, '92df511f-7fa5-4292-8a17-bf75f2e64b50', 1, 'in', 2550.00, 'USD', 1.000000, 2550.00, 'sales', 'installment_payment', '5f4899c5-3171-42b6-8e51-97fedc06aa44', 'Installment payment received for sale SAL-000002 installment #1', 'cash', '2026-05-05 00:00:00', 33, 'posted', NULL, '{\"installment_id\":2,\"installment_uuid\":\"8c4058c4-59ec-4703-a9be-fdc9ae237510\",\"apartment_sale_id\":2,\"apartment_sale_uuid\":\"6993b05a-6421-4ce7-a290-f31c38cc0ee4\",\"sale_id\":\"SAL-000002\"}', '2026-05-05 05:05:54', '2026-05-05 05:05:54'),
(2, '88d6a18d-cd84-4203-b678-21816b8548c6', 1, 'in', 850.00, 'USD', 1.000000, 850.00, 'sales', 'installment_payment', '0c6a77a0-b52e-4d2f-aabf-c8a2654fe9ae', 'Installment payment received for sale SAL-000003 installment #1', 'cash', '2026-05-05 00:00:00', 33, 'posted', NULL, '{\"installment_id\":3,\"installment_uuid\":\"d10d1952-c31c-43ae-ba08-b1a6ead1a0d9\",\"apartment_sale_id\":3,\"apartment_sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\"}', '2026-05-05 05:23:21', '2026-05-05 05:23:21'),
(3, '1c941845-3fc6-47bd-a442-930c3c2c6f02', 1, 'in', 850.00, 'USD', 1.000000, 850.00, 'sales', 'installment_payment', 'bfafef10-7b3e-467a-8c5b-52b789c76a16', 'Installment payment received for sale SAL-000003 installment #3', 'cash', '2026-05-05 00:00:00', 33, 'posted', NULL, '{\"installment_id\":5,\"installment_uuid\":\"628cb452-d151-4b4c-b6df-ba30e1603a78\",\"apartment_sale_id\":3,\"apartment_sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\"}', '2026-05-05 05:23:51', '2026-05-05 05:23:51'),
(4, '83859fe1-0655-40ea-9e2a-bb2bf71d908c', 1, 'in', 850.00, 'USD', 1.000000, 850.00, 'sales', 'installment_payment', 'f4e73988-d777-442f-bf99-40440c24e294', 'Installment payment received for sale SAL-000003 installment #2', 'cash', '2026-05-05 00:00:00', 33, 'posted', NULL, '{\"installment_id\":4,\"installment_uuid\":\"31b3b8f9-da48-41d9-8b56-4b71ebad94dc\",\"apartment_sale_id\":3,\"apartment_sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\"}', '2026-05-05 05:23:59', '2026-05-05 05:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_code` varchar(255) NOT NULL,
  `total_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `usage_type` varchar(255) NOT NULL,
  `block_number` varchar(255) DEFAULT NULL,
  `unit_number` varchar(255) NOT NULL,
  `floor_number` varchar(255) DEFAULT NULL,
  `bedrooms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `halls` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bathrooms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `kitchens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balcony` tinyint(1) NOT NULL DEFAULT 0,
  `area_sqm` decimal(10,2) DEFAULT NULL,
  `apartment_shape` varchar(255) DEFAULT NULL,
  `corridor` varchar(255) DEFAULT NULL,
  `north_boundary` varchar(255) DEFAULT NULL,
  `south_boundary` varchar(255) DEFAULT NULL,
  `east_boundary` varchar(255) DEFAULT NULL,
  `west_boundary` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `qr_code` varchar(255) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `uuid`, `apartment_code`, `total_price`, `usage_type`, `block_number`, `unit_number`, `floor_number`, `bedrooms`, `halls`, `bathrooms`, `kitchens`, `balcony`, `area_sqm`, `apartment_shape`, `corridor`, `north_boundary`, `south_boundary`, `east_boundary`, `west_boundary`, `status`, `qr_code`, `additional_info`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1a447366-6172-4660-b3fe-f736537c44ed', 'G-4040', 0.00, 'residential', 'G', '102', '1/H', 1, 1, 7, 30, 0, 32.00, 'fsdf', 'dfsfsd', 'sfsd', 'asdasd', 'df', 'fsdf', 'available', 'fdsfsd', NULL, '2026-05-02 03:31:07', '2026-05-02 03:41:31', '2026-05-02 03:41:31'),
(2, 'e9e71297-717f-4b42-ac4c-fe4aa592acaa', 'HG-23423', 0.00, 'residential', 'GH', '4040', '1/K', 3, 4, 4, 4, 0, 434.00, 'L-shape', 'North Wing', 'road', 'sdsf', 'Road', 'Road', 'available', 'QR-12312', NULL, '2026-05-02 03:31:08', '2026-05-02 03:41:30', '2026-05-02 03:41:30'),
(3, 'c84b8b5d-9507-44f6-b04d-7746faec1cf2', 'H-30', 0.00, 'residential', 'G', '30', '1/K', 2, 3, 3, 3, 0, 33.00, 'sdf', 'sdfsdf', 'sdfsdfsdf', 'dsfsdfs', 'fsf', 'dsfs', 'available', 'sdfsfs', NULL, '2026-05-02 04:04:55', '2026-05-05 23:05:48', NULL),
(4, 'fcc1fae1-4978-4be1-8d05-48c0424c65cb', 'GH3232', 0.00, 'residential', 'J', '404', '1/H', 2, 3, 5, 2, 0, 32.00, 'L-shape', 'nd', 'efsd', 'fds', 'sdf', 'dsfsd', 'available', NULL, NULL, '2026-05-02 04:04:56', '2026-05-04 22:48:56', '2026-05-04 22:48:56'),
(5, 'c42ae3fa-8afd-4dd0-b1a8-249c1d9492a8', 'BHG3534', 0.00, 'residential', 'a', '2323', '1/h', 3, 3, 3, 4, 0, 33.00, 'l-sha', 'sdf', 'fsd', 'fds', 'sdf', 'dfs', 'available', '1fdsf', NULL, '2026-05-03 05:31:35', '2026-05-04 22:48:59', '2026-05-04 22:48:59'),
(6, '33c12034-1b5c-4f6b-a462-3f0784ea5c15', 'A-500', 0.00, 'residential', 'H', '300', '1J', 1, 3, 3, 3, 0, 33.00, 'sdfs', 'sdfsdf', 'sdf', 'fsdfs', 'sdf', 'dfsdfs', 'available', 'sdfsdf', NULL, '2026-05-05 03:44:05', '2026-05-05 04:30:23', '2026-05-05 04:30:23'),
(7, '92db0cb1-a937-43a8-a6cf-2c1369bec106', 'A-5050', 0.00, 'residential', 'H', '440', '1/J', 3, 4, 4, 4, 0, 232323.00, 'fsd', 'dsfsdf', 'sdfsdf', 'sdfsd', 'fsdfsdfs', 'fsdfsd', 'available', 'fsdfsdfsd', NULL, '2026-05-05 04:01:45', '2026-05-05 04:30:19', '2026-05-05 04:30:19'),
(8, 'f1f0b442-8764-4282-a119-02750789d55b', 'A-440', 0.00, 'residential', 'G', '202', '1/H', 3, 1, 0, 4, 0, 33.00, 'L', 'kg', 'gfk', 'gs', 'fd', 'g', 'handed_over', 'df', NULL, '2026-05-05 04:42:50', '2026-05-05 05:23:38', NULL),
(9, '90b1eeea-5ca2-49a3-a326-3f3ea840b87e', 'GH22', 0.00, 'residential', 'H', '303', '1/J', 2, 2, 2, 22, 0, 32.00, 'lsd', 'fs', 'ds', 'dfs', 'sd', 'df', 'reserved', 'dfs', NULL, '2026-05-05 04:55:19', '2026-05-05 04:59:16', NULL),
(10, 'bf033922-2700-4ebd-9066-cd17ce4c3339', 'J-30', 0.00, 'residential', 'H', '3030', '2/h', 3, 3, 3, 4, 0, 32.00, 'dsfsd', 'fsdfsdfsd', 'fsd', 'fsdfsd', 'sdfsd', 'dsf', 'reserved', 'fsdfsdf', NULL, '2026-05-05 05:00:42', '2026-05-05 05:02:07', NULL),
(11, '7f4bdd6a-977d-4245-ad4e-4b90ec3de204', 'GH32423', 0.00, 'residential', 'H', '30', '1/K', 3, 4, 4, 4, 0, 323.00, 'dsf', 'dsf', 'dsf', 'dsf', 'dsff', 'df', 'reserved', 'fds', NULL, '2026-05-06 05:43:44', '2026-05-06 05:50:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `apartment_qr_access_tokens`
--

CREATE TABLE `apartment_qr_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `expires_at` timestamp NULL DEFAULT NULL,
  `last_scanned_at` timestamp NULL DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartment_qr_access_tokens`
--

INSERT INTO `apartment_qr_access_tokens` (`id`, `uuid`, `apartment_id`, `token`, `status`, `expires_at`, `last_scanned_at`, `created_by_user_id`, `created_at`, `updated_at`) VALUES
(1, '699dc03a-33f0-4b51-968f-704539ce41c7', 1, 'hhenRtxqoeH0veyVWom9dtIFNz3GJof2RQVLAnBKfRTsgEOzZANWrJI4uLVK4xqy', 'active', NULL, NULL, 32, '2026-05-02 03:31:07', '2026-05-02 03:31:07'),
(2, '96854087-c39d-47a8-adc2-f9c18b9ddb2c', 2, 'LkirEnoix2ptfVfgDkrKFMBbm5sO7FoNKf484uQ0s3khRKEfbFYpcFe8Q4ogLfDz', 'active', NULL, NULL, 32, '2026-05-02 03:31:08', '2026-05-02 03:31:08'),
(3, '46afc9c9-36f6-4121-80f5-ae807e8e0e70', 3, 'OLOrNFwhOIfOMnqxXRTJIprizkB4QQr0PQfAUsyGtMPgC09UQyU6bn99412mkyVo', 'active', NULL, NULL, 32, '2026-05-02 04:04:55', '2026-05-02 04:04:55'),
(4, 'ade153a9-5e9f-4cd1-8847-a38ebd57301c', 4, '9TO1vV3VAp1QGN0qulSgZw1R2FSwysQhj2EiISymzAHoE8VfFkDBEwEpedkebnJW', 'active', NULL, NULL, 32, '2026-05-02 04:04:56', '2026-05-02 04:04:56'),
(5, 'cbcdffc2-5850-4c5e-829a-776c8fae9a89', 6, '2KLHcKzXf58qiOwpPyXTV4VZ8px9yKeVeAXX9nVw7yz4HLQvlZq5NZYH8oRqlXUl', 'active', NULL, NULL, 32, '2026-05-05 03:44:05', '2026-05-05 03:44:05'),
(6, '50be70e8-1ccd-4d17-a29c-2f87bf8d33f1', 7, 'YSKOvP37PRU5U2p8Vt3qez8iCc2CvHHGQulyd3CZoulEk1Vv2gEfc5OqYGd6Vakz', 'active', NULL, NULL, 32, '2026-05-05 04:01:45', '2026-05-05 04:01:45'),
(7, '1b2245f2-0d81-4ecc-b803-1dfdcb8384d6', 8, '75DRc0YBMij92oUARIoDMfHwGWAPV2GGhcH1zbJAOnoNyZJiH6Cu0SGlD4I4znZt', 'active', NULL, NULL, 33, '2026-05-05 04:42:50', '2026-05-05 04:42:50'),
(8, '015d194e-3da5-4f06-8347-51946ec30114', 9, 'NVwcitngLZYMQw08l3Kbss8gCOWMMq2Gjr7ATUNPpY8XYLbVuivsG8N9uqFG1RU9', 'active', NULL, NULL, 30, '2026-05-05 04:55:19', '2026-05-05 04:55:19'),
(9, '701485fb-1bfa-44c0-bc22-d676039614d4', 10, 'Wo70RjMkMG205BvAljGxTMIhR9Yp18MMOozBlTlwu4btWVeCIuQh0RWMUC1KHOHg', 'active', NULL, NULL, 30, '2026-05-05 05:00:42', '2026-05-05 05:00:42'),
(10, '6f0863c1-17a1-40da-bfe6-cb03204fb71a', 11, 'uiGPP7bU1ZXqFZUVIN4pMTwNvx3FYlbEP1Oi3gqZIETNxYSaaZFaukvSDOJNDVrY', 'active', NULL, NULL, 32, '2026-05-06 05:43:44', '2026-05-06 05:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `apartment_qr_scan_logs`
--

CREATE TABLE `apartment_qr_scan_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_qr_access_token_id` bigint(20) UNSIGNED DEFAULT NULL,
  `apartment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scan_result` varchar(30) NOT NULL,
  `access_scope` varchar(30) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment_rentals`
--

CREATE TABLE `apartment_rentals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `rental_id` varchar(255) NOT NULL,
  `apartment_id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `contract_start` date NOT NULL,
  `contract_end` date DEFAULT NULL,
  `monthly_rent` decimal(14,2) NOT NULL DEFAULT 0.00,
  `advance_months` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `advance_required_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `advance_paid_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `advance_remaining_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_paid_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `advance_status` varchar(255) NOT NULL DEFAULT 'pending',
  `next_due_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `key_handover_status` varchar(255) NOT NULL DEFAULT 'not_handed_over',
  `key_handover_at` timestamp NULL DEFAULT NULL,
  `key_handover_by` bigint(20) UNSIGNED DEFAULT NULL,
  `key_returned_at` timestamp NULL DEFAULT NULL,
  `key_returned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `termination_reason` text DEFAULT NULL,
  `terminated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment_sales`
--

CREATE TABLE `apartment_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `sale_id` varchar(30) DEFAULT NULL,
  `apartment_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` date NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `net_price` decimal(15,2) DEFAULT NULL,
  `actual_net_revenue` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` enum('full','installment') NOT NULL,
  `frequency_type` varchar(255) DEFAULT NULL,
  `interval_count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `installment_count` int(10) UNSIGNED DEFAULT NULL,
  `first_due_date` date DEFAULT NULL,
  `custom_dates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_dates`)),
  `schedule_locked` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_locked_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `deed_status` varchar(30) NOT NULL DEFAULT 'not_issued',
  `deed_issued_at` timestamp NULL DEFAULT NULL,
  `deed_issued_by` bigint(20) UNSIGNED DEFAULT NULL,
  `key_handover_status` varchar(30) NOT NULL DEFAULT 'not_handed_over',
  `key_handover_at` timestamp NULL DEFAULT NULL,
  `key_handover_by` bigint(20) UNSIGNED DEFAULT NULL,
  `possession_start_date` date DEFAULT NULL,
  `vacated_at` date DEFAULT NULL,
  `key_returned_at` timestamp NULL DEFAULT NULL,
  `key_returned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartment_sales`
--

INSERT INTO `apartment_sales` (`id`, `uuid`, `sale_id`, `apartment_id`, `customer_id`, `sale_date`, `total_price`, `discount`, `net_price`, `actual_net_revenue`, `payment_type`, `frequency_type`, `interval_count`, `installment_count`, `first_due_date`, `custom_dates`, `schedule_locked`, `schedule_locked_at`, `approved_at`, `status`, `deed_status`, `deed_issued_at`, `deed_issued_by`, `key_handover_status`, `key_handover_at`, `key_handover_by`, `possession_start_date`, `vacated_at`, `key_returned_at`, `key_returned_by`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '1f0157ec-081e-4811-a159-42dbb0393e19', 'SAL-000001', 9, 5, '2026-05-05', 8997.00, 0.00, 8997.00, 0.00, 'full', NULL, 1, NULL, NULL, NULL, 0, NULL, '2026-05-05 05:22:49', 'approved', 'not_issued', NULL, NULL, 'not_handed_over', NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05 04:59:16', '2026-05-05 05:22:49', NULL, 30),
(2, '6993b05a-6421-4ce7-a290-f31c38cc0ee4', 'SAL-000002', 10, 4, '2026-05-05', 3000.00, 0.00, 3000.00, 2520.00, 'full', NULL, 1, NULL, NULL, NULL, 0, NULL, '2026-05-05 05:02:46', 'approved', 'not_issued', NULL, NULL, 'not_handed_over', NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05 05:02:06', '2026-05-05 05:05:54', NULL, 33),
(3, 'b84d862b-54f9-4921-8e98-68e7f281f2ca', 'SAL-000003', 8, 1, '2026-05-05', 3000.00, 0.00, 3000.00, 2520.00, 'installment', 'monthly', 1, 3, '2026-05-05', '[]', 0, NULL, '2026-05-05 05:22:40', 'approved', 'not_issued', NULL, NULL, 'handed_over', '2026-05-05 05:23:38', 33, '2026-05-05', NULL, NULL, NULL, '2026-05-05 05:21:40', '2026-05-05 05:23:59', NULL, 33),
(4, '7925687e-227b-4aa0-92db-f8c097713398', 'SAL-000004', 11, 7, '2026-05-06', 1000.00, 0.00, 1000.00, 0.00, 'installment', 'monthly', 1, 3, '2026-05-06', '[]', 0, NULL, '2026-05-06 05:50:30', 'approved', 'not_issued', NULL, NULL, 'handed_over', '2026-05-06 05:57:35', 32, '2026-05-06', NULL, NULL, NULL, '2026-05-06 05:50:28', '2026-05-06 05:57:35', NULL, 32);

-- --------------------------------------------------------

--
-- Table structure for table `apartment_sale_financials`
--

CREATE TABLE `apartment_sale_financials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `accounts_status` varchar(100) NOT NULL DEFAULT 'open',
  `municipality_share_15` decimal(15,2) NOT NULL DEFAULT 0.00,
  `delivered_to_municipality` decimal(15,2) NOT NULL DEFAULT 0.00,
  `remaining_municipality` decimal(15,2) NOT NULL DEFAULT 0.00,
  `company_share_85` decimal(15,2) NOT NULL DEFAULT 0.00,
  `delivered_to_company` decimal(15,2) NOT NULL DEFAULT 0.00,
  `rahnama_fee_1` decimal(15,2) NOT NULL DEFAULT 0.00,
  `customer_debt` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_or_contractor_deduction` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartment_sale_financials`
--

INSERT INTO `apartment_sale_financials` (`id`, `uuid`, `apartment_sale_id`, `accounts_status`, `municipality_share_15`, `delivered_to_municipality`, `remaining_municipality`, `company_share_85`, `delivered_to_company`, `rahnama_fee_1`, `customer_debt`, `discount_or_contractor_deduction`, `created_at`, `updated_at`) VALUES
(1, '1f0157ec-081e-4811-a159-42dbb0393e19', 1, 'open', 1349.55, 0.00, 1349.55, 7647.45, 0.00, 89.97, 7647.45, 0.00, '2026-05-05 04:59:16', '2026-05-05 04:59:16'),
(2, '6993b05a-6421-4ce7-a290-f31c38cc0ee4', 2, 'open', 450.00, 0.00, 450.00, 2550.00, 0.00, 30.00, 0.00, 0.00, '2026-05-05 05:02:07', '2026-05-05 05:05:54'),
(3, 'b84d862b-54f9-4921-8e98-68e7f281f2ca', 3, 'open', 450.00, 0.00, 450.00, 2550.00, 0.00, 30.00, 0.00, 0.00, '2026-05-05 05:21:40', '2026-05-05 05:23:59'),
(4, '7925687e-227b-4aa0-92db-f8c097713398', 4, 'open', 150.00, 0.00, 150.00, 850.00, 0.00, 10.00, 850.00, 0.00, '2026-05-06 05:50:28', '2026-05-06 05:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `apartment_sale_possession_logs`
--

CREATE TABLE `apartment_sale_possession_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(30) NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartment_sale_possession_logs`
--

INSERT INTO `apartment_sale_possession_logs` (`id`, `uuid`, `apartment_sale_id`, `action`, `action_date`, `user_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 'b45f9088-1163-4faa-9440-1ae9eee00f58', 3, 'key_handover', '2026-05-05 05:23:38', 33, 'Key handed over after payment eligibility check.', '2026-05-05 05:23:38', '2026-05-05 05:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `apartment_sale_terminations`
--

CREATE TABLE `apartment_sale_terminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `termination_charge` decimal(15,2) NOT NULL DEFAULT 0.00,
  `refund_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `remaining_debt_after_termination` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approvals`
--

CREATE TABLE `approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `requested_by` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approval_logs`
--

CREATE TABLE `approval_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approval_id` bigint(20) UNSIGNED NOT NULL,
  `approved_by` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `remarks` text DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_assignments`
--

CREATE TABLE `asset_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `asset_id` bigint(20) UNSIGNED NOT NULL,
  `asset_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity_assigned` decimal(14,2) NOT NULL DEFAULT 1.00,
  `assigned_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'active',
  `condition_on_issue` varchar(255) DEFAULT NULL,
  `condition_on_return` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_requests`
--

CREATE TABLE `asset_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `request_no` varchar(255) NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_asset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `quantity_requested` decimal(14,2) NOT NULL DEFAULT 1.00,
  `quantity_allocated` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` varchar(40) NOT NULL DEFAULT 'pending',
  `reason` text DEFAULT NULL,
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `allocated_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `allocated_at` timestamp NULL DEFAULT NULL,
  `allocation_receipt_no` varchar(255) DEFAULT NULL,
  `requested_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_assets`
--

CREATE TABLE `company_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `asset_code` varchar(255) NOT NULL,
  `asset_name` varchar(255) NOT NULL,
  `asset_type` varchar(50) NOT NULL,
  `quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `allocated_quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `maintenance_quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `damaged_quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `retired_quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_no` varchar(100) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'available',
  `current_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `current_project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `current_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_messages`
--

CREATE TABLE `crm_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `installment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel` varchar(20) NOT NULL,
  `message_type` varchar(120) NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'queued',
  `error_message` varchar(500) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `gname` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `tazkira_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `current_area` varchar(255) DEFAULT NULL,
  `current_district` varchar(255) DEFAULT NULL,
  `current_province` varchar(255) DEFAULT NULL,
  `original_area` varchar(255) DEFAULT NULL,
  `original_district` varchar(255) DEFAULT NULL,
  `original_province` varchar(255) DEFAULT NULL,
  `representative_name` varchar(255) DEFAULT NULL,
  `representative_fname` varchar(255) DEFAULT NULL,
  `representative_gname` varchar(255) DEFAULT NULL,
  `representative_job_title` varchar(255) DEFAULT NULL,
  `representative_relationship` varchar(255) DEFAULT NULL,
  `representative_phone` varchar(255) DEFAULT NULL,
  `representative_tazkira_number` varchar(255) DEFAULT NULL,
  `representative_current_area` varchar(255) DEFAULT NULL,
  `representative_current_district` varchar(255) DEFAULT NULL,
  `representative_current_province` varchar(255) DEFAULT NULL,
  `representative_original_area` varchar(255) DEFAULT NULL,
  `representative_original_district` varchar(255) DEFAULT NULL,
  `representative_original_province` varchar(255) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `uuid`, `name`, `fname`, `gname`, `job_title`, `tazkira_number`, `phone`, `phone1`, `email`, `address`, `current_area`, `current_district`, `current_province`, `original_area`, `original_district`, `original_province`, `representative_name`, `representative_fname`, `representative_gname`, `representative_job_title`, `representative_relationship`, `representative_phone`, `representative_tazkira_number`, `representative_current_area`, `representative_current_district`, `representative_current_province`, `representative_original_area`, `representative_original_district`, `representative_original_province`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '5ab786f6-80d4-41d2-b809-bf2e03ab1fa3', 'ahmad', 'karim', 'khan', 'engineer', 'GH324322', '243223423', '2423423423', 'ahmad@gmail.com', 'this is some descriptio', 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-02 03:31:04', '2026-05-05 04:42:49', NULL),
(2, 'd0718d0c-43fd-482f-ad66-0b39a52b15c6', 'karim', 'khan', 'khan', 'engineer', '34234234', '23242423423', '23423423', 'karim@gmail.com', 'sdfsffsdfsdfsdffsdfsdfssdfsdfsdfsdfsdfdsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-02 03:31:06', '2026-05-05 04:30:07', '2026-05-05 04:30:07'),
(3, '834cf09c-d434-4be9-85de-c4dfb2859910', 'wahidullah', 'basir', 'khan', 'Engineering Design', 'GH32423432', '32423423', '324232323', 'wahidullah@gmail.com', 'This is some description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-02 04:04:54', '2026-05-04 22:48:41', '2026-05-04 22:48:41'),
(4, '7ace8702-faf5-49af-965e-047940f3e463', 'samims', 'eng', 'gf', 'enginerne', 'gh32h', '312312', '3223', 'samim@gmail.com', 'dfsdfsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-03 05:31:32', '2026-05-05 05:00:00', NULL),
(5, 'eef77079-7ba1-4449-8c36-512dd90f6bc4', 'wahid', 'khan', 'khan', 'engineer', 'rsghdfgh', '23234', '21312312321', 'wahid@gmail.com', 'sdfsdfsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-05 04:54:54', '2026-05-05 04:54:54', NULL),
(6, 'b471f55d-7a48-4155-873e-27d7e2dff75a', 'tasal', '3423423', 'khan', 'engineerin', 'gh123123', '3242342', 'd22423', 'tasal@gmail.com', 'this is some description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-05 23:05:47', '2026-05-05 23:05:47', NULL),
(7, 'da56d396-494d-4e28-a5c2-79c424c73bf6', 'ahmad shah', 'fahim', 'gull khan', 'Engeneeer', 'ghh', '3232332', '21123', 'ahmadshah@gmail.com', 'fsdfsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2026-05-06 05:43:42', '2026-05-06 05:43:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `document_type` varchar(60) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(1024) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `module`, `document_type`, `reference_id`, `file_path`, `expiry_date`, `created_at`) VALUES
(1, 'customer', 'customer_image', 7, 'documents/customers/TNz0jg6ECR7oU0kiygupXHg0lrObfCZmUpAhbf2p.png', NULL, '2026-05-06 05:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `module` varchar(40) NOT NULL,
  `code` varchar(80) NOT NULL,
  `label` varchar(120) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `uuid`, `module`, `code`, `label`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'c1932bba-c482-4669-b92f-50ed644b2735', 'accounts', 'general', 'General', 1, '2026-05-05 05:04:58', '2026-05-05 05:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `salary_type` varchar(255) DEFAULT NULL,
  `base_salary` varchar(255) DEFAULT NULL,
  `salary_currency_code` varchar(10) NOT NULL DEFAULT 'USD',
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `hire_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_histories`
--

CREATE TABLE `employee_salary_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `previous_salary` decimal(14,2) DEFAULT NULL,
  `previous_salary_currency_code` varchar(10) DEFAULT NULL,
  `new_salary` decimal(14,2) DEFAULT NULL,
  `new_salary_currency_code` varchar(10) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `changed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `source` varchar(50) NOT NULL DEFAULT 'manual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `base_currency` varchar(10) NOT NULL DEFAULT 'USD',
  `quote_currency` varchar(10) NOT NULL DEFAULT 'AFN',
  `rate` decimal(16,6) NOT NULL,
  `source` varchar(20) NOT NULL DEFAULT 'manual',
  `effective_date` date NOT NULL,
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `installment_no` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `due_date` date NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `installments`
--

INSERT INTO `installments` (`id`, `uuid`, `apartment_sale_id`, `installment_no`, `amount`, `due_date`, `paid_amount`, `paid_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '45d63790-17bc-4359-8685-512b0068bb0e', 1, 1, 7647.45, '2026-05-05', 0.00, NULL, 'pending', '2026-05-05 04:59:16', '2026-05-05 04:59:16'),
(2, '8c4058c4-59ec-4703-a9be-fdc9ae237510', 2, 1, 2550.00, '2026-05-05', 2550.00, '2026-05-05', 'paid', '2026-05-05 05:02:06', '2026-05-05 05:05:54'),
(3, 'd10d1952-c31c-43ae-ba08-b1a6ead1a0d9', 3, 1, 850.00, '2026-05-05', 850.00, '2026-05-05', 'paid', '2026-05-05 05:21:40', '2026-05-05 05:23:21'),
(4, '31b3b8f9-da48-41d9-8b56-4b71ebad94dc', 3, 2, 850.00, '2026-06-05', 850.00, '2026-05-05', 'paid', '2026-05-05 05:21:40', '2026-05-05 05:23:59'),
(5, '628cb452-d151-4b4c-b6df-ba30e1603a78', 3, 3, 850.00, '2026-07-05', 850.00, '2026-05-05', 'paid', '2026-05-05 05:21:40', '2026-05-05 05:23:51'),
(6, '4cd079f3-a4e5-47c9-9161-02e7c17c4126', 4, 1, 283.34, '2026-05-06', 0.00, NULL, 'pending', '2026-05-06 05:50:28', '2026-05-06 05:50:28'),
(7, '20ff93b0-fbea-4a32-9428-71fd05622832', 4, 2, 283.33, '2026-06-06', 0.00, NULL, 'pending', '2026-05-06 05:50:28', '2026-05-06 05:50:28'),
(8, '3af51d35-59e7-4cda-867e-909f5c2ce172', 4, 3, 283.33, '2026-07-06', 0.00, NULL, 'pending', '2026-05-06 05:50:28', '2026-05-06 05:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `installment_payments`
--

CREATE TABLE `installment_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `installment_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` varchar(30) NOT NULL DEFAULT 'cash',
  `reference_no` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `received_by` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_currency_code` varchar(10) DEFAULT NULL,
  `exchange_rate_snapshot` decimal(12,6) DEFAULT NULL,
  `account_amount` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `installment_payments`
--

INSERT INTO `installment_payments` (`id`, `uuid`, `installment_id`, `amount`, `payment_date`, `payment_method`, `reference_no`, `notes`, `received_by`, `account_id`, `account_transaction_id`, `payment_currency_code`, `exchange_rate_snapshot`, `account_amount`, `created_at`, `updated_at`) VALUES
(1, '5f4899c5-3171-42b6-8e51-97fedc06aa44', 2, 2550.00, '2026-05-05 10:35:54', 'cash', NULL, NULL, 33, 1, 1, 'USD', 1.000000, 2550.00, '2026-05-05 05:05:54', '2026-05-05 05:05:54'),
(2, '0c6a77a0-b52e-4d2f-aabf-c8a2654fe9ae', 3, 850.00, '2026-05-05 10:53:21', 'cash', NULL, NULL, 33, 1, 2, 'USD', 1.000000, 850.00, '2026-05-05 05:23:21', '2026-05-05 05:23:21'),
(3, 'bfafef10-7b3e-467a-8c5b-52b789c76a16', 5, 850.00, '2026-05-05 10:53:51', 'cash', NULL, NULL, 33, 1, 3, 'USD', 1.000000, 850.00, '2026-05-05 05:23:51', '2026-05-05 05:23:51'),
(4, 'f4e73988-d777-442f-bf99-40440c24e294', 4, 850.00, '2026-05-05 10:53:59', 'cash', NULL, NULL, 33, 1, 4, 'USD', 1.000000, 850.00, '2026-05-05 05:23:59', '2026-05-05 05:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` decimal(14,2) NOT NULL DEFAULT 0.00,
  `reference_unit_price` decimal(14,2) DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_no` varchar(100) DEFAULT NULL,
  `serial_no` varchar(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `min_stock_level` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_requests`
--

CREATE TABLE `material_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `request_no` varchar(255) NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `requested_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'pending',
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `issued_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `issued_at` timestamp NULL DEFAULT NULL,
  `issue_receipt_no` varchar(255) DEFAULT NULL,
  `requested_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_request_items`
--

CREATE TABLE `material_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `material_request_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_requested` decimal(14,2) NOT NULL,
  `quantity_approved` decimal(14,2) NOT NULL DEFAULT 0.00,
  `quantity_issued` decimal(14,2) NOT NULL DEFAULT 0.00,
  `quantity_returned` decimal(14,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(100) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(10, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 26),
(6, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 30),
(1, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35);

-- --------------------------------------------------------

--
-- Table structure for table `municipality_payment_letters`
--

CREATE TABLE `municipality_payment_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `letter_no` varchar(50) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `municipality_share_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `remaining_municipality` decimal(15,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `municipality_payment_letters`
--

INSERT INTO `municipality_payment_letters` (`id`, `uuid`, `apartment_sale_id`, `letter_no`, `issued_at`, `municipality_share_amount`, `remaining_municipality`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'f2e1f445-6c74-4e1e-a344-96c821c388c7', 2, 'MUN-SAL-000002', '2026-05-05 05:02:46', 450.00, 450.00, NULL, '2026-05-05 05:02:46', '2026-05-05 05:02:46'),
(2, '897f65c9-8a4d-4e36-9dcb-cfe47c246fa8', 3, 'MUN-SAL-000003', '2026-05-05 05:22:40', 450.00, 450.00, NULL, '2026-05-05 05:22:40', '2026-05-05 05:22:40'),
(3, '8029b9f7-6c64-4257-b023-fbc8c9ff8225', 1, 'MUN-SAL-000001', '2026-05-05 05:22:49', 1349.55, 1349.55, NULL, '2026-05-05 05:22:49', '2026-05-05 05:22:49'),
(4, '9c3fa659-16cb-4350-9aed-432e81f7973b', 4, 'MUN-SAL-000004', '2026-05-06 05:50:30', 150.00, 150.00, NULL, '2026-05-06 05:50:30', '2026-05-06 05:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `municipality_receipts`
--

CREATE TABLE `municipality_receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `apartment_sale_id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` varchar(30) NOT NULL DEFAULT 'cash',
  `notes` text DEFAULT NULL,
  `received_by` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_currency_code` varchar(10) DEFAULT NULL,
  `exchange_rate_snapshot` decimal(12,6) DEFAULT NULL,
  `account_amount` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('13c06a19-fc7f-42b6-a179-58d3b426b3e9', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 33, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000003\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\",\"customer_id\":1,\"customer_name\":\"ahmad\",\"apartment_id\":8,\"apartment_label\":\"A-440 - Unit 202\",\"net_price\":3000,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/b84d862b-54f9-4921-8e98-68e7f281f2ca\\/financial\",\"created_at\":\"2026-05-05T10:52:40.613113Z\"}', NULL, '2026-05-05 05:22:40', '2026-05-05 05:22:40'),
('3585fbc6-f7da-416a-8f92-fa066747c023', 'App\\Notifications\\SaleApprovedNotification', 'App\\Models\\User', 33, '{\"category\":\"sale_approved\",\"title\":\"Sale Approved: SAL-000003\",\"message\":\"Your apartment sale was approved by System Admin. You can continue the next workflow.\",\"sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\",\"customer_id\":1,\"customer_name\":\"ahmad\",\"apartment_id\":8,\"apartment_label\":\"A-440 - Unit 202\",\"net_price\":3000,\"approved_by_user_id\":32,\"approved_by_name\":\"System Admin\",\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/b84d862b-54f9-4921-8e98-68e7f281f2ca\\/financial\",\"approved_at\":\"2026-05-05T10:52:40.000000Z\"}', NULL, '2026-05-05 05:22:40', '2026-05-05 05:22:40'),
('37d479f7-b059-4c6f-aa79-ea2357258533', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 28, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000003\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"b84d862b-54f9-4921-8e98-68e7f281f2ca\",\"sale_id\":\"SAL-000003\",\"customer_id\":1,\"customer_name\":\"ahmad\",\"apartment_id\":8,\"apartment_label\":\"A-440 - Unit 202\",\"net_price\":3000,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/b84d862b-54f9-4921-8e98-68e7f281f2ca\\/financial\",\"created_at\":\"2026-05-05T10:52:40.537710Z\"}', NULL, '2026-05-05 05:22:40', '2026-05-05 05:22:40'),
('546541d7-2d95-49a2-9304-5a00429b5c5d', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 33, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000001\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"1f0157ec-081e-4811-a159-42dbb0393e19\",\"sale_id\":\"SAL-000001\",\"customer_id\":5,\"customer_name\":\"wahid\",\"apartment_id\":9,\"apartment_label\":\"GH22 - Unit 303\",\"net_price\":8997,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/1f0157ec-081e-4811-a159-42dbb0393e19\\/financial\",\"created_at\":\"2026-05-05T10:52:49.167752Z\"}', NULL, '2026-05-05 05:22:49', '2026-05-05 05:22:49'),
('9a75aeb7-ef9f-404d-b1fe-5a6b5244eabd', 'App\\Notifications\\SaleApprovedNotification', 'App\\Models\\User', 33, '{\"category\":\"sale_approved\",\"title\":\"Sale Approved: SAL-000002\",\"message\":\"Your apartment sale was approved by System Admin. You can continue the next workflow.\",\"sale_uuid\":\"6993b05a-6421-4ce7-a290-f31c38cc0ee4\",\"sale_id\":\"SAL-000002\",\"customer_id\":4,\"customer_name\":\"samims\",\"apartment_id\":10,\"apartment_label\":\"J-30 - Unit 3030\",\"net_price\":3000,\"approved_by_user_id\":32,\"approved_by_name\":\"System Admin\",\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/6993b05a-6421-4ce7-a290-f31c38cc0ee4\\/financial\",\"approved_at\":\"2026-05-05T10:32:46.000000Z\"}', '2026-05-05 05:03:00', '2026-05-05 05:02:46', '2026-05-05 05:03:00'),
('a60e9020-c4ec-4e67-9673-5f4755436267', 'App\\Notifications\\SaleApprovedNotification', 'App\\Models\\User', 30, '{\"category\":\"sale_approved\",\"title\":\"Sale Approved: SAL-000001\",\"message\":\"Your apartment sale was approved by System Admin. You can continue the next workflow.\",\"sale_uuid\":\"1f0157ec-081e-4811-a159-42dbb0393e19\",\"sale_id\":\"SAL-000001\",\"customer_id\":5,\"customer_name\":\"wahid\",\"apartment_id\":9,\"apartment_label\":\"GH22 - Unit 303\",\"net_price\":8997,\"approved_by_user_id\":32,\"approved_by_name\":\"System Admin\",\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/1f0157ec-081e-4811-a159-42dbb0393e19\\/financial\",\"approved_at\":\"2026-05-05T10:52:49.000000Z\"}', NULL, '2026-05-05 05:22:49', '2026-05-05 05:22:49'),
('b0477591-2bf8-4c0f-9e15-80fa5807cc97', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 33, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000002\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"6993b05a-6421-4ce7-a290-f31c38cc0ee4\",\"sale_id\":\"SAL-000002\",\"customer_id\":4,\"customer_name\":\"samims\",\"apartment_id\":10,\"apartment_label\":\"J-30 - Unit 3030\",\"net_price\":3000,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/6993b05a-6421-4ce7-a290-f31c38cc0ee4\\/financial\",\"created_at\":\"2026-05-05T10:32:46.196344Z\"}', NULL, '2026-05-05 05:02:46', '2026-05-05 05:02:46'),
('bb1106c6-e74b-46d0-92fc-b206e0840ac1', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 28, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000002\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"6993b05a-6421-4ce7-a290-f31c38cc0ee4\",\"sale_id\":\"SAL-000002\",\"customer_id\":4,\"customer_name\":\"samims\",\"apartment_id\":10,\"apartment_label\":\"J-30 - Unit 3030\",\"net_price\":3000,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/6993b05a-6421-4ce7-a290-f31c38cc0ee4\\/financial\",\"created_at\":\"2026-05-05T10:32:46.109266Z\"}', NULL, '2026-05-05 05:02:46', '2026-05-05 05:02:46'),
('ec22f211-42b2-4f65-a165-b40098f68332', 'App\\Notifications\\SaleCreatedFinanceNotification', 'App\\Models\\User', 28, '{\"category\":\"sale_created_finance\",\"title\":\"New Sale Created: SAL-000001\",\"message\":\"A new apartment sale was created and is ready for finance payment processing.\",\"sale_uuid\":\"1f0157ec-081e-4811-a159-42dbb0393e19\",\"sale_id\":\"SAL-000001\",\"customer_id\":5,\"customer_name\":\"wahid\",\"apartment_id\":9,\"apartment_label\":\"GH22 - Unit 303\",\"net_price\":8997,\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales\\/1f0157ec-081e-4811-a159-42dbb0393e19\\/financial\",\"created_at\":\"2026-05-05T10:52:49.091483Z\"}', NULL, '2026-05-05 05:22:49', '2026-05-05 05:22:49'),
('f7b5cc48-9fd7-4d2c-a6de-fa56e4ce6b4f', 'App\\Notifications\\SaleApprovalRequiredNotification', 'App\\Models\\User', 32, '{\"category\":\"sale_approval_required\",\"title\":\"Sale Approval Required: SAL-000004\",\"message\":\"A new apartment sale was created and is waiting for admin approval.\",\"sale_uuid\":\"7925687e-227b-4aa0-92db-f8c097713398\",\"sale_id\":\"SAL-000004\",\"customer_id\":7,\"customer_name\":\"ahmad shah\",\"apartment_id\":11,\"apartment_label\":\"GH32423 - Unit 30\",\"payment_type\":\"installment\",\"net_price\":1000,\"status\":\"pending\",\"action_url\":\"https:\\/\\/app.yaftom.com\\/apartment-sales?tab=pending-approval\",\"requested_at\":\"2026-05-06T11:20:29.206914Z\"}', '2026-05-31 22:40:12', '2026-05-06 05:50:29', '2026-05-31 22:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'apartments.view', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(2, 'apartments.create', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(3, 'apartments.update', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(4, 'customers.view', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(5, 'customers.create', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(6, 'customers.update', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(7, 'sales.create', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(8, 'sales.approve', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(9, 'sales.cancel', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(10, 'installments.pay', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(11, 'municipality.view', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(12, 'municipality.record_receipt', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(13, 'municipality.approve', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(14, 'inventory.request', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(15, 'inventory.approve', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(16, 'inventory.issue', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(17, 'vendors.manage', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(18, 'contracts.manage', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(19, 'payments.approve', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(20, 'payroll.view', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(21, 'payroll.pay', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(22, 'payroll.advance', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(23, 'payroll.approve', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(24, 'reports.view', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36'),
(25, 'users.view', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(26, 'users.create', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(27, 'users.update', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(28, 'roles.view', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(29, 'roles.create', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(30, 'roles.update', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(31, 'employees.view', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(32, 'employees.create', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(34, 'employees.update\r\n', 'web', '2026-03-03 01:41:53', '2026-03-03 01:41:53'),
(35, 'employees.update', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(36, 'projects.view', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(37, 'projects.create', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(38, 'projects.update', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(39, 'inventory_master.view', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(40, 'vendors.view', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(41, 'vendors.create', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(42, 'vendors.update', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(43, 'warehouses.view', 'web', '2026-03-29 05:11:40', '2026-03-29 05:11:40'),
(44, 'warehouses.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(45, 'warehouses.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(46, 'materials.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(47, 'materials.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(48, 'materials.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(49, 'company_assets.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(50, 'company_assets.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(51, 'company_assets.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(52, 'warehouse_stock.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(53, 'material_requests.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(54, 'material_requests.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(55, 'material_requests.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(56, 'purchase_requests.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(57, 'purchase_requests.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(58, 'purchase_requests.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(59, 'asset_requests.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(60, 'asset_requests.create', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(61, 'asset_requests.update', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(62, 'stock_movements.view', 'web', '2026-03-29 05:11:41', '2026-03-29 05:11:41'),
(63, 'accounts.view', 'web', '2026-04-05 02:06:54', '2026-04-05 02:06:54'),
(64, 'accounts.create', 'web', '2026-04-05 02:06:54', '2026-04-05 02:06:54'),
(65, 'accounts.update', 'web', '2026-04-05 02:06:54', '2026-04-05 02:06:54'),
(66, 'account_transactions.view', 'web', '2026-04-05 02:06:54', '2026-04-05 02:06:54'),
(67, 'exchange_rates.view', 'web', '2026-04-05 06:50:18', '2026-04-05 06:50:18'),
(68, 'exchange_rates.create', 'web', '2026-04-05 06:50:18', '2026-04-05 06:50:18'),
(69, 'exchange_rates.update', 'web', '2026-04-05 06:50:18', '2026-04-05 06:50:18'),
(70, 'material_requests.issue', 'web', '2026-04-14 04:43:14', '2026-04-14 04:43:14'),
(71, 'purchase_requests.finance', 'web', '2026-04-14 04:43:14', '2026-04-14 04:43:14'),
(72, 'purchase_requests.receive', 'web', '2026-04-14 04:43:14', '2026-04-14 04:43:14'),
(73, 'rentals.view', 'web', '2026-04-27 23:56:41', '2026-04-27 23:56:41'),
(74, 'rentals.create', 'web', '2026-04-27 23:56:41', '2026-04-27 23:56:41'),
(75, 'rentals.update', 'web', '2026-04-27 23:56:41', '2026-04-27 23:56:41'),
(76, 'rentals.approve', 'web', '2026-04-27 23:56:41', '2026-04-27 23:56:41'),
(77, 'rentals.close', 'web', '2026-04-27 23:56:41', '2026-04-27 23:56:41'),
(78, 'rental_payments.view', 'web', '2026-04-27 23:56:42', '2026-04-27 23:56:42'),
(79, 'rental_payments.process', 'web', '2026-04-27 23:56:42', '2026-04-27 23:56:42'),
(80, 'rental_payments.approve', 'web', '2026-04-27 23:56:42', '2026-04-27 23:56:42'),
(82, 'purchase_requests.approve', 'web', '2026-05-02 01:05:31', '2026-05-02 01:05:31'),
(83, 'asset_requests.approve', 'web', '2026-05-02 01:05:31', '2026-05-02 01:05:31'),
(84, 'asset_requests.issue', 'web', '2026-05-02 01:05:31', '2026-05-02 01:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(97, 'App\\Models\\User', 4, 'web', '5bb2267aaf20fc010cb8dee5a7c80d97b0c5729c26b0092957ca9f1a4a7ed964', '[\"*\"]', '2026-03-07 01:18:24', NULL, '2026-03-07 01:13:40', '2026-03-07 01:18:24'),
(320, 'App\\Models\\User', 3, 'web', '0f9fd8fc251ff1e2fdfc3b1638cd67ec8afefa0424d9c0278f473627de1b2b8e', '[\"*\"]', '2026-03-14 03:02:00', NULL, '2026-03-14 02:58:43', '2026-03-14 03:02:00'),
(347, 'App\\Models\\User', 13, 'web', '7b7b889b54c6f2159320a2f1be59f54762c4f9e6ded354211cd996a34879dc5b', '[\"*\"]', '2026-03-18 02:22:48', NULL, '2026-03-18 02:18:13', '2026-03-18 02:22:48'),
(359, 'App\\Models\\User', 17, 'web', '13d3d2cb8282681dcf2cef01ae56c0ff0174da3760cc1a1387e915970f83deab', '[\"*\"]', '2026-03-18 07:04:00', NULL, '2026-03-18 03:41:09', '2026-03-18 07:04:00'),
(443, 'App\\Models\\User', 2, 'web', 'b4ea076aac7a72c198d983f8f9183fcd45cfa35c09d3d05653d2c4eb590e8989', '[\"*\"]', '2026-04-07 03:00:50', NULL, '2026-04-07 03:00:38', '2026-04-07 03:00:50'),
(445, 'App\\Models\\User', 19, 'web', '1ad06b5187a00427d26a7a9349af1ff388225752b7a681fec77baf9a613ff767', '[\"*\"]', '2026-04-07 03:01:44', NULL, '2026-04-07 03:01:28', '2026-04-07 03:01:44'),
(453, 'App\\Models\\User', 18, 'web', '5cfd600dca9c71f7621f25586933c9b4f23d804a2358573c14690ed6e5d6476d', '[\"*\"]', '2026-04-08 04:20:43', NULL, '2026-04-07 04:18:31', '2026-04-08 04:20:43'),
(468, 'App\\Models\\User', 22, 'web', '8a7e3e455c514f2005dbba4c505b2bd53da07b944db34b2823497be08a8b6b95', '[\"*\"]', '2026-04-13 05:20:37', NULL, '2026-04-13 05:19:38', '2026-04-13 05:20:37'),
(471, 'App\\Models\\User', 23, 'web', '776fc96481eb136e91ab0f5936947ba57931a7753801e160b4fc2485183d7d36', '[\"*\"]', '2026-04-14 02:12:59', NULL, '2026-04-14 01:59:03', '2026-04-14 02:12:59'),
(473, 'App\\Models\\User', 24, 'web', '32989f69a3aba7f32dd04d87e31b3bc2df60610b4483a15b3b4b04d49f85f81b', '[\"*\"]', '2026-04-14 04:13:19', NULL, '2026-04-14 03:11:05', '2026-04-14 04:13:19'),
(498, 'App\\Models\\User', 29, 'web', 'aede70c41c7319eea82ea45f0263e928a8c42d1fc2241f65118e319979cdfa4d', '[\"*\"]', '2026-04-18 04:45:34', NULL, '2026-04-18 00:06:51', '2026-04-18 04:45:34'),
(763, 'App\\Models\\User', 32, 'web', '3fba59ce9ee9cc16d0ab222f0efeef81f3574c0acd53cbe5e69c1cb4d8f1b5c0', '[\"*\"]', '2026-06-02 04:53:44', NULL, '2026-06-02 04:45:08', '2026-06-02 04:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `project_manager_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'planned',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_employee_assignments`
--

CREATE TABLE `project_employee_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'active',
  `assigned_at` timestamp NULL DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_material_stocks`
--

CREATE TABLE `project_material_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty_issued` decimal(14,2) NOT NULL DEFAULT 0.00,
  `qty_consumed` decimal(14,2) NOT NULL DEFAULT 0.00,
  `qty_returned` decimal(14,2) NOT NULL DEFAULT 0.00,
  `qty_on_site` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requests`
--

CREATE TABLE `purchase_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `request_no` varchar(255) NOT NULL,
  `request_type` varchar(30) NOT NULL DEFAULT 'material',
  `source_material_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requested_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'pending',
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `received_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_processed_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `payment_processed_at` timestamp NULL DEFAULT NULL,
  `payment_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_account_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_amount` decimal(14,2) DEFAULT NULL,
  `payment_currency_code` varchar(10) DEFAULT NULL,
  `payment_exchange_rate_snapshot` decimal(18,6) DEFAULT NULL,
  `payment_account_amount` decimal(14,2) DEFAULT NULL,
  `payment_slip_no` varchar(255) DEFAULT NULL,
  `payment_notes` text DEFAULT NULL,
  `purchase_receipt_no` varchar(255) DEFAULT NULL,
  `requested_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request_items`
--

CREATE TABLE `purchase_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `item_kind` varchar(30) NOT NULL DEFAULT 'material',
  `material_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_asset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `asset_code_prefix` varchar(50) DEFAULT NULL,
  `quantity_requested` decimal(14,2) NOT NULL,
  `quantity_approved` decimal(14,2) NOT NULL DEFAULT 0.00,
  `quantity_received` decimal(14,2) NOT NULL DEFAULT 0.00,
  `estimated_unit_price` decimal(14,2) DEFAULT NULL,
  `estimated_line_total` decimal(14,2) DEFAULT NULL,
  `actual_unit_price` decimal(14,2) DEFAULT NULL,
  `actual_line_total` decimal(14,2) DEFAULT NULL,
  `unit` varchar(100) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_payments`
--

CREATE TABLE `rental_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `bill_generated_at` timestamp NULL DEFAULT NULL,
  `rental_id` bigint(20) UNSIGNED NOT NULL,
  `period_month` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL DEFAULT 'monthly',
  `amount_due` decimal(14,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(14,2) NOT NULL DEFAULT 0.00,
  `remaining_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `paid_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_payment_receipts`
--

CREATE TABLE `rental_payment_receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `rental_payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rental_id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receipt_no` varchar(255) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` decimal(14,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cash',
  `reference_no` varchar(255) DEFAULT NULL,
  `received_by` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_currency_code` varchar(10) DEFAULT NULL,
  `exchange_rate_snapshot` decimal(12,6) DEFAULT NULL,
  `account_amount` decimal(15,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `uuid` char(36) NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`uuid`, `id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
('4b18db9c-ef11-49d4-b6b7-8308ff06094f', 1, 'Admin', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('ad279ada-3611-4326-afd7-b3a4a1c3184f', 2, 'ApartmentManager', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('6e7e2ac3-b78b-4ac0-850e-2f4f0a2251e9', 3, 'SalesOfficer', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('c89ce0dc-6489-48a6-bea9-8e487fd2af59', 4, 'Accountant', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('83505bea-f6e6-44d5-a0d5-dff109d901f3', 5, 'ProjectManager', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('6fb88323-9a24-44f6-8399-364e78e3c15b', 6, 'Storekeeper', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('dc814f65-7272-4c86-bd3a-89cece8a72bc', 7, 'ProcurementOfficer', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('589c935d-f12c-4801-8a53-3ad6703c743c', 8, 'Auditor', 'web', '2026-02-28 02:40:36', '2026-02-28 02:40:36', NULL),
('ce3adf7b-b454-4916-96d5-abc1aff4127d', 9, 'Customer', 'web', '2026-04-13 00:26:41', '2026-04-13 00:26:41', NULL),
('9045cc8b-c40a-40e2-97f9-dcd6628eade3', 10, 'Warehouse Manager', 'web', '2026-04-14 02:09:57', '2026-04-14 02:16:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(82, 1),
(83, 1),
(84, 1),
(1, 2),
(4, 2),
(63, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(7, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(63, 3),
(67, 3),
(73, 3),
(78, 4),
(79, 4),
(80, 4),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(18, 10),
(19, 10),
(43, 10),
(44, 10),
(45, 10),
(46, 10),
(47, 10),
(48, 10),
(49, 10),
(50, 10),
(51, 10),
(52, 10),
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(58, 10),
(59, 10),
(60, 10),
(61, 10),
(62, 10),
(70, 10),
(72, 10),
(82, 10),
(83, 10),
(84, 10);

-- --------------------------------------------------------

--
-- Table structure for table `salary_advances`
--

CREATE TABLE `salary_advances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `currency_code` varchar(10) NOT NULL DEFAULT 'USD',
  `deducted_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `remaining_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_advance_deductions`
--

CREATE TABLE `salary_advance_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `salary_payment_id` bigint(20) UNSIGNED NOT NULL,
  `salary_advance_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_payments`
--

CREATE TABLE `salary_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `period` varchar(100) NOT NULL,
  `gross_salary` decimal(14,2) NOT NULL,
  `gross_salary_usd` decimal(14,2) DEFAULT NULL,
  `salary_currency_code` varchar(10) NOT NULL DEFAULT 'USD',
  `salary_exchange_rate_snapshot` decimal(14,6) DEFAULT NULL,
  `advance_deducted` decimal(14,2) NOT NULL DEFAULT 0.00,
  `advance_deducted_usd` decimal(14,2) DEFAULT NULL,
  `tax_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `tax_deducted` decimal(14,2) NOT NULL DEFAULT 0.00,
  `tax_deducted_usd` decimal(14,2) DEFAULT NULL,
  `other_deductions` decimal(14,2) NOT NULL DEFAULT 0.00,
  `other_deductions_usd` decimal(14,2) DEFAULT NULL,
  `net_salary` decimal(14,2) NOT NULL,
  `net_salary_usd` decimal(14,2) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_currency_code` varchar(10) DEFAULT NULL,
  `exchange_rate_snapshot` decimal(16,6) DEFAULT NULL,
  `net_salary_account_amount` decimal(14,2) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8D92gwruCj86SEcKL6WKBOVyK0At7E6xKlHjrrcs', NULL, '3.18.186.238', 'visionheight.com/scan Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak9PRFRDR3hOb1VIUjRWY2JTbEVxV09qUHBoc2NOM0RpY1dORVk2QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vYXBpLnlhZnRvbS5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1780322937),
('gETcVaD5PuZdAdA1VoC6RKX4T1erpnFw5mczLNz3', NULL, '176.65.139.234', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm9aNmMyY05PWkkzNWs4Z29DakpodGFKWmFlVFM5QTdTdkdEaFIyVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vYXBpLnlhZnRvbS5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1780371927);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `material_request_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `movement_type` varchar(50) NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `issued_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `movement_date` datetime NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_inbox`
--

CREATE TABLE `sync_inbox` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `idempotency_key` varchar(255) NOT NULL,
  `entity` varchar(255) NOT NULL,
  `entity_uuid` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sync_inbox`
--

INSERT INTO `sync_inbox` (`id`, `user_id`, `idempotency_key`, `entity`, `entity_uuid`, `action`, `processed_at`, `created_at`, `updated_at`) VALUES
(1, 32, '72e99cee-d74a-419c-a7a8-4257a050d7b8', 'customers', '5ab786f6-80d4-41d2-b809-bf2e03ab1fa3', 'create', '2026-05-02 03:31:04', '2026-05-02 03:31:04', '2026-05-02 03:31:04'),
(2, 32, '37c84d7e-95d7-42e6-9970-2609f1495454', 'customers', 'd0718d0c-43fd-482f-ad66-0b39a52b15c6', 'create', '2026-05-02 03:31:06', '2026-05-02 03:31:06', '2026-05-02 03:31:06'),
(3, 32, '8deb2b9c-fc58-4e05-9832-b33a40ec3f01', 'apartments', '1a447366-6172-4660-b3fe-f736537c44ed', 'create', '2026-05-02 03:31:07', '2026-05-02 03:31:07', '2026-05-02 03:31:07'),
(4, 32, '35070911-6d8d-49dc-9e86-08d27e042d35', 'apartments', 'e9e71297-717f-4b42-ac4c-fe4aa592acaa', 'create', '2026-05-02 03:31:08', '2026-05-02 03:31:08', '2026-05-02 03:31:08'),
(5, 33, '9cb9505f-4faa-4d90-aa96-dc3ef8338a88', 'customers', '5ab786f6-80d4-41d2-b809-bf2e03ab1fa3', 'delete', '2026-05-02 03:41:29', '2026-05-02 03:41:29', '2026-05-02 03:41:29'),
(6, 33, '48105603-18c6-429a-b376-d63076fed325', 'customers', 'd0718d0c-43fd-482f-ad66-0b39a52b15c6', 'delete', '2026-05-02 03:41:29', '2026-05-02 03:41:29', '2026-05-02 03:41:29'),
(7, 33, 'd3b260e3-7dee-47eb-b943-02eafbace7fa', 'apartments', 'e9e71297-717f-4b42-ac4c-fe4aa592acaa', 'delete', '2026-05-02 03:41:30', '2026-05-02 03:41:30', '2026-05-02 03:41:30'),
(8, 33, 'ca6170b4-84e2-459b-84e8-b80ba7449df3', 'apartments', '1a447366-6172-4660-b3fe-f736537c44ed', 'delete', '2026-05-02 03:41:31', '2026-05-02 03:41:31', '2026-05-02 03:41:31'),
(9, 32, 'babcd4e8-bdb1-4291-9870-e9172a3c7ab7', 'customers', 'de73c8e1-4b1c-4d50-aa75-c20a290292c6', 'create', '2026-05-02 04:04:52', '2026-05-02 04:04:52', '2026-05-02 04:04:52'),
(10, 32, '62b16f05-b66e-48f8-9276-4e23af0dc77a', 'customers', '6f147baa-4363-4fb2-8e26-e791bec44eba', 'create', '2026-05-02 04:04:53', '2026-05-02 04:04:53', '2026-05-02 04:04:53'),
(11, 32, 'ce6b2ed0-bf41-4357-a120-73a5f5f796d0', 'customers', '834cf09c-d434-4be9-85de-c4dfb2859910', 'create', '2026-05-02 04:04:54', '2026-05-02 04:04:54', '2026-05-02 04:04:54'),
(12, 32, '3fa97197-2f57-444c-8ef4-51baf42eafe1', 'apartments', 'c84b8b5d-9507-44f6-b04d-7746faec1cf2', 'create', '2026-05-02 04:04:55', '2026-05-02 04:04:55', '2026-05-02 04:04:55'),
(13, 32, '98b29c4c-20af-4914-8193-9e62cb2a212d', 'apartments', 'fcc1fae1-4978-4be1-8d05-48c0424c65cb', 'create', '2026-05-02 04:04:56', '2026-05-02 04:04:56', '2026-05-02 04:04:56'),
(14, 32, '2cde9524-4726-4afe-83dd-eaeae8151045', 'users', '63c70602-806c-4bb7-9606-c1e7011b6bf2', 'create', '2026-05-03 04:36:49', '2026-05-03 04:36:49', '2026-05-03 04:36:49'),
(15, 32, 'abb72219-21d6-4d66-a775-77ff55fcb3c7', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-03 04:48:02', '2026-05-03 04:48:02', '2026-05-03 04:48:02'),
(16, 32, '3e2631fc-539d-438d-95d6-08b811303e51', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-03 04:51:00', '2026-05-03 04:51:00', '2026-05-03 04:51:00'),
(17, 32, '7066aa7c-96e5-4634-a6a4-4860bd7bd6f1', 'customers', '7ace8702-faf5-49af-965e-047940f3e463', 'create', '2026-05-03 05:31:33', '2026-05-03 05:31:33', '2026-05-03 05:31:33'),
(18, 32, 'e26d3199-1462-444b-ab91-a1ad8339e28b', 'customers', '5ab786f6-80d4-41d2-b809-bf2e03ab1fa3', 'delete', '2026-05-04 22:48:33', '2026-05-04 22:48:33', '2026-05-04 22:48:33'),
(19, 32, 'c5922f39-0fae-4db9-a539-c1076808d62a', 'customers', 'd0718d0c-43fd-482f-ad66-0b39a52b15c6', 'delete', '2026-05-04 22:48:38', '2026-05-04 22:48:38', '2026-05-04 22:48:38'),
(20, 32, 'd30cf368-7598-4c4d-8e06-9bce1e0e0fdf', 'customers', '834cf09c-d434-4be9-85de-c4dfb2859910', 'delete', '2026-05-04 22:48:41', '2026-05-04 22:48:41', '2026-05-04 22:48:41'),
(21, 32, 'e2d4eebd-4043-49a3-bef2-f361e6257027', 'customers', '7ace8702-faf5-49af-965e-047940f3e463', 'delete', '2026-05-04 22:48:45', '2026-05-04 22:48:45', '2026-05-04 22:48:45'),
(22, 32, '82c87056-ffed-4338-9d38-49ea6d37bbb3', 'apartments', 'c84b8b5d-9507-44f6-b04d-7746faec1cf2', 'delete', '2026-05-04 22:48:52', '2026-05-04 22:48:52', '2026-05-04 22:48:52'),
(23, 32, 'c4cc8d40-03ca-4b58-b283-82a72954fbe4', 'apartments', 'fcc1fae1-4978-4be1-8d05-48c0424c65cb', 'delete', '2026-05-04 22:48:56', '2026-05-04 22:48:56', '2026-05-04 22:48:56'),
(24, 32, 'a21c58a3-fa34-4f2e-aeeb-bebaa4cea2af', 'apartments', 'c42ae3fa-8afd-4dd0-b1a8-249c1d9492a8', 'delete', '2026-05-04 22:48:59', '2026-05-04 22:48:59', '2026-05-04 22:48:59'),
(25, 32, '109d3302-5c90-465c-b9a7-3331ffce8e37', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-04 23:26:33', '2026-05-04 23:26:33', '2026-05-04 23:26:33'),
(26, 32, '015ee8ea-5d08-4605-8dd1-e132f5e03693', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-05 01:47:03', '2026-05-05 01:47:03', '2026-05-05 01:47:03'),
(27, 32, '941cb57f-d8be-4eab-86e0-e8823f74e093', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-05 01:56:15', '2026-05-05 01:56:15', '2026-05-05 01:56:15'),
(28, 32, '607e3b0f-9e9b-4370-99f3-09cb0fd0ca44', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-05 01:57:04', '2026-05-05 01:57:04', '2026-05-05 01:57:04'),
(29, 32, '26a64602-88f8-4ed2-b8a8-dd91c902a579', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-05 01:59:29', '2026-05-05 01:59:29', '2026-05-05 01:59:29'),
(30, 32, '60364513-45e2-4a54-beed-53fa55c1a100', 'roles', 'ad279ada-3611-4326-afd7-b3a4a1c3184f', 'update', '2026-05-05 03:37:47', '2026-05-05 03:37:47', '2026-05-05 03:37:47'),
(31, 32, '366d918f-02de-4d85-82f6-ce7e94acbb1a', 'customers', '1d867080-fae4-4200-aba9-7d78e878ce89', 'create', '2026-05-05 03:44:04', '2026-05-05 03:44:04', '2026-05-05 03:44:04'),
(32, 32, 'afbeec78-d355-4f61-b77f-996b74464d23', 'apartments', '33c12034-1b5c-4f6b-a462-3f0784ea5c15', 'create', '2026-05-05 03:44:05', '2026-05-05 03:44:05', '2026-05-05 03:44:05'),
(33, 32, '8ab5273d-5a50-41b0-9c2e-3096cc793875', 'customers', '07bb32fe-7e4a-4549-b644-8be9124e05b1', 'create', '2026-05-05 04:01:44', '2026-05-05 04:01:44', '2026-05-05 04:01:44'),
(34, 32, 'c614b492-7f07-4da7-b615-e361360bb9fd', 'apartments', '92db0cb1-a937-43a8-a6cf-2c1369bec106', 'create', '2026-05-05 04:01:45', '2026-05-05 04:01:45', '2026-05-05 04:01:45'),
(35, 32, '5e56d7d4-4905-46ec-9c0a-4afc7c3774e2', 'apartment_sales', '9f4a57cd-5611-4c99-97fd-16c5e24febb5', 'delete', '2026-05-05 04:29:57', '2026-05-05 04:29:57', '2026-05-05 04:29:57'),
(36, 32, 'caac2120-955d-4e4c-8d61-98bdf2742667', 'customers', 'd0718d0c-43fd-482f-ad66-0b39a52b15c6', 'delete', '2026-05-05 04:30:07', '2026-05-05 04:30:07', '2026-05-05 04:30:07'),
(37, 32, '14067a17-b4c9-488c-b1fc-4db94395820c', 'customers', '07bb32fe-7e4a-4549-b644-8be9124e05b1', 'delete', '2026-05-05 04:30:11', '2026-05-05 04:30:11', '2026-05-05 04:30:11'),
(38, 32, '1697f626-f0bd-4fed-9744-590b5c9b70de', 'customers', '5ab786f6-80d4-41d2-b809-bf2e03ab1fa3', 'delete', '2026-05-05 04:30:14', '2026-05-05 04:30:14', '2026-05-05 04:30:14'),
(39, 32, '254ed76a-0445-4b33-9a31-eb757ed222e8', 'apartments', '92db0cb1-a937-43a8-a6cf-2c1369bec106', 'delete', '2026-05-05 04:30:19', '2026-05-05 04:30:19', '2026-05-05 04:30:19'),
(40, 32, '583be839-f3c4-4dd4-a6e9-d64a44b5d0f1', 'apartments', '33c12034-1b5c-4f6b-a462-3f0784ea5c15', 'delete', '2026-05-05 04:30:23', '2026-05-05 04:30:23', '2026-05-05 04:30:23'),
(41, 33, '6f05c60a-9077-4e23-9fc0-695291aee292', 'customers', '71939d37-b464-4fa0-97c8-3bef2b0f3e66', 'create', '2026-05-05 04:42:49', '2026-05-05 04:42:49', '2026-05-05 04:42:49'),
(42, 33, 'de87a6cc-afb2-4f48-8304-96e81e620b20', 'apartments', 'f1f0b442-8764-4282-a119-02750789d55b', 'create', '2026-05-05 04:42:50', '2026-05-05 04:42:50', '2026-05-05 04:42:50'),
(43, 30, 'd8e6b51c-d151-43d5-b5a4-9bef2ca24e80', 'customers', '71939d37-b464-4fa0-97c8-3bef2b0f3e66', 'delete', '2026-05-05 04:54:30', '2026-05-05 04:54:30', '2026-05-05 04:54:30'),
(44, 30, 'e2271487-1c56-427b-9f3b-0243b4f7a887', 'apartment_sales', '1f0157ec-081e-4811-a159-42dbb0393e19', 'create', '2026-05-05 04:59:17', '2026-05-05 04:59:17', '2026-05-05 04:59:17'),
(45, 32, '228f9a5a-45de-434c-85e7-1633b7899604', 'customers', 'b471f55d-7a48-4155-873e-27d7e2dff75a', 'create', '2026-05-05 23:05:47', '2026-05-05 23:05:47', '2026-05-05 23:05:47'),
(46, 32, '0b761e31-6d65-4303-92bd-b6f2a5d5fada', 'apartments', 'b8363e7c-ed3e-4ff4-8539-28932bf3e31b', 'create', '2026-05-05 23:05:48', '2026-05-05 23:05:48', '2026-05-05 23:05:48'),
(47, 32, '7c2f101b-3ea6-4eed-b481-afd27ddc8c3e', 'customers', 'da56d396-494d-4e28-a5c2-79c424c73bf6', 'create', '2026-05-06 05:43:42', '2026-05-06 05:43:42', '2026-05-06 05:43:42'),
(48, 32, '39643db1-d881-455e-8322-5dcacb9293a3', 'apartments', '7f4bdd6a-977d-4245-ad4e-4b90ec3de204', 'create', '2026-05-06 05:43:44', '2026-05-06 05:43:44', '2026-05-06 05:43:44'),
(49, 32, '9e670167-6732-4a79-afa1-24acda792dba', 'apartment_sales', '7925687e-227b-4aa0-92db-f8c097713398', 'create', '2026-05-06 05:50:29', '2026-05-06 05:50:29', '2026-05-06 05:50:29'),
(50, 32, '04a542be-af92-4ec5-889b-521c8de9c50f', 'apartment_sale_workflows', '9d3c6abb-ffa9-4cf0-aa90-71d1d805e57d', 'create', '2026-05-06 05:50:30', '2026-05-06 05:50:30', '2026-05-06 05:50:30'),
(51, 32, 'a62923f2-1dfd-4aec-bdb1-73628848d9c3', 'apartment_sale_workflows', '1f32ca40-df42-4ebd-87d3-3c2607f73ac9', 'create', '2026-05-06 05:57:35', '2026-05-06 05:57:35', '2026-05-06 05:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`value`)),
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `full_name`, `name`, `email`, `phone`, `customer_id`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `last_login_at`, `deleted_at`) VALUES
(1, '290225db-0f79-49dd-9bb2-8e4fea19eb65', 'System Admin', 'System Admin', 'admin@gmail.com', '000000000', NULL, NULL, '$2y$12$x0Eq0HojHz.GfTf/FQRHUum0Zbj9oPL4I7pr0QFYXPxzGfAnmSpDq', 'active', NULL, '2026-02-27 21:10:37', '2026-05-03 04:56:59', '2026-05-03 04:56:59', NULL),
(2, '5af1f3dc-8e6c-449d-b3cc-53da45479951', 'ahmad', 'ahmad', 'ahmad@gmail.com', NULL, NULL, NULL, '$2y$12$piIuCQYHqacfJfhPb0PUA.KlDBu4lIbskX7/hcmWcnFSLZVU8h4dG', 'active', NULL, '2026-03-02 19:23:18', '2026-04-13 21:38:59', '2026-04-06 21:30:38', '2026-04-13 21:38:59'),
(3, 'ad821e3b-2a90-4213-86b0-3b28c5eb6924', 'tahir', 'tahir', 'tahir@gmail.com', NULL, NULL, NULL, '$2y$12$qQrL31Z3kh5UXlaa0zLtnO5DoTGwi93OaL4mA1Wv9bx6sm92kV6ju', 'active', NULL, '2026-03-06 18:41:52', '2026-03-17 00:13:33', '2026-03-13 21:28:43', '2026-03-17 00:13:33'),
(12, 'faf2c756-de04-4e8d-a145-adba997e3e9c', 'shams', 'shams', 'shams@gmail.com', NULL, NULL, NULL, '$2y$12$HrrKeB0cPJCobm8v1y168eegIVec//hFgvONWmsHFZly.6U/u0ike', 'active', NULL, '2026-03-13 21:47:24', '2026-05-02 01:46:58', '2026-05-02 01:46:58', NULL),
(17, '548663d5-8770-4617-b458-72e17e31f364', 'example', 'example', 'example@gmail.com', NULL, NULL, NULL, '$2y$12$mo/pPHymcIpfE1QUrh8LvulUPuyS.CbJSGA2LnfJV2V7urTnMWIKG', 'active', NULL, '2026-03-17 21:40:12', '2026-03-28 21:02:52', '2026-03-17 22:11:09', '2026-03-28 21:02:52'),
(18, '71c1b326-6226-48be-b08b-40906de01ad2', 'example55', 'example55', 'example55@gmail.com', NULL, NULL, NULL, '$2y$12$IOWBnuubGDyT9v1VcTAMvOONJDC2GWXhE3K76S2E/ST5qL3MCaoJS', 'active', NULL, '2026-03-29 20:57:34', '2026-04-13 21:39:09', '2026-04-06 22:48:31', '2026-04-13 21:39:09'),
(19, '78b9969c-3cdf-422f-b043-c11d6bdf7884', 'karim', 'karim', 'karim@gmail.com', NULL, NULL, NULL, '$2y$12$LgMThOyzKSOdPswQhqYGXeZowtyV16/qQvX.O8u5fj6Pz0sjxzfHm', 'active', NULL, '2026-04-01 00:11:28', '2026-04-13 21:39:04', '2026-04-06 21:31:28', '2026-04-13 21:39:04'),
(20, '38ba72f6-dce6-49b4-9858-94aeda4aa35d', 'example1', 'example1', 'example1@gmail.com', NULL, NULL, NULL, '$2y$12$VC.RatRAS6IIhRhxWuxyWOisKQfT97GFjMSSJ6TlWUquQe14RSoPG', 'active', NULL, '2026-04-01 22:31:21', '2026-04-13 21:39:01', NULL, '2026-04-13 21:39:01'),
(21, 'd6c4ffb9-7b9a-4342-a91d-96978e28743f', 'example123', 'example123', 'example123@gmail.com', NULL, NULL, NULL, '$2y$12$3WESJdtpZJJtwAJBXemyf.K51TPpR2i0bGtwfAUwXLUzGVTc5bNXu', 'active', NULL, '2026-04-02 00:30:01', '2026-04-13 21:38:54', NULL, '2026-04-13 21:38:54'),
(22, 'b284894b-7b8d-429d-9b32-58dd175d732a', 'customer', 'customer', 'customer@gmail.com', NULL, 1, NULL, '$2y$12$Op875R7G.uK.ob2xj12Gu.Bn5FTw2YnSqsSlDM8snJYVITjx68Rbe', 'active', NULL, '2026-04-12 20:11:59', '2026-04-13 23:50:49', '2026-04-12 23:49:38', '2026-04-13 23:50:49'),
(23, '5e683e80-f50e-4f58-aa96-056cd170db94', 'finance', 'finance', 'finance@gmail.com', NULL, NULL, NULL, '$2y$12$TnnDA24Kl3rSLs4M6jCVEORS5YPvhFyOy1wJQCpuN/p.1OGzEKOCW', 'active', NULL, '2026-04-13 20:28:21', '2026-04-13 23:50:43', '2026-04-13 20:29:03', '2026-04-13 23:50:43'),
(24, '4d1099c2-e62b-48e2-abb1-67ac1e87e2d9', 'manager', 'manager', 'projectmanager@gmail.com', NULL, NULL, NULL, '$2y$12$cbeNkp6Y1tT83.GJuTLXmOEn.z2dfpwpDSQLt11DIi/2KQ4ovdFRu', 'active', NULL, '2026-04-13 21:40:33', '2026-04-13 23:50:53', '2026-04-13 21:41:05', '2026-04-13 23:50:53'),
(25, '57a07293-7c12-4500-87c1-cb9149257518', 'Workflow Admin', 'Workflow Admin', 'workflow.admin@example.com', NULL, NULL, NULL, '$2y$12$3pCvM4D5l1B3Vrd0Ov6Zn.VbZKCShHOXQkCZQby/L6XE9frflILBa', 'active', NULL, '2026-04-13 23:13:15', '2026-05-02 00:36:54', '2026-05-02 00:36:54', NULL),
(26, 'dd87ef0c-bbbc-462a-bf92-d4676ff6a077', 'Workflow Project Manager', 'Workflow Project Manager', 'workflow.pm@example.com', NULL, NULL, NULL, '$2y$12$6LlU4KO9lprIwT/uU19QTuS9rYTqux2eAIr8zQA3KknpavCXVCqjC', 'active', NULL, '2026-04-13 23:13:15', '2026-05-02 01:26:29', '2026-05-02 01:26:29', NULL),
(27, '9a0f1192-83c1-4692-8dce-3cc872ac7cbd', 'Workflow Storekeeper', 'Workflow Storekeeper', 'workflow.storekeeper@example.com', NULL, NULL, NULL, '$2y$12$emFAqGmISvPom.aZitgP4.7Wq.ju1yBXy5.IyLlNK2VmTx46idYmu', 'active', NULL, '2026-04-13 23:13:16', '2026-05-02 01:33:27', '2026-05-02 01:33:27', NULL),
(28, '6678238a-bd14-44ea-abcc-52c98c26aca3', 'Workflow Accountant', 'Workflow Accountant', 'workflow.finance@example.com', NULL, NULL, NULL, '$2y$12$DmQmsoWY9lc8xDVu7cpQKuDBRgR4wzr7yFUuH2DyTAzTc5SZgfJgm', 'active', NULL, '2026-04-13 23:13:16', '2026-04-17 18:37:56', '2026-04-17 18:37:56', NULL),
(29, 'a1e68fce-bcbe-4c3e-8af6-f5e9846918fd', 'worflow apartment', 'worflow apartment', 'apartmanager@gamil.com', NULL, NULL, NULL, '$2y$12$awvPmRWnGbjZ7/oAvWDEIuyUMuPe8EbqAWA20wCJ/sPjW71SCfQNe', 'active', NULL, '2026-04-15 22:55:46', '2026-04-17 18:36:51', '2026-04-17 18:36:51', NULL),
(30, 'c7773fdb-2d91-47c8-859c-def840ece922', 'workflow', 'workflow', 'workflow.apartmentmanager@gmail.com', NULL, NULL, NULL, '$2y$12$y72q1YBOPM0eg6zpssuzhO4baLv.tPHdDQ03d941TLS8lLYnyFduK', 'active', NULL, '2026-04-18 20:26:20', '2026-05-06 05:34:02', '2026-05-06 05:34:02', NULL),
(31, '13723096-def2-449f-90d4-8aed59d391ea', 'ABC', 'ABC', 'abc@gmail.com', NULL, NULL, NULL, '$2y$12$ilWWDAiWdGlfE7KCtTviTeGvraBkGCy887imkU/n..I1DjkNb4OPG', 'active', NULL, '2026-04-19 19:27:29', '2026-04-26 21:34:32', NULL, '2026-04-26 21:34:32'),
(32, '7a0cc4d1-2fcd-4bf7-b95f-15186850fe30', 'System Admin', 'System Admin', 'admin@example.com', NULL, NULL, NULL, '$2y$12$BqlupJb2aj/L.lwGtzbn3.skI.FwkvNulfKPS.CUtv2UOntWDwApq', 'active', NULL, '2026-04-26 21:16:48', '2026-06-02 04:45:08', '2026-06-02 04:45:08', NULL),
(33, 'f92483d4-a6a7-438f-bc69-a98fa4c48a17', 'seller', 'seller', 'sellerr@gmail.com', NULL, NULL, NULL, '$2y$12$Q9rEs7wv8utcOOFFN5Co.eQ4dx3NUHYjuRpE2GlxBmmwJgozPLiTS', 'active', NULL, '2026-04-26 21:35:19', '2026-05-06 05:34:47', '2026-05-06 05:34:47', NULL),
(34, '63c70602-806c-4bb7-9606-c1e7011b6bf2', 'ap', 'ap', 'ap@gmail.com', NULL, NULL, NULL, '$2y$12$UVfZe275BbXP..mM1ToJX.DrECLXMjVeF1NESc0ztTjyI/3k0cVF.', 'active', NULL, '2026-05-03 04:36:48', '2026-05-03 04:46:09', '2026-05-03 04:46:09', NULL),
(35, '0e2c371b-5e4a-42c7-95b5-50b074cd3d08', 'basir', 'basir', 'basir@gmail.com', NULL, NULL, NULL, '$2y$12$iA2tu3FpHyOGFqsdYtTf..cPun3wh1k.lPcBtiseY1EUGyIEqXMnu', 'active', NULL, '2026-05-05 01:52:05', '2026-05-05 01:53:10', '2026-05-05 01:53:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_material_stocks`
--

CREATE TABLE `warehouse_material_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty_on_hand` decimal(14,2) NOT NULL DEFAULT 0.00,
  `qty_reserved` decimal(14,2) NOT NULL DEFAULT 0.00,
  `qty_available` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `accounts_name_unique` (`name`),
  ADD KEY `accounts_account_type_status_index` (`account_type`,`status`),
  ADD KEY `accounts_updated_at_index` (`updated_at`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_transactions_uuid_unique` (`uuid`),
  ADD KEY `account_transactions_created_by_user_id_foreign` (`created_by_user_id`),
  ADD KEY `account_transactions_reversal_of_id_foreign` (`reversal_of_id`),
  ADD KEY `account_transactions_account_id_transaction_date_index` (`account_id`,`transaction_date`),
  ADD KEY `account_transactions_reference_type_reference_uuid_index` (`reference_type`,`reference_uuid`),
  ADD KEY `account_transactions_module_status_index` (`module`,`status`),
  ADD KEY `account_transactions_updated_at_index` (`updated_at`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartments_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apartments_apartment_code_unique` (`apartment_code`);

--
-- Indexes for table `apartment_qr_access_tokens`
--
ALTER TABLE `apartment_qr_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_qr_access_tokens_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apartment_qr_access_tokens_apartment_id_unique` (`apartment_id`),
  ADD UNIQUE KEY `apartment_qr_access_tokens_token_unique` (`token`),
  ADD KEY `apartment_qr_access_tokens_created_by_user_id_foreign` (`created_by_user_id`);

--
-- Indexes for table `apartment_qr_scan_logs`
--
ALTER TABLE `apartment_qr_scan_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_qr_scan_logs_uuid_unique` (`uuid`),
  ADD KEY `apartment_qr_scan_logs_apartment_qr_access_token_id_foreign` (`apartment_qr_access_token_id`),
  ADD KEY `apartment_qr_scan_logs_apartment_id_foreign` (`apartment_id`),
  ADD KEY `apartment_qr_scan_logs_apartment_sale_id_foreign` (`apartment_sale_id`),
  ADD KEY `apartment_qr_scan_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `apartment_rentals`
--
ALTER TABLE `apartment_rentals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_rentals_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apartment_rentals_rental_id_unique` (`rental_id`),
  ADD KEY `apartment_rentals_created_by_foreign` (`created_by`),
  ADD KEY `apartment_rentals_key_handover_by_foreign` (`key_handover_by`),
  ADD KEY `apartment_rentals_key_returned_by_foreign` (`key_returned_by`),
  ADD KEY `apartment_rentals_apartment_id_status_index` (`apartment_id`,`status`),
  ADD KEY `apartment_rentals_tenant_id_status_index` (`tenant_id`,`status`),
  ADD KEY `apartment_rentals_status_next_due_date_index` (`status`,`next_due_date`);

--
-- Indexes for table `apartment_sales`
--
ALTER TABLE `apartment_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_sales_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apartment_sales_sale_id_unique` (`sale_id`),
  ADD KEY `apartment_sales_apartment_id_foreign` (`apartment_id`),
  ADD KEY `apartment_sales_customer_id_foreign` (`customer_id`),
  ADD KEY `apartment_sales_deed_issued_by_foreign` (`deed_issued_by`),
  ADD KEY `apartment_sales_user_id_foreign` (`user_id`),
  ADD KEY `apartment_sales_key_handover_by_foreign` (`key_handover_by`),
  ADD KEY `apartment_sales_key_returned_by_foreign` (`key_returned_by`);

--
-- Indexes for table `apartment_sale_financials`
--
ALTER TABLE `apartment_sale_financials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_sale_financials_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apartment_sale_financials_apartment_sale_id_unique` (`apartment_sale_id`);

--
-- Indexes for table `apartment_sale_possession_logs`
--
ALTER TABLE `apartment_sale_possession_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_sale_possession_logs_uuid_unique` (`uuid`),
  ADD KEY `apartment_sale_possession_logs_apartment_sale_id_foreign` (`apartment_sale_id`),
  ADD KEY `apartment_sale_possession_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `apartment_sale_terminations`
--
ALTER TABLE `apartment_sale_terminations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_sale_terminations_apartment_sale_id_unique` (`apartment_sale_id`);

--
-- Indexes for table `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approvals_module_reference_id_index` (`module`,`reference_id`),
  ADD KEY `approvals_requested_by_foreign` (`requested_by`);

--
-- Indexes for table `approval_logs`
--
ALTER TABLE `approval_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approval_logs_approval_id_foreign` (`approval_id`),
  ADD KEY `approval_logs_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `asset_assignments`
--
ALTER TABLE `asset_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_assignments_uuid_unique` (`uuid`),
  ADD KEY `asset_assignments_asset_request_id_foreign` (`asset_request_id`),
  ADD KEY `asset_assignments_employee_id_foreign` (`employee_id`),
  ADD KEY `asset_assignments_asset_id_status_index` (`asset_id`,`status`);

--
-- Indexes for table `asset_requests`
--
ALTER TABLE `asset_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_requests_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `asset_requests_request_no_unique` (`request_no`),
  ADD KEY `asset_requests_requested_by_employee_id_foreign` (`requested_by_employee_id`),
  ADD KEY `asset_requests_requested_asset_id_foreign` (`requested_asset_id`),
  ADD KEY `asset_requests_approved_by_user_id_foreign` (`approved_by_user_id`),
  ADD KEY `asset_requests_allocated_by_user_id_foreign` (`allocated_by_user_id`),
  ADD KEY `asset_requests_status_updated_at_index` (`status`,`updated_at`),
  ADD KEY `asset_requests_requested_by_user_id_foreign` (`requested_by_user_id`),
  ADD KEY `asset_requests_rejected_by_user_id_foreign` (`rejected_by_user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `company_assets`
--
ALTER TABLE `company_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_assets_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `company_assets_asset_code_unique` (`asset_code`),
  ADD KEY `company_assets_supplier_id_foreign` (`supplier_id`),
  ADD KEY `company_assets_current_employee_id_foreign` (`current_employee_id`),
  ADD KEY `company_assets_current_warehouse_id_foreign` (`current_warehouse_id`);

--
-- Indexes for table `crm_messages`
--
ALTER TABLE `crm_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_messages_customer_id_channel_status_index` (`customer_id`,`channel`,`status`),
  ADD KEY `crm_msg_installment_channel_created_idx` (`installment_id`,`channel`,`created_at`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_uuid_unique` (`uuid`),
  ADD KEY `customers_phone_index` (`phone`),
  ADD KEY `customers_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_module_reference_idx` (`module`,`reference_id`),
  ADD KEY `documents_module_type_idx` (`module`,`document_type`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_module_code_unique` (`module`,`code`),
  ADD UNIQUE KEY `document_types_uuid_unique` (`uuid`),
  ADD KEY `document_types_module_active_idx` (`module`,`is_active`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_uuid_unique` (`uuid`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_project_employee_id_project_id_unique` (`employee_id`,`project_id`),
  ADD KEY `employee_project_project_id_foreign` (`project_id`);

--
-- Indexes for table `employee_salary_histories`
--
ALTER TABLE `employee_salary_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_salary_histories_uuid_unique` (`uuid`),
  ADD KEY `employee_salary_histories_changed_by_foreign` (`changed_by`),
  ADD KEY `employee_salary_histories_employee_id_effective_from_index` (`employee_id`,`effective_from`),
  ADD KEY `employee_salary_histories_updated_at_index` (`updated_at`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exchange_rates_uuid_unique` (`uuid`),
  ADD KEY `exchange_rates_approved_by_user_id_foreign` (`approved_by_user_id`),
  ADD KEY `exchange_rates_base_currency_quote_currency_is_active_index` (`base_currency`,`quote_currency`,`is_active`),
  ADD KEY `exchange_rates_effective_date_index` (`effective_date`),
  ADD KEY `exchange_rates_updated_at_index` (`updated_at`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `installments_uuid_unique` (`uuid`),
  ADD KEY `installments_apartment_sale_id_foreign` (`apartment_sale_id`);

--
-- Indexes for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `installment_payments_uuid_unique` (`uuid`),
  ADD KEY `installment_payments_installment_id_foreign` (`installment_id`),
  ADD KEY `installment_payments_received_by_foreign` (`received_by`),
  ADD KEY `installment_payments_account_id_foreign` (`account_id`),
  ADD KEY `installment_payments_account_transaction_id_foreign` (`account_transaction_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_uuid_unique` (`uuid`),
  ADD KEY `materials_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `material_requests`
--
ALTER TABLE `material_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `material_requests_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `material_requests_request_no_unique` (`request_no`),
  ADD KEY `material_requests_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `material_requests_requested_by_employee_id_foreign` (`requested_by_employee_id`),
  ADD KEY `material_requests_approved_by_user_id_foreign` (`approved_by_user_id`),
  ADD KEY `material_requests_issued_by_user_id_foreign` (`issued_by_user_id`),
  ADD KEY `material_requests_status_updated_at_index` (`status`,`updated_at`),
  ADD KEY `material_requests_requested_by_user_id_foreign` (`requested_by_user_id`),
  ADD KEY `material_requests_rejected_by_user_id_foreign` (`rejected_by_user_id`);

--
-- Indexes for table `material_request_items`
--
ALTER TABLE `material_request_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `material_request_items_uuid_unique` (`uuid`),
  ADD KEY `material_request_items_material_request_id_foreign` (`material_request_id`),
  ADD KEY `material_request_items_material_id_foreign` (`material_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `municipality_payment_letters`
--
ALTER TABLE `municipality_payment_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `municipality_payment_letters_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `municipality_payment_letters_apartment_sale_id_unique` (`apartment_sale_id`),
  ADD UNIQUE KEY `municipality_payment_letters_letter_no_unique` (`letter_no`);

--
-- Indexes for table `municipality_receipts`
--
ALTER TABLE `municipality_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `municipality_receipts_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `municipality_receipts_receipt_no_unique` (`receipt_no`),
  ADD KEY `municipality_receipts_apartment_sale_id_foreign` (`apartment_sale_id`),
  ADD KEY `municipality_receipts_received_by_foreign` (`received_by`),
  ADD KEY `municipality_receipts_account_id_foreign` (`account_id`),
  ADD KEY `municipality_receipts_account_transaction_id_foreign` (`account_transaction_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_uuid_unique` (`uuid`),
  ADD KEY `projects_status_updated_at_index` (`status`,`updated_at`),
  ADD KEY `projects_project_manager_user_id_foreign` (`project_manager_user_id`);

--
-- Indexes for table `project_employee_assignments`
--
ALTER TABLE `project_employee_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_employee_assignments_uuid_unique` (`uuid`),
  ADD KEY `project_employee_assignments_assigned_by_user_id_foreign` (`assigned_by_user_id`),
  ADD KEY `project_employee_assignments_project_id_status_index` (`project_id`,`status`),
  ADD KEY `project_employee_assignments_employee_id_status_index` (`employee_id`,`status`);

--
-- Indexes for table `project_material_stocks`
--
ALTER TABLE `project_material_stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_material_stocks_project_id_material_id_unique` (`project_id`,`material_id`),
  ADD UNIQUE KEY `project_material_stocks_uuid_unique` (`uuid`),
  ADD KEY `project_material_stocks_material_id_foreign` (`material_id`);

--
-- Indexes for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_requests_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `purchase_requests_request_no_unique` (`request_no`),
  ADD KEY `purchase_requests_source_material_request_id_foreign` (`source_material_request_id`),
  ADD KEY `purchase_requests_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchase_requests_vendor_id_foreign` (`vendor_id`),
  ADD KEY `purchase_requests_requested_by_employee_id_foreign` (`requested_by_employee_id`),
  ADD KEY `purchase_requests_approved_by_user_id_foreign` (`approved_by_user_id`),
  ADD KEY `purchase_requests_received_by_user_id_foreign` (`received_by_user_id`),
  ADD KEY `purchase_requests_status_updated_at_index` (`status`,`updated_at`),
  ADD KEY `purchase_requests_requested_by_user_id_foreign` (`requested_by_user_id`),
  ADD KEY `purchase_requests_rejected_by_user_id_foreign` (`rejected_by_user_id`),
  ADD KEY `purchase_requests_payment_processed_by_user_id_foreign` (`payment_processed_by_user_id`),
  ADD KEY `purchase_requests_payment_account_id_foreign` (`payment_account_id`),
  ADD KEY `purchase_requests_payment_account_transaction_id_foreign` (`payment_account_transaction_id`);

--
-- Indexes for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_request_items_uuid_unique` (`uuid`),
  ADD KEY `purchase_request_items_purchase_request_id_foreign` (`purchase_request_id`),
  ADD KEY `purchase_request_items_material_id_foreign` (`material_id`),
  ADD KEY `purchase_request_items_company_asset_id_foreign` (`company_asset_id`);

--
-- Indexes for table `rental_payments`
--
ALTER TABLE `rental_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rental_payments_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `rental_payments_bill_no_unique` (`bill_no`),
  ADD KEY `rental_payments_rental_id_status_index` (`rental_id`,`status`),
  ADD KEY `rental_payments_rental_id_due_date_index` (`rental_id`,`due_date`),
  ADD KEY `rental_payments_payment_type_status_index` (`payment_type`,`status`),
  ADD KEY `rental_payments_period_month_index` (`period_month`),
  ADD KEY `rental_payments_bill_generated_at_index` (`bill_generated_at`),
  ADD KEY `rental_payments_approved_by_approved_at_index` (`approved_by`,`approved_at`);

--
-- Indexes for table `rental_payment_receipts`
--
ALTER TABLE `rental_payment_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rental_payment_receipts_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `rental_payment_receipts_receipt_no_unique` (`receipt_no`),
  ADD KEY `rental_payment_receipts_tenant_id_foreign` (`tenant_id`),
  ADD KEY `rental_payment_receipts_received_by_foreign` (`received_by`),
  ADD KEY `rental_payment_receipts_rental_id_payment_date_index` (`rental_id`,`payment_date`),
  ADD KEY `rental_payment_receipts_rental_payment_id_index` (`rental_payment_id`),
  ADD KEY `rental_payment_receipts_account_id_foreign` (`account_id`),
  ADD KEY `rental_payment_receipts_account_transaction_id_foreign` (`account_transaction_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
  ADD UNIQUE KEY `roles_uuid_unique` (`uuid`),
  ADD KEY `roles_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_advances`
--
ALTER TABLE `salary_advances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_advances_uuid_unique` (`uuid`),
  ADD KEY `salary_advances_user_id_foreign` (`user_id`),
  ADD KEY `salary_advances_employee_id_status_index` (`employee_id`,`status`),
  ADD KEY `salary_advances_updated_at_index` (`updated_at`);

--
-- Indexes for table `salary_advance_deductions`
--
ALTER TABLE `salary_advance_deductions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_advance_deductions_uuid_unique` (`uuid`),
  ADD KEY `salary_advance_deductions_salary_payment_id_deleted_at_index` (`salary_payment_id`,`deleted_at`),
  ADD KEY `salary_advance_deductions_salary_advance_id_deleted_at_index` (`salary_advance_id`,`deleted_at`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_payments_uuid_unique` (`uuid`),
  ADD KEY `salary_payments_user_id_foreign` (`user_id`),
  ADD KEY `salary_payments_employee_id_status_index` (`employee_id`,`status`),
  ADD KEY `salary_payments_period_index` (`period`),
  ADD KEY `salary_payments_updated_at_index` (`updated_at`),
  ADD KEY `salary_payments_account_id_foreign` (`account_id`),
  ADD KEY `salary_payments_account_transaction_id_foreign` (`account_transaction_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_movements_uuid_unique` (`uuid`),
  ADD KEY `stock_movements_material_id_movement_date_index` (`material_id`,`movement_date`),
  ADD KEY `stock_movements_warehouse_id_movement_date_index` (`warehouse_id`,`movement_date`),
  ADD KEY `stock_movements_project_id_movement_date_index` (`project_id`,`movement_date`),
  ADD KEY `stock_movements_movement_type_movement_date_index` (`movement_type`,`movement_date`);

--
-- Indexes for table `sync_inbox`
--
ALTER TABLE `sync_inbox`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sync_inbox_idempotency_key_unique` (`idempotency_key`),
  ADD KEY `sync_inbox_user_id_foreign` (`user_id`),
  ADD KEY `sync_inbox_entity_entity_uuid_index` (`entity`,`entity_uuid`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_unique` (`key`),
  ADD KEY `system_settings_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `users_customer_id_unique` (`customer_id`),
  ADD KEY `users_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_uuid_unique` (`uuid`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_uuid_unique` (`uuid`);

--
-- Indexes for table `warehouse_material_stocks`
--
ALTER TABLE `warehouse_material_stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouse_material_stocks_warehouse_id_material_id_unique` (`warehouse_id`,`material_id`),
  ADD UNIQUE KEY `warehouse_material_stocks_uuid_unique` (`uuid`),
  ADD KEY `warehouse_material_stocks_material_id_foreign` (`material_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `apartment_qr_access_tokens`
--
ALTER TABLE `apartment_qr_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `apartment_qr_scan_logs`
--
ALTER TABLE `apartment_qr_scan_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apartment_rentals`
--
ALTER TABLE `apartment_rentals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apartment_sales`
--
ALTER TABLE `apartment_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `apartment_sale_financials`
--
ALTER TABLE `apartment_sale_financials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `apartment_sale_possession_logs`
--
ALTER TABLE `apartment_sale_possession_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `apartment_sale_terminations`
--
ALTER TABLE `apartment_sale_terminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `approval_logs`
--
ALTER TABLE `approval_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_assignments`
--
ALTER TABLE `asset_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_requests`
--
ALTER TABLE `asset_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_assets`
--
ALTER TABLE `company_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_messages`
--
ALTER TABLE `crm_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_project`
--
ALTER TABLE `employee_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_salary_histories`
--
ALTER TABLE `employee_salary_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_requests`
--
ALTER TABLE `material_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_request_items`
--
ALTER TABLE `material_request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipality_payment_letters`
--
ALTER TABLE `municipality_payment_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `municipality_receipts`
--
ALTER TABLE `municipality_receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=764;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_employee_assignments`
--
ALTER TABLE `project_employee_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_material_stocks`
--
ALTER TABLE `project_material_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_payments`
--
ALTER TABLE `rental_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_payment_receipts`
--
ALTER TABLE `rental_payment_receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salary_advances`
--
ALTER TABLE `salary_advances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_advance_deductions`
--
ALTER TABLE `salary_advance_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_inbox`
--
ALTER TABLE `sync_inbox`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_material_stocks`
--
ALTER TABLE `warehouse_material_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `account_transactions_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `account_transactions_reversal_of_id_foreign` FOREIGN KEY (`reversal_of_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `apartment_qr_access_tokens`
--
ALTER TABLE `apartment_qr_access_tokens`
  ADD CONSTRAINT `apartment_qr_access_tokens_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apartment_qr_access_tokens_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `apartment_qr_scan_logs`
--
ALTER TABLE `apartment_qr_scan_logs`
  ADD CONSTRAINT `apartment_qr_scan_logs_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_qr_scan_logs_apartment_qr_access_token_id_foreign` FOREIGN KEY (`apartment_qr_access_token_id`) REFERENCES `apartment_qr_access_tokens` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_qr_scan_logs_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_qr_scan_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `apartment_rentals`
--
ALTER TABLE `apartment_rentals`
  ADD CONSTRAINT `apartment_rentals_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`),
  ADD CONSTRAINT `apartment_rentals_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `apartment_rentals_key_handover_by_foreign` FOREIGN KEY (`key_handover_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `apartment_rentals_key_returned_by_foreign` FOREIGN KEY (`key_returned_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `apartment_rentals_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `apartment_sales`
--
ALTER TABLE `apartment_sales`
  ADD CONSTRAINT `apartment_sales_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apartment_sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apartment_sales_deed_issued_by_foreign` FOREIGN KEY (`deed_issued_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_sales_key_handover_by_foreign` FOREIGN KEY (`key_handover_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_sales_key_returned_by_foreign` FOREIGN KEY (`key_returned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apartment_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `apartment_sale_financials`
--
ALTER TABLE `apartment_sale_financials`
  ADD CONSTRAINT `apartment_sale_financials_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `apartment_sale_possession_logs`
--
ALTER TABLE `apartment_sale_possession_logs`
  ADD CONSTRAINT `apartment_sale_possession_logs_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `apartment_sale_possession_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `apartment_sale_terminations`
--
ALTER TABLE `apartment_sale_terminations`
  ADD CONSTRAINT `apartment_sale_terminations_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `approvals`
--
ALTER TABLE `approvals`
  ADD CONSTRAINT `approvals_requested_by_foreign` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `approval_logs`
--
ALTER TABLE `approval_logs`
  ADD CONSTRAINT `approval_logs_approval_id_foreign` FOREIGN KEY (`approval_id`) REFERENCES `approvals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `approval_logs_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `asset_assignments`
--
ALTER TABLE `asset_assignments`
  ADD CONSTRAINT `asset_assignments_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `company_assets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asset_assignments_asset_request_id_foreign` FOREIGN KEY (`asset_request_id`) REFERENCES `asset_requests` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_assignments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `asset_requests`
--
ALTER TABLE `asset_requests`
  ADD CONSTRAINT `asset_requests_allocated_by_user_id_foreign` FOREIGN KEY (`allocated_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_requests_approved_by_user_id_foreign` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_requests_rejected_by_user_id_foreign` FOREIGN KEY (`rejected_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_requests_requested_asset_id_foreign` FOREIGN KEY (`requested_asset_id`) REFERENCES `company_assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_requests_requested_by_employee_id_foreign` FOREIGN KEY (`requested_by_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_requests_requested_by_user_id_foreign` FOREIGN KEY (`requested_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `company_assets`
--
ALTER TABLE `company_assets`
  ADD CONSTRAINT `company_assets_current_employee_id_foreign` FOREIGN KEY (`current_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `company_assets_current_warehouse_id_foreign` FOREIGN KEY (`current_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `company_assets_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `crm_messages`
--
ALTER TABLE `crm_messages`
  ADD CONSTRAINT `crm_messages_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_salary_histories`
--
ALTER TABLE `employee_salary_histories`
  ADD CONSTRAINT `employee_salary_histories_changed_by_foreign` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_salary_histories_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD CONSTRAINT `exchange_rates_approved_by_user_id_foreign` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD CONSTRAINT `installment_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `installment_payments_account_transaction_id_foreign` FOREIGN KEY (`account_transaction_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `installment_payments_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `installment_payments_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `material_requests`
--
ALTER TABLE `material_requests`
  ADD CONSTRAINT `material_requests_approved_by_user_id_foreign` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `material_requests_issued_by_user_id_foreign` FOREIGN KEY (`issued_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `material_requests_rejected_by_user_id_foreign` FOREIGN KEY (`rejected_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `material_requests_requested_by_employee_id_foreign` FOREIGN KEY (`requested_by_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `material_requests_requested_by_user_id_foreign` FOREIGN KEY (`requested_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `material_requests_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_request_items`
--
ALTER TABLE `material_request_items`
  ADD CONSTRAINT `material_request_items_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_request_items_material_request_id_foreign` FOREIGN KEY (`material_request_id`) REFERENCES `material_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `municipality_payment_letters`
--
ALTER TABLE `municipality_payment_letters`
  ADD CONSTRAINT `municipality_payment_letters_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `municipality_receipts`
--
ALTER TABLE `municipality_receipts`
  ADD CONSTRAINT `municipality_receipts_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `municipality_receipts_account_transaction_id_foreign` FOREIGN KEY (`account_transaction_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `municipality_receipts_apartment_sale_id_foreign` FOREIGN KEY (`apartment_sale_id`) REFERENCES `apartment_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `municipality_receipts_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_project_manager_user_id_foreign` FOREIGN KEY (`project_manager_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_employee_assignments`
--
ALTER TABLE `project_employee_assignments`
  ADD CONSTRAINT `project_employee_assignments_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `project_employee_assignments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_employee_assignments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_material_stocks`
--
ALTER TABLE `project_material_stocks`
  ADD CONSTRAINT `project_material_stocks_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_material_stocks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD CONSTRAINT `purchase_requests_approved_by_user_id_foreign` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_payment_account_id_foreign` FOREIGN KEY (`payment_account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_payment_account_transaction_id_foreign` FOREIGN KEY (`payment_account_transaction_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_payment_processed_by_user_id_foreign` FOREIGN KEY (`payment_processed_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_received_by_user_id_foreign` FOREIGN KEY (`received_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_rejected_by_user_id_foreign` FOREIGN KEY (`rejected_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_requested_by_employee_id_foreign` FOREIGN KEY (`requested_by_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_requested_by_user_id_foreign` FOREIGN KEY (`requested_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_source_material_request_id_foreign` FOREIGN KEY (`source_material_request_id`) REFERENCES `material_requests` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD CONSTRAINT `purchase_request_items_company_asset_id_foreign` FOREIGN KEY (`company_asset_id`) REFERENCES `company_assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_request_items_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_request_items_purchase_request_id_foreign` FOREIGN KEY (`purchase_request_id`) REFERENCES `purchase_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rental_payments`
--
ALTER TABLE `rental_payments`
  ADD CONSTRAINT `rental_payments_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rental_payments_rental_id_foreign` FOREIGN KEY (`rental_id`) REFERENCES `apartment_rentals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rental_payment_receipts`
--
ALTER TABLE `rental_payment_receipts`
  ADD CONSTRAINT `rental_payment_receipts_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rental_payment_receipts_account_transaction_id_foreign` FOREIGN KEY (`account_transaction_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rental_payment_receipts_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rental_payment_receipts_rental_id_foreign` FOREIGN KEY (`rental_id`) REFERENCES `apartment_rentals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_payment_receipts_rental_payment_id_foreign` FOREIGN KEY (`rental_payment_id`) REFERENCES `rental_payments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rental_payment_receipts_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_advances`
--
ALTER TABLE `salary_advances`
  ADD CONSTRAINT `salary_advances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `salary_advances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `salary_advance_deductions`
--
ALTER TABLE `salary_advance_deductions`
  ADD CONSTRAINT `salary_advance_deductions_salary_advance_id_foreign` FOREIGN KEY (`salary_advance_id`) REFERENCES `salary_advances` (`id`),
  ADD CONSTRAINT `salary_advance_deductions_salary_payment_id_foreign` FOREIGN KEY (`salary_payment_id`) REFERENCES `salary_payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD CONSTRAINT `salary_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `salary_payments_account_transaction_id_foreign` FOREIGN KEY (`account_transaction_id`) REFERENCES `account_transactions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `salary_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `salary_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sync_inbox`
--
ALTER TABLE `sync_inbox`
  ADD CONSTRAINT `sync_inbox_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD CONSTRAINT `system_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
