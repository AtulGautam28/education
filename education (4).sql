-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 11:56 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `education`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `short_about` int(11) DEFAULT NULL,
  `about` longtext NOT NULL,
  `service` text NOT NULL,
  `history` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `image`, `short_about`, `about`, `service`, `history`, `created_at`, `updated_at`) VALUES
(4, 'uploads/website-images/about-2022-02-23-09-27-30-1236.jpg', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do por incididunt ut labore et dolore magna aliqua. Ut enim ad minim iam, qstrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do por incididunt ut labore et dolore magna aliqua. Ut enim ad minim iam, qstrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<p>dolore magna aliqua. Ut enim ad minim iam, qstrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit</p>', '<p>Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria, facer putent intellegam eu pri. Mei debitis ullamcorper eu, at quo idque mundi. Vis in suas porro consequat, nec ad dolor adversarium, ut praesent cotidieque sit. Veniam civibus omittantur duo ut, te his alterum complectitur. Mea omnis oratio impedit ne.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.<br />\r\n&nbsp;</p>', '<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>', '2021-07-12 01:11:22', '2022-03-11 14:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `about_sections`
--

CREATE TABLE `about_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `header` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `section_name` varchar(255) NOT NULL,
  `content_quantity` int(11) NOT NULL DEFAULT 0,
  `show_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_sections`
--

INSERT INTO `about_sections` (`id`, `header`, `icon`, `description`, `section_name`, `content_quantity`, `show_homepage`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'fab fa-accessible-icon', 'After reading the content and examples on the Slogan Creator website, I had a very good feeling about the level and examples on the Slogan Creator website', 'About Section', 0, 1, NULL, '2021-09-03 16:11:26'),
(2, 'Our Winning Awards', 'fas fa-address-book', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'award section', 4, 1, NULL, '2022-02-24 02:50:33'),
(3, 'Our Team', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'team section', 4, 1, NULL, '2022-02-27 07:02:11'),
(4, NULL, NULL, NULL, 'Partner Section', 10, 1, NULL, '2021-08-24 12:26:55');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `forget_password_token` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `admin_type` int(1) NOT NULL DEFAULT 0,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `whatsapp` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pinterest` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `slug`, `email`, `phone`, `password`, `image`, `forget_password_token`, `status`, `author_id`, `admin_type`, `facebook`, `twitter`, `whatsapp`, `instagram`, `linkedin`, `remember_token`, `created_at`, `updated_at`, `pinterest`, `youtube`, `address`, `about`, `banner_image`, `website`) VALUES
(4, 'Atul Gautam', 'atul-gautam', 'admin@gmail.com', '111-333-4444', '$2y$10$NRUBM2bljJnXlIKMYbdW6u6Zt08tq5TGSuFpZmhD6WyoMkGzsLP1u', 'uploads/website-images/atul-gautam-2023-10-06-03-54-05-3937.jpg', NULL, 1, 0, 1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.whatsapp.com', '#', 'https://www.linkedin.com', 'xOd2Y5nKPiJL60nCzrrhr9SJlU0CsJpE03OA0M7fFzWU74aS871NQcLq7G1J', '2021-06-25 23:14:28', '2023-10-06 10:24:10', '#', '#', 'Vijay Nagar Indore', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, est dolorum!t consectetur adipisicing elit. Labore, est dolorum!t consectetur adipisicing elit. Labore, est dolorum!t consectetur adipisicing elit. Labore, est dolorum!', 'uploads/website-images/listing-banner-2023-10-06-03-54-10-9971.jpeg', 'https://example.com'),
(9, 'John Peter', 'John-Peter', 'john@gmail.com', '', '$2y$10$RBxBrErq8NaHE2iKczACJO47LZPaWDa.PE3SqaTaZ4uNuukKU4UqG', '', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-13 05:59:06', '2021-10-12 05:23:34', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Nicholas pooran', 'nicholas-pooran', 'staff@gmail.com', NULL, '$2y$10$Ggj866uFXwjCuRDLqC.0/ukZxFHXFA0nty7XeyPR3hVxvct.gpD4e', NULL, NULL, 1, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-07 02:22:30', '2021-10-17 10:13:50', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aminities`
--

CREATE TABLE `aminities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aminity` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner_images`
--

CREATE TABLE `banner_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_type` int(11) NOT NULL DEFAULT 1,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_images`
--

INSERT INTO `banner_images` (`id`, `image_type`, `location`, `image`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Property', 'uploads/website-images/banner-2022-03-11-01-03-10-6962.jpg', NULL, NULL, NULL, '2022-03-11 07:03:10'),
(2, 1, 'About Us', 'uploads/website-images/banner-2022-03-11-01-04-21-3570.jpg', NULL, NULL, NULL, '2022-03-11 07:04:21'),
(3, 1, 'Pricing Plan', 'uploads/website-images/banner-2022-03-11-01-04-29-8450.jpg', NULL, NULL, NULL, '2022-03-11 07:04:29'),
(5, 1, 'Blog', 'uploads/website-images/banner-2022-03-11-01-04-34-3406.jpg', NULL, NULL, NULL, '2022-03-11 07:04:34'),
(6, 1, 'Contact Us', 'uploads/website-images/banner-2022-03-11-01-04-39-5072.jpg', NULL, NULL, NULL, '2022-03-11 07:04:39'),
(7, 2, 'Admin Login', 'uploads/website-images/login-2023-10-06-03-51-24-8129.jpeg', NULL, NULL, NULL, '2023-10-06 10:21:24'),
(8, 2, 'Staff Login', 'uploads/website-images/login-2021-10-12-09-34-45-6052.jpg', NULL, NULL, NULL, '2021-10-12 03:34:48'),
(9, 1, 'Terms and Condition', 'uploads/website-images/banner-2022-03-11-01-04-45-5731.jpg', NULL, NULL, NULL, '2022-03-11 07:04:45'),
(10, 1, 'Privacy Policy', 'uploads/website-images/banner-2022-03-11-01-04-51-8179.jpg', NULL, NULL, NULL, '2022-03-11 07:04:51'),
(11, 1, 'User Login', 'uploads/website-images/banner-2022-03-11-01-04-57-2945.jpg', NULL, NULL, NULL, '2022-03-11 07:04:57'),
(12, 1, 'Payment Page', 'uploads/website-images/banner-2022-03-11-01-05-03-1190.jpg', NULL, NULL, NULL, '2022-03-11 07:05:04'),
(15, 4, 'Default User Profile Image', 'uploads/website-images/login-2023-10-06-03-52-47-2181.jpg', NULL, NULL, NULL, '2023-10-06 10:22:47'),
(17, 1, 'custom page', 'uploads/website-images/banner-2022-03-11-01-05-10-1684.jpg', NULL, NULL, NULL, '2022-03-11 07:05:10'),
(18, 1, 'Agent Profile', 'uploads/website-images/banner-2022-03-11-01-05-16-3498.jpg', NULL, NULL, NULL, '2022-03-11 07:05:16'),
(19, 1, 'FAQ', 'uploads/website-images/banner-2022-03-11-01-05-22-8564.jpg', NULL, NULL, NULL, '2022-03-11 07:05:22'),
(20, 5, 'faq detail page', 'uploads/website-images/faq-2021-10-27-08-27-58-3913.jpg', NULL, NULL, NULL, '2021-10-27 02:28:04'),
(21, 1, 'Agent Page', 'uploads/website-images/banner-2022-03-11-01-05-28-5423.jpg', NULL, NULL, NULL, '2022-03-11 07:05:28'),
(23, 5, 'Feature Image', 'uploads/website-images/faq-2022-03-01-08-16-40-3153.jpg', 'What Are You Looking For', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi dolorem Incidunt tempora fugit adipisci necessitatibus velit quaerat dolorem error id iure nisi deleniti autem fugiat ut quo.', NULL, '2022-03-01 02:16:40'),
(26, 3, 'Agent Background', 'uploads/website-images/banner-2021-10-30-09-13-33-7585.jpg', NULL, NULL, NULL, '2021-10-30 03:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `seo_title` text NOT NULL,
  `seo_description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `show_homepage` tinyint(4) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `admin_id`, `view`, `title`, `slug`, `description`, `seo_title`, `seo_description`, `image`, `status`, `show_homepage`, `short_description`, `created_at`, `updated_at`) VALUES
(1, 10, 4, 33, '3.5 Stars', '35-stars', NULL, 'Sadhe teen sitara', 'साढ़े तीन सितारा', 'uploads/vocabulary-audio/mp3-2023-10-19-11-08-35-5184.mp3', 1, NULL, NULL, '2021-07-29 11:43:52', '2023-10-19 11:08:35'),
(20, 2, 4, 0, 'Abdomen', 'abdomen', NULL, 'Pet', 'पेट', 'uploads/vocabulary-audio/mp3-2023-10-19-11-08-43-7819.mp3', 1, NULL, NULL, '2023-10-09 10:42:09', '2023-10-19 11:08:43'),
(21, 2, 4, 0, 'Abdomen Cramps', 'abdomen-cramps', NULL, 'Pet Dard', 'पेट दर्द', 'uploads/vocabulary-audio/mp3-2023-10-19-11-08-51-3904.mp3', 1, NULL, NULL, '2023-10-09 10:43:23', '2023-10-19 11:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'All', 'all', 1, '2021-07-29 11:41:39', '2023-10-09 09:55:25'),
(2, 'Greetings', 'greetings', 1, '2021-07-29 11:41:47', '2023-10-09 09:56:27'),
(4, 'General Words', 'general words', 1, '2021-07-29 11:42:05', '2023-10-09 09:56:55'),
(5, 'Medical', 'medical', 1, '2021-07-29 11:42:16', '2023-10-09 09:57:14'),
(10, 'Legal', 'legal', 1, '2021-10-17 08:55:37', '2023-10-09 09:57:30'),
(11, 'Education', 'education', 1, '2023-10-09 09:57:45', '2023-10-09 09:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `name`, `email`, `phone`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Maria Jesus', 'maria32@gmail.com', '256-458-963', 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 1, '2021-07-29 11:52:57', '2021-08-05 10:32:36'),
(4, 2, 'Morni morkel', 'user@gmail.com', NULL, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 1, '2021-09-21 02:33:08', '2021-10-10 04:38:15'),
(6, 2, 'Darren shammi', 'darren36@gmail.com', NULL, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 1, '2021-09-28 10:47:40', '2021-10-17 08:56:59'),
(8, 2, 'John Doe', 'client@gmail.com', NULL, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 1, '2022-02-24 03:31:00', '2022-02-24 03:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_state_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'England', 'england', 1, '2021-09-07 06:13:10', '2021-09-07 07:02:36'),
(2, 4, 'Tezpur', 'tezpur', 1, '2021-09-07 06:13:43', '2021-10-10 03:27:46'),
(4, 5, 'Los Angeles', 'los-angeles', 1, '2021-09-07 06:29:30', '2021-09-07 07:04:09'),
(5, 5, 'California City', 'california-city', 1, '2021-09-07 07:04:37', '2021-10-17 09:26:03'),
(6, 5, 'Oaklan', 'oaklan', 1, '2021-09-07 07:05:05', '2021-10-17 09:26:05'),
(7, 9, 'Miami', 'miami', 1, '2021-09-07 07:05:37', '2021-09-07 07:05:37'),
(8, 9, 'Tampa', 'tampa', 1, '2021-09-07 07:05:44', '2021-09-07 07:05:44'),
(9, 9, 'Florida City', 'florida-city', 1, '2021-09-07 07:05:57', '2021-09-07 07:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `condition_privacies`
--

CREATE TABLE `condition_privacies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_condition` longtext DEFAULT NULL,
  `privacy_policy` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `condition_privacies`
--

INSERT INTO `condition_privacies` (`id`, `terms_condition`, `privacy_policy`, `created_at`, `updated_at`) VALUES
(2, '<p>Consetetur definitionem cu mea, usu legere minimum ne. Pro epicurei constituam ne, atqui lucilius indoctum nam id. Eu timeam volumus vel, eos te movet complectitur, te causae saperet eam. Minimum probatus vim te, eu eum ancillae mentitum comprehensam. Tantas decore adipisci vix no.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria, facer putent intellegam eu pri. Mei debitis ullamcorper eu, at quo idque mundi. Vis in suas porro consequat, nec ad dolor adversarium, ut praesent cotidieque sit. Veniam civibus omittantur duo ut, te his alterum complectitur. Mea omnis oratio impedit ne.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>\r\n\r\n<p>Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>', NULL, '2022-03-02 08:13:46', '2022-03-08 07:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `contact_information`
--

CREATE TABLE `contact_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `header` varchar(255) NOT NULL,
  `phones` text NOT NULL,
  `emails` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `map_embed_code` text NOT NULL,
  `copyright` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_information`
--

INSERT INTO `contact_information` (`id`, `header`, `phones`, `emails`, `address`, `about`, `map_embed_code`, `copyright`, `created_at`, `updated_at`) VALUES
(1, 'Contact Information', '123-456-789', 'support@test.com', 'Vijay Nagar Indore', 'about', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.0375252679028!2d75.89606847592185!3d22.763988625927414!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fddf4d0230ab%3A0xdd697930ecc2f3bc!2sCubixsys!5e0!3m2!1sen!2sin!4v1696585398227!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Copyright 2021, Cubixsys. All Rights Reserved.', '2021-06-11 03:01:41', '2023-10-06 10:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `show_notification` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `show_notification`, `created_at`, `updated_at`) VALUES
(37, 'Atul', 'atulgautam2806@gmail.com', '799797978', 'Test', 'testing for this', 0, '2023-10-25 11:33:13', '2023-10-25 11:33:13'),
(38, 'Atul', 'atulgautam2806@gmail.com', '7997977021', 'Test', 'message for test', 0, '2023-10-26 13:06:23', '2023-10-26 13:06:23'),
(39, 'Atul', 'atulgautam2806@gmail.com', NULL, 'Test', 'message for test', 0, '2023-10-26 13:09:11', '2023-10-26 13:09:11'),
(40, 'Atul', 'atulgautam2806@gmail.com', '7997977021', 'Test', 'sdf', 0, '2023-10-26 13:09:33', '2023-10-26 13:09:33'),
(41, 'Jack', 'atul12@gmail.com', '89797979635', 'test', 'want to learn about this', 0, '2023-10-26 13:17:56', '2023-10-26 13:17:56'),
(42, 'Jack', 'atul12@gmail.com', '89797979635', 'Test', 'This is dummy test here', 0, '2023-10-27 11:20:39', '2023-10-27 11:20:39'),
(43, 'Jack', 'atul12@gmail.com', '89797979635', 'Test 2', 'This is dummy test here\nxcs', 0, '2023-10-27 11:24:17', '2023-10-27 11:24:17'),
(44, 'Jack', 'atul12@gmail.com', '89797979635', 'Test 2', 'This is dummy test here\nxcs', 0, '2023-10-27 11:24:44', '2023-10-27 11:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topbar_email` varchar(255) DEFAULT NULL,
  `topbar_phone` varchar(255) DEFAULT NULL,
  `footer_address` varchar(255) DEFAULT NULL,
  `footer_email` varchar(255) DEFAULT NULL,
  `footer_phone` varchar(255) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `topbar_email`, `topbar_phone`, `footer_address`, `footer_email`, `footer_phone`, `facebook`, `twitter`, `instagram`, `linkedin`, `youtube`, `created_at`, `updated_at`) VALUES
(3, 'info23@test.com', '111-233-1273', 'Vijay Nagar Indore', 'example@gmail.com', '111-233-1273', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.instagram.com', 'https://www.linkedin.com', 'https://www.youtube.com', '2021-06-11 03:18:20', '2023-10-06 10:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'India', 'india', 1, '2021-09-07 04:24:24', '2021-09-07 04:40:01'),
(4, 'United Kindom', 'united-kindom', 1, '2021-09-07 04:27:05', '2021-10-10 03:24:53'),
(5, 'Australia', 'australia', 1, '2021-09-07 04:37:39', '2021-10-17 09:25:37'),
(6, 'United State', 'united-state', 1, '2021-09-07 06:56:14', '2021-10-17 09:25:38'),
(7, 'Africa', 'africa', 1, '2021-09-07 07:01:25', '2021-09-07 07:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'England', 'england', 1, '2021-09-07 05:01:44', '2021-10-17 09:25:45'),
(2, 2, 'Andhra Pradesh', 'andhra-pradesh', 1, '2021-09-07 05:02:19', '2021-10-17 09:25:46'),
(3, 2, 'Assam', 'assam', 1, '2021-09-07 05:02:29', '2021-09-07 06:57:43'),
(4, 5, 'Queensland', 'queensland', 1, '2021-09-07 05:02:43', '2021-09-07 06:58:11'),
(5, 6, 'California', 'california', 1, '2021-09-07 05:02:59', '2021-09-07 06:58:29'),
(6, 4, 'Wales', 'wales', 1, '2021-09-07 05:33:06', '2021-09-07 06:58:52'),
(8, 6, 'Arizona', 'arizona', 1, '2021-09-07 06:59:44', '2021-09-07 06:59:44'),
(9, 6, 'Florida', 'florida', 1, '2021-09-07 06:59:59', '2021-09-07 06:59:59'),
(10, 6, 'Georgia', 'georgia', 1, '2021-09-07 07:00:20', '2021-09-07 07:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AFA', 'Afghan Afghani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ALL', 'Albanian Lek', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DZD', 'Algerian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AOA', 'Angolan Kwanza', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'ARS', 'Argentine Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'AMD', 'Armenian Dram', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'AWG', 'Aruban Florin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'AUD', 'Australian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'AZN', 'Azerbaijani Manat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'BSD', 'Bahamian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'BHD', 'Bahraini Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'BDT', 'Bangladeshi Taka', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'BBD', 'Barbadian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'BYR', 'Belarusian Ruble', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'BEF', 'Belgian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'BZD', 'Belize Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'BMD', 'Bermudan Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'BTN', 'Bhutanese Ngultrum', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'BTC', 'Bitcoin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'BOB', 'Bolivian Boliviano', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'BAM', 'Bosnia-Herzegovina Convertible Mark', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'BWP', 'Botswanan Pula', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'BRL', 'Brazilian Real', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'GBP', 'British Pound Sterling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'BND', 'Brunei Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'BGN', 'Bulgarian Lev', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'BIF', 'Burundian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'KHR', 'Cambodian Riel', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'CAD', 'Canadian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'CVE', 'Cape Verdean Escudo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'KYD', 'Cayman Islands Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'XOF', 'CFA Franc BCEAO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'XAF', 'CFA Franc BEAC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'XPF', 'CFP Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'CLP', 'Chilean Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'CNY', 'Chinese Yuan', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'COP', 'Colombian Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'KMF', 'Comorian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'CDF', 'Congolese Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'CRC', 'Costa Rican ColÃ³n', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'HRK', 'Croatian Kuna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'CUC', 'Cuban Convertible Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'CZK', 'Czech Republic Koruna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'DKK', 'Danish Krone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'DJF', 'Djiboutian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'DOP', 'Dominican Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'XCD', 'East Caribbean Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'EGP', 'Egyptian Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ERN', 'Eritrean Nakfa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'EEK', 'Estonian Kroon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'ETB', 'Ethiopian Birr', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'EUR', 'Euro', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'FKP', 'Falkland Islands Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'FJD', 'Fijian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'GMD', 'Gambian Dalasi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'GEL', 'Georgian Lari', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'DEM', 'German Mark', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'GHS', 'Ghanaian Cedi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'GIP', 'Gibraltar Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'GRD', 'Greek Drachma', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'GTQ', 'Guatemalan Quetzal', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'GNF', 'Guinean Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'GYD', 'Guyanaese Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'HTG', 'Haitian Gourde', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'HNL', 'Honduran Lempira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'HKD', 'Hong Kong Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'HUF', 'Hungarian Forint', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ISK', 'Icelandic KrÃ³na', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'INR', 'Indian Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'IDR', 'Indonesian Rupiah', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'IRR', 'Iranian Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'IQD', 'Iraqi Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ILS', 'Israeli New Sheqel', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'ITL', 'Italian Lira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'JMD', 'Jamaican Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'JPY', 'Japanese Yen', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'JOD', 'Jordanian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'KZT', 'Kazakhstani Tenge', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'KES', 'Kenyan Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'KWD', 'Kuwaiti Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'KGS', 'Kyrgystani Som', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'LAK', 'Laotian Kip', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'LVL', 'Latvian Lats', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'LBP', 'Lebanese Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'LSL', 'Lesotho Loti', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'LRD', 'Liberian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'LYD', 'Libyan Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'LTL', 'Lithuanian Litas', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'MOP', 'Macanese Pataca', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'MKD', 'Macedonian Denar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'MGA', 'Malagasy Ariary', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'MWK', 'Malawian Kwacha', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'MYR', 'Malaysian Ringgit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'MVR', 'Maldivian Rufiyaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'MRO', 'Mauritanian Ouguiya', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'MUR', 'Mauritian Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'MXN', 'Mexican Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'MDL', 'Moldovan Leu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'MNT', 'Mongolian Tugrik', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'MAD', 'Moroccan Dirham', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'MZM', 'Mozambican Metical', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'MMK', 'Myanmar Kyat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'NAD', 'Namibian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'NPR', 'Nepalese Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'ANG', 'Netherlands Antillean Guilder', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'TWD', 'New Taiwan Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'NZD', 'New Zealand Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'NIO', 'Nicaraguan CÃ³rdoba', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'NGN', 'Nigerian Naira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'KPW', 'North Korean Won', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'NOK', 'Norwegian Krone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'OMR', 'Omani Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'PKR', 'Pakistani Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'PAB', 'Panamanian Balboa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'PGK', 'Papua New Guinean Kina', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'PYG', 'Paraguayan Guarani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'PEN', 'Peruvian Nuevo Sol', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'PHP', 'Philippine Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'PLN', 'Polish Zloty', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'QAR', 'Qatari Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'RON', 'Romanian Leu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'RUB', 'Russian Ruble', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'RWF', 'Rwandan Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'SVC', 'Salvadoran ColÃ³n', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'WST', 'Samoan Tala', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'SAR', 'Saudi Riyal', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'RSD', 'Serbian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'SCR', 'Seychellois Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'SLL', 'Sierra Leonean Leone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'SGD', 'Singapore Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'SKK', 'Slovak Koruna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'SBD', 'Solomon Islands Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'SOS', 'Somali Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'ZAR', 'South African Rand', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'KRW', 'South Korean Won', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'XDR', 'Special Drawing Rights', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'LKR', 'Sri Lankan Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'SHP', 'St. Helena Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'SDG', 'Sudanese Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'SRD', 'Surinamese Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'SZL', 'Swazi Lilangeni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'SEK', 'Swedish Krona', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'CHF', 'Swiss Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'SYP', 'Syrian Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'STD', 'São Tomé and Príncipe Dobra', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'TJS', 'Tajikistani Somoni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'TZS', 'Tanzanian Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'THB', 'Thai Baht', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'TOP', 'Tongan pa\'anga', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'TTD', 'Trinidad & Tobago Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'TND', 'Tunisian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'TRY', 'Turkish Lira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'TMT', 'Turkmenistani Manat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'UGX', 'Ugandan Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'UAH', 'Ukrainian Hryvnia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'AED', 'United Arab Emirates Dirham', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'UYU', 'Uruguayan Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'USD', 'US Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'UZS', 'Uzbekistan Som', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'VUV', 'Vanuatu Vatu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'VEF', 'Venezuelan BolÃ­var', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'VND', 'Vietnamese Dong', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'YER', 'Yemeni Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'ZMK', 'Zambian Kwacha', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `currency_countries`
--

CREATE TABLE `currency_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `currency_countries`
--

INSERT INTO `currency_countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Andorra', 'AD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Afghanistan', 'AF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Åland Islands', 'AX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Albania', 'AL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Algeria', 'DZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'American Samoa', 'AS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Angola', 'AO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Anguilla', 'AI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Antarctica', 'AQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Antigua and Barbuda', 'AG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Argentina', 'AR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Armenia', 'AM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Aruba', 'AW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Australia', 'AU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Austria', 'AT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Azerbaijan', 'AZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Bahamas', 'BS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Bahrain', 'BH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Bangladesh', 'BD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Barbados', 'BB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Belarus', 'BY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Belgium', 'BE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Belize', 'BZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Benin', 'BJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Bermuda', 'BM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Bhutan', 'BT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Bolivia (Plurinational State of)', 'BO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Bosnia and Herzegovina', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Botswana', 'BW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Bouvet Island', 'BV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Brazil', 'BR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'British Indian Ocean Territory', 'IO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Brunei Darussalam', 'BN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Bulgaria', 'BG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Burkina Faso', 'BF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Burundi', 'BI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Cabo Verde', 'CV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Cambodia', 'KH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Cameroon', 'CM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Canada', 'CA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Cayman Islands', 'KY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Central African Republic', 'CF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Chad', 'TD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Chile', 'CL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'China', 'CN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Christmas Island', 'CX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Cocos (Keeling) Islands', 'CC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Colombia', 'CO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Comoros', 'KM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Congo', 'CG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Congo (Democratic Republic of the)', 'CD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Cook Islands', 'CK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Costa Rica', 'CR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Côte d\'Ivoire', 'CI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Croatia', 'HR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Cuba', 'CU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Curaçao', 'CW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Cyprus', 'CY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Czech Republic', 'CZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Denmark', 'DK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Djibouti', 'DJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Dominica', 'DM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Dominican Republic', 'DO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Ecuador', 'EC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Egypt', 'EG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'El Salvador', 'SV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Equatorial Guinea', 'GQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Eritrea', 'ER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Estonia', 'EE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Ethiopia', 'ET', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Falkland Islands (Malvinas)', 'FK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Faroe Islands', 'FO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Fiji', 'FJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Finland', 'FI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'France', 'FR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'French Guiana', 'GF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'French Polynesia', 'PF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'French Southern Territories', 'TF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Gabon', 'GA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Gambia', 'GM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Georgia', 'GE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Germany', 'DE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Ghana', 'GH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Gibraltar', 'GI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Greece', 'GR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Greenland', 'GL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Grenada', 'GD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Guadeloupe', 'GP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Guam', 'GU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Guatemala', 'GT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Guernsey', 'GG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Guinea', 'GN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Guinea-Bissau', 'GW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Guyana', 'GY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Haiti', 'HT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Heard Island and McDonald Islands', 'HM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Holy See', 'VA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Honduras', 'HN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Hong Kong', 'HK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Hungary', 'HU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Iceland', 'IS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'India', 'IN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Indonesia', 'ID', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Iran (Islamic Republic of)', 'IR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Iraq', 'IQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Ireland', 'IE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Isle of Man', 'IM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Israel', 'IL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Italy', 'IT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Jamaica', 'JM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Japan', 'JP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Jersey', 'JE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Jordan', 'JO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Kazakhstan', 'KZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Kenya', 'KE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Kiribati', 'KI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Korea (Democratic People\'s Republic of)', 'KP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Korea (Republic of)', 'KR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Kuwait', 'KW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Kyrgyzstan', 'KG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Lao People\'s Democratic Republic', 'LA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Latvia', 'LV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Lebanon', 'LB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Lesotho', 'LS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Liberia', 'LR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Libya', 'LY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Liechtenstein', 'LI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Lithuania', 'LT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Luxembourg', 'LU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Macao', 'MO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Macedonia (the former Yugoslav Republic of)', 'MK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Madagascar', 'MG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Malawi', 'MW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Malaysia', 'MY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Maldives', 'MV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Mali', 'ML', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Malta', 'MT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Marshall Islands', 'MH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Martinique', 'MQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Mauritania', 'MR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Mauritius', 'MU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Mayotte', 'YT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Mexico', 'MX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Micronesia (Federated States of)', 'FM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Moldova (Republic of)', 'MD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Monaco', 'MC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Mongolia', 'MN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Montenegro', 'ME', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Montserrat', 'MS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Morocco', 'MA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Mozambique', 'MZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Myanmar', 'MM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Namibia', 'NA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Nauru', 'NR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Nepal', 'NP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Netherlands', 'NL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'New Caledonia', 'NC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'New Zealand', 'NZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Nicaragua', 'NI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Niger', 'NE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Nigeria', 'NG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Niue', 'NU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Norfolk Island', 'NF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Northern Mariana Islands', 'MP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Norway', 'NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Oman', 'OM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Pakistan', 'PK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Palau', 'PW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Palestine, State of', 'PS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Panama', 'PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Papua New Guinea', 'PG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Paraguay', 'PY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Peru', 'PE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Philippines', 'PH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Pitcairn', 'PN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Poland', 'PL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Portugal', 'PT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Puerto Rico', 'PR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Qatar', 'QA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Réunion', 'RE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Romania', 'RO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Russian Federation', 'RU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Rwanda', 'RW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Saint Barthélemy', 'BL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Saint Kitts and Nevis', 'KN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Saint Lucia', 'LC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Saint Martin (French part)', 'MF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Saint Pierre and Miquelon', 'PM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Saint Vincent and the Grenadines', 'VC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Samoa', 'WS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'San Marino', 'SM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Sao Tome and Principe', 'ST', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Saudi Arabia', 'SA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Senegal', 'SN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Serbia', 'RS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Seychelles', 'SC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Sierra Leone', 'SL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Singapore', 'SG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Sint Maarten (Dutch part)', 'SX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Slovakia', 'SK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Slovenia', 'SI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Solomon Islands', 'SB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Somalia', 'SO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'South Africa', 'ZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'South Georgia and the South Sandwich Islands', 'GS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'South Sudan', 'SS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Spain', 'ES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Sri Lanka', 'LK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Sudan', 'SD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Suriname', 'SR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Svalbard and Jan Mayen', 'SJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Swaziland', 'SZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Sweden', 'SE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Switzerland', 'CH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Syrian Arab Republic', 'SY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Taiwan, Province of China', 'TW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Tajikistan', 'TJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Tanzania, United Republic of', 'TZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Thailand', 'TH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Timor-Leste', 'TL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Togo', 'TG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Tokelau', 'TK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Tonga', 'TO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Trinidad and Tobago', 'TT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Tunisia', 'TN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Turkey', 'TR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Turkmenistan', 'TM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Turks and Caicos Islands', 'TC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Tuvalu', 'TV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Uganda', 'UG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Ukraine', 'UA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'United Arab Emirates', 'AE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'United Kingdom of Great Britain and Northern Ireland', 'GB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'United States Minor Outlying Islands', 'UM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'United States of America', 'US', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Uruguay', 'UY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Uzbekistan', 'UZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Vanuatu', 'VU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Venezuela (Bolivarian Republic of)', 'VE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Viet Nam', 'VN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Virgin Islands (British)', 'VG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Virgin Islands (U.S.)', 'VI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Wallis and Futuna', 'WF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Western Sahara', 'EH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Yemen', 'YE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Zambia', 'ZM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Zimbabwe', 'ZW', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `custom_file_managers`
--

CREATE TABLE `custom_file_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_file_managers`
--

INSERT INTO `custom_file_managers` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(5, 'First Image', 'http://localhost/web-solution-us/realestate_2/script_content/main_files/public/uploads/custom-images/file-manager--2022-03-14-07-30-08-8257.jpg', '2022-03-14 01:30:14', '2022-03-14 01:30:14'),
(6, 'Second Image', 'http://localhost/web-solution-us/realestate_2/script_content/main_files/public/uploads/custom-images/file-manager--2022-03-14-07-30-33-5172.jpg', '2022-03-14 01:30:39', '2022-03-14 01:30:39'),
(7, 'Third Image', 'http://localhost/web-solution-us/realestate_2/script_content/main_files/public/uploads/custom-images/file-manager--2022-03-14-07-31-15-2701.jpg', '2022-03-14 01:31:18', '2022-03-14 01:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `page_name`, `slug`, `description`, `seo_title`, `seo_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Custom Page 1', 'custom-page-1', '<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.&nbsp;Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>Sit vivendum eleifend adipiscing ea. Modus legere suscipiantur an vel, melius patrioque est cu, eum at audire probatus repudiandae. Ei tempor definitiones eam, sea dico omnium ne. Eam ad ubique tincidunt elaboraret, malis aperiri sit et. Ut quo vero inimicus. Sed at munere fuisset noluisse, eleifend senserit an vix.</p>\r\n\r\n<p>Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>', 'Custom Page 1', 'Custom Page 1', 1, '2021-08-06 13:43:15', '2022-03-08 07:07:15'),
(3, 'Custom Page 2', 'custom-page-2', '<p>Meliore inimicus duo ut, tation veritus elaboraret eam cu. Cum in alii agam aliquip, aperiam salutandi et per. Ex vis summo probatus ocurreret, ex assum sententiae pri, blandit sensibus moderatius ei eos. Vix nobis phaedrum neglegentur et.</p>\r\n\r\n<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>', 'Custom Page 2', 'Custom Page 2', 1, '2021-08-06 14:03:42', '2022-03-08 07:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `custom_paginators`
--

CREATE TABLE `custom_paginators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_paginators`
--

INSERT INTO `custom_paginators` (`id`, `page`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'Blog', 6, NULL, '2022-02-28 10:03:47'),
(2, 'Property', 6, NULL, '2022-02-27 07:10:23'),
(3, 'Agent', 10, NULL, '2022-02-27 07:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `custom_day` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day`, `custom_day`, `created_at`, `updated_at`) VALUES
(1, 'Saturday', 'Saturday', NULL, '2021-07-15 02:27:30'),
(2, 'Sunday', 'Sunday', NULL, '2021-08-05 02:53:07'),
(3, 'Monday', 'Monday', NULL, '2021-07-15 02:27:39'),
(4, 'Tuesday', 'Tuesday', NULL, '2021-07-15 02:27:45'),
(5, 'Wednesday', 'Wednesday', NULL, '2021-07-15 02:27:49'),
(6, 'Thursday', 'Thursday', NULL, '2021-07-15 02:27:53'),
(7, 'Friday', 'Friday', NULL, '2021-07-15 02:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `email_configurations`
--

CREATE TABLE `email_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_type` tinyint(4) DEFAULT NULL,
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_port` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `smtp_username` varchar(255) DEFAULT NULL,
  `smtp_password` varchar(255) DEFAULT NULL,
  `mail_encryption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_configurations`
--

INSERT INTO `email_configurations` (`id`, `mail_type`, `mail_host`, `mail_port`, `email`, `email_password`, `smtp_username`, `smtp_password`, `mail_encryption`, `created_at`, `updated_at`) VALUES
(1, 2, 'smtp.gmail.com', '587', 'zubair@world.com', 'mary+pass@', 'zubair.nnns@gmail.com', 'gfltiyqkkdiekejv', 'tls', NULL, '2023-10-06 06:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Password Reset', 'Password Reset', '<h4>Dear <b>{{name}}</b>,</h4>\r\n    <p>Do you want to reset your password? Please Click the following link and Reset Your Password.</p>', NULL, '2021-10-12 05:12:53'),
(2, 'contact email', 'Online Coaching', '<p><span style=\"font-size: 1rem;\">Name: {{name}}</span></p><p><span style=\"font-size: 1rem;\">Email: {{email}}</span><br></p>\r\n<p>Phone: {{phone}}</p>\r\n<p>Subject: {{subject}}</p>\r\n<p>Message: {{message}}</p>', NULL, '2023-10-25 10:44:43'),
(4, 'subscribe notification', 'Subscribe Notification', '<h2>Hi there,</h2>\r\n<p>Congratulations! Your Subscription has been created successfully. Please Click the following link and Verified Your Subscription. If you won\'t approve this link, after 24hourse your subscription will be denay</p>', NULL, '2021-10-09 04:03:36'),
(5, 'user verification', 'User Verification', '<h4>Dear <b>{{user_name}}</b>,</h4>\r\n<p>Congratulations! Your Account has been created successfully. Please Click the following link and Active your Account.</p>', NULL, '2021-10-12 05:21:28'),
(6, 'order successfull', 'Order Successfull', '<h4>Dear <b>{{user_name}}</b>,</h4><p> Thanks for your new order. Your order id has been submited.</p><p><span style=\"font-size: 1rem;\">Payment Method :</span><b style=\"font-size: 1rem;\"> {{payment_method}}</b></p><p>Total amount:<b> {{amount}}</b></p><p><b>{{order_details}}</b></p><p><b><br></b></p>', NULL, '2021-10-17 08:48:05'),
(7, 'pre notification for Order Expire date', 'expired order', '<p>hi <b>{{user_name}}</b>,</p><p>your order will expire at <b>{{expire_date}}</b>. if you want to renew the order. click this lin<b>k&nbsp;</b></p><p><span style=\"font-size: 1rem;\"><b>{{order_details}}</b></span></p>', NULL, '2021-08-05 04:03:57'),
(8, 'Payment Accept', 'Payment Accept', 'Hi {{user_name}}, Your Payment have been approved successfully', NULL, '2021-11-17 10:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Who Are Our Clients?', 'Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.', 1, '2021-09-11 06:50:54', '2022-03-08 08:34:23'),
(2, 'How To Buy a Product ?', 'Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.', 1, '2021-09-11 06:51:24', '2022-03-08 08:33:54'),
(3, 'How to make a payment by credit card?', '`Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere cum eum quas, maiores nobis tempore tenetur. Rem labore quasi quod doloremque dolores commodi neque inventore maxime aut, dicta minima ratione tempora, odio nobis distinctio aliquid ex. Nesciunt fuga, officiis impedit, alias, id consequuntur deleniti, dolores explicabo quibusdam nihil eligendi delectus sunt nam nisi architecto vitae provident quae hic! Qui aperiam asperiores repellat cumque consectetur provident reiciendis, quam architecto error, eaque.', 1, '2021-09-11 06:51:52', '2021-09-20 09:25:41'),
(6, 'How do you write a FAQ question?', 'Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.', 1, '2021-10-18 03:45:20', '2022-03-08 08:34:05'),
(7, 'What are FAQ questions?', 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur. Mel ut decore salutandi intellegam. Labitur epicurei vis cu, in mei rationibus consequuntur. Duo eu modus periculis, inermis detracto expetendis', 1, '2021-10-18 03:45:37', '2021-10-18 03:45:37'),
(8, 'What questions should be on a FAQ page?', 'Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.', 1, '2021-10-18 03:46:01', '2022-03-08 08:34:42'),
(9, 'What should FAQ contain?', 'Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.', 1, '2021-10-18 03:46:28', '2022-03-08 08:35:00'),
(10, 'What is Lorem Ipsum literally?', 'Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.', 1, '2021-10-18 03:56:29', '2022-03-08 08:35:18'),
(11, 'Why Lorem Ipsum is bad?', 'Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.', 1, '2021-10-18 03:56:46', '2022-03-08 08:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `flutterwaves`
--

CREATE TABLE `flutterwaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `public_key` text NOT NULL,
  `secret_key` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `country_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flutterwaves`
--

INSERT INTO `flutterwaves` (`id`, `public_key`, `secret_key`, `title`, `logo`, `status`, `country_code`, `currency_code`, `currency_rate`, `created_at`, `updated_at`) VALUES
(1, 'FLWPUBK_TEST-5760e3ff9888aa1ab5e5cd1ec3f99cb1-X', 'FLWSECK_TEST-81cb5da016d0a51f7329d4a8057e766d-X', 'TopLand', 'uploads/website-images/flutterwave-2021-12-28-04-57-14-8869.jpg', 1, 'NG', 'NGN', 415.5, NULL, '2022-03-01 02:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `section_name` varchar(191) NOT NULL,
  `show_homepage` tinyint(4) NOT NULL,
  `content_quantity` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `icon`, `header`, `description`, `section_name`, `show_homepage`, `content_quantity`, `created_at`, `updated_at`) VALUES
(1, NULL, 'About us', '', 'About section', 1, 4, NULL, '2021-08-24 13:15:35'),
(2, '', 'Our Features', 'Lorem Ipsum is simply dummy text', 'feature section', 1, 3, NULL, '2021-11-01 05:10:38'),
(3, NULL, 'Top Properties', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'top property section', 1, 6, NULL, '2022-02-27 06:29:03'),
(4, '', 'Featured Properties', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Featured properties section', 1, 6, NULL, '2022-02-27 06:29:32'),
(5, '', 'Our Agents', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Agent section', 1, 8, NULL, '2022-02-27 06:42:29'),
(6, '', 'Service You Need', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'service section', 1, 4, NULL, '2022-02-27 06:41:59'),
(7, '', 'Our Blogs', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Blog section', 1, 6, NULL, '2022-02-27 06:42:49'),
(8, '', 'Happy Clients', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'testimonial section', 1, 6, NULL, '2021-09-27 03:25:55'),
(9, '', 'Subscribe to Newsletter', 'Subscribe to get update and information. Don\'t worry, we won\'t send spam!', 'subscriber section', 1, NULL, NULL, '2021-08-24 14:18:01'),
(10, '', 'Meet some happy customers', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'testimonial section', 1, 6, NULL, '2021-09-06 07:13:49'),
(11, '', NULL, NULL, 'Banner Award section', 1, 4, NULL, '2022-02-27 06:52:39'),
(12, '', 'Urgent Properties', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Urgent properties section', 1, 6, NULL, '2022-02-27 06:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `instamojo_payments`
--

CREATE TABLE `instamojo_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_key` text NOT NULL,
  `auth_token` text NOT NULL,
  `currency_rate` varchar(255) NOT NULL DEFAULT '1',
  `account_mode` varchar(255) NOT NULL DEFAULT 'Sandbox',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instamojo_payments`
--

INSERT INTO `instamojo_payments` (`id`, `api_key`, `auth_token`, `currency_rate`, `account_mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test_5f4a2c9a58ef216f8a1a688910f', 'test_994252ada69ce7b3d282b9941c2', '75.47', 'Sandbox', 1, NULL, '2022-02-28 09:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `language_code`, `seo_title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hindi', 'hi', 'हिंदी', 1, '2023-10-25 18:20:03', '2023-10-25 18:20:03'),
(2, 'Punjabi', 'pa', 'ਪੰਜਾਬੀ', 1, '2023-10-25 18:26:50', '2023-10-25 18:26:50'),
(3, 'Nepali', 'ne', 'नेपाली', 1, '2023-10-25 18:28:43', '2023-10-25 18:28:43'),
(4, 'Urdu', 'ur', 'اردو', 1, '2023-10-25 18:29:47', '2023-10-25 18:29:47'),
(5, 'Bengali', 'bn', 'বাংলা', 1, '2023-10-25 18:31:24', '2023-10-25 18:31:24'),
(6, 'Tamil', 'ta', 'தமிழ்', 1, '2023-10-25 18:32:19', '2023-10-25 18:32:19'),
(7, 'Sinhala', 'si', 'සිංහල', 1, '2023-10-25 18:33:14', '2023-10-25 18:33:14'),
(8, 'Telugu', 'te', 'తెలుగు', 1, '2023-10-25 18:33:53', '2023-10-25 18:33:53'),
(9, 'Gujarati', 'gu', 'ગુજરાતી', 1, '2023-10-25 18:34:45', '2023-10-25 18:34:45'),
(10, 'Malayalam', 'ml', 'മലയാളം', 1, '2023-10-25 18:35:26', '2023-10-25 18:35:26'),
(11, 'Kannada', 'kn', 'ಕನ್ನಡ', 1, '2023-10-25 18:36:10', '2023-10-25 18:36:10'),
(12, 'Marathi', 'mr', 'मराठी', 1, '2023-10-25 18:36:49', '2023-10-25 18:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `manage_texts`
--

CREATE TABLE `manage_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(191) NOT NULL,
  `default_text` text NOT NULL,
  `custom_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_texts`
--

INSERT INTO `manage_texts` (`id`, `lang_key`, `default_text`, `custom_text`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'Dashboard', 'Dashboard', NULL, NULL),
(2, 'real_estate', 'Real Estate', 'Real Estate', NULL, NULL),
(3, 'agent_property', 'Agent Properties', 'Agent Properties', NULL, NULL),
(4, 'my_property', 'My Properties', 'My Properties', NULL, NULL),
(5, 'property_purpose', 'Property Purpose', 'Property Purpose', NULL, NULL),
(6, 'property_type', 'Property Types', 'Property Types', NULL, NULL),
(7, 'nearest_loc', 'Nearest Locations', 'Nearest Locations', NULL, NULL),
(8, 'aminities', 'Aminities', 'Aminities', NULL, NULL),
(9, 'package', 'Packages', 'Pricing Plan', NULL, '2023-10-06 05:55:15'),
(10, 'agent', 'Agents', 'Users', NULL, '2023-10-06 05:54:49'),
(11, 'order', 'Orders', 'Purchase Plan', NULL, '2023-10-06 09:39:29'),
(12, 'review', 'Reviews', 'Reviews', NULL, NULL),
(13, 'pages', 'Pages', 'Pages', NULL, NULL),
(14, 'about', 'About Us', 'About Us', NULL, NULL),
(15, 'terms_cond', 'Terms and Conditions', 'Terms and Conditions', NULL, NULL),
(16, 'custom_page', 'Custom Pages', 'Custom Pages', NULL, NULL),
(17, 'faq', 'FAQ', 'FAQ', NULL, NULL),
(18, 'package', 'Packages', 'Pricing Plan', NULL, '2023-10-06 05:54:07'),
(19, 'agent', 'Agents', 'Users', NULL, '2023-10-06 05:54:33'),
(20, 'order', 'Orders', 'Purchase Plan', NULL, '2023-10-06 09:39:29'),
(21, 'review', 'Reviews', 'Reviews', NULL, NULL),
(22, 'pages', 'Pages', 'Pages', NULL, NULL),
(23, 'about', 'About Us', 'About Us', NULL, NULL),
(24, 'terms_cond', 'Terms and Conditions', 'Terms and Conditions', NULL, NULL),
(25, 'custom_page', 'Custom Pages', 'Custom Pages', NULL, NULL),
(26, 'faq', 'FAQ', 'FAQ', NULL, NULL),
(518, 'locations', 'Locations', 'Locations', NULL, NULL),
(519, 'country', 'Country', 'Country', NULL, NULL),
(520, 'state', 'State', 'State', NULL, NULL),
(521, 'city', 'City', 'City', NULL, NULL),
(522, 'section_control', 'Section Control', 'Section Control', NULL, NULL),
(523, 'about_section', 'About Section', 'About Section', NULL, NULL),
(524, 'menu_section', 'Menu Section', 'Menu Section', NULL, NULL),
(525, 'home_section', 'Home Section', 'Home Section', NULL, NULL),
(526, 'all_section', 'All Section', 'All Section', NULL, NULL),
(527, 'banner_section', 'Banner Section', 'Banner Section', NULL, NULL),
(528, 'feature', 'Features', 'Features', NULL, NULL),
(529, 'testimonial', 'Testimonials', 'Testimonials', NULL, NULL),
(530, 'partner', 'Partners', 'Partners', NULL, NULL),
(531, 'services', 'Services', 'Services', NULL, NULL),
(532, 'overview', 'Overview', 'Overview', NULL, NULL),
(533, 'seo_setup', 'Seo Setup', 'Seo Setup', NULL, NULL),
(534, 'home_page', 'Home Page', 'Home Page', NULL, NULL),
(535, 'property_page', 'Property Page', 'Property Page', NULL, NULL),
(536, 'about_us', 'About Us', 'About Us', NULL, NULL),
(537, 'pricing_plan', 'Pricing Plan', 'Pricing Plan', NULL, NULL),
(538, 'agent_page', 'Agent Page', 'Agent Page', NULL, NULL),
(539, 'blog_page', 'Blog Page', 'Blog Page', NULL, NULL),
(540, 'contact_us', 'Contact Us', 'Contact Us', NULL, NULL),
(541, 'faq_page', 'FAQ Page', 'FAQ Page', NULL, NULL),
(542, 'language', 'Language', 'Language', NULL, NULL),
(543, 'website_language', 'Website Language', 'Website Language', NULL, NULL),
(544, 'validation_language', 'Validation Language', 'Validation Language', NULL, NULL),
(545, 'notify_language', 'Notification Language', 'Notification Language', NULL, NULL),
(546, 'setting', 'Setting', 'Setting', NULL, NULL),
(547, 'general_setting', 'General Setting', 'General Setting', NULL, NULL),
(548, 'blog_comment', 'Blog Comment', 'Blog Comment', NULL, NULL),
(549, 'cookie_consent_modal', 'Cookie Consent Modal', 'Cookie Consent Modal', NULL, NULL),
(550, 'payment_account', 'Payment Account', 'Payment Account', NULL, NULL),
(551, 'google_recaptcha', 'Google Recaptcha', 'Google Recaptcha', NULL, NULL),
(552, 'live_chat', 'Live Chat', 'Live Chat', NULL, NULL),
(553, 'google_analytic', 'Google Analytic', 'Google Analytic', NULL, NULL),
(554, 'pagination', 'Pagination', 'Pagination', NULL, NULL),
(555, 'clear_database', 'Clear Database', 'Clear Database', NULL, NULL),
(556, 'email_template', 'Email Template', 'Email Template', NULL, NULL),
(557, 'email_config', 'Email Configuration', 'Email Configuration', NULL, NULL),
(558, 'banner_img', 'Bannner Image', 'Bannner Image', NULL, NULL),
(559, 'login_img', 'Login Image', 'Login Image', NULL, NULL),
(560, 'default_profile_img', 'Default Profile Image', 'Default Profile Image', NULL, NULL),
(561, 'bg_img', 'Background Image', 'Background Image', NULL, NULL),
(562, 'admin', 'Admin', 'User Management', NULL, '2023-10-06 10:06:52'),
(563, 'manage_staff', 'Manage Staff', 'Manage Staff', NULL, NULL),
(564, 'blog', 'Blog', 'Vocabulary', NULL, '2023-10-09 09:54:53'),
(565, 'blog_cat', 'Blog Category', 'Vocabulary Category', NULL, '2023-10-09 09:54:53'),
(566, 'contact', 'Contact', 'Contact', NULL, '2021-10-09 02:31:26'),
(567, 'contact_info', 'Contact Information', 'Contact Information', NULL, NULL),
(568, 'contact_msg', 'Contact Message', 'Contact Message', NULL, NULL),
(569, 'subscriber', 'Subscriber', 'Subscriber', NULL, NULL),
(570, 'email_for_subscriber', 'Email For Subscriber', 'Email for Subscriber', NULL, NULL),
(571, 'total_order', 'Total Order', 'Total Purchase Plan', NULL, '2023-10-06 10:00:24'),
(572, 'active_property', 'Active Property', 'Active Property', NULL, NULL),
(573, 'pending_property', 'Pending Property', 'Pending Property', NULL, NULL),
(574, 'total_property', 'Total Property', 'Total Property', NULL, NULL),
(575, 'total_user', 'Total User', 'Total User', NULL, NULL),
(576, 'earnings', 'Earnings', 'Earnings', NULL, NULL),
(577, 'monthly', 'Monthly', 'Monthly', NULL, NULL),
(578, 'total', 'Total', 'Total', NULL, NULL),
(579, 'total_subscriber', 'Total Subscriber', 'Total Subscriber', NULL, NULL),
(580, 'earnings_in', 'Earning In', 'Earning In', NULL, NULL),
(581, 'login', 'Login', 'Login', NULL, NULL),
(582, 'admin_login', 'Admin Login', 'Admin Login', NULL, NULL),
(583, 'email', 'Email', 'Email', NULL, NULL),
(584, 'pass', 'Password', 'Password', NULL, NULL),
(585, 'forget_your_pass', 'Forget Your Password ?', 'Forget Your Password ?', NULL, NULL),
(586, 'no', 'No', 'No', NULL, NULL),
(587, 'yes', 'Yes', 'Yes', NULL, NULL),
(588, 'item_delete_confirm', 'Item Delete Confirmation', 'Item Delete Confirmation', NULL, NULL),
(589, 'are_you_sure', 'Are You Sure ?', 'Are You Sure ?', NULL, NULL),
(590, 'my_profile', 'My Profile', 'My Profile', NULL, NULL),
(591, 'logout', 'Logout', 'Logout', NULL, NULL),
(592, 'create', 'Create', 'Create', NULL, NULL),
(593, 'serial', 'Serial', 'Serial', NULL, NULL),
(594, 'property', 'Property', 'Property', NULL, NULL),
(595, 'price', 'Price', 'Price', NULL, NULL),
(596, 'type', 'Type', 'Type', NULL, NULL),
(597, 'purpose', 'Purpose', 'Purpose', NULL, NULL),
(598, 'views', 'Views', 'Views', NULL, NULL),
(599, 'status', 'Status', 'Status', NULL, NULL),
(600, 'active', 'Active', 'Active', NULL, NULL),
(601, 'inactive', 'InActive', 'InActive', NULL, NULL),
(602, 'action', 'Action', 'Action', NULL, NULL),
(603, 'agent_s', 'Agent', 'User', NULL, '2023-10-06 09:40:03'),
(604, 'all_property', 'All Property', 'All Property', NULL, NULL),
(605, 'basic_info', 'Basic Information', 'Basic Information', NULL, NULL),
(606, 'title', 'Title', 'Title', NULL, NULL),
(607, 'slug', 'Slug', 'Slug', NULL, NULL),
(608, 'property_type', 'Property Type', 'Property Type', NULL, NULL),
(609, 'address', 'Address', 'Address', NULL, NULL),
(610, 'phone', 'Phone', 'Phone', NULL, NULL),
(612, 'website', 'Website', 'Website', NULL, NULL),
(613, 'period', 'Period', 'Period', NULL, NULL),
(614, 'others_info', 'Others Information', 'Others Information', NULL, NULL),
(615, 'total_area', 'Total Area', 'Total Area', NULL, NULL),
(616, 'sqft', 'Square Feet', 'Square Feet', NULL, NULL),
(617, 'total_unit', 'Total Unit', 'Total Unit', NULL, NULL),
(618, 'total_room', 'Total Room', 'Total Room', NULL, NULL),
(619, 'total_bathroom', 'Total Bathroom', 'Total Bathroom', NULL, NULL),
(620, 'total_bedroom', 'Total Bedroom', 'Total Bedroom', NULL, NULL),
(621, 'total_floor', 'Total Floor', 'Total Floor', NULL, NULL),
(622, 'total_kitchen', 'Total Kitchen', 'Total Kitchen', NULL, NULL),
(623, 'parking_place', 'Total Parking Place', 'Total Parking Place', NULL, NULL),
(624, 'img_pdf_video', 'Image, PDF and Video', 'Image, PDF and Video', NULL, NULL),
(625, 'pdf_file', 'PDF File', 'PDF File', NULL, NULL),
(626, 'exist_pdf', 'Existing PDF', 'Existing PDF', NULL, NULL),
(627, 'banner_img', 'Banner Image', 'Banner Image', NULL, NULL),
(628, 'exist_banner_img', 'Existing Banner Image', 'Existing Banner Image', NULL, NULL),
(629, 'thumb_img', 'Thumbnail Image', 'Thumbnail Image', NULL, NULL),
(630, 'exist_thumb', 'Existing Thumbnail Image', 'Existing Thumbnail Image', NULL, NULL),
(631, 'video_link', 'Youtube Video Link', 'Youtube Video Link', NULL, NULL),
(632, 'select_nearest_loc', 'Select Nearest Location', 'Select Nearest Location', NULL, NULL),
(633, 'distance', 'Distance', 'Distance', NULL, NULL),
(634, 'km', 'Kilometer', 'km', NULL, NULL),
(635, 'detail_google_map', 'Property Details and Google Map', 'Property Details and Google Map', NULL, NULL),
(636, 'select_property_type', 'Select Property Type', 'Select Property Type', NULL, NULL),
(637, 'select_city', 'Select City', 'Select City', NULL, NULL),
(638, 'daily', 'Daily', 'Daily', NULL, NULL),
(639, 'monthly', 'Monthly', 'Monthly', NULL, NULL),
(640, 'yearly', 'Yearly', 'Yearly', NULL, NULL),
(641, 'slider_img', 'Slider Images', 'Slider Images', NULL, NULL),
(642, 'multiple', 'Multiple', 'Multiple', NULL, NULL),
(643, 'google_map', 'Google Map Code', 'Google Map Code', NULL, NULL),
(644, 'des', 'Description', 'Description', NULL, NULL),
(645, 'top_property', 'Top Property', 'Top Property', NULL, NULL),
(646, 'urgent_property', 'Urgent Property', 'Urgent Property', NULL, NULL),
(647, 'featured', 'Featured', 'Featured', NULL, NULL),
(648, 'seo_title', 'SEO Title', 'SEO Title', NULL, NULL),
(649, 'seo_des', 'SEO Description', 'SEO Description', NULL, NULL),
(650, 'save', 'Save', 'Save', NULL, NULL),
(651, 'update', 'Update', 'Update', NULL, NULL),
(652, 'exist_video', 'Existing Video', 'Existing Video', NULL, NULL),
(653, 'purpose_form', 'Purpose Form', 'Purpose Form', NULL, NULL),
(654, 'close', 'Close', 'Close', NULL, NULL),
(656, 'property_type_s', 'Property Type', 'Property Type', NULL, NULL),
(657, 'all_property_type', 'All Property Type', 'All Property Type', NULL, NULL),
(658, 'location', 'Location', 'Location', NULL, NULL),
(659, 'location_form', 'Location Form', 'Location Form', NULL, NULL),
(660, 'aminity', 'Aminity', 'Aminity', NULL, NULL),
(661, 'aminity_form', 'Aminity Form', 'Aminity Form', NULL, NULL),
(662, 'package_name', 'Package Name', 'Package Name', NULL, NULL),
(663, 'package_type', 'Package Type', 'Package Type', NULL, NULL),
(664, 'premium', 'Premium', 'Premium', NULL, NULL),
(665, 'free', 'Free', 'Free', NULL, NULL),
(666, 'number_of_day', 'Number Of Days', 'Number Of Days', NULL, NULL),
(667, 'number_of_property', 'Number Of Property', 'Number Of Property', NULL, NULL),
(668, 'number_of_aminities', 'Number of Aminities', 'Number of Aminities', NULL, NULL),
(669, 'number_of_nearest_place', 'Number of Nearest Place', 'Number of Nearest Place', NULL, NULL),
(670, 'number_of_photo', 'Number Of Photo ', 'Number Of Photo', NULL, '2021-10-09 02:31:26'),
(671, 'allow_feature', 'Allow Feature', 'Allow Feature', NULL, NULL),
(672, 'number_of_featured_property', 'Number Of Featured Property', 'Number Of Featured Property', NULL, NULL),
(673, 'allow_top_property', 'Allow Top Property', 'Allow Top Property', NULL, NULL),
(674, 'number_of_top_property', 'Number Of Top Property', 'Number Of Top Property', NULL, NULL),
(675, 'allow_urgent_property', 'Allow Urgent Property', 'Allow Urgent Property', NULL, NULL),
(676, 'number_of_urgent_property', 'Number Of Urgent Property', 'Number Of Urgent Property', NULL, NULL),
(677, 'package_order', 'Package Order', 'Package Order', NULL, NULL),
(678, 'unlimited_qty', 'Unlimitd Quantity', 'Unlimitd Quantity', NULL, NULL),
(679, 'all_package', 'All Package', 'All Package', NULL, NULL),
(680, 'package_form', 'Package Form', 'Package Form', NULL, NULL),
(681, 'package_detail', 'Package Details', 'Package Details', NULL, NULL),
(682, 'agent_table', 'Agent Table', 'Agent Table', NULL, NULL),
(683, 'agent_info', 'Agent Information', 'Agent Information', NULL, NULL),
(684, 'name', 'Name', 'Name', NULL, NULL),
(686, 'phone', 'Phone', 'Phone', NULL, NULL),
(687, 'photo', 'Photo', 'Photo', NULL, NULL),
(688, 'about', 'About', 'About', NULL, NULL),
(689, 'facebook', 'Facebook', 'Facebook', NULL, NULL),
(690, 'twitter', 'Twitter', 'Twitter', NULL, NULL),
(691, 'linkedin', 'LinkedIn', 'LinkedIn', NULL, NULL),
(692, 'whatsapp', 'Whatsapp', 'Whatsapp', NULL, NULL),
(693, 'website', 'Website', 'Website', NULL, NULL),
(694, 'go_back', 'Go Back', 'Go Back', NULL, NULL),
(695, 'package_s', 'Package', 'Package', NULL, NULL),
(696, 'purchase_date', 'Purchase Date', 'Purchase Date', NULL, NULL),
(697, 'expired_date', 'Expired Date', 'Expired Date', NULL, NULL),
(698, 'order_table', 'Order Table', 'Purchase Plan Table', NULL, '2023-10-06 09:42:53'),
(699, 'order_detail', 'Order Details', 'Purchase Plan Details', NULL, '2023-10-06 09:43:09'),
(700, 'amount_of_usd', 'Amount Of USD', 'Amount Of USD', NULL, NULL),
(701, 'amount_real_currency', 'Amount Of Real Currency', 'Amount Of Real Currency', NULL, NULL),
(702, 'payment_method', 'Payment Method', 'Payment Method', NULL, NULL),
(703, 'trans_id', 'Transaction Id', 'Transaction Id', NULL, NULL),
(704, 'expired', 'Expired', 'Expired', NULL, NULL),
(705, 'unlimited', 'Unlimited', 'Unlimited', NULL, NULL),
(706, 'review_table', 'Review Table', 'Review Table', NULL, NULL),
(707, 'comment', 'Comment', 'Comment', NULL, NULL),
(708, 'rating', 'Rating', 'Rating', NULL, NULL),
(709, 'service_rat', 'Service', 'Service', NULL, NULL),
(710, 'location_rat', 'Location', 'Location', NULL, NULL),
(711, 'clean_rat', 'Cleanliness', 'Cleanliness', NULL, NULL),
(712, 'avg', 'Avarage', 'Avarage', NULL, NULL),
(713, 'value_rat', 'Value', 'Value', NULL, NULL),
(714, 'exist_img', 'Existing Image', 'Existing Image', NULL, NULL),
(715, 'img', 'Image', 'Image', NULL, NULL),
(717, 'service', 'Service', 'Service', NULL, NULL),
(718, 'history', 'History', 'Histroy', NULL, NULL),
(719, 'privacy_policy', 'Privacy  and Policy', 'Privacy  and Policy', NULL, NULL),
(720, 'page_name', 'Page Name', 'Page Name', NULL, NULL),
(721, 'all_custom_page', 'All Custom Page', 'All Custom Page', NULL, NULL),
(722, 'custom_page_form', 'Custom Page Form', 'Custom Page Form', NULL, NULL),
(723, 'new_img', 'New Image', 'New Image', NULL, NULL),
(724, 'qus', 'Question', 'Question', NULL, NULL),
(725, 'ans', 'Answer', 'Answer', NULL, NULL),
(726, 'faq_table', 'FAQ Table', 'FAQ Table', NULL, NULL),
(727, 'faq_form', 'FAQ Form', 'FAQ Form', NULL, NULL),
(728, 'country_table', 'Country Table', 'Country Table', NULL, NULL),
(729, 'country_form', 'Country Form', 'Country Form', NULL, NULL),
(730, 'state_table', 'State Table', 'State Table', NULL, NULL),
(731, 'state_form', 'State Form', 'State Form', NULL, NULL),
(732, 'all_state', 'All State', 'All State', NULL, NULL),
(733, 'select_country', 'Select Country', 'Select Country', NULL, NULL),
(734, 'state_name', 'State Name', 'State Name', NULL, NULL),
(735, 'city_table', 'City Table', 'City Table', NULL, NULL),
(736, 'city', 'City', 'City', NULL, NULL),
(737, 'all_city', 'All City', 'All City', NULL, NULL),
(738, 'city_form', 'City Form', 'City Form', NULL, NULL),
(739, 'select_state', 'Select State', 'Select State', NULL, NULL),
(740, 'award_section', 'Award Section', 'Award Section', NULL, NULL),
(741, 'main_section', 'Main Section', 'Main Section', NULL, NULL),
(742, 'header', 'Header', 'Header', NULL, NULL),
(743, 'content_qty', 'Content Quantity', 'Content Qty', NULL, NULL),
(744, 'show_homepage', 'Show Homepage', 'Show Homepage', NULL, NULL),
(745, 'team_section', 'Team Section', 'Team Section', NULL, NULL),
(746, 'banner_award', 'Banner Award', 'Banner Award', NULL, NULL),
(747, 'top_properties', 'Top Properties', 'Top Properties', NULL, NULL),
(748, 'featured_properties', 'Featured Properties', 'Featured Properties', NULL, NULL),
(749, 'service_form', 'Service Form', 'Service Form', NULL, NULL),
(750, 'icon', 'Icon', 'Icon', NULL, NULL),
(751, 'feature_table', 'Feature Table', 'Feature Table', NULL, NULL),
(752, 'feature_form', 'Feature Form', 'Feature Form', NULL, NULL),
(753, 'icon', 'Icon', 'Icon', NULL, NULL),
(754, 'feature_table', 'Feature Table', 'Feature Table', NULL, NULL),
(755, 'testimonial_table', 'Testimonial Table', 'Testimonial Table', NULL, NULL),
(756, 'testimonial_form', 'Testimonial Form', 'Testimonial Form', NULL, NULL),
(757, 'designation', 'Designation', 'Designation', NULL, NULL),
(758, 'partner_table', 'Partner Table', 'Partner Table', NULL, NULL),
(759, 'partner_form', 'Partner Form', 'Partner Form', NULL, NULL),
(760, 'service_table', 'Service Table', 'Service Table', NULL, NULL),
(761, 'service_form', 'Service Form', 'Service Form', NULL, NULL),
(764, 'overview_table', 'Overview Table', 'Overview Table', NULL, NULL),
(765, 'overview_form', 'Overview Form', 'Overview Form', NULL, NULL),
(766, 'meta_des', 'Meta Description', 'Meta Description', NULL, NULL),
(767, 'general_setting', 'General Setting', 'General Setting', NULL, NULL),
(768, 'exist_logo', 'Existing Logo', 'Existing Logo', NULL, NULL),
(769, 'exist_favicon', 'Existing Favicon', 'Existing Favicon', NULL, NULL),
(770, 'favicon', 'Favicon', 'Favicon', NULL, NULL),
(771, 'sidebar_header', 'Sidebar Header', 'Sidebar Header', NULL, NULL),
(772, 'sidebar_header_icon', 'Sidebar Header Icon', 'Sidebar Header Icon', NULL, NULL),
(773, 'email_send_contact_msg', 'Email For Send Contact Message', 'Email For Send Contact Message', NULL, NULL),
(774, 'save_contact_msg', 'Save Contact Message in Database', 'Save Contact Message in Database', NULL, NULL),
(775, 'layout', 'Layout', 'Layout', NULL, NULL),
(776, 'rtl', 'RTL(right to left)', 'RTL(right to left)', NULL, NULL),
(777, 'ltr', 'LTR(left to right)', 'LTR(left to right)', NULL, NULL),
(778, 'currency_icon', 'Currency Icon', 'Currency Icon', NULL, NULL),
(779, 'currency_rate', 'Currency Rate', 'Currency Rate', NULL, NULL),
(780, 'pre_notify_day', 'Pre Notification Day For Expired Order', 'Pre Notification Day For Expired Order', NULL, NULL),
(781, 'timezone', 'TimeZone', 'TimeZone', NULL, NULL),
(782, 'logo', 'Logo', 'Logo', NULL, NULL),
(783, 'currency_name', 'Currency Name', 'Currency Name', NULL, NULL),
(784, 'comment_type', 'Comment Type', 'Comment Type', NULL, NULL),
(785, 'fb_comment', 'Facebook Comment', 'Facebook Comment', NULL, NULL),
(786, 'custom_comment', 'Custom Comment', 'Custom Comment', NULL, NULL),
(787, 'fb_app_id', 'Facebook App Id', 'Facebook App Id', NULL, NULL),
(788, 'allow_cookie', 'Allow Cookie Consent', 'Allow Cookie Consent', NULL, NULL),
(789, 'border', 'Border', 'Border', NULL, NULL),
(790, 'corners', 'Corners', 'Corners', NULL, NULL),
(791, 'bg_color', 'Background Color', 'Background Color', NULL, NULL),
(792, 'text_color', 'Text Color', 'Text Color', NULL, NULL),
(793, 'border_color', 'Border Color', 'Border Color', NULL, NULL),
(794, 'btn_color', 'Button Color', 'Button Color', NULL, NULL),
(795, 'btn_text_color', 'Button Text Color', 'Button Text Color', NULL, NULL),
(796, 'link_text', 'Link Text', 'Link Text', NULL, NULL),
(797, 'btn_text', 'Button Text', 'Button Text', NULL, NULL),
(798, 'msg', 'Message', 'Message', NULL, NULL),
(799, 'none', 'None', 'None', NULL, NULL),
(800, 'thin', 'Thin', 'Thin', NULL, NULL),
(801, 'normal', 'Normal', 'Normal', NULL, NULL),
(802, 'thick', 'Thick', 'Thick', NULL, NULL),
(803, 'small', 'Small', 'Small', NULL, NULL),
(804, 'large', 'Large', 'Large', NULL, NULL),
(805, 'paypal_account_mode', 'Paypal Account Mode', 'Paypal Account Mode', NULL, NULL),
(806, 'sandbox', 'Sandbox', 'Sandbox', NULL, NULL),
(807, 'live', 'Live', 'Live', NULL, NULL),
(808, 'paypal_client_id', 'Paypal Client Id', 'Paypal Client Id', NULL, NULL),
(809, 'paypal_secret_key', 'Paypal Secret Key', 'Paypal Secret Key', NULL, NULL),
(810, 'stripe_key', 'Stripe Key', 'Stripe Key', NULL, NULL),
(811, 'stripe_secret', 'Stripe Secret', 'Stripe Secret', NULL, NULL),
(812, 'allow_captcha', 'Allow Google Recaptcha', 'Allow Google Recaptcha', NULL, NULL),
(813, 'captcha_key', 'Captcha Site Key', 'Captcha Site Key', NULL, NULL),
(814, 'captcha_secret', 'Captcha Secret Key', 'Captcha Secret Key', NULL, NULL),
(815, 'allow_live_chat', 'Allow Tawk Live Chat', 'Allow Tawk Live Chat', NULL, NULL),
(816, 'chat_link', 'Tawk Live Direct Chat Link', 'Tawk Live Direct Chat Link', NULL, NULL),
(817, 'allow_analytic', 'Allow Google Analytic', 'Allow Google Analytic', NULL, NULL),
(818, 'analytic_id', 'Analytic Tracking Id', 'Analytic Tracking Id', NULL, NULL),
(819, 'qty', 'Quantity', 'Quantity', NULL, NULL),
(820, 'clear_all_data', 'Clear All Data', 'Clear All Data', NULL, NULL),
(821, 'email_type', 'Email Type', 'Email Type', NULL, NULL),
(822, 'subject', 'Subject', 'Subject', NULL, NULL),
(823, 'variable', 'Variable', 'Variable', NULL, NULL),
(824, 'meaning', 'Meaning', 'Meaning', NULL, NULL),
(825, 'user_name', 'User Name', 'User Name', NULL, NULL),
(826, 'user_email', 'User Email', 'User Email', NULL, NULL),
(827, 'user_phone', 'User Phone', 'User Phone', NULL, NULL),
(828, 'msg_subject', 'Message Subject', 'Message Subject', NULL, NULL),
(829, 'total_amount', 'Total Amount', 'Total Amount', NULL, NULL),
(830, 'mail_host', 'Mail Hosto', 'Mail Hosto', NULL, NULL),
(831, 'smtp_user', 'SMTP User Name', 'SMTP User Name', NULL, NULL),
(832, 'smtp_pass', 'SMTP Password', 'SMTP Password', NULL, NULL),
(833, 'mail_port', 'Mail Port', 'Mail Port', NULL, NULL),
(834, 'mail_encryption', 'Mail Encryption', 'Mail Encryption', NULL, NULL),
(835, 'tls', 'TLS', 'TLS', NULL, NULL),
(836, 'ssl', 'SSL', 'SSL', NULL, NULL),
(837, 'admin_table', 'Admin Table', 'Admin Table', NULL, NULL),
(838, 'all_admin', 'All Admin', 'All Admin', NULL, NULL),
(839, 'staff_table', 'Staff Table', 'Staff Table', NULL, NULL),
(840, 'all_staff', 'All Staff', 'All Staff', NULL, NULL),
(841, 'author', 'Author', 'Author', NULL, NULL),
(842, 'staff_form', 'Staff Form', 'Staff Form', NULL, NULL),
(843, 'cat_table', 'Category Table', 'Category Table', NULL, NULL),
(844, 'cat_form', 'Category Form', 'Category Form', NULL, NULL),
(845, 'cat', 'Category', 'Category', NULL, NULL),
(846, 'select_cat', 'Select Category', 'Select Category', NULL, NULL),
(847, 'short_des', 'Short Description', 'Short Description', NULL, NULL),
(848, 'all_blog', 'All Blog', 'All Vocabulary', NULL, '2023-10-09 09:54:53'),
(849, 'blog_form', 'Blog Form', 'Vocabulary Form', NULL, '2023-10-09 09:54:54'),
(850, 'blog_table', 'Blog Table', 'Vocabulary Table', NULL, '2023-10-09 09:54:54'),
(851, 'view', 'View', 'View', NULL, NULL),
(852, 'topbar_contact', 'Topbar Contact', 'Topbar Contact', NULL, NULL),
(853, 'footer_contact', 'Footer Contact', 'Footer Contact', NULL, NULL),
(854, 'social_contact', 'Social Contact', 'Social Contact', NULL, NULL),
(855, 'footer_about', 'Footer About', 'Footer About', NULL, NULL),
(856, 'google_map_code', 'Google Map Embed Code', 'Google Map Embed Code', NULL, NULL),
(857, 'copyright', 'CopyRight', 'CopyRight', NULL, NULL),
(858, 'instagram', 'Instagram', 'Instagram', NULL, NULL),
(859, 'youtube', 'Youtube', 'Youtube', NULL, NULL),
(860, 'msg_from', 'Message From', 'Message From', NULL, NULL),
(861, 'subscriber_table', 'Subscriber Table', 'Subscriber Table', NULL, NULL),
(862, 'email_for_subscriber', 'Email For Subscriber', 'Email For Subscriber', NULL, NULL),
(863, 'send_mail', 'Send Email', 'Send Email', NULL, NULL),
(864, 'verified', 'Verified', 'Verified', NULL, NULL),
(865, 'new_pass', 'New Password', 'New Password', NULL, NULL),
(866, 'confirm_pass', 'Confirm Password', 'Confirm Password', NULL, NULL),
(867, 'forget_pass', 'Forget Password', 'Forget Password', NULL, NULL),
(868, 'reset_pass', 'Reset Password', 'Reset Password', NULL, NULL),
(869, 'login_here', 'Login Here', 'Login Here', NULL, NULL),
(870, 'default_purpose', 'Default Purpose', 'Default Purpose', NULL, NULL),
(871, 'staff_login', 'Staff Login', 'Staff Login', NULL, NULL),
(872, 'property_table', 'Property Table', 'Property Table', NULL, NULL),
(873, 'subscribe', 'Subscribe', 'Subscribe', NULL, NULL),
(874, 'short_link', 'Short Links', 'Short Links', NULL, NULL),
(875, 'help_link', 'Help Link', 'Help Link', NULL, NULL),
(876, 'follow_us', 'Follow Us', 'Follow Us', NULL, NULL),
(877, 'any', 'Any', 'Any', NULL, NULL),
(878, 'sell', 'Sell', 'Sell', NULL, NULL),
(879, 'rent', 'Rent', 'Rent', NULL, NULL),
(880, 'search_type', 'Type...', 'Type...', NULL, NULL),
(881, 'select_location', 'Select Location', 'Select Location', NULL, NULL),
(882, 'search_property', 'Search Property', 'Search Property', NULL, NULL),
(883, 'urgent', 'Urgent', 'Urgent', NULL, NULL),
(884, 'view_detail', 'View Details', 'View Details', NULL, NULL),
(885, 'view_profile', 'View Profile', 'View Profile', NULL, NULL),
(886, 'read_more', 'Read More', 'Read More', NULL, NULL),
(887, 'rooms', 'Rooms', 'Rooms', NULL, NULL),
(888, 'floors', 'Floors', 'Floors', NULL, NULL),
(889, 'units', 'Units', 'Units', NULL, NULL),
(890, 'sqft_s', 'Square Feet', 'Sqft', NULL, NULL),
(891, 'bed', 'Bed', 'Bed', NULL, NULL),
(892, 'bath', 'Bath', 'Bath', NULL, NULL),
(893, 'contact_support', 'Contact Support', 'Contact Support', NULL, NULL),
(894, 'send_msg', 'Send Message', 'Send Message', NULL, NULL),
(895, 'days', 'Days', 'Days', NULL, NULL),
(896, 'unlimited_pro_submission', 'Unlimited Property Submission', 'Unlimited Property Submission', NULL, NULL),
(897, 'pro_submission', 'Property Submission', 'Propertiy Submission', NULL, NULL),
(898, 'unlimited_aminity', 'Unlimited Aminity', 'Unlimited Aminity', NULL, NULL),
(899, 'unlimited_nearest_place', 'Unlimited Nearest Place', 'Unlimited Nearest Place', NULL, NULL),
(900, 'nearest_place', 'Nearest Place', 'Nearest Place', NULL, NULL),
(901, 'unlimited_photo', 'Unlimited Photo', 'Unlimited Photo', NULL, NULL),
(902, 'photo', 'Photo', 'Photo', NULL, NULL),
(903, 'featured_property', 'Featured Property', 'Featured Property', NULL, NULL),
(904, 'unlimited_feature_property', 'Unlimited Featured Propertiy', 'Unlimited Featured Property', NULL, NULL),
(905, 'unlimited_top_property', 'Unlimited Top Property', 'Unlimited Top Property', NULL, NULL),
(906, 'unlimited_urgent_property', 'Unlimited Urgent Property', 'Unlimited Urgent Property', NULL, NULL),
(907, 'start_with', 'Start with', 'Start with', NULL, NULL),
(908, 'blog_not_found', 'Blog not found.', 'Vocabulary not found.', NULL, '2023-10-09 09:54:54'),
(909, 'search', 'Search', 'Search', NULL, NULL),
(910, 'categories', 'Categories', 'Categories', NULL, NULL),
(911, 'trend_post', 'Trending Posts', 'Trending Posts', NULL, NULL),
(912, 'comments', 'Comments', 'Comments', NULL, NULL),
(913, 'submit_comment', 'Submit a Comment', 'Submit a Comment', NULL, NULL),
(914, 'submit', 'Submit', 'Submit', NULL, NULL),
(915, 'find_property', 'Find Your Property', 'Find Your Property', NULL, NULL),
(916, 'keyword', 'Keyword', 'Keyword', NULL, NULL),
(917, 'default_order', 'Default Order', 'Default Order', NULL, NULL),
(918, 'most-views', 'Most Views', 'Most Views', NULL, NULL),
(919, 'top', 'Top', 'Top', NULL, NULL),
(920, 'new', 'New', 'New', NULL, NULL),
(921, 'oldest', 'Oldest', 'Oldest', NULL, NULL),
(922, 'default_order', 'Default Order', 'Default Order', NULL, NULL),
(923, 'most_views', 'Most Views', 'Most Views', NULL, NULL),
(924, 'top', 'Top', 'Top', NULL, NULL),
(925, 'new', 'New', 'New', NULL, NULL),
(926, 'oldest', 'Oldest', 'Oldest', NULL, NULL),
(927, 'property_not_found', 'Property not found.', 'Property not found.', NULL, NULL),
(928, 'add_review', 'Add Review', 'Add Review', NULL, NULL),
(929, 'add_wishlist', 'Add to Wishlist', 'Add to Wishlist', NULL, NULL),
(930, 'detail_and_feature', 'Details & Features', 'Details & Features', NULL, NULL),
(931, 'areas', 'Areas', 'Areas', NULL, NULL),
(932, 'bedrooms', 'Bedrooms', 'Bedrooms', NULL, NULL),
(933, 'bathrooms', 'Bathrooms', 'Bathrooms', NULL, NULL),
(934, 'kitchens', 'Kitchens', 'Kitchens', NULL, NULL),
(935, 'parking_place_s', 'Parking Place', 'Parking Place', NULL, NULL),
(936, 'download_pdf', 'Download PDF', 'Download PDF', NULL, NULL),
(937, 'property_video', 'Property video', 'Property video', NULL, NULL),
(938, 'out_of_5', 'Out of 5.0', 'Out of 5.0', NULL, NULL),
(939, 'value_for_money', 'Value for Money', 'Value for Money', NULL, NULL),
(940, 'write_review', 'Write a Review', 'Write a Review', NULL, NULL),
(941, 'avg_rat', 'Average Rating', 'Average Rating', NULL, NULL),
(942, 'before_review', 'Please login to write review.', 'Please login to write review.', NULL, NULL),
(943, 'related_pro', 'Related Properties', 'Related Properties', NULL, NULL),
(944, 'quick_contact', 'Quick Contact', 'Quick Contact', NULL, NULL),
(945, 'properties', 'Properties', 'Properties', NULL, NULL),
(946, 'if_account_exist', 'If you have an account?', 'If you have an account?', NULL, NULL),
(947, 'please_login', 'Please Login', 'Please Login', NULL, NULL),
(948, 'dont_have_account', 'Don\'t Have An Account?', 'Don\'t Have An Account?', NULL, NULL),
(949, 'please_register', 'Please Register', 'Please Register', NULL, NULL),
(950, 'create_account', 'Create Account', 'Create Account', NULL, NULL),
(951, 'remember', 'Remember me', 'Remember me', NULL, NULL),
(952, 'wishlist', 'Wishlists', 'Wishlists', NULL, NULL),
(953, 'pricing_plan', 'Pricing Plan', 'Pricing Plan', NULL, NULL),
(954, 'my_review', 'My Reviews', 'My Reviews', NULL, NULL),
(955, 'client_review', 'Client Reviews', 'Client Reviews', NULL, NULL),
(956, 'publish_pro', 'Published Property', 'Published Property', NULL, NULL),
(957, 'expired_pro', 'Expired Property', 'Expired Property', NULL, NULL),
(958, 'active_order', 'Active Order', 'Active Order', NULL, NULL),
(959, 'available', 'Available', 'Available', NULL, NULL),
(960, 'not_available', 'Not Available', 'Not Available', NULL, NULL),
(961, 'update_review', 'Update Review', 'Update Review', NULL, NULL),
(962, 'old_pass', 'Old Password', 'Old Password', NULL, NULL),
(963, 'change_pass', 'Change Password', 'Change Password', NULL, NULL),
(964, 'date_added', 'Date Added', 'Date Added', NULL, NULL),
(965, 'currently_active', 'Currently Active', 'Currently Active', NULL, NULL),
(966, 'order_id', 'Order Id', 'Order Id', NULL, NULL),
(967, 'amount', 'Amount', 'Amount', NULL, NULL),
(968, 'payment', 'Payment', 'Payment', NULL, NULL),
(969, 'print', 'Print this invoice', 'Print this invoice', NULL, NULL),
(970, 'stripe', 'Stripe', 'Stripe', NULL, NULL),
(971, 'paypal', 'Paypal', 'Paypal', NULL, NULL),
(972, 'card_number', 'Card Number', 'Card Number', NULL, NULL),
(973, 'cvc', 'CVC', 'CVC', NULL, NULL),
(974, 'exp_month', 'Expiration Month', 'Expiration Month', NULL, NULL),
(975, 'exp_year', 'Expiration Year', 'Expiration Year', NULL, NULL),
(976, 'pay_with_paypal', 'Pay With Paypal', 'Pay With Paypal', NULL, NULL),
(977, 'valid_card', 'Please insert valid card Information', 'Please insert valid card Information', NULL, NULL),
(978, 'new', 'New', 'New', NULL, NULL),
(979, 'remove', 'Remove', 'Remove', NULL, NULL),
(980, 'first_icon', 'First Social Icon', 'First social icon', NULL, NULL),
(981, 'first_link', 'First Link', 'First link', NULL, NULL),
(982, 'second_icon', 'Second Social Icon', 'Second social icon', NULL, NULL),
(983, 'second_link', 'Second Link', 'Second link', NULL, NULL),
(984, 'third_icon', 'Third social icon', 'Third social icon', NULL, NULL),
(985, 'third_link', 'Third Link', 'Third Link', NULL, NULL),
(986, 'four_icon', 'Four social link', 'Four social link', NULL, NULL),
(987, 'four_link', 'Four Link', 'Four link', NULL, NULL),
(988, 'theme_color', 'Theme Color', 'Theme Color', NULL, NULL),
(989, 'color_one', 'Theme Color One', 'Theme Color One', NULL, NULL),
(990, 'color_two', 'Theme Color Two', 'Theme Color Two', NULL, NULL),
(991, 'color_three', 'Theme Color Three', 'Theme Color Three', NULL, NULL),
(992, 'inr', 'INR', 'INR', NULL, NULL),
(993, 'bank_payment', 'Bank Payment', 'Bank', NULL, NULL),
(994, 'razorpay', 'RazorPay', 'RazorPay', NULL, NULL),
(995, 'trans_info', 'Transaction Information', 'Transaction Information', NULL, NULL),
(996, 'pending_order', 'Pending Orders', 'Pending Purchase Plan', NULL, '2023-10-06 09:39:30'),
(997, 'pending', 'Pending', 'Pending', NULL, NULL),
(998, 'payment_accept', 'Payment Accept', 'Payment Accept', NULL, NULL),
(999, 'delete', 'Delete', 'Delete', NULL, NULL),
(1000, 'bank_details', 'Bank Account Detail', 'Bank Account Detail', NULL, NULL),
(1001, 'razorpay_info', 'RazorPay Payment Information', 'RazorPay Payment Information', NULL, NULL),
(1002, 'razorpay_key', 'RazorPay key', 'RazorPay key', NULL, NULL),
(1003, 'razorpay_secret_key', 'Razorpay Secret Key', 'Razorpay Secret Key', NULL, NULL),
(1004, 'pay', 'Pay', 'Pay', NULL, NULL),
(1005, 'per_active_currency', 'Per Active Currency', 'Per Active Currency', NULL, NULL),
(1006, 'active_currency', 'Currency Rate', 'Currency Rate', NULL, NULL),
(1007, 'flutterwave', 'Flutterwave', 'Flutterwave', NULL, NULL),
(1008, 'pay_with_flutterwave', 'Pay with Flutterwave', 'Pay with Flutterwave', NULL, NULL),
(1009, 'public_key', 'Public key', 'Public key', NULL, NULL),
(1010, 'secret_key', 'Secret key', 'Secret key', NULL, NULL),
(1011, 'slider', 'Slider', 'Slider', NULL, NULL),
(1012, 'slider_form', 'Slider Form', 'Slider Form', NULL, NULL),
(1013, 'slider_table', 'Slider Table', 'Slider Table', NULL, NULL),
(1014, 'area', 'Area', 'Area', NULL, NULL),
(1015, 'out_of_5', 'out of 5.0', 'out of 5.0', NULL, NULL),
(1016, 'search_blog', 'Search Blog', 'Search Vocabulary', NULL, '2023-10-09 09:54:54'),
(1017, 'payment_detail', 'payment details', 'payment details', NULL, NULL),
(1018, 'are_you_sure', 'Are you sure?', 'Are you sure?', NULL, NULL),
(1019, 'delete_des', 'Are You sure delete this item ?', 'Are You sure delete this item ?', NULL, NULL),
(1020, 'yes_delete', 'Yes, Delete it.', 'Yes, Delete it.', NULL, NULL),
(1021, 'cancel', 'Cancel', 'Cancel', NULL, NULL),
(1022, 'delete', 'Delete', 'Delete', NULL, NULL),
(1023, 'delete_success', 'Delete Successffully', 'Delete Successffully', NULL, NULL),
(1024, 'upgrade_plan', 'You will also upgrade your plan!', 'You will also upgrade your plan!', NULL, NULL),
(1025, 'enrolled', 'Enrolled', 'Enrolled', NULL, NULL),
(1026, 'free_enroll', 'Congrats to Enroll our Free Plan', 'Congrats to Enroll our Free Plan', NULL, NULL),
(1027, 'enrol_it', 'Yes, Enroll it!', 'Yes, Enroll it!', NULL, NULL),
(1028, 'go_to_homepage', 'Go to Homepage', 'Go to Homepage', NULL, NULL),
(1029, 'urgent_properties', 'Urgent Property', 'Urgent Property', NULL, NULL),
(1030, 'select_currency', 'Select Currency', 'Select Currency', NULL, NULL),
(1031, 'country_name', 'Country Name', 'Country Name', NULL, NULL),
(1032, 'currency_name', 'Currency Name', 'Currency Name', NULL, NULL),
(1034, 'per', 'Per', 'Per', NULL, NULL),
(1035, 'paystack', 'Paystack', 'Paystack', NULL, NULL),
(1036, 'public_key', 'Public Key', 'Public Key', NULL, NULL),
(1037, 'secret_key', 'Secret Key', 'Secret Key', NULL, NULL),
(1038, 'mollie', 'Mollie', 'Mollie', NULL, NULL),
(1039, 'mollie_key', 'Mollie Key', 'Mollie Key', NULL, NULL),
(1040, 'instamojo', 'Instamojo', 'Instamojo', NULL, NULL),
(1041, 'api_key', 'Api Key', 'Api Key', NULL, NULL),
(1042, 'auth_token', 'Auth Token', 'Auth Token', NULL, NULL),
(1043, 'account_mode', 'Account Mode', 'Account Mode', NULL, NULL),
(1044, 'bank', 'Bank', 'Bank', NULL, NULL),
(1045, 'pay_with_paystack', 'Pay with Paystack', 'Pay with Paystack', NULL, NULL),
(1046, 'pay_with_mollie', 'Pay with Mollie', 'Pay with Mollie', NULL, NULL),
(1047, 'pay_with_instamojo', 'Pay with Instamojo', 'Pay with Instamojo', NULL, NULL),
(1048, 'read_more', 'Read more', 'Read more...', NULL, NULL),
(1049, 'file_manager', 'File Manager', 'File Manager', NULL, NULL),
(1050, 'add_new', 'Add New', 'Add New', NULL, NULL),
(1051, 'image_path', 'Image path', 'Image path', NULL, NULL),
(1052, 'copy', 'Copy', 'Copy', NULL, NULL),
(1053, 'new_image', 'New Image', 'New Image', NULL, NULL),
(1054, 'image', 'Image', 'Image', NULL, NULL),
(1055, 'subscribe_us', 'subscribe our news letter', 'subscribe our news letter', NULL, NULL),
(1056, 'header_logo', 'Header Logo', 'Header Logo', NULL, NULL),
(1057, 'footer_logo', 'Footer Logo', 'Footer Logo', NULL, NULL),
(1058, 'current_header', 'Current Header Logo', 'Current Header Logo', NULL, NULL),
(1059, 'current_footer', 'Current Footer Logo', 'Current Footer Logo', NULL, NULL),
(1062, 'practice', 'Practice', 'Practice', NULL, NULL),
(1063, 'practice_table', 'Practice Table', 'Practice Table', NULL, NULL),
(1064, 'practice_form', 'Practice Form', 'Practice Form', NULL, NULL),
(1065, 'practice_instruction', 'Practice Instruction', 'Practice Instruction', NULL, NULL);

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
(53, '2021_06_07_155525_create_terms_policies_table', 13),
(55, '2014_10_12_000000_create_users_table', 14),
(56, '2014_10_12_100000_create_password_resets_table', 14),
(57, '2019_08_19_000000_create_failed_jobs_table', 14),
(58, '2021_06_01_154935_create_doctors_table', 14),
(59, '2021_06_01_154955_create_admins_table', 14),
(60, '2021_06_02_061442_create_departments_table', 14),
(61, '2021_06_02_061452_create_department_images_table', 14),
(62, '2021_06_02_105225_create_locations_table', 14),
(63, '2021_06_02_113729_create_blog_categories_table', 14),
(64, '2021_06_02_115615_create_blogs_table', 14),
(65, '2021_06_03_041937_create_features_table', 14),
(66, '2021_06_03_060558_create_home_sections_table', 14),
(67, '2021_06_03_143301_create_services_table', 14),
(68, '2021_06_03_143735_create_service_images_table', 14),
(69, '2021_06_03_161038_create_service_faqs_table', 14),
(70, '2021_06_04_041544_create_department_faqs_table', 14),
(71, '2021_06_04_053020_create_videos_table', 14),
(72, '2021_06_06_042100_create_faq_categories_table', 14),
(73, '2021_06_06_045120_create_faqs_table', 14),
(74, '2021_06_06_152014_create_blog_comments_table', 14),
(75, '2021_06_06_152604_create_testimonials_table', 14),
(76, '2021_06_07_050501_create_abouts_table', 14),
(77, '2021_06_07_101918_create_doctor_social_links_table', 14),
(78, '2021_06_07_160726_create_condition_privacies_table', 14),
(79, '2021_06_09_075611_create_contact_messages_table', 15),
(82, '2021_06_09_085640_create_contact_us_table', 16),
(83, '2021_06_09_131532_create_sliders_table', 17),
(84, '2021_06_10_044031_create_medicines_table', 18),
(85, '2021_06_10_090440_create_schedules_table', 19),
(86, '2021_06_10_093637_create_days_table', 20),
(87, '2021_06_11_083301_create_contact_information_table', 21),
(88, '2021_06_11_133427_create_works_table', 22),
(89, '2021_06_11_133553_create_work_faqs_table', 22),
(90, '2021_06_12_075620_create_appointments_table', 23),
(91, '2021_06_12_083244_create_leaves_table', 23),
(92, '2021_06_14_041145_create_habits_table', 24),
(93, '2021_06_14_050412_create_prescribes_table', 25),
(94, '2021_06_14_102344_create_advice_table', 26),
(95, '2021_06_15_111126_create_subscribes_table', 27),
(96, '2021_06_16_135618_create_payment_accounts_table', 28),
(97, '2021_06_18_042314_create_settings_table', 29),
(98, '2021_06_18_052104_create_manage_navigations_table', 30),
(99, '2021_06_18_052805_create_manage_pages_table', 31),
(100, '2021_06_19_052404_create_partners_table', 32),
(102, '2021_06_19_154658_create_custome_pages_table', 33),
(103, '2021_06_20_163121_create_overviews_table', 34),
(106, '2021_06_24_005829_create_medicine_types_table', 35),
(107, '2021_06_24_011107_create_orders_table', 35),
(111, '2021_06_24_175001_create_cancle_appointments_table', 36),
(113, '2021_06_25_041121_create_cancel_orders_table', 37),
(114, '2021_06_27_114416_create_banner_images_table', 38),
(117, '2021_06_28_100743_create_navigations_table', 39),
(119, '2021_06_28_110714_create_manage_texts_table', 40),
(121, '2021_07_01_113430_create_messages_table', 41),
(123, '2021_07_02_081300_create_manage_texts_table', 42),
(126, '2021_07_04_073021_create_email_templates_table', 43),
(128, '2021_07_05_091055_create_manage_texts_table', 44),
(129, '2021_07_05_153851_create_validation_texts_table', 45),
(130, '2021_07_06_023416_create_notification_texts_table', 46),
(131, '2021_07_08_132239_create_subscriber_emails_table', 47),
(134, '2021_07_18_094223_create_listing_categories_table', 48),
(135, '2021_07_18_164612_create_subscriber_contents_table', 49),
(136, '2021_07_18_211825_create_overview_videos_table', 50),
(137, '2021_07_19_120309_create_about_sections_table', 51),
(138, '2021_07_20_091642_create_aminities_table', 52),
(140, '2021_07_20_095410_create_listing_packages_table', 53),
(141, '2021_07_20_154151_create_listings_table', 54),
(142, '2021_07_20_162410_create_listing_images_table', 55),
(143, '2021_07_20_163439_create_listing_videos_table', 56),
(144, '2021_07_20_163626_create_listing_aminities_table', 57),
(145, '2021_07_20_211256_create_package_sections_table', 58),
(146, '2021_07_22_130153_create_listing_schedules_table', 59),
(147, '2021_07_24_220152_create_wishlishts_table', 60),
(148, '2021_07_24_222009_create_wishlists_table', 61),
(150, '2021_07_25_090126_create_orders_table', 62),
(151, '2021_07_26_123955_create_listing_reviews_table', 63),
(153, '2021_07_28_232258_create_seo_texts_table', 64),
(154, '2021_07_30_091313_create_validation_texts_table', 65),
(155, '2021_07_30_140006_create_modal_consents_table', 66),
(156, '2021_08_06_192922_create_custom_pages_table', 67),
(157, '2021_08_15_131338_create_paginators_table', 68),
(158, '2021_08_23_152942_create_payment_card_logos_table', 69),
(159, '2021_08_23_170702_create_email_configurations_table', 70),
(160, '2021_08_24_155414_create_listing_claimes_table', 71),
(161, '2021_09_07_094858_create_countries_table', 72),
(162, '2021_09_07_095000_create_cities_table', 72),
(163, '2021_09_07_095624_create_country_states_table', 72),
(165, '2021_09_07_100415_create_countries_table', 73),
(166, '2021_09_07_100432_create_country_states_table', 73),
(167, '2021_09_07_100442_create_cities_table', 73),
(168, '2021_09_07_130905_create_property_purposes_table', 74),
(169, '2021_09_07_130929_create_property_types_table', 74),
(171, '2021_09_09_082917_create_nearest_locations_table', 75),
(172, '2021_09_09_093400_create_properties_table', 76),
(173, '2021_09_09_130913_create_property_aminities_table', 77),
(174, '2021_09_09_131024_create_property_images_table', 78),
(176, '2021_09_11_123648_create_faqs_table', 79),
(177, '2021_09_12_082830_create_services_table', 80),
(178, '2021_09_12_122306_create_awards_table', 81),
(179, '2021_09_16_144548_create_property_nearest_places_table', 82),
(180, '2021_09_16_145016_create_property_nearest_locations_table', 83),
(181, '2021_09_20_100954_create_packages_table', 84),
(182, '2021_11_18_095420_create_razorpays_table', 85),
(183, '2021_12_28_043109_create_flutterwaves_table', 86),
(184, '2022_02_27_141539_create_paystack_and_mollies_table', 87),
(185, '2022_02_27_142120_create_instamojo_payments_table', 88),
(186, '2022_03_02_134257_create_privacy_policies_table', 89),
(187, '2022_03_06_153730_create_custom_file_managers_table', 90),
(188, '2023_10_09_114001_create_practices_table', 91),
(189, '2023_10_09_111609_create_tutorials_table', 92),
(190, '2023_10_09_165520_create_text_formates_table', 92),
(191, '2023_10_12_114333_create_segments_table', 93),
(192, '2023_10_18_110316_add_column_device_token', 93),
(193, '2023_10_25_171651_create_languages_table', 94);

-- --------------------------------------------------------

--
-- Table structure for table `modal_consents`
--

CREATE TABLE `modal_consents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `border` varchar(255) DEFAULT NULL,
  `corners` varchar(255) DEFAULT NULL,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `border_color` varchar(255) DEFAULT NULL,
  `btn_bg_color` varchar(255) DEFAULT NULL,
  `btn_text_color` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modal_consents`
--

INSERT INTO `modal_consents` (`id`, `status`, `border`, `corners`, `background_color`, `text_color`, `border_color`, `btn_bg_color`, `btn_text_color`, `message`, `link_text`, `btn_text`, `link`, `created_at`, `updated_at`) VALUES
(1, 1, 'thin', 'small', '#4ac4b6', '#f4f1f1', '#da2b2b', '#ecf1f3', '#111fee', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'More Info', 'Yes', NULL, NULL, '2021-08-23 05:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `navbar` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigations`
--

INSERT INTO `navigations` (`id`, `name`, `navbar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'Home', 1, NULL, '2021-09-27 04:09:03'),
(2, 'Properties', 'Properties', 1, NULL, '2021-09-27 04:13:34'),
(3, 'All Properties', 'All Properties', 1, NULL, '2021-10-17 09:16:57'),
(4, 'About Us', 'About Us', 1, NULL, '2021-09-27 04:10:15'),
(5, 'Pricing Plan', 'Pricing Plan', 1, NULL, '2021-08-12 05:42:48'),
(6, 'Agents', 'Agents', 1, NULL, '2021-08-24 12:28:19'),
(7, 'Blog', 'Blog', 1, NULL, '2021-08-12 05:42:48'),
(8, 'Contact Us', 'Contact', 1, NULL, '2021-08-12 05:42:48'),
(12, 'Login', 'Login/Registration', 1, NULL, '2021-09-27 06:13:09'),
(13, 'Forget Password', 'Forget Password', 1, NULL, '2021-10-10 03:48:54'),
(14, 'Reset Password', 'Reset Password', 1, NULL, '2021-08-12 05:42:48'),
(15, 'Terms and Conditions', 'Terms and Conditions', 1, NULL, '2021-10-09 01:38:54'),
(16, 'Privacy and Policy', 'Privacy Policy', 1, NULL, '2021-10-18 06:32:20'),
(17, 'FAQ', 'FAQ', 1, NULL, '2021-10-12 04:57:40'),
(18, 'Pages', 'Pages', 1, NULL, '2021-09-27 05:13:50'),
(19, 'Featured Properties', 'Featured Properties', 1, NULL, '2021-10-11 03:04:51'),
(20, 'Top Properties', 'Top Properties', 1, NULL, '2021-10-11 03:04:52'),
(21, 'Urgent Properties', 'Urgent Properties', 1, NULL, '2021-10-11 03:04:52'),
(22, 'My Account', 'My Account', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nearest_locations`
--

CREATE TABLE `nearest_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nearest_locations`
--

INSERT INTO `nearest_locations` (`id`, `location`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rail Station', 'rail-station', 1, '2021-09-09 03:00:20', '2021-09-11 03:21:10'),
(2, 'Bus Station', 'bus-station', 1, '2021-09-09 03:00:52', '2021-09-09 03:00:52'),
(3, 'Airport', 'airport', 1, '2021-09-09 03:02:24', '2021-09-09 03:02:24'),
(4, 'Beach', 'beach', 1, '2021-09-09 03:02:33', '2021-10-08 02:58:20'),
(5, 'Metro', 'metro', 1, '2021-09-09 03:02:39', '2021-10-10 03:02:22'),
(6, 'Bank', 'bank', 1, '2021-09-09 03:02:45', '2021-09-09 03:02:45'),
(7, 'School', 'school', 1, '2021-09-09 03:02:52', '2021-09-09 03:02:52'),
(8, 'Hospital', 'hospital', 1, '2021-09-09 03:07:40', '2021-09-09 03:12:28'),
(10, 'Super Market', 'super-market', 1, '2021-09-09 03:56:40', '2021-09-09 03:56:40'),
(11, 'Pharmacy', 'pharmacy', 1, '2021-09-09 03:56:54', '2021-09-09 03:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `notification_texts`
--

CREATE TABLE `notification_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(191) NOT NULL,
  `default_text` text NOT NULL,
  `custom_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_texts`
--

INSERT INTO `notification_texts` (`id`, `lang_key`, `default_text`, `custom_text`, `created_at`, `updated_at`) VALUES
(1, 'comment', 'Comment Submited successfully', 'Comment submited successfully', NULL, '2021-10-12 04:22:31'),
(2, 'subscribe', 'Subscribed successfully. please verifify your email', 'Subscribed successfully. please verify your email', NULL, '2021-07-31 18:11:59'),
(3, 'already_subscribe', 'Already Subscribed', 'Already subscribed', NULL, '2021-10-12 04:22:31'),
(4, 'verified', 'Verified successfully', 'Verified successfully', NULL, '2021-07-31 18:11:59'),
(5, 'invalid_token', 'Invalid token', 'Invalid token', NULL, '2021-07-31 18:11:59'),
(6, 'msg', 'Message Send Successfully', 'Message send successfully', NULL, '2021-10-12 04:22:31'),
(7, 'something', 'Something Went Wrong', 'Something went wrong', NULL, '2021-10-12 04:22:31'),
(8, 'update', 'Update Successfully', 'Update successfully', NULL, '2021-10-12 04:22:31'),
(9, 'create', 'Create Successfuly', 'Create successfuly', NULL, '2021-10-12 04:22:31'),
(10, 'delete', 'Delete Successfuly', 'Delete successfuly', NULL, '2021-10-12 04:22:31'),
(11, 'active', 'Active Successfuly', 'Active successfuly', NULL, '2021-10-12 04:22:31'),
(12, 'inactive', 'InActive Successfuly', 'InActive successfuly', NULL, '2021-10-12 04:22:31'),
(13, 'pass', 'Password Change Successfully', 'Password change successfully', NULL, '2021-10-12 04:22:31'),
(14, 'old_pass', 'Old Password does not match', 'Old Password does not match', NULL, NULL),
(16, 'review', 'Review Already Submited', 'Review already submited', NULL, '2021-10-12 04:22:31'),
(17, 'max_property', 'Maximum property Already Exist', 'Maximum property already exist', NULL, '2021-10-12 04:19:49'),
(20, 'payment', 'Payment Successfully', 'Payment successfully', NULL, '2021-10-12 04:22:31'),
(21, 'payment_faild', 'Payment Faild', 'Payment faild', NULL, '2021-10-12 04:22:31'),
(22, 'wishlist', 'Wishlist Addedd Successfully', 'Wishlist addedd successfully', NULL, '2021-10-12 04:22:31'),
(23, 'already_wishlist', 'Already Added in Wishlist', 'Already added in wishlist', NULL, '2021-10-12 04:22:31'),
(24, 'email_send', 'Email send successfully', 'Email send successfully', NULL, '2021-10-12 02:32:24'),
(25, 'invalid_email', 'Invalid email', 'Invalid email', NULL, '2021-10-12 02:32:24'),
(26, 'login', 'Login Successfully', 'Login successfully', NULL, '2021-10-12 04:22:31'),
(28, 'invalid_login', 'Invalid Login Information', 'Invalid login information', NULL, '2021-10-12 04:22:31'),
(29, 'inactive_user', 'Inactive your Account', 'Inactive your account', NULL, '2021-10-12 04:22:31'),
(30, 'logout', 'Logout Successfully', 'Logout successfully', NULL, '2021-10-12 04:22:31'),
(31, 'register', 'Thanks For Registration. Before Login, Please Verify Your Email.', 'Thanks for registration. Before login, please verify your email.', NULL, '2021-10-12 04:22:31'),
(34, 'forget_pass', 'Forgot Password Token has been Sent to Your Email', 'Forgot password token has been sent to your email', NULL, '2021-10-12 04:22:31'),
(35, 'email_not_exist', 'Email does not exist', 'Email does not exist', NULL, '2021-10-12 02:32:24'),
(38, 'expired_package', 'Your package has expired', 'Your package has expired', NULL, '2021-08-11 16:19:23'),
(49, 'reset_pass', 'Password Reset Successfully. Please Login here', 'Password reset successfully. Please login here', NULL, '2021-10-12 04:22:31'),
(50, 'review_submit', 'Review submited successfully', 'Review submited successfully', NULL, NULL),
(51, 'order_success', 'Order Successfully', 'Plan Purchase successfully', NULL, '2023-10-06 09:49:43'),
(52, 'bank_order_success', 'Order successfully, wait for admin approval\r\n\r\n\r\n', 'Plan Purchase successfully, wait for admin approval', NULL, '2023-10-06 09:49:43'),
(53, 'payment_accept', 'Payment Accept Successfully', 'Payment Accept Successfully', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expired_day` int(11) NOT NULL,
  `expired_date` date DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `amount_usd` decimal(10,0) NOT NULL,
  `amount_real_currency` int(11) NOT NULL,
  `currency_type` varchar(191) NOT NULL,
  `currency_icon` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `package_id`, `purchase_date`, `expired_day`, `expired_date`, `payment_method`, `transaction_id`, `payment_status`, `amount_usd`, `amount_real_currency`, `currency_type`, `currency_icon`, `status`, `created_at`, `updated_at`) VALUES
(145, '#29202301111310', 31, 4, '2023-11-01', 100, '2024-02-09', 'Stripe', 'txn_3O7WjqF56Pb8BOOX0nlvAZkW', 1, '50', 50, 'USD', '$', 1, '2023-11-01 11:13:10', '2023-11-01 11:13:10'),
(146, '#40202301114319', 48, 4, '2023-11-01', 100, '2024-02-09', 'Stripe', 'txn_3O7XD1F56Pb8BOOX1zwkiiby', 1, '50', 50, 'USD', '$', 1, '2023-11-01 11:43:19', '2023-11-01 11:43:19'),
(147, '#22202301114008', 30, 4, '2023-11-01', 100, '2024-02-09', 'Stripe', 'txn_3O7Zy7F56Pb8BOOX1BGlB7LT', 1, '50', 50, 'USD', '$', 1, '2023-11-01 14:40:08', '2023-11-01 14:40:08');

-- --------------------------------------------------------

--
-- Table structure for table `overviews`
--

CREATE TABLE `overviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `overviews`
--

INSERT INTO `overviews` (`id`, `name`, `qty`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Total Properties', '330', 'far fa-building', '1', '2021-09-12 06:48:56', '2022-03-01 06:50:56'),
(2, 'Happy Clients', '115', 'fal fa-handshake', '1', '2021-09-12 06:50:04', '2022-03-01 06:52:42'),
(3, 'Successfull Orders', '220', 'fal fa-house-user', '1', '2021-09-12 06:56:34', '2022-03-01 06:52:02'),
(7, 'Our Teams', '123', 'fas fa-id-card', '1', '2021-09-12 07:14:39', '2022-03-01 06:54:55'),
(8, 'Our Categories', '100', 'fas fa-balance-scale', '1', '2021-09-12 07:15:24', '2022-02-22 08:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_type` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `number_of_aminities` int(11) DEFAULT NULL,
  `number_of_nearest_place` int(11) DEFAULT NULL,
  `number_of_photo` int(11) DEFAULT NULL,
  `number_of_property` int(11) DEFAULT NULL,
  `number_of_feature_property` int(11) DEFAULT NULL,
  `number_of_top_property` int(11) DEFAULT NULL,
  `number_of_urgent_property` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_top` tinyint(4) NOT NULL DEFAULT 0,
  `is_urgent` tinyint(4) NOT NULL DEFAULT 0,
  `package_order` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `package_type`, `price`, `number_of_days`, `number_of_aminities`, `number_of_nearest_place`, `number_of_photo`, `number_of_property`, `number_of_feature_property`, `number_of_top_property`, `number_of_urgent_property`, `status`, `is_featured`, `is_top`, `is_urgent`, `package_order`, `created_at`, `updated_at`) VALUES
(1, 'Pro', '1', 300, 365, 15, -1, -1, 30, -1, -1, -1, 1, 1, 1, 1, 3, '2021-09-20 05:35:19', '2021-10-18 01:38:56'),
(3, 'Free', '0', 0, 30, 7, 5, 3, 5, 0, 0, 0, 1, 0, 0, 0, 1, '2021-09-20 05:48:19', '2021-10-18 01:35:43'),
(4, 'Basic', '1', 50, 100, 10, 4, 4, 7, 1, 0, 0, 1, 1, 0, 0, 2, '2021-09-20 06:16:36', '2021-10-18 01:36:39'),
(6, 'Golden', '1', 300, -1, -1, -1, -1, -1, -1, -1, -1, 0, 1, 1, 1, 4, '2021-10-10 03:07:23', '2021-10-18 01:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(255) NOT NULL,
  `first_icon` varchar(255) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `first_link` varchar(191) DEFAULT NULL,
  `second_icon` varchar(191) DEFAULT NULL,
  `second_link` varchar(191) DEFAULT NULL,
  `third_icon` varchar(191) DEFAULT NULL,
  `third_link` varchar(191) DEFAULT NULL,
  `four_icon` varchar(191) DEFAULT NULL,
  `four_link` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `first_icon`, `designation`, `first_link`, `second_icon`, `second_link`, `third_icon`, `third_link`, `four_icon`, `four_link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Stiven Smith', 'uploads/custom-images/partner-2021-10-18-09-28-22-1734.jpg', 'fab fa-facebook', 'Lawyer', 'https://www.facebook.com', 'fab fa-linkedin', 'https://www.linkedin.com', 'fab fa-whatsapp', 'https://www.whatsapp.com', 'fab fa-twitter', 'https://www.twitter.com', 1, '2021-08-01 04:28:48', '2021-10-27 02:03:42'),
(3, 'David Richard', 'uploads/custom-images/partner-2021-10-18-09-28-49-2842.jpg', 'fab fa-facebook', 'Teacher', 'https://www.facebook.com', 'fab fa-linkedin', 'https://www.linkedin.com', 'fab fa-whatsapp', 'https://www.whatsapp.com', 'fab fa-twitter', 'https://www.twitter.com', 1, '2021-08-01 04:29:12', '2021-10-27 01:51:57'),
(4, 'Thomas Charles', 'uploads/custom-images/partner-2021-10-07-08-39-11-6641.jpg', 'fab fa-linkedin-in', 'Founder', 'https://www.linkedin.com', 'fab fa-facebook', 'https://www.facebook.com', 'fab fa-twitter', 'https://www.twitter.com', 'fab fa-whatsapp', 'https://www.whatsapp.com', 1, '2021-09-21 05:24:10', '2021-10-27 01:57:07'),
(5, 'Kenneth Kevin', 'uploads/custom-images/partner-2021-10-07-08-42-10-4823.jpg', 'https://www.whatsapp.com', 'Ceo', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', NULL, NULL, NULL, NULL, 0, '2021-09-21 05:25:29', '2021-10-18 02:04:09'),
(6, 'Matthew Anthony', 'uploads/custom-images/partner-2021-10-07-08-40-39-6169.jpg', 'fab fa-whatsapp', 'Founder', 'https://www.whatsapp.com', 'fab fa-twitter', 'https://www.twitter.com', 'fab fa-linkedin-in', 'https://www.linkedin.com', 'fab fa-facebook', 'https://www.facebook.com', 1, '2021-09-21 05:26:01', '2021-10-27 01:58:32'),
(8, 'Lewandaski', 'uploads/custom-images/partner-2021-10-18-09-29-11-5595.jpg', 'fab fa-facebook', 'Founder', 'https://www.facebook.com/', 'fab fa-twitter', 'https://www.twitter.com', 'fab fa-linkedin-in', 'https://www.linkedin.com/', 'fab fa-whatsapp', 'https://www.whatsapp.com', 1, '2021-09-21 05:39:11', '2021-10-27 01:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accounts`
--

CREATE TABLE `payment_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_mode` varchar(191) NOT NULL,
  `paypal_client_id` text DEFAULT NULL,
  `paypal_secret` text DEFAULT NULL,
  `paypal_country_code` varchar(255) DEFAULT NULL,
  `paypal_currency_code` varchar(255) DEFAULT NULL,
  `paypal_currency_rate` double NOT NULL DEFAULT 1,
  `stripe_country_code` varchar(255) DEFAULT NULL,
  `stripe_currency_code` varchar(255) DEFAULT NULL,
  `stripe_currency_rate` double NOT NULL DEFAULT 1,
  `stripe_key` text DEFAULT NULL,
  `stripe_secret` text DEFAULT NULL,
  `captcha_key` text DEFAULT NULL,
  `captcha_secret` text DEFAULT NULL,
  `bank_account` text NOT NULL,
  `paypal_status` int(10) NOT NULL DEFAULT 1,
  `stripe_status` int(10) NOT NULL DEFAULT 1,
  `bank_status` int(10) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_accounts`
--

INSERT INTO `payment_accounts` (`id`, `account_mode`, `paypal_client_id`, `paypal_secret`, `paypal_country_code`, `paypal_currency_code`, `paypal_currency_rate`, `stripe_country_code`, `stripe_currency_code`, `stripe_currency_rate`, `stripe_key`, `stripe_secret`, `captcha_key`, `captcha_secret`, `bank_account`, `paypal_status`, `stripe_status`, `bank_status`, `created_at`, `updated_at`) VALUES
(1, 'sandbox', 'AWlV5x8Lhj9BRF8-TnawXtbNs-zt69mMVXME1BGJUIoDdrAYz8QIeeTBQp0sc2nIL9E529KJZys32Ipy', 'EEvn1J_oIC6alxb-FoF4t8buKwy4uEWHJ4_Jd_wolaSPRMzFHe6GrMrliZAtawDDuE-WKkCKpWGiz0Yn', 'US', 'USD', 1, 'US', 'USD', 1, 'pk_test_51JU61aF56Pb8BOOX5ucAe5DlDwAkCZyffqlKMDUWsAwhKbdtuY71VvIzr0NgFKjq4sOVVaaeeyVXXnNWwu5dKgeq00kMzCBUm5', 'sk_test_51JU61aF56Pb8BOOXlz7jGkzJsCkozuAoRlFJskYGsgunfaHLmcvKLubYRQLCQOuyYHq0mvjoBFLzV7d8F6q8f6Hv00CGwULEEV', NULL, NULL, 'Bank Name: Your bank name\r\nAccount Number:  Your bank account number\r\nRouting Number: Your bank routing number\r\nBranch: Your bank branch name', 1, 1, 1, '2021-06-17 10:51:03', '2022-02-28 09:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `paystack_and_mollies`
--

CREATE TABLE `paystack_and_mollies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mollie_key` varchar(255) DEFAULT NULL,
  `mollie_status` int(11) DEFAULT 0,
  `mollie_currency_rate` varchar(255) DEFAULT '0',
  `mollie_country_code` varchar(255) DEFAULT '0',
  `mollie_currency_code` varchar(255) DEFAULT '0',
  `paystack_public_key` varchar(255) DEFAULT NULL,
  `paystack_secret_key` varchar(255) DEFAULT NULL,
  `paystack_currency_rate` varchar(255) DEFAULT NULL,
  `paystack_country_code` varchar(255) DEFAULT '0',
  `paystack_currency_code` varchar(255) DEFAULT '0',
  `paystack_status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paystack_and_mollies`
--

INSERT INTO `paystack_and_mollies` (`id`, `mollie_key`, `mollie_status`, `mollie_currency_rate`, `mollie_country_code`, `mollie_currency_code`, `paystack_public_key`, `paystack_secret_key`, `paystack_currency_rate`, `paystack_country_code`, `paystack_currency_code`, `paystack_status`, `created_at`, `updated_at`) VALUES
(1, 'test_bgtkwz4pErUqqTzW8KyRQKR27WgMuE', 1, '1', 'US', 'USD', 'pk_test_057dfe5dee14eaf9c3b4573df1e3760c02c06e38', 'sk_test_77cb93329abbdc18104466e694c9f720a7d69c97', '415.50', 'NG', 'NGN', 1, NULL, '2022-02-28 09:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `practices`
--

CREATE TABLE `practices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_lastminutes` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `title`, `description`, `instructions`, `slug`, `status`, `is_lastminutes`, `created_at`, `updated_at`) VALUES
(1, 'Child Abuse', 'Working in pairs or small groups, write a report about what you saw and heard. WHO: Who was involved? WHAT: What happened? Nature and extent of harm and any signs of abuse or neglect (physical, psychological, verbalizations of abuse, etc.)', 'Organise meetings of children with school authorities. Discuss child rights issues with the parents in the PTA meetings. Say NO to corporal punishment. Use positive reinforcement techniques like dialogue and counselling to discipline children.', NULL, 1, 1, '2023-10-09 07:03:05', '2023-11-01 10:10:35'),
(2, 'Chickenpox', 'Chickenpox is a highly contagious viral infection that mainly affects children. Typical symptoms include a very itchy skin rash with red blisters and a mild fever. Because most children are now vaccinated, chickenpox (also referred to as varicella) is much less common than it was in the past.', 'The best way to prevent chickenpox is to get the chickenpox vaccine. Everyone—including children, adolescents, and adults—should get two doses of chickenpox vaccine if they have never had chickenpox or were never vaccinated. Chickenpox vaccine is very safe and effective at preventing the disease.', NULL, 1, 0, '2023-10-09 07:08:40', '2023-10-18 06:23:05'),
(5, 'Age Care Centre', 'Aged care is the support provided to older people who need help in their own home or who can no longer live at home. It can include: help with everyday living. assistive equipment and home modifications.', 'Present new information at a slower rate than you do for younger patients. Speak in a low tone of voice and allow enough time for the patient to assimilate and integrate conceptual material.', NULL, 1, 0, '2023-10-18 06:20:23', '2023-10-18 06:29:31'),
(6, 'Dental problems', 'People typically use the term “dental problems” to refer to conditions that affect oral health. Dental problems include cavities, tooth erosion, gum infections, and gum diseases. They can cause pain and discomfort, may affect a person\'s ability to eat, and may have a negative impact on an individual\'s self-esteem.', '1.Gently brush your teeth on all sides with a soft-bristle brush and fluoride toothpaste. \r\n2.Use small circular motions and short back-and-forth strokes.\r\n3.Brush carefully and gently along your gum line.\r\n4.Lightly brush your tongue or use a tongue scraper to help keep your mouth clean.', NULL, 1, 0, '2023-10-18 06:28:41', '2023-10-18 06:28:41'),
(7, 'Diabetes', 'Diabetes is a chronic (long-lasting) health condition that affects how your body turns food into energy. Your body breaks down most of the food you eat into sugar (glucose) and releases it into your bloodstream. When your blood sugar goes up, it signals your pancreas to release insulin.', 'Adopt healthy eating habits through nutrition education, including meal-planning, weight-loss strategies and other disease-specific nutrition counseling. Develop problem-solving strategies and skills to self-manage diabetes. Monitor blood glucose and learn how to interpret and appropriately respond to the results.', NULL, 1, 0, '2023-10-18 06:30:45', '2023-10-18 06:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privacy_policy` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `privacy_policy`, `created_at`, `updated_at`) VALUES
(2, '<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>Sit vivendum eleifend adipiscing ea. Modus legere suscipiantur an vel, melius patrioque est cu, eum at audire probatus repudiandae. Ei tempor definitiones eam, sea dico omnium ne. Eam ad ubique tincidunt elaboraret, malis aperiri sit et. Ut quo vero inimicus. Sed at munere fuisset noluisse, eleifend senserit an vix.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>\r\n\r\n<p>Meliore inimicus duo ut, tation veritus elaboraret eam cu. Cum in alii agam aliquip, aperiam salutandi et per. Ex vis summo probatus ocurreret, ex assum sententiae pri, blandit sensibus moderatius ei eos. Vix nobis phaedrum neglegentur et.</p>', '2022-03-02 08:10:44', '2022-03-08 07:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 1,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `property_type_id` int(11) NOT NULL DEFAULT 0,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `listing_package_id` int(11) NOT NULL DEFAULT 0,
  `property_purpose_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `description` text NOT NULL,
  `file` text DEFAULT NULL,
  `thumbnail_image` text DEFAULT NULL,
  `banner_image` text DEFAULT NULL,
  `number_of_unit` int(11) DEFAULT NULL,
  `number_of_room` int(11) DEFAULT NULL,
  `number_of_bedroom` int(11) DEFAULT NULL,
  `number_of_bathroom` int(11) DEFAULT NULL,
  `number_of_floor` int(11) DEFAULT NULL,
  `number_of_kitchen` int(11) DEFAULT NULL,
  `number_of_parking` int(11) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `google_map_embed_code` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `period` text DEFAULT NULL,
  `video_link` text DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  `top_property` tinyint(4) NOT NULL DEFAULT 0,
  `urgent_property` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `seo_title` text DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_type`, `admin_id`, `user_id`, `property_type_id`, `city_id`, `listing_package_id`, `property_purpose_id`, `title`, `slug`, `views`, `address`, `phone`, `email`, `website`, `description`, `file`, `thumbnail_image`, `banner_image`, `number_of_unit`, `number_of_room`, `number_of_bedroom`, `number_of_bathroom`, `number_of_floor`, `number_of_kitchen`, `number_of_parking`, `area`, `google_map_embed_code`, `price`, `period`, `video_link`, `is_featured`, `verified`, `top_property`, `urgent_property`, `status`, `seo_title`, `expired_date`, `seo_description`, `created_at`, `updated_at`) VALUES
(9, 1, 4, 0, 3, 2, 0, 1, '2811 Battery Place Northwest', '2811 Battery Place Northwest', 100, 'Melbourne', '1907485306', 'admin@gmail.com', NULL, '<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>int dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>', 'property-file-2021-10-10-08-15-45-7669.pdf', 'uploads/custom-images/property-thumb-2021-10-12-09-54-08-7799.png', 'uploads/custom-images/listing-banner-2021-10-12-09-54-10-2966.jpg', 40, 25, 22, 10, 10, 4, 4, 400, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62920.48427569165!2d-117.94932048380569!3d34.02204554042307!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2d5ff0cf28975%3A0x24ea9c3aea7b766c!2sPacific%20Palms%20Resort!5e0!3m2!1sen!2sbd!4v1634520695036!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 200, 'Daily', 'https://www.youtube.com/watch?v=SMKPKGW083c', 1, 1, 0, 1, 1, '2811 Battery Place Northwest', NULL, '2811 Battery Place Northwest', '2021-09-11 04:51:02', '2022-03-08 08:21:17'),
(11, 1, 4, 0, 1, 4, 0, 2, 'Saybrook Point Resort & Marina', 'saybrook-point-resort-marina', 106, 'Agoura Hills', '123-343-4444', 'client@gmail.com', 'https://example.com', '<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Doming aliquid te pro. Mei et quodsi ornatus praesent, summo debet vis eu, dolor soleat nostrud sea eu. Cu altera possim sanctus est. Ea iriure repudiandae per, no eam legendos consectetuer. Mel at justo doming voluptatum. Mel mentitum fabellas deserunt no, et duo amet unum appetere.</p>\r\n\r\n<p>Quo id nemore dignissim persequeris, unum melius option ei vix, oratio vidisse eam ei. Altera neglegentur cum te. Latine probatus cum cu. Vim dicta sonet intellegebat ne, ei mazim decore eleifend nam, no malis soleat usu. Est ei tale praesent, ad nibh iudicabit has.<br />\r\n&nbsp;</p>', 'property-file-2021-10-17-01-04-04-9188.pdf', 'uploads/custom-images/property-thumb-2021-10-12-09-50-10-9705.png', 'uploads/custom-images/listing-banner-2021-10-12-09-50-11-3241.png', 15, 20, 16, 4, 5, 6, 6, 450, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d52921.92125018989!2d-118.00293421085884!3d34.00229109486106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2d5d428c37789%3A0xe3df22dfc0a25528!2sHacienda%20Heights%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634520209371!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 500, 'Yearly', 'https://www.youtube.com/watch?v=UJv9-F7SN5A', 1, 1, 0, 0, 1, 'Saybrook Point Resort & Marina', NULL, 'Saybrook Point Resort & Marina', '2021-09-16 09:38:07', '2022-03-08 08:21:29'),
(12, 1, 4, 0, 3, 1, 0, 2, '3015 Grand Avenue, CocoWalk', '3015-grand-avenue-cocowalk', 76, 'Newport', '651-458-754', 'client@gmail.com', 'https://example.com', '<p>Nec in rebum primis causae. Affert iisque ex pri, vis utinam vivendo definitionem ad, nostrum omnesque per et. Omnium antiopam cotidieque cu sit. Id pri placerat voluptatum, vero dicunt dissentiunt eum et, adhuc iisque vis no. Eu suavitate contentiones definitionem mel, ex vide insolens ocurreret eam. Et dico blandit mea. Sea tollit vidisse mandamus te, qui movet efficiendi ex.</p>\r\n\r\n<p>Doming aliquid te pro. Mei et quodsi ornatus praesent, summo debet vis eu, dolor soleat nostrud sea eu. Cu altera possim sanctus est. Ea iriure repudiandae per, no eam legendos consectetuer. Mel at justo doming voluptatum. Mel mentitum fabellas deserunt no, et duo amet unum appetere.</p>\r\n\r\n<p>Consetetur definitionem cu mea, usu legere minimum ne. Pro epicurei constituam ne, atqui lucilius indoctum nam id. Eu timeam volumus vel, eos te movet complectitur, te causae saperet eam. Minimum probatus vim te, eu eum ancillae mentitum comprehensam. Tantas decore adipisci vix no.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria, facer putent intellegam eu pri. Mei debitis ullamcorper eu, at quo idque mundi. Vis in suas porro consequat, nec ad dolor adversarium, ut praesent cotidieque sit. Veniam civibus omittantur duo ut, te his alterum complectitur. Mea omnis oratio impedit ne.<br />\r\n&nbsp;</p>', NULL, 'uploads/custom-images/property-thumb-2021-09-22-12-42-07-7843.jpg', 'uploads/custom-images/listing-banner-2021-09-22-12-42-07-2026.jpg', 30, 21, 18, 10, 10, 5, 5, 300, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d52921.92125018989!2d-118.00293421085884!3d34.00229109486106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2d5d428c37789%3A0xe3df22dfc0a25528!2sHacienda%20Heights%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634520209371!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 500, 'Monthly', 'https://www.youtube.com/watch?v=SMKPKGW083c', 1, 1, 1, 1, 1, '3015 Grand Avenue, CocoWalk', NULL, '3015 Grand Avenue, CocoWalk', '2021-09-22 06:42:08', '2022-03-10 16:48:12'),
(16, 0, 0, 2, 4, 9, 0, 1, 'Luxury Family Home', 'luxury-family-home', 76, 'Florida', '0170000000', 'agent@gmail.com', 'https://example.com', '<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>', 'property-file-2021-10-11-03-26-45-3061.pdf', 'uploads/custom-images/property-thumb-2021-10-12-10-09-01-6254.jpg', 'uploads/custom-images/listing-banner-2021-09-25-10-41-57-1345.jpg', 33, 30, 30, 12, 10, 3, 3, 630, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d105820.98061571886!2d-117.98881174982824!3d34.020632860346275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634525800182!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 20, 'Monthly', 'https://www.youtube.com/watch?v=SMKPKGW083c', 0, 0, 0, 0, 1, 'Luxury Family Home', '2023-02-28', 'Luxury Family Home', '2021-09-25 04:41:59', '2022-03-11 15:30:44'),
(17, 0, 0, 2, 3, 1, 0, 2, 'Black glass house', 'black-glass-house', 59, 'Vatikanska 11', NULL, 'agent@gmail.com', 'https://example.com', '<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-18-08-56-02-8036.png', 'uploads/custom-images/listing-banner-2021-10-18-08-56-03-7016.jpg', 1, 10, 0, 3, 1, 0, 3, 150, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d105820.98061571886!2d-117.98881174982824!3d34.020632860346275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634525800182!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 20, 'Monthly', 'https://www.youtube.com/watch?v=G6KBwzjbs7w', 0, 0, 0, 0, 1, 'Black glass house', '2023-02-28', 'Black glass house', '2021-09-25 06:34:31', '2022-03-08 08:29:54'),
(18, 0, 0, 23, 3, 1, 0, 1, 'Stay Greenwich Village', 'stay-greenwich-village', 14, 'Washington, Indiana', '123-343-4444', 'client@gmail.com', 'https://example.com', '<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Sit vivendum eleifend adipiscing ea. Modus legere suscipiantur an vel, melius patrioque est cu, eum at audire probatus repudiandae. Ei tempor definitiones eam, sea dico omnium ne. Eam ad ubique tincidunt elaboraret, malis aperiri sit et. Ut quo vero inimicus. Sed at munere fuisset noluisse, eleifend senserit an vix.</p>\r\n\r\n<p>Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-18-09-12-37-4861.jpg', 'uploads/custom-images/listing-banner-2021-10-18-09-10-38-8381.jpg', 3, 9, 3, 3, 3, 1, 1, 63.58, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d105820.98061571886!2d-117.98881174982824!3d34.020632860346275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634525800182!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 60, 'Daily', 'https://www.youtube.com/watch?v=G6KBwzjbs7w', 0, 0, 0, 0, 1, 'Stay Greenwich Village', '2021-10-29', 'Stay Greenwich Village', '2021-09-26 10:43:49', '2022-03-08 08:25:43'),
(21, 1, 4, 0, 3, 2, 0, 1, 'Vezer Family Vineyard - Blue Victorian', 'httplocalhostwebsolutionusrealestate_2script_contentmain_files', 12, '20 Brown Hills West Stephaniaton', '123-343-4444', 'admin@gmail.com', 'https://example.com', '<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-12-09-46-30-4037.jpg', 'uploads/custom-images/listing-banner-2021-10-12-09-46-31-3403.jpg', 25, 30, 25, 5, 5, 10, 7, 630, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d52921.92125018989!2d-118.00293421085884!3d34.00229109486106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2d5d428c37789%3A0xe3df22dfc0a25528!2sHacienda%20Heights%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634520209371!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 650, 'Daily', 'https://www.youtube.com/watch?v=SMKPKGW083c', 1, 0, 1, 1, 1, '1745 T Street Southeast', NULL, '1745 T Street Southeast', '2021-10-10 05:35:12', '2022-03-13 05:58:06'),
(22, 1, 4, 0, 1, 1, 0, 2, 'Hart 2 Hart Vineyards Everhart Cellars', 'hart-2-hart-vineyards-everhart-cellars', 38, 'Manchester', '125-547-869', 'agent@gmail.com', 'https://example.com', '<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>Sit vivendum eleifend adipiscing ea. Modus legere suscipiantur an vel, melius patrioque est cu, eum at audire probatus repudiandae. Ei tempor definitiones eam, sea dico omnium ne. Eam ad ubique tincidunt elaboraret, malis aperiri sit et. Ut quo vero inimicus. Sed at munere fuisset noluisse, eleifend senserit an vix.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-12-09-42-04-5671.jpg', 'uploads/custom-images/listing-banner-2021-10-12-09-42-05-6044.png', 33, 20, 15, 10, 4, 5, 5, 1000, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d105787.7267718059!2d-117.98274035089183!3d34.04729643070238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c329c466d70ea9%3A0xe45ef44baa0981ea!2sWest%20Covina%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634519909601!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 300, 'Monthly', 'https://www.youtube.com/watch?v=G6KBwzjbs7w', 1, 0, 1, 1, 1, '8502 Madrone Avenue', NULL, '8502 Madrone Avenue', '2021-10-10 06:53:01', '2022-03-13 05:58:50'),
(23, 0, 0, 2, 3, 4, 0, 2, 'Ozalj apartment', 'ozalj-apartment', 7, 'Zeleni put 21', '112-223-443', 'client@gmail.com', 'https://listkhoj.com/', '<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>Nec in rebum primis causae. Affert iisque ex pri, vis utinam vivendo definitionem ad, nostrum omnesque per et. Omnium antiopam cotidieque cu sit. Id pri placerat voluptatum, vero dicunt dissentiunt eum et, adhuc iisque vis no. Eu suavitate contentiones definitionem mel, ex vide insolens ocurreret eam. Et dico blandit mea. Sea tollit vidisse mandamus te, qui movet efficiendi ex.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-12-10-03-44-5145.jpg', 'uploads/custom-images/listing-banner-2021-10-12-10-03-51-6785.jpg', 45, 65, 4, 5, 6, 4, 3, 44, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d105820.98061571886!2d-117.98881174982824!3d34.020632860346275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634525800182!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 500, 'Yearly', 'https://www.youtube.com/watch?v=SMKPKGW083c', 0, 0, 0, 0, 1, 'Ozalj apartment', '2023-02-28', 'Ozalj apartment', '2021-10-11 09:45:46', '2022-03-08 08:28:02'),
(24, 1, 4, 0, 1, 4, 0, 1, '1508 Massachusetts Avenue Southeast', '1508-massachusetts-avenue-southeast', 10, '95 South Park Avenue, New York, USA', NULL, 'agent@gmail.com', 'https://example.com', '<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Sit vivendum eleifend adipiscing ea. Modus legere suscipiantur an vel, melius patrioque est cu, eum at audire probatus repudiandae. Ei tempor definitiones eam, sea dico omnium ne. Eam ad ubique tincidunt elaboraret, malis aperiri sit et. Ut quo vero inimicus. Sed at munere fuisset noluisse, eleifend senserit an vix.</p>\r\n\r\n<p>Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>\r\n\r\n<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>', 'property-file-2021-10-18-07-13-36-4836.pdf', 'uploads/custom-images/property-thumb-2021-10-18-07-15-13-3410.jpg', 'uploads/custom-images/listing-banner-2021-10-18-07-13-36-5087.jpg', 33, 10, 5, 3, 4, 3, 5, 630, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d299257.1409710053!2d-118.38318481374871!3d34.03475018656413!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1634519784016!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 650, 'Daily', 'https://www.youtube.com/watch?v=G6KBwzjbs7w', 0, 0, 1, 1, 1, '1508 Massachusetts Avenue Southeast', NULL, '1508 Massachusetts Avenue Southeast', '2021-10-12 04:44:02', '2022-03-08 08:14:23'),
(26, 0, 0, 27, 1, 5, 0, 1, 'Luxury Gymnasium  Club', 'luxury-gymnasium-club', 13, 'San Diego', '123-343-4444', 'agent@thesky9.com', 'https://example.com', '<p>Lorem ipsum dolor sit amet, nibh saperet te pri, at nam diceret disputationi. Quo an consul impedit, usu possim evertitur dissentiet ei, ridens minimum nominavi et vix. An per mutat adipisci. Ut pericula dissentias sed, est ea modus gloriatur. Aliquip persius has cu, oportere adversarium mei an, justo fabulas in vix.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>&nbsp;</p>', 'property-file-2021-10-18-08-42-44-4052.pdf', 'uploads/custom-images/property-thumb-2021-10-18-08-42-44-2751.jpg', 'uploads/custom-images/listing-banner-2021-10-18-01-02-40-8902.jpg', 45, 50, 45, 15, 5, 10, 4, 600, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62920.48427569165!2d-117.94932048380569!3d34.02204554042307!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2d5ff0cf28975%3A0x24ea9c3aea7b766c!2sPacific%20Palms%20Resort!5e0!3m2!1sen!2sbd!4v1634520695036!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 250, 'Daily', 'https://www.youtube.com/watch?v=SMKPKGW083c', 0, 0, 0, 0, 1, 'Luxury Gymnasium  Club', '2023-03-01', 'Luxury Gymnasium  Club', '2021-10-18 02:42:50', '2022-03-08 08:23:59'),
(27, 1, 4, 0, 3, 1, 0, 2, '3d Rendering Luxury Modern Design', '3d-rendering-luxury-modern-design', 6, 'Newcastle', '123-343-4444', 'user@gmail.com', NULL, '<p>Lorem ipsum dolor sit amet, nibh saperet te pri, at nam diceret disputationi. Quo an consul impedit, usu possim evertitur dissentiet ei, ridens minimum nominavi et vix. An per mutat adipisci. Ut pericula dissentias sed, est ea modus gloriatur. Aliquip persius has cu, oportere adversarium mei an, justo fabulas in vix.</p>\r\n\r\n<p>Nec in rebum primis causae. Affert iisque ex pri, vis utinam vivendo definitionem ad, nostrum omnesque per et. Omnium antiopam cotidieque cu sit. Id pri placerat voluptatum, vero dicunt dissentiunt eum et, adhuc iisque vis no. Eu suavitate contentiones definitionem mel, ex vide insolens ocurreret eam. Et dico blandit mea. Sea tollit vidisse mandamus te, qui movet efficiendi ex.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-08-46-38-8523.jpg', 'uploads/custom-images/listing-banner-2021-10-19-08-46-44-1494.jpg', 12, 23, 12, 11, 3, 4, 2, 452, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 120, 'Monthly', 'https://www.youtube.com/watch?v=SMKPKGW083c', 1, 0, 1, 1, 1, '3d Rendering Luxury Modern Design', NULL, '3d Rendering Luxury Modern Design', '2021-10-19 02:46:46', '2022-03-08 08:12:12'),
(28, 1, 4, 0, 3, 1, 0, 1, 'J Dusi Wines- Winery and Tasting Room', 'j-dusi-wines-winery-and-tasting-room', 5, 'Newport', '635-897-412', 'user@gmail.com', 'https://example.com', '<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>Nec in rebum primis causae. Affert iisque ex pri, vis utinam vivendo definitionem ad, nostrum omnesque per et. Omnium antiopam cotidieque cu sit. Id pri placerat voluptatum, vero dicunt dissentiunt eum et, adhuc iisque vis no. Eu suavitate contentiones definitionem mel, ex vide insolens ocurreret eam. Et dico blandit mea. Sea tollit vidisse mandamus te, qui movet efficiendi ex.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, nibh saperet te pri, at nam diceret disputationi. Quo an consul impedit, usu possim evertitur dissentiet ei, ridens minimum nominavi et vix. An per mutat adipisci. Ut pericula dissentias sed, est ea modus gloriatur. Aliquip persius has cu, oportere adversarium mei an, justo fabulas in vix.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-08-51-35-9353.jpg', 'uploads/custom-images/listing-banner-2021-10-19-08-51-47-3886.jpg', 41, 21, 12, 4, 2, 1, 1, 14784, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 1200, 'Daily', '', 0, 0, 1, 1, 1, 'Trendy House Interior', NULL, 'Trendy House Interior', '2021-10-19 02:51:53', '2022-03-13 05:59:33'),
(29, 1, 4, 0, 1, 1, 0, 2, 'Leisure Beautiful Health Garden Landscape', 'leisure-beautiful-health-garden-landscape', 31, 'Newport', NULL, 'user@gmail.com', NULL, '<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>In vim natum soleat nostro, pri in eloquentiam contentiones. Eu sit sapientem reprehendunt, omnis aliquid eu eos. No quot illum veniam est, ne pro iudico saperet mnesarchum. Ea pri nostro disputando contentiones, eu nec menandri qualisque, vis ex equidem invidunt. Et accusam detracto splendide per, congue meliore id sea. Has eu aeterno patrioque expetendis, mel ei dissentiet reformidans.</p>\r\n\r\n<p>Meliore inimicus duo ut, tation veritus elaboraret eam cu. Cum in alii agam aliquip, aperiam salutandi et per. Ex vis summo probatus ocurreret, ex assum sententiae pri, blandit sensibus moderatius ei eos. Vix nobis phaedrum neglegentur et.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Vim et alterum ornatus vivendum, ut mea solum repudiare. His etiam delenit tibique no, ad harum omnes scribentur qui, ne wisi detracto his. Ei movet accusam pri. Ex vel diam quas urbanitas, ne has velit affert habemus. At quis nonumy disputando nec, falli scaevola vel ea. Omittantur concludaturque nam eu, ex est vocent virtute.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-08-54-56-9589.jpg', 'uploads/custom-images/listing-banner-2021-10-19-08-54-59-5852.jpg', 12, 32, 12, 21, 5, 5, 3, 480, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 200, 'Yearly', '', 0, 0, 1, 1, 1, 'Leisure Beautiful Health Garden Landscape', NULL, 'Leisure Beautiful Health Garden Landscape', '2021-10-19 02:55:01', '2022-03-11 12:43:00'),
(30, 1, 4, 0, 3, 4, 0, 1, 'Outdoor Swimming Pool', 'outdoor-swimming-pool', 7, 'Long Beach', NULL, 'client@gmail.com', 'https://example.com', '<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria, facer putent intellegam eu pri. Mei debitis ullamcorper eu, at quo idque mundi. Vis in suas porro consequat, nec ad dolor adversarium, ut praesent cotidieque sit. Veniam civibus omittantur duo ut, te his alterum complectitur. Mea omnis oratio impedit ne.</p>\r\n\r\n<p>Id est maiorum volutpat, ad nominavi suscipit suscipiantur vix. Ut ius veri aperiam reprehendunt. Ut per unum sapientem consequuntur, usu ut quot scripta. Sea te nisl expetenda, ad quo congue argumentum, sit quis simul accusam cu. Usu ei perfecto repudiare tincidunt, ut quas malis erant vim. An mel vidit iudicabit.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-08-58-21-6848.jpg', 'uploads/custom-images/listing-banner-2021-10-19-08-58-25-7947.jpg', 10, 10, 15, 12, 2, 5, 1, 800, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 1300, 'Daily', 'https://www.youtube.com/watch?v=SMKPKGW083c', 0, 0, 1, 1, 1, 'Outdoor Swimming Pool', NULL, 'Outdoor Swimming Pool', '2021-10-19 02:58:27', '2022-03-08 08:08:26'),
(31, 1, 4, 0, 3, 1, 0, 1, 'Indoor Swimming Pool', 'indoor-swimming-pool', 19, 'Lynwood', NULL, 'user@gmail.com', 'https://example.com', '<p>Nec in rebum primis causae. Affert iisque ex pri, vis utinam vivendo definitionem ad, nostrum omnesque per et. Omnium antiopam cotidieque cu sit. Id pri placerat voluptatum, vero dicunt dissentiunt eum et, adhuc iisque vis no. Eu suavitate contentiones definitionem mel, ex vide insolens ocurreret eam. Et dico blandit mea. Sea tollit vidisse mandamus te, qui movet efficiendi ex.</p>\r\n\r\n<p>Doming aliquid te pro. Mei et quodsi ornatus praesent, summo debet vis eu, dolor soleat nostrud sea eu. Cu altera possim sanctus est. Ea iriure repudiandae per, no eam legendos consectetuer. Mel at justo doming voluptatum. Mel mentitum fabellas deserunt no, et duo amet unum appetere.</p>\r\n\r\n<p>Ut qui eligendi urbanitas. Assum periculis te mel, libris quidam te sit. Qui nisl nemore eleifend id, in illud ullum sea. Ut nusquam sapientem comprehensam ius. His molestie complectitur ex.</p>\r\n\r\n<p>Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at, duo id sumo vulputate. His legimus assueverit ut, commune maluisset deterruisset id mel. Oblique volumus eos ut, quo autem posidonium definitiones cu. Cu usu lorem consul concludaturque, pro ea fuisset consectetuer. Ex aeterno forensibus has, dicta propriae est ei, ex alterum apeirian quo.</p>\r\n\r\n<p>Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria, facer putent intellegam eu pri. Mei debitis ullamcorper eu, at quo idque mundi. Vis in suas porro consequat, nec ad dolor adversarium, ut praesent cotidieque sit. Veniam civibus omittantur duo ut, te his alterum complectitur. Mea omnis oratio impedit ne.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-09-02-00-9708.jpg', 'uploads/custom-images/listing-banner-2021-10-19-09-02-04-4070.jpg', 5, 3, 1, 2, 1, 1, 1, 750, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 300, 'Daily', 'https://www.youtube.com/watch?v=G6KBwzjbs7w', 1, 0, 1, 1, 1, 'Indoor Swimming Pool', NULL, 'Indoor Swimming Pool', '2021-10-19 03:02:08', '2022-03-11 14:09:41'),
(32, 1, 4, 0, 1, 4, 0, 1, 'Library Road-6854', 'library-road6854', 19, 'Long Beach', '123-343-4444', 'user@gmail.com', 'https://example.com', '<p>Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.</p>\r\n\r\n<p>Appetere fabellas ius te. Nonumes splendide deseruisse ea vis, alii velit vel eu. Eos ut scaevola platonem rationibus. Vis natum vivendo sententiae in, ea aperiam apeirian pri, in partem eleifend quo. Pro ex nobis utinam, nam et vidit numquam fastidii, ne per munere adolescens.</p>\r\n\r\n<p>Ipsum volumus pertinax mea ut, eu erat tacimates nam. Tibique copiosae verterem mea no, eam ex melius option, soluta timeam et his. Sit simul gubergren reformidans id, amet minimum nominavi eos ea. Et augue dicta vix. Mea ne utamur referrentur.</p>\r\n\r\n<p>Sint dignissim consectetuer nec et, per ad probatus referrentur, vel cu consequat sententiae. Ad duis fugit dictas mea, et cum stet oratio cetero. Ne pri omittam fastidii. No per harum dicant neglegentur, sea ei esse volumus adolescens. Nulla argumentum at pri, vel apeirian principes in. An dicam dicant consul mea, ne per option appetere argumentum, vim legere senserit et.</p>\r\n\r\n<p>Te soleat legendos molestiae cum. Tale sanctus invidunt cu per, quo at modo recteque elaboraret. Ex mazim homero per. Eu nec exerci doctus, cu mei oblique copiosae. Consul diceret usu ne.</p>\r\n\r\n<p>Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.</p>\r\n\r\n<p>Vim exerci sadipscing in, est simul recteque ei, dictas repudiandae comprehensam cu usu. Te melius veritus tibique pri. Sea nonumy euismod deserunt te. Ad ius nullam malorum assueverit.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, nibh saperet te pri, at nam diceret disputationi. Quo an consul impedit, usu possim evertitur dissentiet ei, ridens minimum nominavi et vix. An per mutat adipisci. Ut pericula dissentias sed, est ea modus gloriatur. Aliquip persius has cu, oportere adversarium mei an, justo fabulas in vix.</p>', NULL, 'uploads/custom-images/property-thumb-2021-10-19-09-05-30-3037.jpg', 'uploads/custom-images/listing-banner-2021-10-19-09-05-33-7577.jpg', 33, 33, 15, 30, 5, 4, 4, 400, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4945541.406433895!2d-6.812930082618514!3d52.75357023711754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d0a98a6c1ed5df%3A0xf4e19525332d8ea8!2sEngland%2C%20UK!5e0!3m2!1sen!2sbd!4v1634611529164!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 300, 'Daily', '', 1, 0, 1, 1, 1, 'Library Road-6854', NULL, 'Library Road-6854', '2021-10-19 03:05:36', '2022-03-08 08:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `property_aminities`
--

CREATE TABLE `property_aminities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `aminity_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_aminities`
--

INSERT INTO `property_aminities` (`id`, `property_id`, `aminity_id`, `status`, `created_at`, `updated_at`) VALUES
(13, 5, 3, 1, '2021-09-09 09:04:22', '2021-09-09 09:04:22'),
(14, 5, 5, 1, '2021-09-09 09:04:22', '2021-09-09 09:04:22'),
(15, 5, 6, 1, '2021-09-09 09:04:22', '2021-09-09 09:04:22'),
(16, 5, 7, 1, '2021-09-09 09:04:22', '2021-09-09 09:04:22'),
(20, 6, 5, 1, '2021-09-11 02:18:16', '2021-09-11 02:18:16'),
(21, 6, 6, 1, '2021-09-11 02:18:16', '2021-09-11 02:18:16'),
(22, 6, 7, 1, '2021-09-11 02:18:16', '2021-09-11 02:18:16'),
(27, 7, 1, 1, '2021-09-11 02:18:46', '2021-09-11 02:18:46'),
(28, 7, 2, 1, '2021-09-11 02:18:46', '2021-09-11 02:18:46'),
(29, 7, 3, 1, '2021-09-11 02:18:46', '2021-09-11 02:18:46'),
(30, 7, 4, 1, '2021-09-11 02:18:46', '2021-09-11 02:18:46'),
(1329, 32, 2, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1330, 32, 4, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1331, 32, 5, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1332, 32, 6, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1333, 32, 7, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1334, 32, 14, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1335, 32, 15, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1336, 32, 16, 1, '2022-03-08 08:06:37', '2022-03-08 08:06:37'),
(1337, 31, 1, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1338, 31, 2, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1339, 31, 3, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1340, 31, 4, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1341, 31, 5, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1342, 31, 6, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1343, 31, 7, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1344, 31, 15, 1, '2022-03-08 08:07:34', '2022-03-08 08:07:34'),
(1345, 30, 1, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1346, 30, 2, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1347, 30, 4, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1348, 30, 5, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1349, 30, 6, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1350, 30, 7, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1351, 30, 16, 1, '2022-03-08 08:08:13', '2022-03-08 08:08:13'),
(1352, 29, 1, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1353, 29, 2, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1354, 29, 3, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1355, 29, 4, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1356, 29, 6, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1357, 29, 7, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1358, 29, 14, 1, '2022-03-08 08:08:59', '2022-03-08 08:08:59'),
(1366, 27, 2, 1, '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(1367, 27, 3, 1, '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(1368, 27, 4, 1, '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(1369, 27, 5, 1, '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(1370, 27, 7, 1, '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(1371, 24, 1, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1372, 24, 2, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1373, 24, 3, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1374, 24, 5, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1375, 24, 6, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1376, 24, 15, 1, '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(1405, 12, 1, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1406, 12, 2, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1407, 12, 3, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1408, 12, 4, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1409, 12, 5, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1410, 12, 6, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1411, 12, 7, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1412, 12, 16, 1, '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(1413, 9, 1, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1414, 9, 2, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1415, 9, 3, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1416, 9, 4, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1417, 9, 6, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1418, 9, 14, 1, '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(1419, 11, 2, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1420, 11, 3, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1421, 11, 4, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1422, 11, 5, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1423, 11, 6, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1424, 11, 16, 1, '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(1425, 26, 1, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1426, 26, 2, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1427, 26, 3, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1428, 26, 4, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1429, 26, 7, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1430, 26, 14, 1, '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(1431, 18, 2, 1, '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(1432, 18, 3, 1, '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(1433, 18, 5, 1, '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(1434, 18, 6, 1, '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(1435, 18, 14, 1, '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(1436, 23, 2, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1437, 23, 3, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1438, 23, 4, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1439, 23, 5, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1440, 23, 6, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1441, 23, 7, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1442, 23, 14, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1443, 23, 15, 1, '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(1444, 17, 1, 1, '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(1445, 17, 4, 1, '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(1446, 17, 5, 1, '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(1447, 17, 7, 1, '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(1448, 17, 14, 1, '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(1449, 16, 1, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1450, 16, 2, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1451, 16, 3, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1452, 16, 4, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1453, 16, 5, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1454, 16, 14, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1455, 16, 15, 1, '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(1456, 21, 2, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1457, 21, 3, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1458, 21, 4, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1459, 21, 5, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1460, 21, 6, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1461, 21, 7, 1, '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(1462, 22, 2, 1, '2022-03-13 05:58:50', '2022-03-13 05:58:50'),
(1463, 22, 3, 1, '2022-03-13 05:58:50', '2022-03-13 05:58:50'),
(1464, 22, 4, 1, '2022-03-13 05:58:50', '2022-03-13 05:58:50'),
(1465, 22, 6, 1, '2022-03-13 05:58:51', '2022-03-13 05:58:51'),
(1466, 22, 14, 1, '2022-03-13 05:58:51', '2022-03-13 05:58:51'),
(1467, 22, 15, 1, '2022-03-13 05:58:51', '2022-03-13 05:58:51'),
(1468, 28, 2, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1469, 28, 3, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1470, 28, 4, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1471, 28, 5, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1472, 28, 6, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1473, 28, 7, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(1474, 28, 15, 1, '2022-03-13 05:59:33', '2022-03-13 05:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image`, `created_at`, `updated_at`) VALUES
(10, 5, 'uploads/custom-images/listing-sm-2021-09-09-03-04-28-3717.jpg', '2021-09-09 09:04:30', '2021-09-09 09:04:30'),
(12, 7, 'uploads/custom-images/listing-sm-2021-09-11-08-18-46-3194.jpg', '2021-09-11 02:18:50', '2021-09-11 02:18:50'),
(13, 7, 'uploads/custom-images/listing-sm-2021-09-11-08-18-50-4090.jpg', '2021-09-11 02:18:56', '2021-09-11 02:18:56'),
(14, 7, 'uploads/custom-images/listing-sm-2021-09-11-08-18-56-5793.jpg', '2021-09-11 02:18:59', '2021-09-11 02:18:59'),
(40, 12, 'uploads/custom-images/property-slide-2021-09-22-12-42-08-4491.jpg', '2021-09-22 06:42:08', '2021-09-22 06:42:08'),
(41, 12, 'uploads/custom-images/property-slide-2021-09-22-12-42-09-7900.jpg', '2021-09-22 06:42:09', '2021-09-22 06:42:09'),
(76, 22, 'uploads/custom-images/property-slide-2021-10-12-09-42-05-6976.jpg', '2021-10-12 03:42:06', '2021-10-12 03:42:06'),
(77, 22, 'uploads/custom-images/property-slide-2021-10-12-09-42-06-6375.jpg', '2021-10-12 03:42:06', '2021-10-12 03:42:06'),
(78, 22, 'uploads/custom-images/property-slide-2021-10-12-09-42-06-2694.jpg', '2021-10-12 03:42:06', '2021-10-12 03:42:06'),
(80, 21, 'uploads/custom-images/property-slide-2021-10-12-09-46-31-9227.jpg', '2021-10-12 03:46:32', '2021-10-12 03:46:32'),
(81, 21, 'uploads/custom-images/property-slide-2021-10-12-09-46-32-7319.png', '2021-10-12 03:46:32', '2021-10-12 03:46:32'),
(82, 21, 'uploads/custom-images/property-slide-2021-10-12-09-46-32-9309.png', '2021-10-12 03:46:33', '2021-10-12 03:46:33'),
(83, 11, 'uploads/custom-images/property-slide-2021-10-12-09-50-12-2797.jpg', '2021-10-12 03:50:12', '2021-10-12 03:50:12'),
(84, 11, 'uploads/custom-images/property-slide-2021-10-12-09-50-12-7389.jpg', '2021-10-12 03:50:12', '2021-10-12 03:50:12'),
(85, 11, 'uploads/custom-images/property-slide-2021-10-12-09-50-12-7959.png', '2021-10-12 03:50:13', '2021-10-12 03:50:13'),
(86, 9, 'uploads/custom-images/property-slide-2021-10-12-09-54-10-4404.jpg', '2021-10-12 03:54:10', '2021-10-12 03:54:10'),
(87, 9, 'uploads/custom-images/property-slide-2021-10-12-09-54-10-5433.jpg', '2021-10-12 03:54:11', '2021-10-12 03:54:11'),
(88, 9, 'uploads/custom-images/property-slide-2021-10-12-09-54-11-2561.jpg', '2021-10-12 03:54:11', '2021-10-12 03:54:11'),
(91, 23, 'uploads/custom-images/property-slide-2021-10-12-10-04-02-9116.jpg', '2021-10-12 04:04:03', '2021-10-12 04:04:03'),
(98, 24, 'uploads/custom-images/property-slide-2021-10-18-07-13-39-8674.jpg', '2021-10-18 01:13:46', '2021-10-18 01:13:46'),
(99, 24, 'uploads/custom-images/property-slide-2021-10-18-07-13-46-5352.jpg', '2021-10-18 01:13:49', '2021-10-18 01:13:49'),
(100, 24, 'uploads/custom-images/property-slide-2021-10-18-07-13-49-9076.jpg', '2021-10-18 01:13:51', '2021-10-18 01:13:51'),
(101, 26, 'uploads/custom-images/property-slide-2021-10-18-08-42-50-8510.jpg', '2021-10-18 02:42:53', '2021-10-18 02:42:53'),
(102, 26, 'uploads/custom-images/property-slide-2021-10-18-08-42-53-2644.jpg', '2021-10-18 02:42:56', '2021-10-18 02:42:56'),
(103, 26, 'uploads/custom-images/property-slide-2021-10-18-08-42-56-3659.jpg', '2021-10-18 02:43:00', '2021-10-18 02:43:00'),
(104, 17, 'uploads/custom-images/property-slide-2021-10-18-08-56-04-1967.png', '2021-10-18 02:56:04', '2021-10-18 02:56:04'),
(105, 17, 'uploads/custom-images/property-slide-2021-10-18-08-56-04-7319.jpg', '2021-10-18 02:56:05', '2021-10-18 02:56:05'),
(107, 16, 'uploads/custom-images/property-slide-2021-10-18-09-00-30-6916.png', '2021-10-18 03:00:31', '2021-10-18 03:00:31'),
(108, 16, 'uploads/custom-images/property-slide-2021-10-18-09-00-31-2575.png', '2021-10-18 03:00:31', '2021-10-18 03:00:31'),
(109, 16, 'uploads/custom-images/property-slide-2021-10-18-09-00-31-5875.png', '2021-10-18 03:00:32', '2021-10-18 03:00:32'),
(110, 18, 'uploads/custom-images/property-slide-2021-10-18-09-10-44-3492.jpg', '2021-10-18 03:10:47', '2021-10-18 03:10:47'),
(111, 18, 'uploads/custom-images/property-slide-2021-10-18-09-10-47-6508.jpg', '2021-10-18 03:10:48', '2021-10-18 03:10:48'),
(112, 18, 'uploads/custom-images/property-slide-2021-10-18-09-10-48-3399.jpg', '2021-10-18 03:10:51', '2021-10-18 03:10:51'),
(113, 27, 'uploads/custom-images/property-slide-2021-10-19-08-46-46-2725.jpg', '2021-10-19 02:46:52', '2021-10-19 02:46:52'),
(114, 27, 'uploads/custom-images/property-slide-2021-10-19-08-46-52-4488.jpg', '2021-10-19 02:46:57', '2021-10-19 02:46:57'),
(115, 27, 'uploads/custom-images/property-slide-2021-10-19-08-46-57-4205.jpg', '2021-10-19 02:47:03', '2021-10-19 02:47:03'),
(116, 28, 'uploads/custom-images/property-slide-2021-10-19-08-51-53-4005.jpg', '2021-10-19 02:51:56', '2021-10-19 02:51:56'),
(117, 28, 'uploads/custom-images/property-slide-2021-10-19-08-51-56-2036.jpg', '2021-10-19 02:51:59', '2021-10-19 02:51:59'),
(118, 28, 'uploads/custom-images/property-slide-2021-10-19-08-51-59-3815.jpg', '2021-10-19 02:52:03', '2021-10-19 02:52:03'),
(119, 29, 'uploads/custom-images/property-slide-2021-10-19-08-55-01-4123.jpg', '2021-10-19 02:55:04', '2021-10-19 02:55:04'),
(120, 29, 'uploads/custom-images/property-slide-2021-10-19-08-55-04-7657.jpg', '2021-10-19 02:55:09', '2021-10-19 02:55:09'),
(121, 29, 'uploads/custom-images/property-slide-2021-10-19-08-55-09-1672.jpg', '2021-10-19 02:55:14', '2021-10-19 02:55:14'),
(122, 30, 'uploads/custom-images/property-slide-2021-10-19-08-58-27-9374.jpg', '2021-10-19 02:58:31', '2021-10-19 02:58:31'),
(123, 30, 'uploads/custom-images/property-slide-2021-10-19-08-58-31-4422.jpg', '2021-10-19 02:58:34', '2021-10-19 02:58:34'),
(124, 30, 'uploads/custom-images/property-slide-2021-10-19-08-58-34-1802.jpg', '2021-10-19 02:58:37', '2021-10-19 02:58:37'),
(125, 31, 'uploads/custom-images/property-slide-2021-10-19-09-02-08-5947.jpg', '2021-10-19 03:02:11', '2021-10-19 03:02:11'),
(126, 31, 'uploads/custom-images/property-slide-2021-10-19-09-02-11-4606.jpg', '2021-10-19 03:02:14', '2021-10-19 03:02:14'),
(127, 32, 'uploads/custom-images/property-slide-2021-10-19-09-05-36-9314.jpg', '2021-10-19 03:05:41', '2021-10-19 03:05:41'),
(128, 32, 'uploads/custom-images/property-slide-2021-10-19-09-05-41-8160.jpg', '2021-10-19 03:05:46', '2021-10-19 03:05:46'),
(129, 32, 'uploads/custom-images/property-slide-2021-10-19-09-05-46-8332.jpg', '2021-10-19 03:05:51', '2021-10-19 03:05:51'),
(140, 23, 'uploads/custom-images/property-slide-2022-02-28-02-31-01-9308.jpg', '2022-02-28 08:31:03', '2022-02-28 08:31:03'),
(141, 23, 'uploads/custom-images/property-slide-2022-02-28-02-31-03-7971.jpg', '2022-02-28 08:31:05', '2022-02-28 08:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `property_nearest_locations`
--

CREATE TABLE `property_nearest_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `nearest_location_id` int(11) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_nearest_locations`
--

INSERT INTO `property_nearest_locations` (`id`, `property_id`, `nearest_location_id`, `distance`, `created_at`, `updated_at`) VALUES
(86, 13, 3, '66', '2021-09-25 02:58:14', '2021-09-25 02:58:14'),
(87, 13, 8, '1.5', '2021-09-25 02:58:14', '2021-09-25 02:58:14'),
(129, 19, 3, '1.5', '2021-09-27 17:10:00', '2021-09-27 17:10:00'),
(415, 27, 2, '1', '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(416, 27, 11, '.5', '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(417, 27, 6, '2', '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(418, 27, 4, '1.2', '2022-03-08 08:11:57', '2022-03-08 08:11:57'),
(419, 24, 2, '1.5', '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(420, 24, 4, '5', '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(421, 24, 8, '3', '2022-03-08 08:14:23', '2022-03-08 08:14:23'),
(433, 12, 10, '1', '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(434, 12, 7, '2', '2022-03-08 08:18:25', '2022-03-08 08:18:25'),
(435, 9, 8, '3', '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(436, 9, 4, '2', '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(437, 9, 5, '.5', '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(438, 9, 6, '1.5', '2022-03-08 08:20:13', '2022-03-08 08:20:13'),
(439, 11, 7, '4', '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(440, 11, 3, '6', '2022-03-08 08:21:07', '2022-03-08 08:21:07'),
(441, 26, 2, '.3', '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(442, 26, 5, '.5', '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(443, 26, 10, '1', '2022-03-08 08:23:53', '2022-03-08 08:23:53'),
(444, 18, 3, '6', '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(445, 18, 2, '4', '2022-03-08 08:25:43', '2022-03-08 08:25:43'),
(446, 23, 3, '12', '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(447, 23, 5, '2', '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(448, 23, 6, '12', '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(449, 23, 11, '1', '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(450, 23, 10, '3', '2022-03-08 08:28:02', '2022-03-08 08:28:02'),
(451, 17, 7, '66', '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(452, 17, 1, '1', '2022-03-08 08:29:54', '2022-03-08 08:29:54'),
(453, 16, 7, '2', '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(454, 16, 11, '1', '2022-03-08 08:30:31', '2022-03-08 08:30:31'),
(455, 21, 3, '2', '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(456, 21, 4, '1', '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(457, 21, 8, '.9', '2022-03-13 05:58:06', '2022-03-13 05:58:06'),
(458, 22, 4, '1.5', '2022-03-13 05:58:52', '2022-03-13 05:58:52'),
(459, 22, 11, '0.3', '2022-03-13 05:58:52', '2022-03-13 05:58:52'),
(460, 22, 5, '0.8', '2022-03-13 05:58:52', '2022-03-13 05:58:52'),
(461, 22, 3, '1.5', '2022-03-13 05:58:53', '2022-03-13 05:58:53'),
(462, 28, 2, '.3', '2022-03-13 05:59:33', '2022-03-13 05:59:33'),
(463, 28, 3, '.5', '2022-03-13 05:59:34', '2022-03-13 05:59:34'),
(464, 28, 8, '2', '2022-03-13 05:59:34', '2022-03-13 05:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `property_purposes`
--

CREATE TABLE `property_purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `custom_purpose` varchar(191) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_purposes`
--

INSERT INTO `property_purposes` (`id`, `purpose`, `custom_purpose`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'For Sale', 'For Sale', 'for-sale', 1, '2021-09-07 08:15:28', '2021-10-12 09:16:52'),
(2, 'For Rent', 'For Rent', 'for-rent', 1, '2021-09-07 08:15:53', '2021-10-12 09:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `property_reviews`
--

CREATE TABLE `property_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `service_rating` float NOT NULL,
  `location_rating` float NOT NULL,
  `money_rating` float NOT NULL,
  `clean_rating` float NOT NULL,
  `avarage_rating` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_reviews`
--

INSERT INTO `property_reviews` (`id`, `user_id`, `property_id`, `comment`, `service_rating`, `location_rating`, `money_rating`, `clean_rating`, `avarage_rating`, `status`, `created_at`, `updated_at`) VALUES
(12, 2, 12, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 4, 3, 4, 5, 4, 1, '2021-09-27 14:38:46', '2021-10-11 06:27:33'),
(13, 23, 12, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 3, 5, 5, 5, 4.5, 1, '2021-09-27 14:41:27', '2021-09-27 15:13:55'),
(16, 23, 17, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 4, 5, 4, 5, 4.5, 1, '2021-09-27 14:42:06', '2021-09-27 15:13:47'),
(18, 24, 9, 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis.', 3, 2, 3, 5, 3.25, 1, '2021-09-27 14:44:28', '2021-09-27 15:13:44'),
(19, 24, 11, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur. Mel ut decore salutandi intellegam. Labitur epicurei vis cu, in mei rationibus conse', 2, 2, 4, 2, 2.5, 1, '2021-09-27 14:45:25', '2021-09-27 15:13:43'),
(20, 24, 12, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 3, 4, 2, 2, 2.75, 1, '2021-09-27 14:45:59', '2021-09-29 12:39:15'),
(22, 24, 16, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 5, 2, 5, 5, 4.25, 1, '2021-09-27 14:46:42', '2021-09-27 15:13:40'),
(23, 24, 17, 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola, est ut clita dolorem, ei est mazim fuisset scribentur', 3, 5, 5, 2, 3.75, 1, '2021-09-27 14:46:50', '2021-09-29 12:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `type`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'House and Garden', 'house-and-garden', 1, '2021-09-09 08:46:05', '2021-10-10 02:57:29'),
(3, 'Hotel And Resort', 'hotel-and-resort', 1, NULL, '2021-09-09 08:55:29'),
(4, 'Business', 'business', 1, NULL, '2021-09-09 08:56:38'),
(5, 'Restaurant', 'restaurant', 1, NULL, '2021-09-09 08:56:49'),
(6, 'Fitness Club', 'fitness-club', 1, NULL, '2021-09-09 08:56:55'),
(7, 'Event and Club', 'event-and-club', 1, NULL, '2021-09-09 08:57:04'),
(8, 'Education', 'education', 1, NULL, '2021-09-09 08:57:09'),
(9, 'Housing', 'housing', 1, NULL, '2021-09-09 08:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `razorpays`
--

CREATE TABLE `razorpays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razorpay_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `theme_color` varchar(255) DEFAULT NULL,
  `razorpay_status` int(10) NOT NULL DEFAULT 1,
  `currency_rate` varchar(10) NOT NULL DEFAULT '1',
  `currency_code` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `razorpays`
--

INSERT INTO `razorpays` (`id`, `razorpay_key`, `secret_key`, `name`, `description`, `image`, `theme_color`, `razorpay_status`, `currency_rate`, `currency_code`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 'rzp_test_K7CipNQYyyMPiS', 'zSBmNMorJrirOrnDrbOd1ALO', 'TopLand', 'This is description', 'uploads/website-images/razorpay-2021-11-18-10-48-50-1748.png', '#3f28e6', 1, '75.47', 'INR', 'IN', NULL, '2022-03-01 02:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `question_audio` varchar(255) DEFAULT NULL,
  `answer_audio` varchar(255) DEFAULT NULL,
  `practice_id` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `question`, `answer`, `question_audio`, `answer_audio`, `practice_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What should my blood sugar be when I wake up (fasting) and before meals? What about after?', 'For most people with diabetes, the American Diabetes Association recommends a fasting or before-meals blood glucose (or blood sugar) goal of 70–130 mg/dl. One to two hours after eating, a postprandial blood sugar reading at or under 180 mg/dl is recommended.', 'uploads/segments-audio/mp3-2023-10-18-02-54-41-1231.mp3', 'uploads/segments-audio/mp3-2023-10-18-02-54-41-8372.mp3', '1', 1, '2023-10-18 06:42:55', '2023-10-30 12:31:33'),
(2, 'How long does it take to show signs of chickenpox after being exposed?', 'It takes from 10 to 21 days to develop symptoms after\r\nbeing exposed to a person infected with chickenpox.\r\nThe usual time period is 14–16 days', 'uploads/segments-audio/mp3-2023-10-18-02-54-52-8155.mp3', 'uploads/segments-audio/mp3-2023-10-18-02-54-52-3306.mp3', '2', 1, '2023-10-18 06:50:57', '2023-10-18 14:54:52'),
(3, 'How long is a person with chickenpox contagious?', 'Patients with chickenpox are contagious for 1–2 days\r\nbefore the rash appears and continue to be contagious\r\nthrough the first 4–5 days or until all the blisters are\r\ncrusted over.', 'uploads/segments-audio/mp3-2023-10-18-12-22-26-3477.mp3', 'uploads/segments-audio/mp3-2023-10-18-12-22-26-6113.mp3', '5', 1, '2023-10-18 06:52:26', '2023-10-30 12:31:47'),
(4, 'What procedures would you feel comfortable doing at our practice?', 'This question allows you to explain more of your expertise within the dental profession. Share your history of administering oral health care', 'uploads/segments-audio/mp3-2023-10-18-12-27-50-7377.mp3', 'uploads/segments-audio/mp3-2023-10-18-12-27-50-1321.mp3', '7', 1, '2023-10-18 06:57:50', '2023-10-18 06:57:50'),
(5, 'What do you think is the most challenging thing about working with children?', 'Similar to the question about your weaknesses, this question tests what challenges you have experienced and how you overcome them. Maintain a positive tone and remember to explain how you manage the challenge you face.', 'uploads/segments-audio/mp3-2023-10-18-12-31-33-5767.mp3', 'uploads/segments-audio/mp3-2023-10-18-12-31-33-4363.mp3', '2', 1, '2023-10-18 07:01:33', '2023-10-30 12:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `seo_texts`
--

CREATE TABLE `seo_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_texts`
--

INSERT INTO `seo_texts` (`id`, `page_name`, `title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Home Page', 'TopLand - HomePage', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:48:59'),
(2, 'Property Page', 'TopLand-All Properties', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:06'),
(3, 'About Us', 'TopLand -About us', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:13'),
(4, 'Pricing Plan', 'TopLand -Pricing Plan', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:19'),
(5, 'Agent Page', 'TopLand- Our Agent', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:26'),
(6, 'Blog Page', 'TopLand - Blog Page', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:36'),
(7, 'Contact Us', 'TopLand - Contact us', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:47'),
(8, 'FAQ Page', 'TopLand - FAQ Page', 'Lorem ipsum dolor sit amet, per mollis aeterno nostrud in, nam timeam fastidii eu. Commodo nonumes vim eu. Quo indoctum voluptatibus no.', NULL, '2022-03-01 06:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Perfect Tools', 'Lorem ipsum dolor sit amet, qui assum oblique praesent te. Quo ei erant essent scaevola', 'fab fa-affiliatetheme', 1, '2021-09-12 02:44:09', '2021-10-18 02:29:48'),
(2, 'Search in Click', 'Pri tempor appareat no, eruditi repudiandae vix at. Eos at brute omnesque voluptaria', 'fas fa-align-center', 1, '2021-09-12 02:46:26', '2022-03-08 08:36:28'),
(4, 'User Control', 'Ei usu malis aeque efficiantur. Mazim dolor denique duo ad, augue ornatus sententiae vel at', 'fab fa-github-square', 1, '2021-09-12 02:58:33', '2022-03-08 08:36:43'),
(5, '5 Star Support', 'Consetetur definitionem cu mea, usu legere minimum ne. Pro epicurei constituam ne', 'fas fa-american-sign-language-interpreting', 1, '2021-09-12 02:59:08', '2022-03-08 08:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `show` tinyint(4) DEFAULT 1,
  `patient_can_register` int(2) DEFAULT 1,
  `save_contact_message` int(191) DEFAULT 0,
  `comment_type` int(1) DEFAULT 1,
  `preloader` int(1) DEFAULT 1,
  `preloader_image` varchar(191) DEFAULT NULL,
  `facebook_comment_script` text DEFAULT NULL,
  `cookie_text` text DEFAULT NULL,
  `cookie_button_text` varchar(191) DEFAULT NULL,
  `allow_cookie_consent` int(1) DEFAULT 0,
  `captcha_key` text DEFAULT NULL,
  `captcha_secret` text DEFAULT NULL,
  `allow_captcha` int(11) NOT NULL DEFAULT 0,
  `live_chat` int(1) NOT NULL DEFAULT 0,
  `livechat_script` text DEFAULT NULL,
  `text_direction` varchar(191) NOT NULL DEFAULT 'LTR',
  `currency_icon` varchar(191) NOT NULL DEFAULT '$',
  `currency_name` varchar(191) NOT NULL DEFAULT 'usd',
  `currency_rate` float NOT NULL,
  `timezone` varchar(191) NOT NULL DEFAULT 'UTC',
  `google_analytic` int(1) NOT NULL DEFAULT 0,
  `google_analytic_code` text DEFAULT NULL,
  `theme_one` varchar(191) DEFAULT '#0000FF',
  `theme_two` varchar(191) DEFAULT '#0000FF',
  `theme_three` varchar(191) NOT NULL,
  `google_map_api_key` varchar(191) DEFAULT NULL,
  `prenotification_day` int(11) NOT NULL,
  `dashboard_header` varchar(191) NOT NULL,
  `dashbaord_header_icon` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `footer_logo`, `favicon`, `email`, `show`, `patient_can_register`, `save_contact_message`, `comment_type`, `preloader`, `preloader_image`, `facebook_comment_script`, `cookie_text`, `cookie_button_text`, `allow_cookie_consent`, `captcha_key`, `captcha_secret`, `allow_captcha`, `live_chat`, `livechat_script`, `text_direction`, `currency_icon`, `currency_name`, `currency_rate`, `timezone`, `google_analytic`, `google_analytic_code`, `theme_one`, `theme_two`, `theme_three`, `google_map_api_key`, `prenotification_day`, `dashboard_header`, `dashbaord_header_icon`, `created_at`, `updated_at`) VALUES
(10, 'uploads/website-images/logo-2023-10-06-02-32-58-7107.png', 'uploads/website-images/logo-2023-10-06-02-32-58-8737.png', 'uploads/website-images/favicon-2023-10-06-02-32-47-8011.png', 'atul.cubixsys@gmail.com', 1, 1, 1, 1, 0, 'public/uploads/website-images/preloader_image-2021-08-23-11-57-24-6178.png', '882238482112522', 'We use cookies to personalize content and ads, to provide social media features and to analyze our traffic. We also share information about your use of our site with our social media, advertising and analytics partners who may combine it with other information that you’ve provided to them or that they’ve collected from your use of their services.', 'Accept', 1, '6LcVO6cbAAAAAOzIEwPlU66nL1rxD4VAS38tjpBX', '6LcVO6cbAAAAALVNrpZfNRfd0Gy_9a_fJRLiMVUI', 0, 0, 'https://embed.tawk.to/5a7c31ded7591465c7077c48/default', 'LTR', '$', 'USD', 1, 'America/Los_Angeles', 1, 'UA-84213520-6', '#f02c2d', '#c4e3f3', '000', 'AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY', 5, 'Education', 'fas fa-graduation-cap', '2021-06-18 09:25:14', '2023-10-25 10:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `serial` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(21, 'uploads/custom-images/home-page-banner-2022-03-01-08-12-36-9622.jpg', 'Trendy House Interior', 1, 1, '2022-02-22 08:53:52', '2022-03-01 06:55:29'),
(22, 'uploads/custom-images/home-page-banner-2022-02-22-02-54-35-4444.jpg', 'Luxury Family Home', 4, 1, '2022-02-22 08:54:04', '2022-03-01 06:56:26'),
(23, 'uploads/custom-images/home-page-banner-2022-03-01-08-13-06-4556.jpg', 'Luxury Gymnasium Club', 3, 1, '2022-02-22 08:54:18', '2022-03-01 06:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_contents`
--

CREATE TABLE `subscriber_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `header` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriber_contents`
--

INSERT INTO `subscriber_contents` (`id`, `header`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Subscribe to Newsletter', 'Subscribe to get update and information. Don\'t worry, we won\'t send spam!', NULL, '2021-07-18 10:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_emails`
--

CREATE TABLE `subscriber_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriber_emails`
--

INSERT INTO `subscriber_emails` (`id`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, '', '', NULL, '2021-07-13 02:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `verify_token` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `verify_token`, `status`, `created_at`, `updated_at`) VALUES
(6, 'olivia@gmail.com', '', 1, '2021-08-23 06:47:58', '2021-08-23 06:47:58'),
(23, 'client234@gmail.com', 'usunEO2UyuRP67jVLzcyhdkjR', 0, '2022-02-23 02:43:26', '2022-02-23 02:43:26'),
(24, 'agent@gmail.com', 'mWSQCpCe3QD0jR0aC9QHAfZga', 0, '2022-02-23 02:47:12', '2022-02-23 02:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `designation` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `image`, `designation`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'James Robert', 'uploads/custom-images/testimonial-2021-09-12-09-19-30-1155.jpg', 'Founder', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 1, '2021-08-01 04:27:20', '2021-10-18 01:56:31'),
(2, 'Alabama William', 'uploads/custom-images/testimonial-2021-09-12-09-18-48-7887.jpg', 'CEO', 'Per ex vero nonumy. Ius eu doming nominavi mediocrem, aliquid efficiantur no vim, sanctus admodum mnesarchum ad pro. No sea invidunt partiendo. No postea numquam ocurreret duo, unum abhorreant cu nam, fugit fastidii percipitur nam id.', 1, '2021-08-01 04:27:51', '2022-03-08 08:31:55'),
(5, 'Jhone Doe', 'uploads/custom-images/testimonial-2021-10-18-09-26-53-3936.jpg', 'Employee', 'Usu ad solet diceret, usu at appetere percipit appellantur, te est primis audire gloriatur. Scripta noluisse no mel, vis ne decore ridens labitur. Stet erant saepe eu mea. An mel dolore salutandi abhorreant. An quo aliquip maluisset, mea quaeque indoctum in, pro augue veritus praesent te.', 1, '2021-09-27 04:35:41', '2022-03-08 08:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `text_formates`
--

CREATE TABLE `text_formates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discription` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `text_formates`
--

INSERT INTO `text_formates` (`id`, `title`, `image`, `discription`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Naati Test Format', 'uploads/custom-images/textformate-2023-10-18-06-06-20-1665.jpg', '<p>Education Test determines a candidate&#39;s ability to interpret the recorded conversation from English to LOTE (Language Other Than English) and vice versa.<br />\r\nFive bonus points which are also referred to as Credentialed Community Language Points are awarded and used to claim points in the point-based visa applications to Australia..<br />\r\nThis is a verbal exam, so you do not need to write anything.<br />\r\nIn the Education Test, the examiner plays the audio<br />\r\nfor the test taker to interpret. This audio comprises two<br />\r\ndialogues.<br />\r\nEach dialogue represents a conversation between an English speaker and a speaker of LOTE. The candidate&#39;s response is recorded for the evaluation.<br />\r\nEach dialogue is of roughly 300 words, almost half in English and half in LOTE. The dialogues are divided into various segments.<br />\r\nEach segment reaches up to a maximum of 35 words. The time allocated for the test is 20 minutes.</p>', 0, '2023-10-09 11:41:01', '2023-10-18 18:06:20'),
(3, 'Test Marking', 'uploads/custom-images/tutorial-2023-10-25-10-52-51-2534.jpg', '<p>Education Test determines a candidate&#39;s ability to interpret the recorded conversation from English to LOTE (Language Other Than English) and vice versa.<br />\r\nFive bonus points which are also referred to as Credentialed Community Language Points are awarded and used to claim points in the point-based visa applications to Australia..<br />\r\nThis is a verbal exam, so you do not need to write anything.<br />\r\nIn the Education Test, the examiner plays the audio<br />\r\nfor the test taker to interpret. This audio comprises two<br />\r\ndialogues.<br />\r\nEach dialogue represents a conversation between an English speaker and a speaker of LOTE. The candidate&#39;s response is recorded for the evaluation.<br />\r\nEach dialogue is of roughly 300 words, almost half in English and half in LOTE. The dialogues are divided into various segments.<br />\r\nEach segment reaches up to a maximum of 35 words. The time allocated for the test is 20 minutes.</p>', 1, '2023-10-25 10:52:51', '2023-10-25 10:52:51'),
(4, 'How to apply ?', 'uploads/custom-images/textformate-2023-10-25-02-42-27-1110.jpg', '<p>Education Test determines a candidate&#39;s ability to interpret the recorded conversation from English to LOTE (Language Other Than English) and vice versa.<br />\r\nFive bonus points which are also referred to as Credentialed Community Language Points are awarded and used to claim points in the point-based visa applications to Australia..<br />\r\nThis is a verbal exam, so you do not need to write anything.<br />\r\nIn the Education Test, the examiner plays the audio<br />\r\nfor the test taker to interpret. This audio comprises two<br />\r\ndialogues.<br />\r\nEach dialogue represents a conversation between an English speaker and a speaker of LOTE. The candidate&#39;s response is recorded for the evaluation.<br />\r\nEach dialogue is of roughly 300 words, almost half in English and half in LOTE. The dialogues are divided into various segments.<br />\r\nEach segment reaches up to a maximum of 35 words. The time allocated for the test is 20 minutes.</p>', 1, '2023-10-25 10:54:02', '2023-10-25 14:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `discription` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `title`, `video`, `discription`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Education Exam Format and Marking Criteria', 'uploads/video/tutorial-2023-10-25-03-05-51-4207.mp4', 'Education Exam Format and Marking Criteria', 1, '2023-10-09 07:43:32', '2023-10-25 15:05:51'),
(10, 'Education Online Exam Demonstration', 'uploads/video/tutorial-2023-10-25-03-05-28-8235.mp4', 'Education Online Exam Demonstration | Online Classes | Language Academy PTE NAATI IELTS Experts', 1, '2023-10-09 09:41:18', '2023-10-25 15:05:28'),
(11, 'Education Real Exam Demonstration', 'uploads/video/tutorial-2023-10-25-01-35-36-4197.mp4', 'Education Real Exam Demonstration | Sample Diaologue and Response | Must watch', 1, '2023-10-09 09:41:32', '2023-10-25 13:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `exam_date` timestamp NULL DEFAULT NULL,
  `about` text DEFAULT NULL,
  `icon_one` varchar(191) DEFAULT NULL,
  `link_one` varchar(191) DEFAULT NULL,
  `icon_two` varchar(191) DEFAULT NULL,
  `link_two` varchar(191) DEFAULT NULL,
  `icon_three` varchar(191) DEFAULT NULL,
  `link_three` varchar(191) DEFAULT NULL,
  `icon_four` varchar(191) DEFAULT NULL,
  `link_four` varchar(191) DEFAULT NULL,
  `email_verified_token` varchar(255) DEFAULT NULL,
  `email_verified` int(2) NOT NULL DEFAULT 0,
  `forget_password_token` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `website` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `phone`, `image`, `language`, `exam_date`, `about`, `icon_one`, `link_one`, `icon_two`, `link_two`, `icon_three`, `link_three`, `icon_four`, `link_four`, `email_verified_token`, `email_verified`, `forget_password_token`, `password`, `status`, `website`, `address`, `remember_token`, `banner_image`, `created_at`, `updated_at`) VALUES
(30, 'atul', 'atul', 'atul12@gmail.com', '8965163634', 'uploads/custom-images/user-2023-10-30-05-17-54-7594.jpg', '7', '2023-11-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0AjkGmP7LmLSOWdmN1PpqB7JeKo1gFNZM34RpaLEYxiTotP22xWEAw34pbH4zEwgNowtuBRAcJU0u4YIi1N8mOKMNg7GbPpVK12F', 0, NULL, '$2y$10$Z7gjyYrcg2xG5VFXa4NikeB6hTTFuP11yNQBdYPHFZC98Z9xU1GD6', 1, NULL, 'vijay nagar indore', NULL, NULL, '2023-10-06 06:23:33', '2023-10-19 17:03:54'),
(31, 'jay dabi', 'jay-dabi', 'atul.cubixsys@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YlMs7O73AU1YYN5G9pGY3y6pInSrVBiXUK9XUTm2TVC2Mq3D7I2mvX9K42TPpSuzeZKMvi1IIxvrOQ7UsVcmxdjo1EFkANx4meNp', 0, '9bY5A6UGGRHZjdsnqnql2JSztZQH2QVySy20PH8DMopHHjcbofS9c1Mf6tALpFxMpfR8cbhRKMHxYppTQWwkTh4poSHAZVGoHmoD', '$2y$10$ld/wV9Iga2TQEBNwy/ei5.MI6E2YyOxHmdGdWUXtM5gGByvwnRlpu', 1, NULL, NULL, NULL, NULL, '2023-10-13 13:18:50', '2023-10-17 11:26:33'),
(32, 'jay', 'jay', 'rajat.cubixsys@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5jt76Pi2fVYRVKbQvpzG0oMTmSSwfI0XwA5hI1HmRLz7Dgs5MmsbgIm6qwUPFPdc0Q4ttZggvLLXZfX1qWRWl1AYSumWfAdvehV2', 0, 'glj2UWUzGBpPuGq1ijEXmlbj15uK5TlhyBscIReGalgulprkj57J2lzxwugks2osM97Qri3rjxoH982mNHpn7ObIZLzlKwejCAIW', '$2y$10$5Uf7ojZMgi9QF/1wEvJ22.moFoR7JMr4Cljy3r3.s.t/1pVPxrMnK', 1, NULL, NULL, NULL, NULL, '2023-10-13 14:24:39', '2023-10-16 11:48:06'),
(33, 'raj', 'raj', 'raj@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VCJMZwtIxwqukgWWofcSJ6XnNQRtRAFpWzps6rc1NM9q6GLJ10TkzomuSLjKKw7c5l2cYwpNTCBuXsMA1sXNPh66S788o7sM6u1g', 0, NULL, '$2y$10$AOUjKyEsb/XN.dxQ7QcycOOzI09YJSlAqndKqfYsPo7RVazK.drIS', 1, NULL, NULL, NULL, NULL, '2023-10-13 14:26:05', '2023-10-13 15:16:38'),
(34, 'raj', 'raj', 'raj123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hQ4Qc6bZgDQMedyM87rD0Lqsd4C6MjgYIks1HdMLKzDN8PDqWqKzZhMtWCHY8xjrUfr6WpaW6nRTtnCriU17KQL8Iy8PtKJhHTO8', 0, NULL, '$2y$10$mVQry7resQLCnJ20KA11u.eJKxXViR7Q5pRkny8gungdl/ijzeyUK', 1, NULL, NULL, NULL, NULL, '2023-10-13 15:07:59', '2023-10-13 15:16:37'),
(35, 'Gautam', 'gautam', 'atul120@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RD0xmV0mBFVGshbpfuMNOe13Nmn8V80sVgUyct2FXEeGd1zU2Lk4noeERT2lxo7gN0DKGCfg208msG1KqhPou4z1P9yMvwdoxpHJ', 0, NULL, '$2y$10$dOgmwvBeKk4x/Eq.HdqvBueRutjkYWBn.Pw6/4YtnzDKM5RNA4l8S', 1, NULL, NULL, NULL, NULL, '2023-10-13 15:08:40', '2023-10-13 15:18:52'),
(36, 'Gautam', 'gautam', 'atul1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GnsTXcJHkRLbhsLPHQeErTFuAVYb5EfmZmoucQyiIXBFgYA6vyRUPSqBuys5rr4I1DJu7297sqcNZHt5fbWBh4ZUuLOlu0R2NBeo', 0, NULL, '$2y$10$TEHxm6QWkEAZaMJNPub8P.d19EekIPMJcVO50k3/tzHxLoKUYpZdC', 1, NULL, NULL, NULL, NULL, '2023-10-13 15:13:33', '2023-10-13 15:18:51'),
(37, 'Gautam', 'gautam', 'atu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XOTzgcNfW2c4UII9D0Je8rkpRlD63c5KPuAOViOngk8VZevkcCku2oF1LlCuVWXd1zZGbJfTrUTipCWPdZA5Yt6MBloBg1A4hA5d', 0, NULL, '$2y$10$ZrRiJ9/gn5mdzPGnheq/ue0R/BX1kf29uoXkxcJ4j0yGdBGJ1Dz3a', 1, NULL, NULL, NULL, NULL, '2023-10-13 15:15:15', '2023-10-13 15:18:50'),
(38, 'raj', 'raj', 'raj1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QzB0x5bQ8tqhi7EsXdqJ1GU8aIXhqb3qk1TpZPkuBs7nZRPaCeJqHD01oCHVTJLJtFloXYkk4E8u0Ul3rICBt8AJMh449puis2aH', 0, NULL, '$2y$10$bZYYtywKc7FhuDxvFjwqsuCb3rbC5VvvS9DQSIFUZq0ll5./GQgf2', 1, NULL, NULL, NULL, NULL, '2023-10-13 15:15:33', '2023-10-13 15:18:50'),
(39, 'jay', 'jay', 'jay@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zL5ZevUkmAxqyNnK7IPir8JR8UfadbKDUj0LNZ7IjchUEvn9PDbGBJBAOQAZ4A6FY9Ah3FgrbKmRiabxhiocWNFgwopXrZVbWfW2', 0, 'dO8DkRSlUW6GSsUkUc4qChkK0WYOUyi4KWXUzi4YNVj9Nayfl1Ty6sMqyO7KfGK8fMf8PTRtbIA0M2hvhlozHsYF9qkfXYHBUh6O', '$2y$10$lVNCpqkBYx/fmkRwsrw0EuFldf5XxX9cwwy/sVeQuTBhR28CHJLCi', 1, NULL, NULL, NULL, NULL, '2023-10-18 12:50:11', '2023-10-27 13:25:41'),
(40, 'neha', 'neha', 'rajkumar.cubixsys@gmail.com', '9635784153', 'uploads/custom-images/user-2023-10-27-05-11-18-7091.png', '1', '2023-10-28 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bxf8ILAXxwaeyTj7WdyfchuAOZnMRnQcYVnGDdoVqRwR6ZRT3IUXUqUhnQPlhxC50oahCg2OvDHQwabHTD9fZx35b1eLQvtuBJkl', 0, 'pzgalNM9P8hr2w3aqjyZraKNBGGrgobsZGVQuGQpujaifLlw8vuz9mjR3f1JtaKvidquCOMe0TSTMH1sIOLu5b5mzjgyfWgqnTmQ', '$2y$10$SZqGo5lNNhAbdZgJIB9GtOB75KiLHeejJiNJX5EQuJpi1U3.gcy5G', 1, NULL, 'indore', NULL, NULL, '2023-10-19 12:53:48', '2023-10-23 18:26:35'),
(41, 'Shivam', 'shivam', 'shivam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'heruzD1nBMnTFMArry1ekIdCTUGc3JSOF7ClePmqWyE0c3K6bWayiGFfZDlhInmaNcaDxUerr2sIebTnpOZ95i9Rdux1tQWscY12', 0, NULL, '$2y$10$PBls7l3wuz3K5GOvF/PLPu78a8cSkO/hSNYZ8tW902hNQ2O5p6zXK', 0, NULL, NULL, NULL, NULL, '2023-10-20 13:28:21', '2023-10-20 13:28:21'),
(42, 'Shivam', 'shivam', 'shivam1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'poiFH9BRsuwnWYgfwLalifzQLztg9KhwbHbib0wPbEX6GuKIasL3wmvEbTcKMAWyWmO0ygKchc3U2D37BtH81babM0ce4GlcH2Ju', 0, NULL, '$2y$10$N8cbjwnGcP4WmR5k6xrzP.E3pTT4Y4JsECjucDphgfXV5zA6Sjqri', 0, NULL, NULL, NULL, NULL, '2023-10-20 13:30:00', '2023-10-20 13:30:00'),
(43, 'vineet', 'vineet', 'vineetsharma334@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AUliNWBduYIZuqc5tisvz2hsZUBQwQh90ZRt1K1Vm5Lrqdt9J7IsFIG2kaU3i6okljXuMRLrspExxQLU3cCEy5ewjaCaIBZ0SzwB', 0, 'QSeK4Tww1wSaFxMIhquJdClCoGUuN6ZqG2WVBpnEsNbmPAjPKZ7EnwATsGrIaqjg6X3MjK7K8THtoml3JdLJXk3fU3t7IdfZo9QI', '$2y$10$REDUmRx65R27OpMV5SC9guNsJF3VowCfG3PROOnzNqrEzGFlNMYS.', 0, NULL, NULL, NULL, NULL, '2023-10-23 20:11:27', '2023-10-23 20:12:09'),
(44, 'vineet', 'vineet', 'vineet.cubixsys@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '597CnHruuZ2qfTgiNSV0htXkaZaum4xbHrajQ8NhysI4tWhS9qwg2UharAVTNS97xuaJhO96VKRyHhGnCQDW6PVYrgKdwZKwFW4T', '$2y$10$/mm0FtVl0l.0Tc3nJ6w1yuAxMP8QidQ7a73gpPojRInh7KriXMDDW', 1, NULL, NULL, NULL, NULL, '2023-10-23 20:15:39', '2023-10-25 15:38:50'),
(48, 'Neeru', 'neeru', 'neerre@gmail.com', NULL, NULL, '2', '2023-10-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DeVcNUaHqNimBRsSkKUlbDf5UdjSJE29ivGpjQDenKnEw6BQ9uizyYFJXN6lpjU878Z8LJlFIvVb0uahaxcrGDhODgePefCTwFBJ', 0, NULL, '$2y$10$QHmnyY3/n33FHfc4G6x.v.rzz9LPj1phkadeHEfBk0dkdI0IJqYIm', 0, NULL, NULL, NULL, NULL, '2023-10-25 18:42:17', '2023-10-25 18:42:17'),
(49, 'karan', 'karan', 'karan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3qMW9ClrzGoG2lElQyRR63wNbuNZh9NKrgeM7liMHlIH9ILXx1sijZKcTsRQ0dHMQ0aljVAtSf4Is8LRFeqYUmRgzTHdQIDNk0Cz', 0, 'Vt0TjNSQtlNcmicOi35cR5M6dYJr6vBxZ2hW45ZljOjaxuwuptB6ip6ABq0ua9cJBGSTr5DryfzFlFCDW4KziQqtSt8bmOmlFvNv', '$2y$10$6r73hyEbmU.x6HBok8Pk4OljwtvLlyj/N5WSBpChwhzqCqGNj/726', 0, NULL, NULL, NULL, NULL, '2023-10-26 10:05:42', '2023-10-26 10:45:53'),
(50, 'karan', 'karan', 'karan1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FPKOXHIPxv9t1KKgu12eYVar1mSeZxSJ5lSioHQ8dnhtBBhuyzT9G6rchoeXWps6wOJaTz7mzLAEGO2y7R3sdaS79duDZbAYPV7P', 0, 'Ds165PZrXfJs867U6hwMqNtixiCjCxoxIBvHdRvhiu5C0RBu1ViolefrWsEDm24GgoH8axCLwaNK42WyF0e3qe6AuWYRPNc773VP', '$2y$10$744.ZZjyv3RvlvisYtY4muRHryL0xD.IZdFj8nuVo/Mv4/M0dJJO2', 0, NULL, NULL, NULL, NULL, '2023-10-26 10:07:29', '2023-10-26 10:47:06'),
(51, 'karan', 'karan', 'karan12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yPL0zzPc7ChNlIJFRTdFaxgDRo5KdekoRSswxAw2vOlJSzQl6nSnCv4GY3TluI9JnvQi6SmAPFZDIJ0GaKY2PUoPhNq1Nph3Jhmj', 0, NULL, '$2y$10$BhoDAbphfQhcdvZ/vbXyOu0EfA/eniUW1DvB8AyXrBdj.KKXLwd9G', 0, NULL, NULL, NULL, NULL, '2023-10-26 10:56:14', '2023-10-26 10:56:14'),
(52, 'jay', 'jay', 'jay12@gmail.com', NULL, NULL, '12', '2023-10-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a7qnIS6llEv4nSCxLHKn6N8kQOPQklGMAwZeb5nTTVTVipS6dmoBeEF5aeYFPIbXKqXZ1uvdQ9ukE5RmEtXwsrprbOGCbBZL7gXu', 0, NULL, '$2y$10$Mc/PDMh4JITExVdmcKIF9uekoEbjhRZesZwTlotaxh18fVs9J5nCm', 0, NULL, NULL, NULL, NULL, '2023-10-26 11:02:02', '2023-10-26 11:02:02'),
(53, 'Rahul', 'rahul', 'rahul@gmail.com', NULL, NULL, '9', '2023-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42xkz8xLeAnoQL8FWjpixKtacJp61IlqAiLGibwfn32LU0AqoDRCWTYcBqEyKjO8el37u0QcErBnMUGV0PT8lFFPo7MDCZcfslqF', 0, NULL, '$2y$10$wwLsIlQ9UsNYaYnlMTkhTeqS/4JLFC8oSRLETGOBYpAWMnEwyn/E6', 0, NULL, NULL, NULL, NULL, '2023-10-26 16:00:27', '2023-10-26 16:00:27'),
(54, 'arun', 'arun', 'arun@gmail.com', NULL, NULL, '12', '2023-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'E7CvUZMfIirbTyMq18uIEhcBkn1CdFtqJot85gjJZvb28DEyOMZcMq2Q5GTMvsGKm3P41v4WQTEx607chUWnrRE8VzqauXVp8OjF', 0, NULL, '$2y$10$m6o0xc2MkN1tIpDOX7PgduG2otBSovAqyBPQCOezCwArxoNM1fVwG', 0, NULL, NULL, NULL, NULL, '2023-10-27 15:52:38', '2023-10-27 15:52:38'),
(55, 'Rajkumar', 'rajkumar', 'rajkumarrajoriya45@gmail.com', '1698649967', 'uploads/custom-images/user-2023-10-27-04-27-07-7461.jpg', '2', '2023-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$SQt2hhAbf4gsUaeEqyrbx.MnwUKGz9GXrksKFDJUcbxxWTla.d8KG', 1, NULL, 'indore', NULL, NULL, '2023-10-27 15:58:00', '2023-10-27 16:02:42'),
(56, 'Shivam Kanathe', 'shivam-kanathe', 'shivamkanathe@gmail.com', NULL, NULL, '12', '2023-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$cLf.6Dfxft45jtQ1rsIVkOz3/nFBUstd/acjQNBZ.pJ4i5Z5a3CtG', 1, NULL, NULL, NULL, NULL, '2023-10-27 16:39:42', '2023-10-27 16:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `validation_texts`
--

CREATE TABLE `validation_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(191) NOT NULL,
  `default_text` text NOT NULL,
  `custom_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `validation_texts`
--

INSERT INTO `validation_texts` (`id`, `lang_key`, `default_text`, `custom_text`, `created_at`, `updated_at`) VALUES
(1, 'email', 'Email field is required', 'Email field is required', NULL, '2021-10-12 02:36:20'),
(2, 'valid_email', 'Insert Your Valid Email', 'Insert Your Valid Email', NULL, '2021-07-31 18:29:38'),
(3, 'unique_email', 'Email Already Exist', 'Email Already Exist', NULL, '2021-07-31 18:29:38'),
(4, 'name', 'Name field is required', 'Name field is required', NULL, '2021-10-12 02:36:15'),
(5, 'phone', 'Phone field is required', 'Phone field is required', NULL, '2021-10-12 02:36:15'),
(6, 'subject', 'Subject field is required', 'Subject field is required', NULL, '2021-10-12 02:36:15'),
(7, 'msg', 'Message field is required', 'Message field is required', NULL, '2021-10-12 02:36:15'),
(8, 'user_type', 'User type field is required', 'User type field is required', NULL, '2021-10-12 02:36:15'),
(9, 'search', 'Search field is required', 'Search field is required', NULL, '2021-10-12 02:36:15'),
(10, 'comment', 'Comment field is required', 'Comment field is required', NULL, '2021-10-12 02:36:15'),
(11, 'about', 'About field is required', 'About field is required', NULL, '2021-10-12 02:36:15'),
(12, 'pass', 'Password field is required', 'Password field is required', NULL, NULL),
(13, 'current_pass', 'Current Password field is required', 'Current Password field is required', NULL, NULL),
(14, 'confirm_pass', 'Confirmation Password Does not match', 'Confirmation Password Does not match', NULL, '2021-10-12 02:36:15'),
(15, 'rating', 'Rating field is required', 'Rating field is required', NULL, '2021-10-12 02:43:53'),
(16, 'property', 'Property field is required', 'Property field is required', NULL, '2021-10-12 02:43:53'),
(17, 'package', 'Package field is required', 'Package field is required', NULL, '2021-10-12 02:43:53'),
(18, 'title', 'Title field is required', 'Title field is required', NULL, '2021-10-12 02:43:54'),
(19, 'slug', 'Slug  field is required', 'Slug  field is required', NULL, '2021-10-12 02:43:54'),
(20, 'cat', 'Category field is Required', 'Category field is Required', NULL, '2021-10-12 02:43:54'),
(21, 'loc', 'Location field is Required', 'Location field is Required', NULL, '2021-10-12 02:43:54'),
(22, 'address', 'Address field is required', 'Address field is required', NULL, '2021-10-12 02:43:54'),
(25, 'logo', 'Logo field is Required', 'Logo field is Required', NULL, '2021-10-12 02:43:54'),
(26, 'thumb', 'Thumbnail Image field is required', 'Thumbnail Image field is required', NULL, '2021-10-12 02:43:54'),
(27, 'img', 'Image field is Required', 'Image field is Required', NULL, '2021-10-12 02:43:54'),
(29, 'short_des', 'Short Description is required', 'Short Description is required', NULL, '2021-08-19 11:36:12'),
(30, 'des', 'Description field is required', 'Description field is required', NULL, '2021-10-12 02:43:54'),
(34, 'status', 'Status field is required', 'Status field is required', NULL, '2021-10-12 02:36:15'),
(35, 'min_pass', 'Password Minimum 3 character', 'Password Minimum 3 character', NULL, NULL),
(36, 'recaptcha', 'Please Complete the recaptcha to submit the form', 'Please Complete the recaptcha to submit the form', NULL, NULL),
(37, 'video', 'Video link field is required', 'Video link field is required', NULL, '2021-10-12 02:36:15'),
(38, 'content_qty', 'Content quantity filed is required', 'Content quantity filed is required', NULL, '2021-10-12 02:36:15'),
(40, 'header', 'Header filed is required', 'Header filed is required', NULL, '2021-10-12 02:36:15'),
(42, 'icon', 'Icon field is required', 'Icon field is required', NULL, '2021-10-12 02:36:15'),
(43, 'aminity', 'Aminity field is required', 'Aminity field is required', NULL, '2021-10-12 02:36:15'),
(44, 'unique_name', 'Name already exist', 'Name already exist', NULL, '2021-10-12 02:36:15'),
(45, 'unique_slug', 'Slug already exist', 'Slug already exist', NULL, '2021-10-12 02:36:15'),
(46, 'unique_title', 'Title already exist', 'Title already exist', NULL, '2021-10-12 02:36:15'),
(47, 'terms_cond', 'Terms and condition field is required', 'Terms and condition field is required', NULL, '2021-10-12 02:36:15'),
(48, 'privacy_policy', 'Privacy policy field is required', 'Privacy policy field is required', NULL, '2021-10-12 02:36:15'),
(49, 'map', 'Map embed code field is required', 'Map embed code field is required', NULL, '2021-10-12 02:36:15'),
(50, 'copyright', 'Copyright filed is required', 'Copyright filed is required', NULL, '2021-10-12 02:36:15'),
(54, 'featured', 'Featured filed is required', 'Featured filed is required', NULL, '2021-10-12 02:36:15'),
(55, 'package_type', 'Package type field is required', 'Package type field is required', NULL, '2021-10-12 02:36:15'),
(56, 'package_name', 'Package name field is required', 'Package name field is required', NULL, '2021-10-12 02:36:15'),
(57, 'price', 'Price field is required', 'Price field is required', NULL, '2021-10-12 02:36:15'),
(58, 'number_of_day', 'Number of days field is required', 'Number of days field is required', NULL, '2021-10-12 02:36:15'),
(59, 'number_of_aminity', 'Number of aminities field is required', 'Number of aminities field is required', NULL, '2021-10-12 02:36:15'),
(60, 'number_of_photo', 'Number of photo field is required', 'Number of photo field is required', NULL, '2021-10-12 02:36:15'),
(61, 'number_of_top_property', 'Number of top property field is required', 'Number of top property field is required', NULL, '2021-10-12 02:43:54'),
(62, 'number_of_property', 'Number of property field is required', 'Number of property field is required', NULL, '2021-10-12 02:36:15'),
(63, 'number_of_feature_property', 'Number of feature property field is required', 'Number of feature property field is required', NULL, '2021-10-12 02:36:15'),
(64, 'unique_loc', 'Location already exist', 'Location already exist', NULL, '2021-10-12 02:36:15'),
(65, 'qty', 'Quantity field is required', 'Quantity field is required', NULL, '2021-08-19 11:36:12'),
(66, 'account_mode', 'Account mode field is required', 'Account mode field is required', NULL, '2021-10-12 02:36:15'),
(67, 'paypal_client_id', 'Paypal client id field is required', 'Paypal client id field is required', NULL, '2021-10-12 02:36:15'),
(68, 'paypal_secret', 'Paypal secret field is required', 'Paypal secret field is required', NULL, '2021-10-12 02:36:15'),
(69, 'stripe_key', 'Stripe key field is required', 'Stripe key field is required', NULL, '2021-10-12 02:36:15'),
(70, 'stripe_secret', 'Stripe secret field is required', 'Stripe secret field is required', NULL, '2021-10-12 02:36:15'),
(71, 'meta_des', 'Meta description field is required', 'Meta description field is required', NULL, '2021-10-12 02:36:15'),
(72, 'currency_name', 'Currency name field is required', 'Currency name field is required', NULL, '2021-10-12 02:36:15'),
(73, 'currency_icon', 'Currency icon field is required', 'Currency icon field is required', NULL, '2021-10-12 02:36:15'),
(75, 'pre_notify', 'Prenotification day field is required', 'Prenotification day field is required', NULL, '2021-10-12 02:36:15'),
(76, 'fb_comment', 'facebook app id field is required', 'facebook app id field is required', NULL, '2021-08-19 11:36:12'),
(77, 'allow', 'Allow filed is required', 'Allow filed is required', NULL, '2021-10-12 02:36:15'),
(78, 'border', 'Border filed is required', 'Border filed is required', NULL, '2021-10-12 02:36:15'),
(79, 'corner', 'Corner filed is required', 'Corner filed is required', NULL, '2021-10-12 02:36:15'),
(80, 'bg_color', 'Background color filed is required', 'Background color filed is required', NULL, '2021-10-12 02:36:15'),
(81, 'text_color', 'Text color filed is required', 'Text color filed is required', NULL, '2021-10-12 02:36:15'),
(82, 'border_color', 'Border color filed is required', 'Border color filed is required', NULL, '2021-10-12 02:36:15'),
(83, 'button_color', 'Button color filed is required', 'Button color filed is required', NULL, '2021-10-12 02:36:15'),
(84, 'button_text_color', 'Button text color filed is required', 'Button text color filed is required', NULL, '2021-10-12 02:36:15'),
(85, 'link_text', 'Link text filed is required', 'Link text filed is required', NULL, '2021-10-12 02:36:15'),
(86, 'button_text', 'Button text filed is required', 'Button text filed is required', NULL, '2021-10-12 02:36:16'),
(87, 'captcha_key', 'Captcha key filed is required', 'Captcha key filed is required', NULL, '2021-10-12 02:36:16'),
(88, 'captcha_secret', 'Captcha secret filed is required', 'Captcha secret filed is required', NULL, '2021-10-12 02:36:16'),
(89, 'live_chat', 'Livechat script filed is required', 'Livechat script filed is required', NULL, '2021-10-12 02:36:16'),
(90, 'analytic', 'Google analytic code field is required', 'Google analytic code field is required', NULL, '2021-10-12 02:36:16'),
(91, 'designation', 'Designation filed is required', 'Designation filed is required', NULL, '2021-10-12 02:36:16'),
(92, 'page_name', 'Page name field is required', 'Page name field is required', NULL, '2021-10-12 02:36:16'),
(93, 'unique_page_name', 'Page name already exist', 'Page name already exist', NULL, '2021-10-12 02:36:16'),
(94, 'banner_img', 'Banner Image field is required', 'Banner Image field is required', NULL, '2021-10-12 02:43:54'),
(96, 'mail_host', 'Mail Host field is required', 'Mail Host field is required', NULL, '2021-10-12 02:43:54'),
(97, 'smtp_user', 'SMTP User field is required', 'SMTP User field is required', NULL, '2021-10-12 02:43:54'),
(98, 'smtp_pass', 'SMTP Password field is required', 'SMTP Password field is required', NULL, '2021-10-12 02:43:54'),
(99, 'mail_port', 'Mail Port field is required', 'Mail Port field is required', NULL, '2021-10-12 02:43:54'),
(100, 'mail_encryption', 'Mail Encryption field is required', 'Mail Encryption field is required', NULL, '2021-10-12 02:43:54'),
(104, 'sidebar_header', 'Sidebar header field is required', 'Sidebar header field is required', NULL, NULL),
(105, 'sidebar_icon', 'Sidebar header icon field is required', 'Sidebar header icon field is required', NULL, NULL),
(106, 'currency_rate', 'Currency Rate field is required', 'Currency Rate field is required', NULL, '2021-10-12 02:43:54'),
(107, 'purpose', 'Purpose field is required', 'Purpose field is required', NULL, '2021-10-12 02:43:54'),
(108, 'type', 'Type field is required', 'Type field is required', NULL, '2021-10-12 02:43:54'),
(109, 'number_of_nearest_place', 'Number on nearest place field is required', 'Number on nearest place field is required', NULL, '2021-10-12 02:43:54'),
(110, 'number_of_urgent_property', 'Number of urgent property field is required', 'Number of urgent property field is required', NULL, '2021-10-12 02:43:54'),
(111, 'package_order', 'Package order field is required', 'Package order field is required', NULL, '2021-10-12 02:43:54'),
(112, 'property_type', 'Property type field is required', 'Property type field is required', NULL, '2021-10-12 02:43:54'),
(113, 'city', 'City field is required', 'City field is required', NULL, '2021-10-12 02:43:54'),
(114, 'area', 'Total area field is required', 'Total area field is required', NULL, '2021-10-12 02:43:54'),
(115, 'unit', 'Unit field is required', 'Unit field is required', NULL, '2021-10-12 02:43:54'),
(116, 'room', 'Total room field is required', 'Total room field is required', NULL, '2021-10-12 02:43:54'),
(117, 'bedroom', 'Bedroom field is required', 'Bedroom field is required', NULL, '2021-10-12 02:43:54'),
(118, 'bathroom', 'Bathroom field is required', 'Bathroom field is required', NULL, '2021-10-12 02:43:54'),
(119, 'floor', 'Floor field is required', 'Floor field is required', NULL, '2021-10-12 02:43:54'),
(120, 'kitchen', 'Total kitchen field is required', 'Total kitchen field is required', NULL, '2021-10-12 02:43:54'),
(121, 'parking', 'Total parking place field is required', 'Total parking place field is required', NULL, '2021-10-12 02:43:54'),
(122, 'banner_img', 'Banner image field is required', 'Banner image field is required', NULL, '2021-10-12 02:43:54'),
(123, 'thumb_img', 'Thumbnail image field is required', 'Thumbnail image field is required', NULL, '2021-10-12 02:43:54'),
(124, 'slider_img', 'Slider image field is required', 'Slider image field is required', NULL, '2021-10-12 02:43:54'),
(125, 'img', 'Image field is required', 'Image field is required', NULL, '2021-10-12 02:43:54'),
(126, 'unique_type', 'Type already exist', 'Type already exist', NULL, NULL),
(127, 'unique_aminity', 'Aminity already exist', 'Aminity already exist', NULL, NULL),
(129, 'service', 'Service field is required', 'Service field is required', NULL, '2021-10-12 02:43:54'),
(130, 'history', 'History field is required', 'History field is required', NULL, '2021-10-12 02:43:54'),
(131, 'state_name', 'State Name field is required', 'State Name field is required', NULL, '2021-10-12 02:43:54'),
(132, 'unique_state_name', 'State Name already exist', 'State Name already exist', NULL, NULL),
(133, 'country', 'Country field is required', 'Country field is required', NULL, '2021-10-12 02:43:54'),
(134, 'state', 'State field is required', 'State field is required', NULL, '2021-10-12 02:43:54'),
(135, 'unique_city', 'City already exist', 'City already exist', NULL, NULL),
(136, 'show_homepage', 'Show homepage field is required', 'Show homepage field is required', NULL, '2021-10-12 02:43:54'),
(137, 'every', 'Every filed required', 'Every filed required', NULL, '2021-10-12 02:44:55'),
(138, 'bank_account', 'Bank account field is required', 'Bank account field is required', NULL, NULL),
(139, 'razorpay_key', 'Razorpay key is required', 'Razorpay key is required', NULL, NULL),
(140, 'razorpay_secret', 'Razorpay secret key is required', 'Razorpay secret key is required', NULL, NULL),
(141, 'public_key', 'Public key is required', 'Public key is required', NULL, NULL),
(142, 'secret_key', 'Secret key is required', 'Secret key is required', NULL, NULL),
(143, 'serial', 'Serial field is required', 'Serial field is required', NULL, NULL),
(144, 'country', 'Country is required', 'Country is required', NULL, NULL),
(145, 'currency', 'Currency is required', 'Currency is required', NULL, NULL),
(146, 'currency_rate', 'Currency rate is required', 'Currency rate is required', NULL, NULL),
(147, 'public_key', 'Public key', 'Public key', NULL, NULL),
(148, 'secret_key', 'Secret key', 'Secret key', NULL, NULL),
(149, 'mollie_key', 'Mollie key', 'Mollie key', NULL, NULL),
(150, 'auth_token', 'Auth token is required', 'Auth token is required', NULL, NULL),
(151, 'api_key', 'Api key is required', 'Api key is required', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `vocabulary_id`, `created_at`, `updated_at`) VALUES
(11, 2, 22, '2021-10-12 04:15:45', '2021-10-12 04:15:45'),
(62, 40, 21, '2023-10-28 16:37:26', '2023-10-28 16:37:26'),
(77, 48, 1, '2023-10-30 12:05:19', '2023-10-30 12:05:19'),
(86, 30, 1, '2023-10-31 12:30:23', '2023-10-31 12:30:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `aminities`
--
ALTER TABLE `aminities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `condition_privacies`
--
ALTER TABLE `condition_privacies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_information`
--
ALTER TABLE `contact_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_countries`
--
ALTER TABLE `currency_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `custom_file_managers`
--
ALTER TABLE `custom_file_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_paginators`
--
ALTER TABLE `custom_paginators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_configurations`
--
ALTER TABLE `email_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutterwaves`
--
ALTER TABLE `flutterwaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instamojo_payments`
--
ALTER TABLE `instamojo_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_texts`
--
ALTER TABLE `manage_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modal_consents`
--
ALTER TABLE `modal_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nearest_locations`
--
ALTER TABLE `nearest_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_texts`
--
ALTER TABLE `notification_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overviews`
--
ALTER TABLE `overviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paystack_and_mollies`
--
ALTER TABLE `paystack_and_mollies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practices`
--
ALTER TABLE `practices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_aminities`
--
ALTER TABLE `property_aminities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_nearest_locations`
--
ALTER TABLE `property_nearest_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_purposes`
--
ALTER TABLE `property_purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_reviews`
--
ALTER TABLE `property_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpays`
--
ALTER TABLE `razorpays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_texts`
--
ALTER TABLE `seo_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber_contents`
--
ALTER TABLE `subscriber_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber_emails`
--
ALTER TABLE `subscriber_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_formates`
--
ALTER TABLE `text_formates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `validation_texts`
--
ALTER TABLE `validation_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `about_sections`
--
ALTER TABLE `about_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `aminities`
--
ALTER TABLE `aminities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `condition_privacies`
--
ALTER TABLE `condition_privacies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_information`
--
ALTER TABLE `contact_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `currency_countries`
--
ALTER TABLE `currency_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `custom_file_managers`
--
ALTER TABLE `custom_file_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_paginators`
--
ALTER TABLE `custom_paginators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_configurations`
--
ALTER TABLE `email_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `flutterwaves`
--
ALTER TABLE `flutterwaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `instamojo_payments`
--
ALTER TABLE `instamojo_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `manage_texts`
--
ALTER TABLE `manage_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1066;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `modal_consents`
--
ALTER TABLE `modal_consents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `nearest_locations`
--
ALTER TABLE `nearest_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_texts`
--
ALTER TABLE `notification_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `overviews`
--
ALTER TABLE `overviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paystack_and_mollies`
--
ALTER TABLE `paystack_and_mollies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `practices`
--
ALTER TABLE `practices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `property_aminities`
--
ALTER TABLE `property_aminities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1475;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `property_nearest_locations`
--
ALTER TABLE `property_nearest_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `property_purposes`
--
ALTER TABLE `property_purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_reviews`
--
ALTER TABLE `property_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `razorpays`
--
ALTER TABLE `razorpays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seo_texts`
--
ALTER TABLE `seo_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subscriber_contents`
--
ALTER TABLE `subscriber_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriber_emails`
--
ALTER TABLE `subscriber_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `text_formates`
--
ALTER TABLE `text_formates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `validation_texts`
--
ALTER TABLE `validation_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
