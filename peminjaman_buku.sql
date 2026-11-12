-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2026 at 04:24 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `publisher`, `year`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang', 2005, 3, '2026-11-10 00:05:15', '2026-11-10 00:49:55'),
(2, 'Bumi', 'Tere Liye', 'Gramedia', 2014, 2, '2026-11-10 00:05:15', '2026-11-12 06:16:43'),
(3, 'Belajar Laravel', 'Budi Raharjo', 'Informatika', 2023, 4, '2026-11-10 00:05:15', '2026-11-12 06:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('perpustakaan_cache_filament:auth:register:rate_limit:72ab0b2676e23e70eb4742fe84b582cd979c9bb80c6971ef74642864b46562cf', 'i:2;', 1794300642),
('perpustakaan_cache_filament:auth:register:rate_limit:72ab0b2676e23e70eb4742fe84b582cd979c9bb80c6971ef74642864b46562cf:timer', 'i:1794300642;', 1794300642),
('perpustakaan_cache_filament:auth:register:rate_limit:8f12b080543295e864a6a724304b8855c446bbe44d6bbaf082e9f6a428326365', 'i:1;', 1794489498),
('perpustakaan_cache_filament:auth:register:rate_limit:8f12b080543295e864a6a724304b8855c446bbe44d6bbaf082e9f6a428326365:timer', 'i:1794489498;', 1794489498),
('perpustakaan_cache_livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:2;', 1794495403),
('perpustakaan_cache_livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1794495403;', 1794495403),
('perpustakaan_cache_livewire-rate-limiter:9a85c7d25d4828b60e211b83318cc879a9769002', 'i:1;', 1794489498),
('perpustakaan_cache_livewire-rate-limiter:9a85c7d25d4828b60e211b83318cc879a9769002:timer', 'i:1794489498;', 1794489498);

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
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `returned_at` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'dipinjam',
  `fine` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `book_id`, `loan_date`, `due_date`, `returned_at`, `status`, `fine`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2026-11-10', '2026-11-17', NULL, 'dipinjam', 0, '2026-11-10 00:49:55', '2026-11-10 00:49:55'),
(2, 6, 2, '2026-11-12', '2026-11-19', NULL, 'dipinjam', 0, '2026-11-12 06:16:43', '2026-11-12 06:16:43'),
(3, 7, 3, '2026-11-12', '2026-11-19', NULL, 'dipinjam', 0, '2026-11-12 06:17:15', '2026-11-12 06:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_10_074629_create_books_table', 1),
(5, '2026_11_10_074638_create_loans_table', 1);

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
('Icv4LELOajx7Qkw9ZbTKOt0F96gvcmCVFgtqUP6g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVVFWkt0RmI2Z2ZkR0FlYnNsU3lJc2FGY1BsbzZvaXl5YURzam5RMSI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo2NDoiNWFkYWI3ZjA5YTAwODFjY2Q3MDZkZmM3NmVhYmJiOTc3ZjY4OGJkMTZjNmRiYjZhNjBhOGUxZTU5ZDZkZDk0OSI7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5hZG1pbi5hdXRoLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794494591),
('iseEiom6UnwcVOZ5eUt6M9pzDPtg1Ed4A9DL2kzJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVktRVHJIOUFKWmpxNUZVaVJRc0lybGJuenJlU1A3RFFHWDE0TFI4VyI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo2NDoiNjAzZjUwYmNlNWQwMzBjMzMxNzBiZDI2YTJlODE3MDg3YjZjOTcyZTE4ZDJlMGM5ZjM3MjE1MDU4ZjMzZTc2YSI7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5hZG1pbi5hdXRoLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794494519),
('pL6FQePYa7KkOxbAtYk3cXO5m5Gwy3dKzSw6Sf3A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.146.0 Chrome/150.0.7871.250 Electron/43.8.6 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWUMyaWF6eUtjeDRFeGVVQ1Z6Zm0wb1VmZUdGS09TS0phYmNLSDVFMSI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo2NDoiNGY3ZmY5Mzc3MmE3OGUyMjAzMjJiM2RmOTMwZGIxOWFhZjg5NWI0MzY0NjRhN2ExZTE0ZDU0ODlkYmQ3NTYxMCI7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1794489055),
('uNynDyvQKWtdIUtJE1MF0UF9bKyr4cDtjM7egF4o', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 OPR/139.0.0.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRmpBM2VXNW1aQnNZelZkTGZYRTltUE9aRTBRUE1Hc1VUUkdvRGZCbyI7czo4OiJmaWxhbWVudCI7YToyOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo0MDoiWFBuSWhSMTBnRkFWVWw4N2lLWWJUMnZmSkZhV3FyNWVCVkZMRlp2ZyI7fXM6NjoidGFibGVzIjthOjE6e3M6NjQ6IjY1ZjA4ODM2NjE5NWY4NTc5OGU1NTA2YzBiOTE1ZTVhMDAzZmUxNzVjMWVlZDQ3MWJmZjZkNWU3NTRiNjU2MTIiO2E6MTp7czo3OiJjb2x1bW5zIjthOjc6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJ0aXRsZSI7czo1OiJsYWJlbCI7czo1OiJUaXRsZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NjoiYXV0aG9yIjtzOjU6ImxhYmVsIjtzOjY6IkF1dGhvciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToicHVibGlzaGVyIjtzOjU6ImxhYmVsIjtzOjk6IlB1Ymxpc2hlciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoieWVhciI7czo1OiJsYWJlbCI7czo0OiJZZWFyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJzdG9jayI7czo1OiJsYWJlbCI7czo1OiJTdG9jayI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319fX19czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9ib29rcyI7czo1OiJyb3V0ZSI7czozNjoiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLmJvb2tzLmluZGV4Ijt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjJhMDEzNzYyYzE1MmQ4ZjNjY2Q5N2RkODdiMDIyY2ViM2E3MjEwNjRhYWFmYmQ5MmM3Y2UyMTM0MGY4ZGNlMTUiO30=', 1794495352);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'siswa',
  `kelas` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `kelas`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Vlod', 'Vlod2alt@gmail.com', 'siswa', NULL, NULL, '$2y$12$BijdjIVGOOMCaXlGYaJSPeb8/Rfv.CFKquglFxz3siFygxK0CYUii', NULL, '2026-11-09 23:58:57', '2026-11-09 23:58:57'),
(2, 'Admin', 'admin@perpus.test', 'admin', NULL, NULL, '$2y$12$J8LaJX0qJaktqc6WH7GoJOfAz4OfWkb.c..QqZ95wT/ACedpW.wI2', NULL, '2026-11-10 00:05:15', '2026-11-10 00:05:15'),
(3, 'Dimas', 'siswa@perpus.test', 'siswa', 'XII RPL 2', NULL, '$2y$12$L/IuMKqo6rFR4DudCVAINePAlJ5ye6wbtkIbYs15XGr4LWnvLqXqa', NULL, '2026-11-10 00:05:15', '2026-11-10 00:05:15'),
(4, 'luluk', 'sukrum@tes', 'siswa', NULL, NULL, '$2y$12$KxqY8jlJ13ekfHPSzPe9tOTAwQuoTkGgko438jpDD9a0FssJ/yOSW', NULL, '2026-11-10 00:49:47', '2026-11-10 00:49:47'),
(5, 'Juan', 'halo@tes', 'siswa', NULL, NULL, '$2y$12$FoMnxwBkSIFnpKPtCzMfe.fa57g6CKO/uY2HbkUoE1YTWkSFo1nFS', NULL, '2026-11-12 05:17:19', '2026-11-12 05:17:19'),
(6, 'Horse', 'Horse@gmail.com', 'admin', NULL, NULL, '$2y$12$oUE1EWYbwQx5nBHwMFNxZeZK7ySTyyb4qm.QWbtjBhAb3WuIaHYxe', NULL, '2026-11-12 05:20:30', '2026-11-12 05:44:33'),
(7, 'Ebola', 'Ebola@gmail.com', 'siswa', NULL, NULL, '$2y$12$PRuHZZ32zkpBmSyKbKFP9e1bD0dn4WCbeFwovFx0tUKiQg1s7STCC', NULL, '2026-11-12 06:17:11', '2026-11-12 06:17:11'),
(8, 'admin', 'adminbuku@gmail.com', 'admin', NULL, NULL, '$2y$12$/jffFgm6gHsrI/iv2Th6o.LHQA5heVa4R1.nlXKFL6YabR5mRWa9y', NULL, '2026-11-12 06:46:43', '2026-11-12 06:50:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_user_id_foreign` (`user_id`),
  ADD KEY `loans_book_id_foreign` (`book_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
