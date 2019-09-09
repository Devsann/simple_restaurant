-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2019 at 06:36 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catSlug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `catSlug`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', 'chicken', '2019-08-26 23:08:12', '2019-08-26 23:08:12'),
(2, 'Vegetables', 'vegetables', '2019-08-26 23:08:12', '2019-08-26 23:08:12'),
(3, 'Meals', 'meals', '2019-08-26 23:08:12', '2019-08-26 23:08:12'),
(4, 'BBQ', 'bbq', '2019-08-26 23:08:12', '2019-08-26 23:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemSlug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `itemSlug`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Item One', 'item-one', 'This is Item One', 232, '1566884336.jpeg', '2019-08-26 23:08:56', '2019-08-26 23:08:56'),
(2, 2, 'Item Two', 'item-two', 'This is Item Two', 343, '1566884361.jpeg', '2019-08-26 23:09:21', '2019-08-26 23:09:21'),
(3, 3, 'Item 3', 'item-3', 'This is Item 3', 434, '1566884396.jpeg', '2019-08-26 23:09:56', '2019-08-26 23:09:56'),
(4, 1, 'Item 4', 'item-4', 'This is Item 4', 542, '1566884417.png', '2019-08-26 23:10:17', '2019-08-26 23:10:17'),
(5, 3, 'Item 5', 'item-5', 'Quay is a progression of rare and beautiful ingredients where texture, flavour and harmony is paramount.\nContinually inspired by nature, the creative process for chef Peter Gilmore begins in working closely with the farmers, fishermen, producers and artisans who cultivate bespoke produce exclusively for Quay. For each dish, the growth of every element and the selection of every ceramic piece is carefully considered and crafted for its role in the dining experience.\nQuay brings a personal, interactive passage for diners through Peter Gilmore’s culinary evolution.', 543, '1566884443.jpeg', '2019-08-26 23:10:44', '2019-08-28 01:51:05'),
(7, 4, 'Item 6', 'item-6', 'Quay is a progression of rare and beautiful ingredients where texture, flavour and harmony is paramount.\nContinually inspired by nature, the creative process for chef Peter Gilmore begins in working closely with the farmers, fishermen, producers and artisans who cultivate bespoke produce exclusively for Quay. For each dish, the growth of every element and the selection of every ceramic piece is carefully considered and crafted for its role in the dining experience.\nQuay brings a personal, interactive passage for diners through Peter Gilmore’s culinary evolution.', 343, '1566884564.jpeg', '2019-08-26 23:12:44', '2019-08-28 01:50:46'),
(8, 3, 'Item 7', 'item-7', 'Quay is a progression of rare and beautiful ingredients where texture, flavour and harmony is paramount.\nContinually inspired by nature, the creative process for chef Peter Gilmore begins in working closely with the farmers, fishermen, producers and artisans who cultivate bespoke produce exclusively for Quay. For each dish, the growth of every element and the selection of every ceramic piece is carefully considered and crafted for its role in the dining experience.\nQuay brings a personal, interactive passage for diners through Peter Gilmore’s culinary evolution.', 432, '1566884595.png', '2019-08-26 23:13:15', '2019-08-28 01:50:30'),
(9, 2, 'Item 8', 'item-8', 'Quay is a progression of rare and beautiful ingredients where texture, flavour and harmony is paramount.\nContinually inspired by nature, the creative process for chef Peter Gilmore begins in working closely with the farmers, fishermen, producers and artisans who cultivate bespoke produce exclusively for Quay. For each dish, the growth of every element and the selection of every ceramic piece is carefully considered and crafted for its role in the dining experience.\nQuay brings a personal, interactive passage for diners through Peter Gilmore’s culinary evolution.', 654, '1566884618.jpeg', '2019-08-26 23:13:38', '2019-08-28 01:49:43'),
(10, 1, 'Item 9', 'item-9', 'Quay is a progression of rare and beautiful ingredients where texture, flavour and harmony is paramount.\nContinually inspired by nature, the creative process for chef Peter Gilmore begins in working closely with the farmers, fishermen, producers and artisans who cultivate bespoke produce exclusively for Quay. For each dish, the growth of every element and the selection of every ceramic piece is carefully considered and crafted for its role in the dining experience.\nQuay brings a personal, interactive passage for diners through Peter Gilmore’s culinary evolution.', 332, '1566884663.jpeg', '2019-08-26 23:14:23', '2019-08-28 01:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(15, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(16, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(17, '2016_06_01_000004_create_oauth_clients_table', 1),
(18, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(19, '2019_08_20_070446_create_categories_table', 1),
(20, '2019_08_21_073251_create_items_table', 1),
(21, '2019_08_29_075744_create_reserves_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_and_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reserves`
--

INSERT INTO `reserves` (`id`, `name`, `phone`, `email`, `date_and_time`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First Request', '099999999', 'frist@gmail.com', '1', 'This is First Request !!!', 0, '2019-08-30 21:43:32', '2019-08-30 21:43:32'),
(2, 'Second Request', '090003332', 'second@gmail.com', '1', 'This is Second Request !!!', 1, '2019-09-02 01:06:12', '2019-09-03 22:46:33'),
(3, 'Third Request', '092222000', 'third@gmail.com', '1', 'This is Third Request !!!', 1, '2019-09-02 01:11:16', '2019-09-02 22:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$qTbmkxcfu6rUKlY/x.ZjYOVwXlPz4lNDNWEY4fRaepJ0W6UiY0Hdq', 'admin', NULL, '1566884215.png', 'yifUo0qdtk2bMz7iJ7q306vyyhPRuQFE20bdWbKIvoFS8q6ALaucHjYnPrLk', '2019-08-26 23:00:09', '2019-08-26 23:06:55'),
(2, 'Singer', 'singer@gmail.com', NULL, '$2y$10$P9/BH2QoU7h3mxu3UT7gsOTXOaYaWjQSftxg1zw0SJQ45v6Gfio.K', 'user', 'sdawefawefaf', 'profile.png', NULL, '2019-08-26 23:04:24', '2019-08-26 23:04:24'),
(3, 'Programmer', 'program@gmail.com', NULL, '$2y$10$olfMQZjM6qB6WgttURh8K.p0ryVkcPM1jQgn1SqmGpoWWnLVCeMsq', 'author', 'This is Programmer', 'profile.png', NULL, '2019-08-26 23:04:59', '2019-08-26 23:04:59'),
(4, 'Developer', 'developer@gmail.com', NULL, '$2y$10$uNKSV15QEiqfAeJ3Nf8TTu1KRiQOErRWfxkv.h1shHI7DPnmHS53.', 'user', 'This is Developer', 'profile.png', NULL, '2019-08-26 23:05:31', '2019-08-26 23:05:31'),
(5, 'Marketing', 'market@gmail.com', NULL, '$2y$10$Mi52FjdvVvXNC/j.uP/P8uw3Bpx.nYnL1SpSgrMc/Yro40GeBkZGW', 'author', 'This is Market Man', 'profile.png', 'TA0YOz65b7TlmZqkO7AZBDf0EqJmyVsI2FDxxpQtQnoTbZOLb7Q4dd794Bzz', '2019-08-26 23:05:55', '2019-08-26 23:05:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserves`
--
ALTER TABLE `reserves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
