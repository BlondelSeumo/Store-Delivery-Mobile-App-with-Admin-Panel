-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 03:51 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markets_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_settings_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `app_settings`
--

TRUNCATE TABLE `app_settings`;
--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Smart Delivery'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'productdelivery@smartersvision.com'),
(24, 'mail_password', 'NnvAwk&&E7'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'productdelivery@smartersvision.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-light bg-white'),
(38, 'logo_bg_color', 'bg-white'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '0'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', 'JV2A7G4SEMLMZ565'),
(114, 'paypal_secret', 'AbMmSXVaig1ExpY3utVS3dcAjx7nAHH0utrZsUN6LYwPgo7wfMzrV5WZ'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#25D366'),
(117, 'main_dark_color', '#25D366'),
(118, 'second_color', '#043832'),
(119, 'second_dark_color', '#ccccdd'),
(120, 'accent_color', '#8c98a8'),
(121, 'accent_dark_color', '#9999aa'),
(122, 'scaffold_dark_color', '#2c2c2c'),
(123, 'scaffold_color', '#fafafa'),
(124, 'google_maps_key', 'AIzaSyAT07iMlfZ9bJt1gmGj9KhJDLFY8srI6dA'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `carts`
--

TRUNCATE TABLE `carts`;
-- --------------------------------------------------------

--
-- Table structure for table `cart_options`
--

DROP TABLE IF EXISTS `cart_options`;
CREATE TABLE IF NOT EXISTS `cart_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`option_id`,`cart_id`),
  KEY `cart_options_cart_id_foreign` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `cart_options`
--

TRUNCATE TABLE `cart_options`;
-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `categories`
--

TRUNCATE TABLE `categories`;
--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tools', 'Omnis necessitatibus deleniti ut incidunt. Ea cumque non optio odio. Reiciendis est assumenda cumque qui eaque eos aperiam. Minus molestias sit perspiciatis ratione. Aspernatur suscipit excepturi omnis doloribus reprehenderit libero voluptatem.', '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(2, 'Foods', 'Impedit voluptatem rem incidunt reiciendis consectetur molestiae voluptas. Quibusdam minus cumque quis quia. Aliquid omnis esse nemo voluptas. Dolor perspiciatis ut illum enim. Dolorem quod et necessitatibus aut rerum.', '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(3, 'Tools', 'Et eaque ut aut et. Quos maiores in ut similique autem nihil. Explicabo dicta dolorem cupiditate recusandae est vitae. Est odit odio minima ut eos deleniti tenetur ipsam. Reprehenderit maxime ut et doloribus similique hic eveniet.', '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(4, 'Foods', 'Nihil dignissimos qui id deleniti error deserunt et architecto. Animi dolores quasi ut nesciunt non perferendis in. Praesentium nihil in earum odit natus rem accusantium. Quia nihil tempora quibusdam quia neque ipsa id. Sunt dolorem ipsam voluptatibus quia voluptate repudiandae.', '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(5, 'Foods', 'Pariatur suscipit recusandae alias non quo. Explicabo dolor provident et. Et eaque adipisci dolorem. Sunt omnis quia sapiente qui qui in omnis. Amet beatae repellendus saepe veritatis et tempore qui unde.', '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(6, 'Foods', 'Molestiae reprehenderit nostrum suscipit quisquam ipsum dolorem voluptatem. Illum fuga est facere voluptatem vel non tempora nobis. Aut architecto enim laborum vel sequi non. Totam architecto quia illo labore sit occaecati. Error ut ut alias et.', '2020-05-03 12:49:22', '2020-05-03 12:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `currencies`
--

TRUNCATE TABLE `currencies`;
--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2019-10-22 14:50:48', '2019-10-22 14:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2019-10-22 14:51:39', '2019-10-22 14:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2019-10-22 14:52:50', '2019-10-22 14:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2019-10-22 14:53:22', '2019-10-22 14:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2019-10-22 14:54:00', '2019-10-22 14:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2019-10-22 14:55:51', '2019-10-22 14:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2019-10-22 14:56:26', '2019-10-22 14:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `custom_fields`
--

TRUNCATE TABLE `custom_fields`;
--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(4, 'phone', 'text', NULL, 0, 0, 0, 6, 2, 'App\\Models\\User', '2019-09-06 20:30:00', '2019-09-06 20:31:47'),
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-06 20:43:58', '2019-09-06 20:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-06 20:49:22', '2019-09-06 20:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
CREATE TABLE IF NOT EXISTS `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `view` longtext COLLATE utf8mb4_unicode_ci,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `custom_field_values`
--

TRUNCATE TABLE `custom_field_values`;
--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(29, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 2, '2019-09-06 20:52:30', '2019-09-06 20:52:30'),
(30, 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 5, 'App\\Models\\User', 2, '2019-09-06 20:52:30', '2019-10-16 18:32:35'),
(31, '2911 Corpening Drive South Lyon, MI 48178', '2911 Corpening Drive South Lyon, MI 48178', 6, 'App\\Models\\User', 2, '2019-09-06 20:52:30', '2019-10-16 18:32:35'),
(32, '+136 226 5660', '+136 226 5660', 4, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-09-27 07:12:04'),
(33, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-10-16 18:23:53'),
(34, '569 Braxton Street Cortland, IL 60112', '569 Braxton Street Cortland, IL 60112', 6, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-10-16 18:23:53'),
(35, '+1 098-6543-236', '+1 098-6543-236', 4, 'App\\Models\\User', 3, '2019-10-15 16:21:32', '2019-10-17 22:21:43'),
(36, 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 5, 'App\\Models\\User', 3, '2019-10-15 16:21:32', '2019-10-17 22:21:12'),
(37, '1850 Big Elm Kansas City, MO 64106', '1850 Big Elm Kansas City, MO 64106', 6, 'App\\Models\\User', 3, '2019-10-15 16:21:32', '2019-10-17 22:21:43'),
(38, '+1 248-437-7610', '+1 248-437-7610', 4, 'App\\Models\\User', 4, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(40, '1050 Frosty Lane Sidney, NY 13838', '1050 Frosty Lane Sidney, NY 13838', 6, 'App\\Models\\User', 4, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(41, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 5, '2019-12-15 17:49:44', '2019-12-15 17:49:44'),
(42, '<p>Short Bio</p>', 'Short Bio', 5, 'App\\Models\\User', 5, '2019-12-15 17:49:44', '2019-12-15 17:49:44'),
(43, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 5, '2019-12-15 17:49:44', '2019-12-15 17:49:44'),
(44, '+136 955 6525', '+136 955 6525', 4, 'App\\Models\\User', 6, '2020-03-29 16:28:04', '2020-03-29 16:28:04'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-29 16:28:05', '2020-03-29 16:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-29 16:28:05', '2020-03-29 16:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

DROP TABLE IF EXISTS `delivery_addresses`;
CREATE TABLE IF NOT EXISTS `delivery_addresses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_addresses_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `delivery_addresses`
--

TRUNCATE TABLE `delivery_addresses`;
--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `is_default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Voluptatum iusto ipsa neque dolor illum ad et.', '12964 Toney Spurs\nEast Ronaldo, PA 74572-8369', '32.808521', '-117.913547', 1, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(2, 'Voluptatum voluptas nostrum corrupti non sint dolorem.', '182 Addie Villages Suite 898\nWest Kathleenside, CT 74731', '-21.654508', '14.855607', 1, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(3, 'Quisquam exercitationem odio quis amet.', '964 Alice Flat\nWest Abelardo, WY 93380-3857', '2.648579', '63.331831', 1, 6, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(4, 'Enim est ut ea quo non voluptates in.', '8736 Herzog Canyon\nPort Metastad, MT 19162', '27.76618', '-88.043727', 0, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(5, 'Et consequatur architecto consequatur magnam non perspiciatis cupiditate.', '59576 Schneider Vista Suite 735\nSouth Nicholaus, NV 47743-9641', '40.821454', '4.151953', 1, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(6, 'Accusamus quis velit fugiat sapiente ratione repellendus error.', '3873 Quitzon Lake Suite 273\nEast Chadburgh, MI 20692-0966', '79.375689', '-116.571049', 0, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(7, 'Quisquam enim vel repudiandae quae enim facilis ipsam.', '63958 Luettgen Lock Suite 213\nOrtizhaven, UT 10508', '-42.444204', '-54.191002', 1, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(8, 'Enim voluptas modi vero similique.', '499 Cristian Island Suite 487\nSuzannemouth, DE 12869-3626', '71.914655', '-117.868474', 1, 6, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(9, 'Similique est velit explicabo voluptatum sed corporis rerum.', '6692 Kshlerin Cove\nLebsackbury, FL 00281', '88.316855', '-56.010682', 1, 6, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(10, 'Tempora libero voluptas similique quisquam consequatur nemo dolorem beatae.', '4752 June Extension\nVolkmanport, MD 79097-1049', '-30.412575', '-127.688303', 0, 5, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(11, 'Quo dolore illo culpa eum.', '70628 Halie Creek\nQuitzonborough, IN 81288-1626', '-61.829792', '-82.910623', 1, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(12, 'Quas tempore dolor atque amet dolorem dolor officiis.', '542 Hill View\nKreigerburgh, UT 55080-1171', '67.034086', '-78.335574', 1, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(13, 'Et autem libero voluptas atque eum quos beatae.', '92118 Chyna Walks Suite 857\nLake Reyes, FL 09624-9078', '-2.419231', '-173.012349', 1, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(14, 'Id excepturi rerum ea sit quae.', '8713 Veum Summit\nNorth Guy, WV 36641-5392', '59.735009', '-29.582002', 1, 5, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(15, 'Et cum consectetur pariatur qui.', '3971 Wilderman Ville\nNew Kadeport, RI 50507', '12.100306', '-76.276477', 1, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `delivery_fee` double(5,2) NOT NULL DEFAULT '0.00',
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `earning` double(9,2) NOT NULL DEFAULT '0.00',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drivers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `drivers`
--

TRUNCATE TABLE `drivers`;
-- --------------------------------------------------------

--
-- Table structure for table `drivers_payouts`
--

DROP TABLE IF EXISTS `drivers_payouts`;
CREATE TABLE IF NOT EXISTS `drivers_payouts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT '0.00',
  `paid_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drivers_payouts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `drivers_payouts`
--

TRUNCATE TABLE `drivers_payouts`;
-- --------------------------------------------------------

--
-- Table structure for table `driver_markets`
--

DROP TABLE IF EXISTS `driver_markets`;
CREATE TABLE IF NOT EXISTS `driver_markets` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `market_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`market_id`),
  KEY `driver_markets_market_id_foreign` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `driver_markets`
--

TRUNCATE TABLE `driver_markets`;
--
-- Dumping data for table `driver_markets`
--

INSERT INTO `driver_markets` (`user_id`, `market_id`) VALUES
(5, 1),
(5, 2),
(5, 4),
(6, 2),
(6, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
CREATE TABLE IF NOT EXISTS `earnings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `market_id` int(10) UNSIGNED NOT NULL,
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `admin_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `market_earning` double(9,2) NOT NULL DEFAULT '0.00',
  `delivery_fee` double(9,2) NOT NULL DEFAULT '0.00',
  `tax` double(9,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `earnings_market_id_foreign` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `earnings`
--

TRUNCATE TABLE `earnings`;
-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_faq_category_id_foreign` (`faq_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `faqs`
--

TRUNCATE TABLE `faqs`;
--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Autem est est rerum. Aut nihil in et quam facere voluptatem. Est laborum rerum quibusdam eius.', 'Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all is! I\'ll try and say \"Who am I to get into her head. \'If I eat or drink anything; so I\'ll just see what would happen next.', 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(2, 'Velit praesentium eum beatae. Quasi cumque velit aut facere harum tempore.', 'At last the Mouse, who seemed to be found: all she could not remember ever having seen in her life, and had to stop and untwist it. After a while she was walking by the English, who wanted leaders.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(3, 'Cum fugiat aut rerum dolor non. Accusamus eligendi placeat eius quos.', 'So they couldn\'t see it?\' So she began thinking over all the other side. The further off from England the nearer is to do that,\' said Alice. \'Anything you like,\' said the last word two or three.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(4, 'Illum eaque deleniti eius ullam placeat. Et magnam eveniet optio voluptate occaecati quasi cum.', 'Why, she\'ll eat a little of her going, though she knew that it is!\' \'Why should it?\' muttered the Hatter. \'Does YOUR watch tell you just now what the moral of that is--\"Oh, \'tis love, that makes you.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(5, 'Quos voluptates ullam quo. Temporibus ea delectus et ut. Ex eveniet omnis soluta ea dolorum.', 'Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. \'It\'s a mineral, I THINK,\' said Alice. \'Well, then,\' the Cat said, waving its tail when.', 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(6, 'Eveniet quas provident dolores molestiae dolores qui et. Consequatur et nam et aspernatur ab.', 'AND WASHING--extra.\"\' \'You couldn\'t have done that, you know,\' the Hatter began, in rather a handsome pig, I think.\' And she kept fanning herself all the unjust things--\' when his eye chanced to.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(7, 'Et suscipit et aut cum. Quas quasi dolorem doloremque quos.', 'Gryphon, and, taking Alice by the hand, it hurried off, without waiting for the baby, and not to make out which were the two sides of it; and while she was in the other: the Duchess asked, with.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(8, 'Dolorem dicta animi vel quia dolor ipsa eligendi. Porro fugiat nihil odio repellendus.', 'Queen, pointing to the King, going up to them she heard a little bottle that stood near the entrance of the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(9, 'Incidunt occaecati ut autem. Ipsam incidunt eum voluptas. Et quo ex sit quis corporis quasi et.', 'Duchess; \'and most things twinkled after that--only the March Hare said--\' \'I didn\'t!\' the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows When the.', 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(10, 'Est vitae et aspernatur delectus et et. Vero consequatur rem id omnis maxime porro pariatur.', 'Dodo could not think of any that do,\' Alice hastily replied; \'at least--at least I know I have done that?\' she thought. \'I must go by the carrier,\' she thought; \'and how funny it\'ll seem, sending.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(11, 'Cumque illum et unde facere omnis officiis atque. Eligendi dicta non eius et ut ducimus.', 'Alice, \'and those twelve creatures,\' (she was so large in the distance. \'Come on!\' and ran off, thinking while she was terribly frightened all the right words,\' said poor Alice, that she still held.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(12, 'Aut suscipit ipsum aut dolorum. Dolor rerum enim enim commodi. Quo et deleniti aut.', 'Queen was in such confusion that she did not venture to say \'I once tasted--\' but checked herself hastily, and said anxiously to herself, \'I wish I hadn\'t cried so much!\' said Alice, rather alarmed.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(13, 'Enim assumenda sed necessitatibus et saepe. Illum consectetur quis ullam officia.', 'At last the Mouse, sharply and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(14, 'Deserunt est quisquam autem facere. Beatae eum nemo qui. Sint dolore doloribus sint qui ut.', 'Alice caught the baby was howling so much at this, that she was always ready to play croquet.\' The Frog-Footman repeated, in the shade: however, the moment she appeared on the top of his Normans--\".', 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(15, 'Beatae consequatur velit sed eveniet et et. Explicabo quia id explicabo.', 'Duchess said in a pleased tone. \'Pray don\'t trouble yourself to say \'Drink me,\' but the Dodo in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation; \'I\'ve none of them hit her.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(16, 'Quia nisi perferendis explicabo omnis non cumque tempore repudiandae. Facilis fuga nesciunt sunt.', 'Alice loudly. \'The idea of having nothing to do: once or twice, half hoping that the Queen was close behind her, listening: so she took courage, and went back to finish his story. CHAPTER IV. The.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(17, 'Ut occaecati sit fugiat eum quis qui pariatur. Odio saepe in perspiciatis voluptas.', 'March Hare. \'Exactly so,\' said the last few minutes it puffed away without being seen, when she looked down at her feet in a furious passion, and went on at last, they must be growing small again.\'.', 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(18, 'Quam cum rerum excepturi velit explicabo optio. Tenetur deserunt consectetur voluptas officiis.', 'Owl, as a cushion, resting their elbows on it, or at least one of the trees upon her knee, and looking at the moment, \'My dear! I shall ever see such a neck as that! No, no! You\'re a serpent; and.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(19, 'Neque inventore maiores id similique porro omnis. Totam qui distinctio et cumque.', 'Alice said; \'there\'s a large mustard-mine near here. And the Gryphon remarked: \'because they lessen from day to day.\' This was such a wretched height to be.\' \'It is wrong from beginning to see the.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(20, 'Porro iure iusto optio iste sint. Dolores eum qui consequatur rerum repellendus.', 'That he met in the air. She did it so quickly that the pebbles were all writing very busily on slates. \'What are tarts made of?\' Alice asked in a great crash, as if she were looking up into the.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(21, 'Est ipsam enim tempora. Blanditiis molestias aut consequatur et fugiat et voluptatem tempora.', 'I believe.\' \'Boots and shoes under the table: she opened the door and went stamping about, and called out as loud as she had quite a long way. So she began nursing her child again, singing a sort of.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(22, 'In eos et laboriosam autem sit. Et corrupti aperiam quis nulla suscipit autem dolore.', 'She was moving them about as much right,\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too flustered to tell you--all I know I do!\' said Alice.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(23, 'Tenetur quia amet quasi quia et explicabo et qui. Dolores atque ipsa est.', 'YOU are, first.\' \'Why?\' said the Dodo solemnly presented the thimble, saying \'We beg your pardon!\' cried Alice hastily, afraid that it was the Cat remarked. \'Don\'t be impertinent,\' said the King.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(24, 'Dolor ex dolorem omnis commodi et. Illo unde quos in quasi non tempore et.', 'Caterpillar. This was quite out of his pocket, and was suppressed. \'Come, that finished the goose, with the next verse,\' the Gryphon said, in a trembling voice:-- \'I passed by his garden.\"\' Alice.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(25, 'Quisquam perspiciatis animi voluptates nam. Illum quis sit sunt enim consequuntur.', 'IS that to be talking in a whisper, half afraid that it led into the court, without even waiting to put the Dormouse sulkily remarked, \'If you knew Time as well look and see what would happen next.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(26, 'Earum dolor sapiente et iste atque. Iste rerum animi dignissimos. Aliquam illo vero laboriosam.', 'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, I fancy--Who\'s to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, \'we learned French and music.\'.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(27, 'Non aperiam qui earum et facere. Fugit recusandae at debitis vel et. Sed autem dolor quaerat dicta.', 'Gryphon interrupted in a long, low hall, which was full of soup. \'There\'s certainly too much pepper in that poky little house, and the whole party look so grave that she ought not to be no use.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(28, 'Id dolor inventore qui aut quam. Ut repellat odit magni quo earum.', 'Alice and all dripping wet, cross, and uncomfortable. The moment Alice felt so desperate that she wasn\'t a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom.', 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(29, 'Aut sit error a commodi. Eum quia qui perspiciatis deleniti suscipit ut saepe.', 'At this moment Alice appeared, she was shrinking rapidly; so she turned away. \'Come back!\' the Caterpillar decidedly, and he hurried off. Alice thought she might as well go in at all?\' said the.', 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(30, 'Id modi sunt esse omnis. Ut vel error facilis error sit dolorem.', 'THE VOICE OF THE SLUGGARD,\"\' said the Mock Turtle replied in an offended tone, and she looked up, but it just at present--at least I know all the right height to rest herself, and fanned herself.', 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
CREATE TABLE IF NOT EXISTS `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `faq_categories`
--

TRUNCATE TABLE `faq_categories`;
--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Products', '2019-08-31 11:31:52', '2019-08-31 11:31:52'),
(2, 'Services', '2019-08-31 11:32:03', '2019-08-31 11:32:03'),
(3, 'Delivery', '2019-08-31 11:32:11', '2019-08-31 11:32:11'),
(4, 'Misc', '2019-08-31 11:32:17', '2019-08-31 11:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_product_id_foreign` (`product_id`),
  KEY `favorites_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `favorites`
--

TRUNCATE TABLE `favorites`;
--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 16, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(2, 24, 6, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(3, 19, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(4, 10, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(5, 27, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(6, 10, 6, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(7, 26, 5, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(8, 16, 6, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(9, 26, 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(10, 23, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(11, 20, 6, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(12, 7, 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(13, 24, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(14, 13, 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(15, 19, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(16, 22, 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(17, 16, 5, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(18, 11, 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(19, 17, 6, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(20, 16, 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(21, 10, 3, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(22, 23, 5, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(23, 24, 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(24, 7, 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(25, 14, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(26, 7, 4, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(27, 24, 5, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(28, 17, 2, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(29, 14, 5, '2020-05-03 12:49:27', '2020-05-03 12:49:27'),
(30, 15, 1, '2020-05-03 12:49:27', '2020-05-03 12:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

DROP TABLE IF EXISTS `favorite_options`;
CREATE TABLE IF NOT EXISTS `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`option_id`,`favorite_id`),
  KEY `favorite_options_favorite_id_foreign` (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `favorite_options`
--

TRUNCATE TABLE `favorite_options`;
--
-- Dumping data for table `favorite_options`
--

INSERT INTO `favorite_options` (`option_id`, `favorite_id`) VALUES
(1, 1),
(1, 5),
(2, 6),
(3, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `fields`
--

TRUNCATE TABLE `fields`;
--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Grocery', 'Eum similique maiores atque quia explicabo. Dolores quia placeat consequatur id quis perspiciatis. Ducimus sit ducimus officia labore maiores et porro. Est iusto natus nesciunt debitis consequuntur totam. Et illo et autem inventore earum corrupti.', '2020-04-11 14:03:21', '2020-04-11 14:03:21'),
(2, 'Pharmacy', 'Eaque et aut natus. Minima blanditiis ut sunt distinctio ad. Quasi doloremque rerum ex rerum. Molestias similique similique aut rerum delectus blanditiis et. Dolorem et quas nostrum est nobis.', '2020-04-11 14:03:21', '2020-04-11 14:03:21'),
(3, 'Restaurant', 'Est nihil omnis natus ducimus ducimus excepturi quos. Et praesentium in quia veniam. Tempore aut nesciunt consequatur pariatur recusandae. Voluptatem commodi eius quaerat est deleniti impedit. Qui quo harum est sequi incidunt labore eligendi cum.', '2020-04-11 14:03:21', '2020-04-11 14:03:21'),
(4, 'Store', 'Ex nostrum suscipit aut et labore. Ut dolor ut eum eum voluptatem ex. Sapiente in tempora soluta voluptatem. Officia accusantium quae sit. Rerum esse ipsa molestias dolorem et est autem consequatur.', '2020-04-11 14:03:21', '2020-04-11 14:03:21'),
(5, 'Electronics', 'Dolorum earum ut blanditiis blanditiis. Facere quis voluptates assumenda saepe. Ab aspernatur voluptatibus rem doloremque cum impedit. Itaque blanditiis commodi repudiandae asperiores. Modi atque placeat consectetur et aut blanditiis.', '2020-04-11 14:03:21', '2020-04-11 14:03:21'),
(6, 'Furniture', 'Est et iste enim. Quam repudiandae commodi rerum non esse. Et in aut sequi est aspernatur. Facere non modi expedita asperiores. Ipsa laborum saepe deserunt qui consequatur voluptas inventore dolorum.', '2020-04-11 14:03:21', '2020-04-11 14:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `market_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_market_id_foreign` (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `galleries`
--

TRUNCATE TABLE `galleries`;
--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `market_id`, `created_at`, `updated_at`) VALUES
(1, 'Vero quis distinctio voluptas neque corporis qui quod.', 7, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(2, 'Sequi dolorum porro corporis quasi.', 8, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(3, 'Nesciunt assumenda tempore quos ea sit quo.', 9, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(4, 'Aut recusandae voluptatibus et.', 6, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(5, 'Ut ipsum id et voluptatum ratione.', 8, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(6, 'Voluptate impedit alias necessitatibus aliquam ipsa vitae illo.', 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(7, 'Dolor iste ut sunt doloremque harum eum id.', 7, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(8, 'Facilis molestiae in quos repudiandae in voluptas.', 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(9, 'Temporibus architecto voluptas dicta corrupti deserunt tenetur.', 1, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(10, 'Quisquam et esse suscipit est illum ab dolorem.', 7, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(11, 'Amet rerum iste autem.', 8, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(12, 'Amet omnis officia commodi ipsam.', 1, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(13, 'Perspiciatis laudantium earum molestiae beatae.', 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(14, 'Eos harum architecto tempore quas est.', 8, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(15, 'Cupiditate dicta sint tenetur ex quo nisi odit.', 6, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(16, 'At facere dolores velit dolores optio consequatur qui repellendus.', 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(17, 'Sed rerum ut quos nesciunt consequatur ipsa similique eum.', 3, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(18, 'Consequuntur qui dolore voluptatum fugit vel fugiat dolorum.', 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(19, 'Quo iure sequi sit harum omnis consequuntur ducimus.', 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(20, 'Voluptatibus est necessitatibus expedita blanditiis sed.', 4, '2020-05-03 12:49:24', '2020-05-03 12:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
CREATE TABLE IF NOT EXISTS `markets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci,
  `admin_commission` double(8,2) DEFAULT '0.00',
  `delivery_fee` double(8,2) DEFAULT '0.00',
  `delivery_range` double(8,2) DEFAULT '0.00',
  `default_tax` double(8,2) DEFAULT '0.00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `available_for_delivery` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `markets`
--

TRUNCATE TABLE `markets`;
--
-- Dumping data for table `markets`
--

INSERT INTO `markets` (`id`, `name`, `description`, `address`, `latitude`, `longitude`, `phone`, `mobile`, `information`, `admin_commission`, `delivery_fee`, `delivery_range`, `default_tax`, `closed`, `available_for_delivery`, `created_at`, `updated_at`) VALUES
(1, 'Mall Breitenberg, Bernier and Hessel', 'Eveniet ipsam aut veniam nam. Dolorum dolorem enim facere iure officiis consequatur. Et enim perspiciatis nulla ipsa unde eos fugit.', '218 Lang Orchard\nMoorefort, MT 54811-4372', '43.251671', '7.193782', '(328) 849-6987', '379-322-7980 x598', 'Exercitationem cupiditate omnis animi quam est consequatur. Nihil sed aliquid eveniet dolor voluptate nihil quo. Distinctio harum minima eaque tempora qui porro.', 14.51, 8.19, 36.63, 13.04, 0, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(2, 'Grocery Ziemann, McDermott and Goyette', 'Error quas ut dolores omnis est. Eveniet et accusantium dolores quidem est. Enim sed consequatur consequatur id nulla. Sed tempora cumque qui officiis nostrum ea dicta.', '715 Connelly Ridge\nAbshiremouth, WV 80143', '41.094609', '10.65616', '262.606.2247', '(596) 615-5149 x4545', 'Distinctio qui unde omnis ea rerum cupiditate. Quod possimus voluptas et est doloribus fugiat provident. Minus sapiente non ea quos.', 18.81, 1.52, 96.25, 5.91, 1, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(3, 'Pharmacy Jacobson, Wolf and Crona', 'Eligendi minima ducimus blanditiis laborum sunt autem. Quia necessitatibus aut quidem et at ut. Atque qui aspernatur in. Non ut qui neque enim iusto.', '572 Hessel Meadows\nLake Mikaylaton, ME 98900-5486', '44.835037', '11.261691', '+1-984-312-1674', '837-935-0065 x1398', 'Dolores sapiente ut vel. Hic est nihil vitae et error possimus sint. Omnis fugiat reprehenderit inventore suscipit est reiciendis veniam.', 25.07, 5.14, 98.81, 20.74, 0, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(4, 'Pharmacy Hessel, Abernathy and Pouros', 'Ea odit quia quasi beatae est. Vel voluptatem natus modi voluptatem ad. Et possimus libero et laudantium sit excepturi qui ad. Quibusdam sit culpa numquam laudantium exercitationem modi fugit.', '57825 Duane Bridge Apt. 948\nSouth Cristina, AK 34560', '51.071237', '10.96726', '+1-249-918-8193', '1-308-286-2034 x306', 'Ipsum necessitatibus eveniet aut voluptatum placeat tempora vel. Accusantium eum ad sunt eius earum quo nihil. Et eos at culpa eius.', 32.43, 1.70, 43.33, 22.00, 1, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(5, 'Mall Kiehn-Parker', 'Vel culpa non et eligendi deleniti iusto omnis. Qui maiores laboriosam veniam. Ratione dolorem consequuntur enim impedit possimus praesentium reprehenderit.', '719 Alex Island\nPort Katelynn, DC 17537-7432', '46.749174', '8.707638', '1-424-427-1128', '(895) 907-2062', 'Dicta recusandae quia eos corrupti. Ut quo incidunt earum. Quas aut placeat eius quos facilis animi velit.', 32.29, 9.15, 32.98, 27.14, 1, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(6, 'Furniture Cruickshank Ltd', 'Aut et et magni vel eum sunt. Tempora dolorem consequatur delectus sint consequatur. Nemo provident doloremque ad aliquam.', '4545 Israel Parkway\nO\'Konborough, VA 83761-2354', '44.172063', '9.391737', '+1-681-685-4166', '1-590-773-1061 x282', 'In aut rem ducimus non totam modi minus eaque. Ut modi illo ea dolor esse sequi cupiditate. Eaque deleniti odio accusantium quidem vitae alias alias incidunt.', 35.31, 7.34, 53.57, 28.01, 1, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(7, 'Shop Gulgowski Group', 'Ut aut qui totam ab accusamus illo rem. Sed qui eum ea fugiat repellat ad. Perferendis sint omnis quibusdam.', '710 Susanna Springs Apt. 343\nStantonton, WY 07751', '47.557814', '11.870734', '658-224-4579 x9252', '1-486-466-8684 x305', 'Laborum quia laborum est mollitia delectus est sit. Natus dolorem enim quis consequatur odit id repudiandae. Vitae ut officia explicabo rerum et eum consequatur voluptas.', 13.65, 5.28, 89.60, 24.24, 1, 0, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(8, 'Grocery Upton and Sons', 'Et rerum quia quisquam quo. Aperiam hic rerum voluptate distinctio consequatur ad. Explicabo sit enim corporis est et ut.', '16937 Betty Place\nEmmittville, NC 74844-0653', '54.643233', '9.181556', '(727) 260-0229 x9105', '679.587.5067', 'Veniam optio quibusdam sint odio et. Quibusdam blanditiis qui quibusdam consectetur voluptatem quod. Rerum porro dicta repudiandae assumenda consequatur.', 38.18, 5.61, 13.08, 29.45, 1, 0, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(9, 'Furniture Satterfield-Cassin', 'Sed perferendis porro porro soluta quae vel quia. Mollitia tempora iste molestiae accusamus qui.', '65947 General Wells Suite 476\nLake Mathildebury, UT 55889', '51.4564', '8.000142', '1-846-653-3739', '667.560.2074', 'Omnis nobis pariatur enim fugit culpa id. Quaerat aut placeat illum officia ratione. Ea sed impedit sint ducimus dolores unde.', 37.86, 4.50, 10.61, 24.62, 0, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22'),
(10, 'Grocery Moore LLC', 'Cumque saepe aut est sit. Distinctio maiores in hic hic. Vel quam nisi aut dolores aut voluptatum. Beatae nihil provident quae quis.', '10185 Lorine Heights Suite 244\nLake Vaughnland, AZ 92678-1884', '47.067646', '10.290949', '(849) 370-8260', '446.766.7170 x944', 'Deleniti natus fugiat impedit vero est suscipit. Esse commodi et ut aut. Unde rerum numquam id debitis sit accusamus maxime.', 30.45, 8.41, 22.03, 21.88, 1, 1, '2020-05-03 12:49:22', '2020-05-03 12:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `markets_payouts`
--

DROP TABLE IF EXISTS `markets_payouts`;
CREATE TABLE IF NOT EXISTS `markets_payouts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `market_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(9,2) NOT NULL DEFAULT '0.00',
  `paid_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `markets_payouts_market_id_foreign` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `markets_payouts`
--

TRUNCATE TABLE `markets_payouts`;
-- --------------------------------------------------------

--
-- Table structure for table `market_fields`
--

DROP TABLE IF EXISTS `market_fields`;
CREATE TABLE IF NOT EXISTS `market_fields` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `market_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`field_id`,`market_id`),
  KEY `market_fields_market_id_foreign` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `market_fields`
--

TRUNCATE TABLE `market_fields`;
--
-- Dumping data for table `market_fields`
--

INSERT INTO `market_fields` (`field_id`, `market_id`) VALUES
(1, 7),
(1, 9),
(2, 1),
(2, 2),
(2, 7),
(3, 2),
(3, 6),
(4, 1),
(4, 3),
(5, 8),
(5, 10),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `market_reviews`
--

DROP TABLE IF EXISTS `market_reviews`;
CREATE TABLE IF NOT EXISTS `market_reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `market_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `market_reviews_user_id_foreign` (`user_id`),
  KEY `market_reviews_market_id_foreign` (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `market_reviews`
--

TRUNCATE TABLE `market_reviews`;
--
-- Dumping data for table `market_reviews`
--

INSERT INTO `market_reviews` (`id`, `review`, `rate`, `user_id`, `market_id`, `created_at`, `updated_at`) VALUES
(1, 'Footman, \'and that for two Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the party sat silent and looked anxiously round, to make it stop. \'Well, I\'d hardly finished the.', 4, 2, 5, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(2, 'Mock Turtle. \'And how many hours a day or two: wouldn\'t it be of any use, now,\' thought poor Alice, and looking at the top of his pocket, and pulled out a box of comfits, (luckily the salt water had.', 5, 4, 7, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(3, 'And he added in a thick wood. \'The first thing she heard a voice outside, and stopped to listen. The Fish-Footman began by producing from under his arm a great deal to ME,\' said the Duchess. \'I make.', 5, 6, 6, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(4, 'Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Then you shouldn\'t talk,\' said the Dodo said, \'EVERYBODY has won, and all of them didn\'t know how to spell \'stupid,\' and that is enough,\' Said his.', 1, 4, 10, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(5, 'Puss,\' she began, in a great hurry. \'You did!\' said the King, \'that saves a world of trouble, you know, and he went on again:-- \'I didn\'t write it, and on both sides of it; and as Alice could bear.', 4, 2, 8, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(6, 'Alice thought to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t take more.\' \'You mean you can\'t help it,\' said Alice angrily. \'It wasn\'t very civil of you to set them.', 2, 3, 4, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(7, 'The Hatter opened his eyes. \'I wasn\'t asleep,\' he said in a twinkling! Half-past one, time for dinner!\' (\'I only wish they COULD! I\'m sure I can\'t understand it myself to begin lessons: you\'d only.', 4, 1, 2, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(8, 'Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice began to cry again, for she felt unhappy. \'It was much pleasanter at home,\' thought poor Alice, \'to speak to this mouse? Everything is so.', 2, 6, 9, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(9, 'Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not like the three gardeners, but she stopped hastily, for the immediate adoption of more broken glass.) \'Now tell me.', 1, 6, 6, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(10, 'HIS time of life. The King\'s argument was, that her neck from being broken. She hastily put down yet, before the trial\'s over!\' thought Alice. One of the song, perhaps?\' \'I\'ve heard something like.', 4, 3, 5, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(11, 'Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat in a fight with another dig of her ever.', 2, 2, 1, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(12, 'Dormouse say?\' one of them attempted to explain it is I hate cats and dogs.\' It was the BEST butter, you know.\' He was an uncomfortably sharp chin. However, she did not notice this question, but.', 5, 3, 3, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(13, 'Cat, and vanished again. Alice waited patiently until it chose to speak again. The Mock Turtle replied in an offended tone. And the moral of that is--\"Birds of a treacle-well--eh, stupid?\' \'But they.', 5, 1, 7, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(14, 'He says it kills all the players, except the Lizard, who seemed ready to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the house of the Shark, But, when the Rabbit began.', 3, 4, 5, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(15, 'Alice thought she had nothing else to do, and in another moment down went Alice like the look of things at all, as the jury asked. \'That I can\'t tell you more than three.\' \'Your hair wants cutting,\'.', 2, 2, 6, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(16, 'Duchess. An invitation from the time it vanished quite slowly, beginning with the strange creatures of her ever getting out of a globe of goldfish she had known them all her wonderful Adventures.', 4, 3, 2, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(17, 'Wonderland of long ago: and how she would keep, through all her coaxing. Hardly knowing what she was getting very sleepy; \'and they drew all manner of things--everything that begins with a sigh: \'he.', 5, 6, 8, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(18, 'I THINK,\' said Alice. \'Come on, then,\' said the Duchess, who seemed ready to agree to everything that Alice could only see her. She is such a dear little puppy it was!\' said Alice, \'we learned.', 5, 3, 9, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(19, 'Cheshire Cat sitting on a three-legged stool in the air: it puzzled her a good deal to ME,\' said Alice loudly. \'The idea of the cupboards as she could, \'If you can\'t swim, can you?\' he added.', 5, 6, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(20, 'SHE, of course,\' the Mock Turtle went on. \'We had the best plan.\' It sounded an excellent plan, no doubt, and very angrily. \'A knot!\' said Alice, who was gently brushing away some dead leaves that.', 4, 5, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `media`
--

TRUNCATE TABLE `media`;
-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_29_213820_create_fields_table', 1),
(10, '2019_08_29_213821_create_markets_table', 1),
(11, '2019_08_29_213822_create_categories_table', 1),
(12, '2019_08_29_213826_create_option_groups_table', 1),
(13, '2019_08_29_213829_create_faq_categories_table', 1),
(14, '2019_08_29_213833_create_order_statuses_table', 1),
(15, '2019_08_29_213837_create_products_table', 1),
(16, '2019_08_29_213838_create_options_table', 1),
(17, '2019_08_29_213842_create_galleries_table', 1),
(18, '2019_08_29_213847_create_product_reviews_table', 1),
(19, '2019_08_29_213921_create_payments_table', 1),
(20, '2019_08_29_213922_create_delivery_addresses_table', 1),
(21, '2019_08_29_213926_create_faqs_table', 1),
(22, '2019_08_29_213940_create_market_reviews_table', 1),
(23, '2019_08_30_152927_create_favorites_table', 1),
(24, '2019_08_31_111104_create_orders_table', 1),
(25, '2019_09_04_153857_create_carts_table', 1),
(26, '2019_09_04_153858_create_favorite_options_table', 1),
(27, '2019_09_04_153859_create_cart_options_table', 1),
(28, '2019_09_04_153958_create_product_orders_table', 1),
(29, '2019_09_04_154957_create_product_order_options_table', 1),
(30, '2019_09_04_163857_create_user_markets_table', 1),
(31, '2019_10_22_144652_create_currencies_table', 1),
(32, '2019_12_14_134302_create_driver_markets_table', 1),
(33, '2020_03_25_094752_create_drivers_table', 1),
(34, '2020_03_25_094802_create_earnings_table', 1),
(35, '2020_03_25_094809_create_drivers_payouts_table', 1),
(36, '2020_03_25_094817_create_markets_payouts_table', 1),
(37, '2020_03_27_094855_create_notifications_table', 1),
(38, '2020_04_11_135804_create_market_fields_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `model_has_permissions`
--

TRUNCATE TABLE `model_has_permissions`;
-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `model_has_roles`
--

TRUNCATE TABLE `model_has_roles`;
--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `notifications`
--

TRUNCATE TABLE `notifications`;
-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `product_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_product_id_foreign` (`product_id`),
  KEY `options_option_group_id_foreign` (`option_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `options`
--

TRUNCATE TABLE `options`;
--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `product_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '500g', 'Beatae non sit eveniet.', 37.87, 28, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(2, '5L', 'Rerum eos possimus.', 41.17, 10, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(3, 'White', 'Porro neque impedit perspiciatis.', 23.84, 12, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(4, 'XL', 'Aut ut sint quia.', 44.59, 12, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(5, '1Kg', 'Eos repudiandae dolores unde.', 15.93, 8, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(6, '2L', 'Voluptatem quas officiis explicabo.', 40.62, 27, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(7, '1Kg', 'Distinctio iusto esse.', 42.64, 2, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(8, 'Red', 'Ullam voluptatem veritatis.', 37.91, 27, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(9, 'Oil', 'Vero blanditiis id maiores aliquid voluptatem.', 27.17, 28, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(10, 'Green', 'Inventore cumque animi eum voluptatem.', 44.85, 12, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(11, 'L', 'Possimus eos occaecati voluptas.', 45.35, 12, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(12, '2L', 'Recusandae sequi iusto officiis.', 39.08, 19, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(13, 'Red', 'Ut est velit hic dicta.', 39.92, 16, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(14, '5L', 'A nihil accusamus.', 22.05, 28, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(15, 'White', 'Molestiae dolorum modi ut cupiditate.', 28.24, 25, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(16, 'White', 'Voluptate sint repudiandae.', 31.79, 6, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(17, '1Kg', 'Dolorem molestiae earum culpa molestias.', 29.66, 13, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(18, 'Red', 'Quam et molestias necessitatibus.', 32.51, 19, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(19, '5L', 'Pariatur laudantium soluta vel saepe.', 14.91, 27, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(20, '2L', 'Accusantium similique sequi quia dolorem.', 40.06, 2, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(21, '500g', 'Optio nulla illo et.', 11.20, 20, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(22, '5L', 'Dolore minima error.', 12.23, 26, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(23, 'Red', 'In quasi quasi.', 23.71, 28, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(24, '500g', 'Consequatur rerum ipsam sed recusandae.', 24.12, 30, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(25, 'Green', 'Et dolorum quia dolorem nihil.', 16.11, 11, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(26, 'Red', 'Corrupti voluptas et sint soluta excepturi.', 15.42, 30, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(27, 'XL', 'Omnis quo voluptatem consectetur.', 36.71, 9, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(28, '1Kg', 'Architecto illum neque odit animi explicabo.', 49.61, 25, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(29, 'White', 'Debitis aut nam autem eos.', 16.41, 20, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(30, 'Green', 'Eos totam omnis quas.', 31.50, 13, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(31, 'Oil', 'Dolorem iusto id non.', 17.51, 2, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(32, 'L', 'Molestiae cupiditate animi cum nisi.', 46.82, 9, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(33, 'Tomato', 'Aliquam aut doloribus.', 28.58, 28, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(34, '2L', 'Pariatur dicta et sed.', 41.21, 28, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(35, 'Tomato', 'Molestias tenetur nisi pariatur.', 42.79, 24, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(36, 'Red', 'Autem est doloribus laboriosam voluptate.', 40.93, 30, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(37, '5L', 'Autem sed tempore.', 48.37, 1, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(38, 'Green', 'Nulla perspiciatis sint et.', 24.61, 11, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(39, 'Tomato', 'Commodi et ab natus voluptates quis.', 42.25, 8, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(40, 'White', 'Voluptatem beatae ab soluta debitis est.', 18.85, 25, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(41, 'XL', 'Velit pariatur dignissimos.', 30.81, 4, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(42, '1Kg', 'Inventore voluptatem repudiandae.', 26.40, 12, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(43, '1Kg', 'Voluptatem corporis ipsum deleniti sed fugiat.', 36.72, 24, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(44, 'Green', 'Id quis vel in.', 24.47, 10, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(45, 'XL', 'Libero quaerat consectetur occaecati voluptas vel.', 49.71, 2, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(46, '2L', 'Facilis est nihil aut.', 38.75, 22, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(47, 'Tomato', 'Accusamus sunt exercitationem.', 20.13, 28, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(48, 'White', 'Est modi optio ipsa quas maxime.', 10.41, 4, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(49, '2L', 'Nisi maxime vero voluptatem nihil.', 23.48, 14, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(50, 'Green', 'Ut quo aut qui ut.', 43.27, 29, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(51, 'Oil', 'Nihil sunt fugit aut.', 35.72, 30, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(52, '500g', 'Quia esse officiis.', 10.53, 15, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(53, '1Kg', 'Maxime voluptatem hic aut odio.', 46.50, 22, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(54, 'S', 'Ea natus nisi maiores quaerat.', 21.56, 2, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(55, 'Green', 'Dolore in molestiae.', 13.92, 6, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(56, '2L', 'Vero odit quo.', 36.63, 27, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(57, '5L', 'Veniam nisi exercitationem voluptatum qui.', 10.07, 1, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(58, '500g', 'Cupiditate qui enim rerum.', 20.32, 16, 4, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(59, 'XL', 'Nesciunt qui fugit necessitatibus voluptatibus.', 40.00, 15, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(60, '2L', 'In voluptate qui quasi dolore.', 44.24, 8, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(61, 'Tomato', 'Veritatis non deserunt ullam ut.', 36.62, 14, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(62, 'Tomato', 'Necessitatibus nam iusto ea.', 23.99, 16, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(63, 'White', 'Occaecati voluptatibus sunt veniam.', 16.35, 19, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(64, '500g', 'Est voluptatum quis non vitae.', 25.62, 29, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(65, '5L', 'Ab blanditiis consectetur quo harum.', 48.72, 11, 3, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(66, 'Green', 'Cumque temporibus quam.', 13.52, 6, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(67, 'Tomato', 'Laboriosam distinctio ratione perferendis.', 11.72, 4, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(68, 'L', 'Molestiae recusandae non.', 36.07, 18, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(69, 'L', 'Aut cupiditate maxime occaecati vel quo.', 38.51, 14, 2, '2020-05-03 12:49:26', '2020-05-03 12:49:26'),
(70, 'Oil', 'Sed sapiente ut accusamus.', 39.78, 19, 1, '2020-05-03 12:49:26', '2020-05-03 12:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

DROP TABLE IF EXISTS `option_groups`;
CREATE TABLE IF NOT EXISTS `option_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `option_groups`
--

TRUNCATE TABLE `option_groups`;
--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(2, 'Color', '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(3, 'Parfum', '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(4, 'Taste', '2019-10-09 12:26:28', '2019-10-09 12:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `tax` double(5,2) DEFAULT '0.00',
  `delivery_fee` double(5,2) DEFAULT '0.00',
  `hint` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `driver_id` int(10) UNSIGNED DEFAULT NULL,
  `delivery_address_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_driver_id_foreign` (`driver_id`),
  KEY `orders_delivery_address_id_foreign` (`delivery_address_id`),
  KEY `orders_payment_id_foreign` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `orders`
--

TRUNCATE TABLE `orders`;
-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `order_statuses`
--

TRUNCATE TABLE `order_statuses`;
--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Order Received', '2019-08-30 15:39:28', '2019-10-15 17:03:14'),
(2, 'Preparing', '2019-10-15 17:03:50', '2019-10-15 17:03:50'),
(3, 'Ready', '2019-10-15 17:04:30', '2019-10-15 17:04:30'),
(4, 'On the Way', '2019-10-15 17:04:13', '2019-10-15 17:04:13'),
(5, 'Delivered', '2019-10-15 17:04:30', '2019-10-15 17:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `payments`
--

TRUNCATE TABLE `payments`;
-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `permissions`
--

TRUNCATE TABLE `permissions`;
--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'users.profile', 'web', '2020-03-29 13:58:02', '2020-03-29 13:58:02', NULL),
(2, 'dashboard', 'web', '2020-03-29 13:58:02', '2020-03-29 13:58:02', NULL),
(3, 'medias.create', 'web', '2020-03-29 13:58:02', '2020-03-29 13:58:02', NULL),
(4, 'medias.delete', 'web', '2020-03-29 13:58:02', '2020-03-29 13:58:02', NULL),
(5, 'medias', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(6, 'permissions.index', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(7, 'permissions.edit', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(8, 'permissions.update', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(9, 'permissions.destroy', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(10, 'roles.index', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(11, 'roles.edit', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(12, 'roles.update', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(13, 'roles.destroy', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(14, 'customFields.index', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(15, 'customFields.create', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(16, 'customFields.store', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(17, 'customFields.show', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(18, 'customFields.edit', 'web', '2020-03-29 13:58:03', '2020-03-29 13:58:03', NULL),
(19, 'customFields.update', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(20, 'customFields.destroy', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(21, 'users.login-as-user', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(22, 'users.index', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(23, 'users.create', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(24, 'users.store', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(25, 'users.show', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(26, 'users.edit', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(27, 'users.update', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(28, 'users.destroy', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(29, 'app-settings', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(30, 'markets.index', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(31, 'markets.create', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(32, 'markets.store', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(33, 'markets.edit', 'web', '2020-03-29 13:58:04', '2020-03-29 13:58:04', NULL),
(34, 'markets.update', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(35, 'markets.destroy', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(36, 'categories.index', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(37, 'categories.create', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(38, 'categories.store', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(39, 'categories.edit', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(40, 'categories.update', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(41, 'categories.destroy', 'web', '2020-03-29 13:58:05', '2020-03-29 13:58:05', NULL),
(42, 'faqCategories.index', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(43, 'faqCategories.create', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(44, 'faqCategories.store', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(45, 'faqCategories.edit', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(46, 'faqCategories.update', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(47, 'faqCategories.destroy', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(48, 'orderStatuses.index', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(49, 'orderStatuses.show', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(50, 'orderStatuses.edit', 'web', '2020-03-29 13:58:06', '2020-03-29 13:58:06', NULL),
(51, 'orderStatuses.update', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(52, 'products.index', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(53, 'products.create', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(54, 'products.store', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(55, 'products.edit', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(56, 'products.update', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(57, 'products.destroy', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(58, 'galleries.index', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(59, 'galleries.create', 'web', '2020-03-29 13:58:07', '2020-03-29 13:58:07', NULL),
(60, 'galleries.store', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(61, 'galleries.edit', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(62, 'galleries.update', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(63, 'galleries.destroy', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(64, 'productReviews.index', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(65, 'productReviews.create', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(66, 'productReviews.store', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(67, 'productReviews.edit', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(68, 'productReviews.update', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(69, 'productReviews.destroy', 'web', '2020-03-29 13:58:08', '2020-03-29 13:58:08', NULL),
(76, 'options.index', 'web', '2020-03-29 13:58:09', '2020-03-29 13:58:09', NULL),
(77, 'options.create', 'web', '2020-03-29 13:58:09', '2020-03-29 13:58:09', NULL),
(78, 'options.store', 'web', '2020-03-29 13:58:09', '2020-03-29 13:58:09', NULL),
(79, 'options.show', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(80, 'options.edit', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(81, 'options.update', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(82, 'options.destroy', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(83, 'payments.index', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(84, 'payments.show', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(85, 'payments.update', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(86, 'faqs.index', 'web', '2020-03-29 13:58:10', '2020-03-29 13:58:10', NULL),
(87, 'faqs.create', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(88, 'faqs.store', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(89, 'faqs.edit', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(90, 'faqs.update', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(91, 'faqs.destroy', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(92, 'marketReviews.index', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(93, 'marketReviews.create', 'web', '2020-03-29 13:58:11', '2020-03-29 13:58:11', NULL),
(94, 'marketReviews.store', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(95, 'marketReviews.edit', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(96, 'marketReviews.update', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(97, 'marketReviews.destroy', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(98, 'favorites.index', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(99, 'favorites.create', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(100, 'favorites.store', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(101, 'favorites.edit', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(102, 'favorites.update', 'web', '2020-03-29 13:58:12', '2020-03-29 13:58:12', NULL),
(103, 'favorites.destroy', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(104, 'orders.index', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(105, 'orders.create', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(106, 'orders.store', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(107, 'orders.show', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(108, 'orders.edit', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(109, 'orders.update', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(110, 'orders.destroy', 'web', '2020-03-29 13:58:13', '2020-03-29 13:58:13', NULL),
(111, 'notifications.index', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(112, 'notifications.show', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(113, 'notifications.destroy', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(114, 'carts.index', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(115, 'carts.edit', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(116, 'carts.update', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(117, 'carts.destroy', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(118, 'currencies.index', 'web', '2020-03-29 13:58:14', '2020-03-29 13:58:14', NULL),
(119, 'currencies.create', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(120, 'currencies.store', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(121, 'currencies.edit', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(122, 'currencies.update', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(123, 'currencies.destroy', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(124, 'deliveryAddresses.index', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(125, 'deliveryAddresses.create', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(126, 'deliveryAddresses.store', 'web', '2020-03-29 13:58:15', '2020-03-29 13:58:15', NULL),
(127, 'deliveryAddresses.edit', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(128, 'deliveryAddresses.update', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(129, 'deliveryAddresses.destroy', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(130, 'drivers.index', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(131, 'drivers.create', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(132, 'drivers.store', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(133, 'drivers.show', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(134, 'drivers.edit', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(135, 'drivers.update', 'web', '2020-03-29 13:58:16', '2020-03-29 13:58:16', NULL),
(136, 'drivers.destroy', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(137, 'earnings.index', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(138, 'earnings.create', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(139, 'earnings.store', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(140, 'earnings.show', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(141, 'earnings.edit', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(142, 'earnings.update', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(143, 'earnings.destroy', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(144, 'driversPayouts.index', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(145, 'driversPayouts.create', 'web', '2020-03-29 13:58:17', '2020-03-29 13:58:17', NULL),
(146, 'driversPayouts.store', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(147, 'driversPayouts.show', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(148, 'driversPayouts.edit', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(149, 'driversPayouts.update', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(150, 'driversPayouts.destroy', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(151, 'marketsPayouts.index', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(152, 'marketsPayouts.create', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(153, 'marketsPayouts.store', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(154, 'marketsPayouts.show', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(155, 'marketsPayouts.edit', 'web', '2020-03-29 13:58:18', '2020-03-29 13:58:18', NULL),
(156, 'marketsPayouts.update', 'web', '2020-03-29 13:58:19', '2020-03-29 13:58:19', NULL),
(157, 'marketsPayouts.destroy', 'web', '2020-03-29 13:58:19', '2020-03-29 13:58:19', NULL),
(158, 'permissions.create', 'web', '2020-03-29 13:59:15', '2020-03-29 13:59:15', NULL),
(159, 'permissions.store', 'web', '2020-03-29 13:59:15', '2020-03-29 13:59:15', NULL),
(160, 'permissions.show', 'web', '2020-03-29 13:59:15', '2020-03-29 13:59:15', NULL),
(161, 'roles.create', 'web', '2020-03-29 13:59:15', '2020-03-29 13:59:15', NULL),
(162, 'roles.store', 'web', '2020-03-29 13:59:15', '2020-03-29 13:59:15', NULL),
(163, 'roles.show', 'web', '2020-03-29 13:59:16', '2020-03-29 13:59:16', NULL),
(164, 'fields.index', 'web', '2020-04-11 14:04:39', '2020-04-11 14:04:39', NULL),
(165, 'fields.create', 'web', '2020-04-11 14:04:39', '2020-04-11 14:04:39', NULL),
(166, 'fields.store', 'web', '2020-04-11 14:04:39', '2020-04-11 14:04:39', NULL),
(167, 'fields.edit', 'web', '2020-04-11 14:04:39', '2020-04-11 14:04:39', NULL),
(168, 'fields.update', 'web', '2020-04-11 14:04:39', '2020-04-11 14:04:39', NULL),
(169, 'fields.destroy', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(170, 'optionGroups.index', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(171, 'optionGroups.create', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(172, 'optionGroups.store', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(173, 'optionGroups.edit', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(174, 'optionGroups.update', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL),
(175, 'optionGroups.destroy', 'web', '2020-04-11 14:04:40', '2020-04-11 14:04:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` double(8,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `capacity` double(9,2) DEFAULT '0.00',
  `package_items_count` double(9,2) DEFAULT '0.00',
  `unit` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `deliverable` tinyint(1) DEFAULT '1',
  `market_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_market_id_foreign` (`market_id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `products`
--

TRUNCATE TABLE `products`;
--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `discount_price`, `description`, `capacity`, `package_items_count`, `unit`, `featured`, `deliverable`, `market_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Cookie', 32.22, 24.92, 'Porro sit soluta iste molestiae recusandae qui quidem. Veniam iure minima at nesciunt architecto consequatur hic. Laboriosam rerum ipsum atque repellendus consectetur illum.', 126.26, 5.00, 'g', 1, 0, 7, 1, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(2, 'Onion', 28.91, 0.00, 'Laborum porro eum sed est possimus dolor atque. Nemo quae error quam aliquam modi perferendis et. Laborum vel quia voluptatem officiis.', 455.30, 4.00, 'L', 1, 1, 1, 5, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(3, 'Spaghetti', 42.74, 38.65, 'Dolorum voluptates quaerat eos nihil cumque voluptates possimus velit. Omnis sit impedit cumque doloremque vero aliquam eligendi enim. Qui beatae nam soluta reiciendis.', 435.78, 3.00, 'L', 1, 0, 8, 1, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(4, 'Pasta', 38.04, 33.68, 'Nam nihil et quos blanditiis. Similique et quae et sunt. Consequuntur nesciunt quo in iste rerum nisi modi.', 431.33, 2.00, 'm', 0, 0, 9, 6, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(5, 'Acarbose', 27.95, 0.00, 'Sit qui blanditiis commodi ut dolorem. Et mollitia ut ea odit. Officia neque sed doloremque. Et esse ratione quo rerum porro et. Quas est velit et ratione molestiae eaque.', 393.56, 1.00, 'g', 1, 1, 4, 2, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(6, 'Salt', 30.47, 0.00, 'Doloribus molestiae eaque magni eaque. Sint ipsum adipisci molestiae optio ratione quae tempora. Sit est ut nemo odit autem cupiditate quia. Quis est cupiditate optio dolor harum et.', 154.49, 1.00, 'Kg', 0, 0, 5, 3, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(7, 'Eggs', 14.80, 8.25, 'Vel eos et velit deleniti quia aperiam officia quod. Nihil nulla eos aspernatur voluptatem ut. Praesentium eum consequatur id ea magni voluptatibus id.', 139.18, 4.00, 'm', 0, 1, 8, 2, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(8, 'Onion', 26.71, 17.38, 'Iusto quo necessitatibus unde accusamus debitis. Ipsam magnam voluptate tempora ut reiciendis. Minima nobis quis ut a recusandae.', 200.45, 3.00, 'ml', 0, 0, 5, 4, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(9, 'Milk', 23.19, 18.74, 'Qui et nisi unde rerum vero distinctio perferendis. Impedit fugit autem nulla deserunt. Et aspernatur blanditiis molestias voluptatem dolor. Nesciunt et incidunt tenetur error reiciendis vitae.', 194.58, 4.00, 'ml', 1, 0, 3, 6, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(10, 'Vinegar', 44.30, 0.00, 'Omnis vel dolore sapiente assumenda vero. Laborum consequatur consectetur ex sit velit laborum dolorum. Id voluptatem voluptatum blanditiis quae repellendus dolores vel.', 268.07, 6.00, 'Oz', 0, 0, 3, 1, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(11, 'Bread', 15.24, 0.00, 'Laboriosam culpa iure consequatur optio repudiandae ipsam. Aut aut sint hic ratione porro ex. Magnam quibusdam ut qui vel enim. Commodi aut tempora animi esse rerum illo.', 37.33, 2.00, 'Kg', 0, 0, 6, 5, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(12, 'Cupcake', 30.64, 23.34, 'Voluptatem sed qui eligendi omnis optio qui. Molestiae est tempore enim enim quis incidunt consequatur optio. Eveniet autem nemo dolores accusantium tempore accusantium voluptatem.', 114.66, 4.00, 'm²', 1, 0, 5, 1, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(13, 'Cupcake', 21.56, 0.00, 'Voluptas placeat eum voluptas possimus. Soluta ut enim fugit eligendi cupiditate deleniti nisi. Reiciendis quisquam possimus vitae qui dolorem omnis illum. Odit ut quia assumenda ex natus saepe.', 269.91, 2.00, 'Oz', 0, 1, 7, 2, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(14, 'Fish', 21.76, 0.00, 'Placeat qui odit repellat sapiente. Aut quia saepe sint voluptatum esse alias vel sit. Dolores illum saepe doloremque dolores dignissimos voluptates iure.', 346.80, 2.00, 'L', 0, 0, 8, 1, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(15, 'Rice', 17.76, 11.49, 'Recusandae voluptate aut quaerat possimus officiis aliquid quia. Provident facere in molestiae nobis expedita animi. Aut voluptate voluptatibus eos quis delectus occaecati quia mollitia.', 233.83, 2.00, 'Oz', 0, 1, 1, 4, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(16, 'Cupcake', 27.77, 20.80, 'Aut enim temporibus assumenda et et. Dicta animi cumque ea eos ipsam. Optio quod corrupti debitis suscipit. Voluptatum illum minus qui.', 359.82, 5.00, 'Kg', 0, 0, 3, 3, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(17, 'Spaghetti', 41.97, 0.00, 'Et cupiditate sit fugit quia magnam. Eum aut aut at accusamus at. Repellat accusamus neque similique eaque consequatur cupiditate.', 281.69, 5.00, 'Kg', 0, 1, 2, 3, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(18, 'Honey', 44.41, 35.77, 'Et iste nemo officia. Quasi quis omnis esse ducimus ut dolor. Dolorem quaerat laboriosam doloremque neque libero. Rerum fuga natus dolorem soluta id et qui quia.', 117.71, 6.00, 'L', 1, 0, 1, 5, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(19, 'Steak', 46.76, 0.00, 'Debitis dolor ut explicabo aut aut ratione amet laudantium. Dolorem nobis delectus enim itaque esse rem eius. Ut quidem eius neque.', 174.81, 1.00, 'm²', 0, 0, 3, 5, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(20, 'Eggs', 30.19, 0.00, 'Commodi possimus quo et cumque. Iusto suscipit labore dolorum architecto repellat. Totam sapiente omnis sed velit.', 218.70, 6.00, 'm²', 0, 1, 8, 3, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(21, 'Soup', 43.04, 34.27, 'Soluta amet incidunt delectus voluptatem aut rerum veritatis iusto. Culpa iusto fugiat assumenda sint architecto. Accusamus ducimus est inventore reprehenderit qui vero et.', 115.19, 2.00, 'm²', 1, 0, 3, 2, '2020-05-03 12:49:23', '2020-05-03 12:49:23'),
(22, 'Spaghetti', 11.66, 0.00, 'Recusandae sit et consequatur delectus dolores excepturi vel. Maiores doloremque quia doloribus dolor ipsam doloremque incidunt tempora.', 412.20, 3.00, 'ml', 0, 1, 1, 6, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(23, 'Soup', 12.17, 0.00, 'Maxime reiciendis iste ipsam sit. Sit omnis ex voluptas et fugiat iste consectetur. Aut aut dolores cumque officiis accusamus. Sint impedit cupiditate nemo temporibus.', 130.43, 4.00, 'm', 0, 0, 3, 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(24, 'Sugar', 31.17, 0.00, 'Dolores pariatur enim explicabo earum in rerum. Aut sed quaerat rem rem unde quia. Provident provident enim reiciendis doloribus.', 34.54, 1.00, 'L', 0, 0, 4, 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(25, 'Salad', 27.20, 21.83, 'Deserunt quos et ut architecto nisi. Sunt enim veniam excepturi eaque suscipit. Rem enim est et autem possimus incidunt. Rem modi aspernatur ut quia molestias impedit. Autem et nobis qui et.', 97.99, 3.00, 'm²', 1, 1, 9, 1, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(26, 'Rice', 15.45, 0.00, 'Sequi iusto et est qui deleniti non. Facere consequatur atque deleniti. Sequi recusandae nemo eos consequuntur quia. Dicta architecto quas animi voluptatibus dolorem perferendis recusandae sed.', 313.17, 5.00, 'ml', 0, 1, 6, 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(27, 'Cupcake', 29.60, 0.00, 'Consectetur et recusandae ut facere quod consequatur. Qui dignissimos consectetur quia aliquid.', 315.18, 5.00, 'm²', 0, 0, 2, 3, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(28, 'Acarbose', 28.06, 18.38, 'Corporis neque quia similique at voluptatibus in. Sunt ut eveniet rerum unde facere. Voluptatem non deserunt voluptatem ipsum. Deleniti quo recusandae saepe.', 386.59, 5.00, 'm', 0, 0, 6, 6, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(29, 'Vinegar', 16.24, 12.92, 'Fugiat odit sit officia eum id aut molestiae. Sit repudiandae ad cumque minus.', 273.16, 2.00, 'ml', 0, 0, 5, 4, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(30, 'Pasta', 48.02, 42.96, 'Incidunt sed omnis rem non nesciunt porro quo. Autem praesentium iusto porro earum est et consectetur. Hic sint aut porro atque blanditiis ducimus.', 102.86, 1.00, 'g', 1, 1, 1, 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(31, 'Pasta', 11.09, 7.79, 'Voluptatem consequatur esse consectetur. Ab qui necessitatibus assumenda cumque hic vel. Id nam sint dignissimos qui omnis et.', 306.34, 5.00, 'm²', 0, 0, 7, 4, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(32, 'Tuna steak', 38.42, 0.00, 'Quos eveniet ut iste accusamus assumenda. Ea rerum minima illum eligendi. Omnis aut voluptatem minus autem ea aspernatur reiciendis. Commodi eum minima consequuntur qui earum est eos.', 492.29, 5.00, 'g', 0, 1, 10, 5, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(33, 'Honey', 32.07, 26.87, 'Et quo quos rem omnis. Dolorem explicabo tempora eius ea. Repudiandae autem eveniet nesciunt atque ducimus eaque labore.', 468.97, 1.00, 'm', 1, 0, 10, 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(34, 'Fish', 24.55, 0.00, 'Assumenda natus asperiores sed. Animi rerum sapiente doloribus. Labore laudantium ut quia consequatur ut nobis quidem molestiae. Incidunt qui ut expedita labore.', 34.39, 6.00, 'g', 0, 0, 3, 2, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(35, 'Steak', 13.61, 6.27, 'Sed dolor sint praesentium dolore in accusamus totam. Atque sit vel animi quibusdam neque inventore. Ducimus beatae delectus exercitationem saepe ut velit distinctio.', 192.78, 4.00, 'ml', 1, 0, 1, 3, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(36, 'Cookie', 47.62, 39.06, 'Qui quas accusamus sed. Maiores quibusdam voluptas sed expedita autem ad quod et. Fugiat occaecati numquam dicta.', 254.22, 4.00, 'L', 1, 0, 3, 1, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(37, 'Eggs', 29.05, 0.00, 'Reiciendis temporibus fugit aut tempora repellendus. Ut ut numquam qui. Quia voluptatibus qui vel.', 126.47, 1.00, 'L', 1, 0, 10, 4, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(38, 'Steak', 29.24, 0.00, 'Qui quis rerum animi sit placeat. Excepturi quia in eos excepturi deserunt odit qui sapiente. Expedita voluptatum aut alias beatae autem voluptatem.', 221.28, 4.00, 'm', 1, 0, 5, 3, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(39, 'Sugar', 43.05, 0.00, 'Quas et nesciunt nam et dignissimos. Nemo magni quia qui consequuntur. Explicabo aut ratione pariatur provident dolor. Et blanditiis omnis excepturi porro.', 404.65, 4.00, 'L', 0, 0, 2, 3, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(40, 'Steak', 12.40, 0.00, 'Consectetur et a maxime. Labore sed voluptatum delectus aut repellat et. Sed ut ad quas a qui illum possimus. Facilis odio explicabo ratione sunt at aliquam.', 206.74, 1.00, 'Kg', 1, 1, 1, 6, '2020-05-03 12:49:24', '2020-05-03 12:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
CREATE TABLE IF NOT EXISTS `product_orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_orders_product_id_foreign` (`product_id`),
  KEY `product_orders_order_id_foreign` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `product_orders`
--

TRUNCATE TABLE `product_orders`;
-- --------------------------------------------------------

--
-- Table structure for table `product_order_options`
--

DROP TABLE IF EXISTS `product_order_options`;
CREATE TABLE IF NOT EXISTS `product_order_options` (
  `product_order_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`product_order_id`,`option_id`),
  KEY `product_order_options_option_id_foreign` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `product_order_options`
--

TRUNCATE TABLE `product_order_options`;
-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `product_reviews`
--

TRUNCATE TABLE `product_reviews`;
--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `review`, `rate`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'VERY good opportunity for making her escape; so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of such a tiny little thing!\' It did so indeed, and much sooner than.', 3, 2, 28, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(2, 'Duchess, \'chop off her unfortunate guests to execution--once more the pig-baby was sneezing on the breeze that followed them, the melancholy words:-- \'Soo--oop of the e--e--evening, Beautiful.', 3, 4, 11, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(3, 'I never was so large a house, that she was up to Alice, and sighing. \'It IS a Caucus-race?\' said Alice; \'you needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe.', 4, 6, 12, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(4, 'Alice to find that the poor little feet, I wonder what you\'re doing!\' cried Alice, with a whiting. Now you know.\' \'Not the same thing with you,\' said the March Hare and the poor child, \'for I can\'t.', 4, 3, 19, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(5, 'Duchess replied, in a large plate came skimming out, straight at the end of the cattle in the middle of one! There ought to be seen: she found herself in the sand with wooden spades, then a voice.', 3, 4, 18, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(6, 'The hedgehog was engaged in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the Queen. \'I never was so full of tears, until there was a large plate came skimming out.', 4, 5, 16, '2020-05-03 12:49:24', '2020-05-03 12:49:24'),
(7, 'Pigeon, raising its voice to its feet, \'I move that the mouse doesn\'t get out.\" Only I don\'t know what to say it out into the wood for fear of their hearing her; and the party went back for a minute.', 2, 6, 12, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(8, 'Dinah, and saying \"Come up again, dear!\" I shall have to ask the question?\' said the Mock Turtle, who looked at her, and she at once to eat or drink something or other; but the cook took the.', 4, 3, 8, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(9, 'Hatter opened his eyes were looking up into a doze; but, on being pinched by the officers of the mushroom, and her face in some alarm. This time there could be no sort of a procession,\' thought she.', 3, 5, 15, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(10, 'The cook threw a frying-pan after her as hard as he said do. Alice looked up, and began singing in its hurry to change the subject. \'Go on with the edge of the soldiers shouted in reply. \'Idiot!\'.', 4, 5, 28, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(11, 'Alice; \'it\'s laid for a long and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, and then dipped suddenly down, so suddenly that Alice said; but was dreadfully.', 1, 4, 6, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(12, 'So they couldn\'t see it?\' So she set to work very diligently to write with one eye; \'I seem to see if there are, nobody attends to them--and you\'ve no idea what Latitude or Longitude either, but.', 4, 2, 16, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(13, 'And she began fancying the sort of people live about here?\' \'In THAT direction,\' waving the other paw, \'lives a Hatter: and in his throat,\' said the Mock Turtle yawned and shut his eyes.--\'Tell her.', 3, 5, 17, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(14, 'Gryphon at the stick, and held it out again, so she tried another question. \'What sort of present!\' thought Alice. One of the right-hand bit to try the whole party at once to eat or drink anything.', 3, 6, 13, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(15, 'You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was a paper label, with the grin, which remained some time busily writing in his note-book, cackled.', 1, 2, 8, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(16, 'How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure I\'m not looking for eggs, I know I do!\' said Alice as it was just going to give the hedgehog to, and.', 2, 1, 8, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(17, 'Footman continued in the after-time, be herself a grown woman; and how she would keep, through all her knowledge of history, Alice had not noticed before, and he wasn\'t one?\' Alice asked. \'We called.', 4, 6, 7, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(18, 'BEST butter,\' the March Hare. \'Yes, please do!\' pleaded Alice. \'And be quick about it,\' said the Rabbit coming to look about her any more HERE.\' \'But then,\' thought Alice, \'they\'re sure to kill it.', 3, 3, 9, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(19, 'Fish-Footman was gone, and, by the officers of the jurymen. \'No, they\'re not,\' said the Caterpillar. \'Well, I can\'t see you?\' She was a large piece out of its mouth, and its great eyes half shut.', 3, 5, 30, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(20, 'She said the Hatter, and here the conversation a little. \'\'Tis so,\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the game. CHAPTER IX. The Mock Turtle at.', 4, 5, 28, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(21, 'Majesty,\' said the Footman. \'That\'s the judge,\' she said to the table for it, while the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor child, \'for I never heard it.', 5, 2, 23, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(22, 'Alice to herself, being rather proud of it: \'No room! No room!\' they cried out when they liked, and left foot, so as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * \'Come.', 5, 6, 10, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(23, 'They had not gone far before they saw her, they hurried back to them, they set to partners--\' \'--change lobsters, and retire in same order,\' continued the Hatter, with an anxious look at the door.', 1, 6, 11, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(24, 'And beat him when he sneezes: He only does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' the Hatter began, in a VERY turn-up nose, much more like a star-fish,\'.', 3, 6, 23, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(25, 'Hatter and the pool was getting quite crowded with the bones and the words all coming different, and then added them up, and there was Mystery,\' the Mock Turtle drew a long breath, and said to the.', 4, 1, 3, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(26, 'The cook threw a frying-pan after her as she could, \'If you please, sir--\' The Rabbit Sends in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest.', 5, 4, 21, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(27, 'Dodo could not help bursting out laughing: and when she heard something splashing about in a confused way, \'Prizes! Prizes!\' Alice had never heard it before,\' said Alice,) and round Alice, every now.', 4, 2, 28, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(28, 'Alice; \'but a grin without a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they can\'t prove I did: there\'s no room at all comfortable, and it put more simply--\"Never imagine.', 3, 6, 6, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(29, 'March Hare said--\' \'I didn\'t!\' the March Hare said in a very humble tone, going down on one knee. \'I\'m a poor man,\' the Hatter went on eagerly. \'That\'s enough about lessons,\' the Gryphon went on.', 4, 3, 19, '2020-05-03 12:49:25', '2020-05-03 12:49:25'),
(30, 'Alice whispered to the shore. CHAPTER III. A Caucus-Race and a great thistle, to keep herself from being broken. She hastily put down her flamingo, and began staring at the top with its eyelids, so.', 4, 1, 30, '2020-05-03 12:49:25', '2020-05-03 12:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `roles`
--

TRUNCATE TABLE `roles`;
--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'admin', 'web', 0, '2018-07-21 15:37:56', '2019-09-07 21:42:01', NULL),
(3, 'manager', 'web', 0, '2019-09-07 21:41:38', '2019-09-07 21:41:38', NULL),
(4, 'client', 'web', 1, '2019-09-07 21:41:54', '2019-09-07 21:41:54', NULL),
(5, 'driver', 'web', 0, '2019-12-15 17:50:21', '2019-12-15 17:50:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `role_has_permissions`
--

TRUNCATE TABLE `role_has_permissions`;
--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3),
(6, 2),
(9, 2),
(10, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(26, 2),
(27, 2),
(27, 3),
(27, 4),
(27, 5),
(28, 2),
(29, 2),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(31, 2),
(32, 2),
(33, 2),
(33, 3),
(34, 2),
(34, 3),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 5),
(50, 2),
(51, 2),
(52, 2),
(52, 3),
(52, 4),
(52, 5),
(53, 2),
(53, 3),
(54, 2),
(54, 3),
(55, 2),
(55, 3),
(56, 2),
(56, 3),
(57, 2),
(57, 3),
(58, 2),
(58, 3),
(59, 2),
(59, 3),
(60, 2),
(60, 3),
(61, 2),
(61, 3),
(62, 2),
(62, 3),
(63, 2),
(63, 3),
(64, 2),
(64, 3),
(64, 4),
(64, 5),
(67, 2),
(67, 3),
(67, 4),
(67, 5),
(68, 2),
(68, 3),
(68, 4),
(68, 5),
(69, 2),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(83, 4),
(83, 5),
(85, 2),
(86, 2),
(86, 3),
(86, 4),
(86, 5),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(92, 3),
(92, 4),
(92, 5),
(95, 2),
(95, 3),
(95, 4),
(95, 5),
(96, 2),
(96, 3),
(96, 4),
(96, 5),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(98, 5),
(103, 2),
(103, 3),
(103, 4),
(103, 5),
(104, 2),
(104, 3),
(104, 4),
(104, 5),
(107, 2),
(107, 3),
(107, 4),
(107, 5),
(108, 2),
(108, 3),
(109, 2),
(109, 3),
(110, 2),
(110, 3),
(111, 2),
(111, 3),
(111, 4),
(111, 5),
(112, 2),
(113, 2),
(113, 3),
(113, 4),
(113, 5),
(114, 2),
(114, 3),
(114, 4),
(114, 5),
(117, 2),
(117, 3),
(117, 4),
(117, 5),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(130, 3),
(130, 5),
(131, 2),
(134, 2),
(134, 3),
(135, 2),
(135, 3),
(137, 2),
(137, 3),
(138, 2),
(144, 2),
(144, 5),
(145, 2),
(145, 3),
(145, 5),
(146, 2),
(146, 3),
(146, 5),
(148, 2),
(149, 2),
(151, 2),
(151, 3),
(152, 2),
(152, 3),
(153, 2),
(153, 3),
(155, 2),
(156, 2),
(160, 2),
(164, 2),
(164, 3),
(164, 4),
(164, 5),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(170, 3),
(171, 2),
(171, 3),
(172, 2),
(172, 3),
(173, 2),
(174, 2),
(175, 2);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `uploads`
--

TRUNCATE TABLE `uploads`;
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `braintree_id`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Michael E. Quinn', 'admin@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T4PQhFvBcAA7k02f7ejq4I7z7QKKnvxQLV0oqGnuS6Ktz6FdWULrWrzZ3oYn', '2018-08-06 21:58:41', '2019-09-27 06:49:45'),
(2, 'Barbara J. Glanz', 'manager@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5nysjzVKI4LU92bjRqMUSYdOaIo1EcPC3pIMb6Tcj2KXSUMriGrIQ1iwRdd0', '2018-08-14 16:06:28', '2019-09-25 21:09:35'),
(3, 'Charles W. Abeyta', 'client@demo.com', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V6PIUfd8JdHT2zkraTlnBcRSINZNjz5Ou7N0WtUGRyaTweoaXKpSfij6UhqC', '2019-10-12 21:31:26', '2020-03-29 16:44:30'),
(4, 'Robert E. Brock', 'client1@demo.com', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-15 16:55:39', '2020-03-29 16:59:39'),
(5, 'Sanchez Roberto', 'driver@demo.com', '$2y$10$T/jwzYDJfC8c9CdD5PbpuOKvEXlpv4.RR1jMT0PgIMT.fzeGw67JO', 'OuMsmU903WMcMhzAbuSFtxBekZVdXz66afifRo3YRCINi38jkXJ8rpN0FcfS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-15 17:49:44', '2020-03-29 16:22:10'),
(6, 'John Doe', 'driver1@demo.com', '$2y$10$YF0jCx2WCQtfZOq99hR8kuXsAE0KSnu5OYSomRtI9iCVguXDoDqVm', 'zh9mzfNO2iPtIxj6k4Jpj8flaDyOsxmlGRVUZRnJqOGBr8IuDyhb3cGoncvS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 16:28:04', '2020-03-29 16:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_markets`
--

DROP TABLE IF EXISTS `user_markets`;
CREATE TABLE IF NOT EXISTS `user_markets` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `market_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`market_id`),
  KEY `user_markets_market_id_foreign` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `user_markets`
--

TRUNCATE TABLE `user_markets`;
--
-- Dumping data for table `user_markets`
--

INSERT INTO `user_markets` (`user_id`, `market_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 6),
(2, 3),
(2, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_options`
--
ALTER TABLE `cart_options`
  ADD CONSTRAINT `cart_options_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  ADD CONSTRAINT `drivers_payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_markets`
--
ALTER TABLE `driver_markets`
  ADD CONSTRAINT `driver_markets_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_markets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `markets_payouts`
--
ALTER TABLE `markets_payouts`
  ADD CONSTRAINT `markets_payouts_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_fields`
--
ALTER TABLE `market_fields`
  ADD CONSTRAINT `market_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `market_fields_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_reviews`
--
ALTER TABLE `market_reviews`
  ADD CONSTRAINT `market_reviews_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `market_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_order_options`
--
ALTER TABLE `product_order_options`
  ADD CONSTRAINT `product_order_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_order_options_product_order_id_foreign` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_markets`
--
ALTER TABLE `user_markets`
  ADD CONSTRAINT `user_markets_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `markets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_markets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
