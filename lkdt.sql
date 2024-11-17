-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql8-container
-- Generation Time: Nov 17, 2024 at 01:12 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lkdt`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Bàn Phím'),
(4, 'Chuột'),
(5, 'LapTop'),
(7, 'Màn Hình'),
(1, 'PC Bán Chạy'),
(8, 'Ram'),
(3, 'Tai Nghe');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(35, 4, 42, 'Đẹp', '2024-10-15 20:51:03.000000', '2024-10-15 20:51:03.000000'),
(36, 7, 41, 'Đẹp', '2024-10-31 17:17:39.000000', '2024-10-31 17:17:39.000000'),
(37, 47, 41, 'đẹp', '2024-11-04 23:46:38.000000', '2024-11-04 23:46:38.000000'),
(38, 9, 41, 'đẹp', '2024-11-05 01:17:34.000000', '2024-11-05 01:17:34.000000'),
(39, 9, 45, 'qua dep', '2024-11-07 15:11:39.334892', '2024-11-07 15:11:39.334892'),
(40, 9, 41, 'dep', '2024-11-07 15:12:28.432514', '2024-11-07 15:12:28.432514'),
(41, 16, 41, 'ahihi', '2024-11-12 00:33:43.523734', '2024-11-12 00:33:43.523734'),
(42, 47, 47, 'This is good, this is another comment', '2024-11-16 04:23:38.206659', '2024-11-16 04:23:38.206659'),
(43, 47, 47, 'This is good, this is another comment', '2024-11-16 04:23:42.409086', '2024-11-16 04:23:42.409086'),
(44, 47, 47, 'This is good, this is another comment', '2024-11-16 04:23:44.883704', '2024-11-16 04:23:44.883704');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `active`, `value`) VALUES
(1, 'SUMMER2024', 1, '91%'),
(2, 'WINTER2024', 1, '91%'),
(3, 'NEWYEAR2025', 1, '45%'),
(4, 'FALL2024', 1, ''),
(5, 'SPRING2024', 1, ''),
(6, 'NONEL', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_conditions`
--

CREATE TABLE `coupon_conditions` (
  `id` bigint NOT NULL,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `discount_amount` decimal(38,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupon_conditions`
--

INSERT INTO `coupon_conditions` (`id`, `coupon_id`, `attribute`, `operator`, `value`, `discount_amount`) VALUES
(1, 1, 'minimum_purchase', '>=', '100000', 20.00),
(2, 1, 'product_category', '	=', '	electronics', 20.00),
(3, 2, 'user_type', '	=', 'member', 20.00),
(4, 2, 'order_quantity', '>', '3', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `picture`, `name`, `email`, `createdAt`) VALUES
('12', 'https://lh3.googleusercontent.com/a/ACg8ocJ_S3PbpLtvhbxPhEj1KKxzQBFY1nuhX-rZltlH4-f2zKlZ8Q=s96-c', 'VŨ PHẠM HOÀI', '21522804@gm.uit.edu.vn', '2024-06-26 08:58:17'),
('13', '	https://example.com/avatar1.jpg', '	TRẦN THỊ ANH', 'anh.tran@gmail.com', '2023-12-01 03:20:05'),
('14', 'https://example.com/avatar2.jpg', 'NGUYỄN VĂN BÌNH', 'binh.nguyen@yahoo.com', '2024-01-15 07:45:32'),
('15', '	https://example.com/avatar3.jpg', 'PHẠM QUANG HUY', 'huy.pham@outlook.com', '2024-09-10 11:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `facebooks`
--

CREATE TABLE `facebooks` (
  `id` int NOT NULL,
  `facebook_id` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `facebooks`
--

INSERT INTO `facebooks` (`id`, `facebook_id`, `name`, `email`) VALUES
(1, '1', '	Lê Hoàng C', 'nguyen.va@example.com'),
(2, '2', '	Phạm Dương D', '	tran.b@gmail.com'),
(3, '3', '	Nguyễn Văn A', '	lehoangc@yahoo.com'),
(4, '3', '	Trần Thị B', 'duongd@hotmail.com'),
(5, '4', '	Vũ Phạm E', '	vupham.e@outlook.com'),
(6, '5', 'Lê Tiến Tài', 'pham.e@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `count`) VALUES
(1, 35, 3, 0),
(2, 36, 2, 0),
(3, 37, 2, 0),
(4, 38, 1, 0),
(5, 39, 5, 0),
(6, 40, 10, 0),
(7, 45, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(2, '1', 'alter some tables', 'SQL', 'V1__alter_some_tables.sql', 670188877, 'root', '2023-12-01 10:05:58', 605, 1),
(3, '2', 'change tokens', 'SQL', 'V2__change_tokens.sql', 1468721430, 'root', '2023-12-01 10:05:58', 27, 1),
(4, '3', 'refresh tokens', 'SQL', 'V3__refresh_tokens.sql', 1847335528, 'root', '2023-12-03 04:50:25', 36, 1),
(5, '4', 'create comments table', 'SQL', 'V4__create_comments_table.sql', -16394321, 'root', '2024-04-01 15:28:05', 31, 1),
(6, '5', 'create coupon table', 'SQL', 'V5__create_coupon_table.sql', 1588630482, 'root', '2024-04-01 15:28:05', 182, 1),
(7, '6', 'create table email fb', 'SQL', 'V6__create_table_email_fb.sql', 706482020, 'root', '2024-06-23 12:18:56', 95, 1),
(8, '7', 'setId auto', 'SQL', 'V7__setId_auto.sql', -1180031767, 'root', '2024-06-25 04:28:10', 152, 1),
(9, '8', 'add color product', 'SQL', 'V8__add_color_product.sql', 120259016, 'root', '2024-10-20 16:10:37', 70, 1),
(10, '9', 'fix pw', 'SQL', 'V9__fix_pw.sql', -1445294448, 'root', '2024-11-02 11:01:49', 147, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`, `coupon_id`) VALUES
(1, 37, 'Lê Tiến Tài', 'nguyen.a@example.com', '901234567', '123 Đường A, Quận 1', 'Giao nhanh', '2024-10-03 10:15:00.000000', 'shipped', 2500000, 'Giao hàng tiết kiệm', '123 Đường A, Quận 1', '2024-10-06', 'TN123456789', 'Tiền Mặt', 1, 1),
(2, 36, 'Phú', 'nguyenb@example.com', '012345678', 'HCM', 'Không ghi chú', '2024-10-03 10:15:00.000000', 'pending', 1500000, 'Giao hàng nhanh', '	456 Đường B, Quận 2', '2024-10-06', 'TN123456786', 'MoMo', 1, 2),
(3, 37, 'Tài', 'nguyen.a@example.com', '901234567', '123 Đường A, Quận 1', 'Giao nhanh', '2024-10-03 10:15:00.000000', 'pending', 1500000, 'Giao hàng tiết kiệm', '123 Đường A, Quận 1', '2024-10-06', 'TN123456780', 'MoMo', 1, 2),
(4, 38, 'Trần Hữu Hoàng', 'tran.b@example.com', '0912345678', 'Quận 2', 'Để lại dưới cây', '2024-10-03 10:15:00.000000', 'cancelled', 1000000, 'Giao hàng tiết kiệm', '123 Đường A, Quận 1', '2024-10-06', 'TN123456743', 'MoMo', 1, 3),
(5, 39, 'Tú', 'lec@example.com', '0912345677', ' Quận 3', 'Bỏ trong nhà', '2024-10-03 10:15:00.000000', 'shipped', 2000000, 'Giao hàng tiết kiệm', '	456 Đường B, Quận 2', '2024-10-06', 'TN123456744', 'Tiền Mặt', 1, 4),
(72, 42, 'Tran Huu Hoang', 'huuhoang23102003', '0866776815', 'Go vap', 'asd', '2024-10-15 20:47:34.000000', 'processing', 34990000, 'express', NULL, '2024-10-15', NULL, 'cod', 1, NULL),
(73, 45, 'Tran Huu Hoang', 'huuhoang23102003@gmail.com', '0866776815', 'Go vap', 'asd123123', '2024-11-13 00:01:26.809567', 'pending', 19992000, 'express', NULL, '2024-11-13', NULL, 'cod', 1, NULL),
(74, 45, 'Tran Huu Hoang', 'huuhoang23102003@gmail.com', '0866776811', 'Go vap', 'asd1111', '2024-11-14 08:11:34.887003', 'pending', 49576000, 'express', NULL, '2024-11-14', NULL, 'cod', 1, NULL),
(75, 47, 'Nguyễn Văn X', 'nvxx@yahoo.com', '1234456', 'Nhà a ngõ B, ngách D', 'Hàng dễ vỡ xin nhẹ tay', '2024-11-16 13:50:53.507440', 'pending', 123.45, 'express', NULL, '2024-11-16', NULL, 'cod', 1, NULL),
(76, 47, 'Nguyễn Văn X', 'nvxx@yahoo.com', '1234456', 'Nhà a ngõ B, ngách D', 'Hàng dễ vỡ xin nhẹ tay', '2024-11-16 14:06:40.473744', 'pending', 123.45, 'express', NULL, '2024-11-16', NULL, 'cod', 1, NULL),
(77, 47, 'Nguyễn Văn X', 'nvxx@yahoo.com', '1234456', 'Nhà a ngõ B, ngách D', 'Hàng dễ vỡ xin nhẹ tay', '2024-11-16 14:12:56.100556', 'pending', 123.45, 'express', NULL, '2024-11-16', NULL, 'cod', 1, NULL),
(78, 47, 'Nguyễn Văn X', 'nvxx@yahoo.com', '1234456', 'Nhà a ngõ B, ngách D', 'Hàng dễ vỡ xin nhẹ tay', '2024-11-16 14:13:08.840311', 'pending', 123.45, 'express', NULL, '2024-11-16', NULL, 'cod', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` float NOT NULL,
  `number_of_products` int DEFAULT '1',
  `total_money` decimal(10,2) DEFAULT '0.00',
  `color` varchar(255) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`, `coupon_id`) VALUES
(119, 72, 2, 34990000, 1, NULL, NULL, NULL),
(120, 73, 9, 24990000, 1, NULL, NULL, NULL),
(121, 74, 17, 36990000, 1, NULL, NULL, NULL),
(122, 74, 6, 10590000, 2, NULL, NULL, NULL),
(123, 74, 16, 3800000, 1, NULL, NULL, NULL),
(124, 75, 1, 22990000, 1, NULL, NULL, NULL),
(125, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(126, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(127, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(128, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(129, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(130, 5, 1, 12.33, 1, 123.45, '#ff00ff', NULL),
(131, 76, 1, 22990000, 1, NULL, NULL, NULL),
(132, 77, 1, 22990000, 1, NULL, NULL, NULL),
(133, 78, 1, 22990000, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `content`, `thumbnail`, `title`) VALUES
(3, '2024-11-16 13:41:59.968123', '2024-11-17 20:00:11.174483', '812.34dấd', 'This is a test product', 'macbook air 15 incadash 2023'),
(5, '2024-11-17 19:51:57.613874', '2024-11-17 19:51:57.613874', 'dâssasa', NULL, 'SUMMER2024'),
(6, '2024-11-17 19:53:20.597446', '2024-11-17 19:53:20.597446', 'assa', NULL, 'đasaaa'),
(7, '2024-11-17 19:53:28.231293', '2024-11-17 19:53:28.231293', 'assa', NULL, 'đasaaas'),
(8, '2024-11-17 19:55:00.604738', '2024-11-17 19:55:00.604738', 'aa', NULL, 'aaa'),
(9, '2024-11-17 19:55:05.839433', '2024-11-17 19:55:05.839433', 'aaaaaaa', NULL, 'aaa'),
(10, '2024-11-17 19:55:12.517731', '2024-11-17 19:55:12.517731', 'aaa', NULL, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` float DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `Price1` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `supplier_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`, `Price1`, `color`, `count`, `supplier_id`) VALUES
(1, 'Laptop Avita PURA A+ AF14A3VNF56F Black', 22990000, 'Laptop Avita PURA A+ AF14A3VNF56F Black.jpg', 'Thiết kế mỏng nhẹ - Avita PURA có thiết kế thanh lịch với vỏ ngoài làm từ chất liệu nhựa hoặc hợp kim nhẹ, giúp giảm trọng lượng máy, dễ dàng mang theo, phù hợp với người dùng di động.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 5, 22222222.00, 'black', 0, NULL),
(2, 'Laptop Avita PURA A+ AF14A3VNF56F Silver', 34990000, 'Laptop Avita PURA A+ AF14A3VNF56F Silver.jpg', 'Màn hình Full HD - Với màn hình kích thước từ 14 inch, độ phân giải Full HD (1920x1080), Avita PURA cung cấp chất lượng hình ảnh rõ ràng, đủ đáp ứng nhu cầu làm việc văn phòng, xem phim, và giải trí.\r \r ', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 5, NULL, NULL, 0, NULL),
(3, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W', 29990000, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W.jpg', 'Thiết kế thời trang và thanh lịch - ASUS VivoBook có kiểu dáng mỏng nhẹ và hiện đại, với lớp vỏ kim loại hoặc nhựa cao cấp, mang đến vẻ ngoài tinh tế và chuyên nghiệp, phù hợp cho cả sinh viên và nhân viên văn phòng.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 5, NULL, NULL, 0, NULL),
(4, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS', 18790000, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS.jpg', 'Màn hình NanoEdge với viền mỏng - VivoBook thường sở hữu màn hình viền mỏng NanoEdge từ 14 đến 15.6 inch, độ phân giải Full HD (1920x1080) cho hình ảnh sắc nét, góc nhìn rộng và trải nghiệm hình ảnh tốt.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 5, NULL, NULL, 0, NULL),
(5, 'Laptop Dell Vostro 3420 V4I5702W1-Gray', 28990000, 'Laptop Dell Vostro 3420 V4I5702W1-Gray.jpg', 'Thiết kế bền bỉ và chuyên nghiệp - Dell Vostro có thiết kế chắc chắn, vỏ ngoài thường bằng nhựa hoặc hợp kim nhôm, với kiểu dáng đơn giản, mạnh mẽ, phù hợp với người dùng doanh nghiệp và văn phòng.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 5, NULL, NULL, 0, NULL),
(6, 'PC GVN Intel i5-12400F', 10590000, 'PC GVN Intel i5-12400F.jpg', 'Hiệu suất: Intel Core i5 là bộ vi xử lý tầm trung của Intel, với hiệu suất mạnh mẽ cho các tác vụ văn phòng, xử lý đồ họa nhẹ và chơi game ở mức cấu hình trung bình.\nSố nhân và luồng: Thường có từ 4 đến 6 nhân và 8 đến 12 luồng, giúp xử lý đa nhiệm hiệu quả và cải thiện hiệu suất khi chạy nhiều ứng dụng cùng lúc.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 1, NULL, NULL, 0, NULL),
(7, 'PC GVN x Corsair iCUE', 14090000, 'PC GVN x Corsair iCUE.jpg', 'Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàngThường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.Thường từ 8GB đến 16GB DDR4, đủ để đáp ứng nhu cầu sử dụng hàng ngày và làm việc với các ứng dụng văn phòng hoặc chỉnh sửa hình ảnh nhẹ nhàng.nhẹ nhàng..', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 1, NULL, NULL, 0, NULL),
(9, 'PC GVN x Corsair iCUo', 24990000, 'PC GVN x Corsair iCUo.jpg', 'Hiệu suất: Intel Core i5 là bộ vi xử lý tầm trung của Intel, với hiệu suất mạnh mẽ cho các tác vụ văn phòng, xử lý đồ họa nhẹ và chơi game ởHiệu suất: Intel Core i5 là bộ vi xử lý tầm trung của Intel, với hiệu suất mạnh mẽ cho các tác vụ văn phòng, xử lý đồ họa nhẹ và chơi game ở mức cấu hình trung bình. mức cấu hình trung bình.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 1, NULL, NULL, 0, NULL),
(10, 'PC GVN x MSI Dragon ACE', 22990000, 'PC GVN x MSI Dragon ACE.jpg', 'Có thể sử dụng card đồ họa tích hợp của Intel (như Intel UHD Graphics) cho các tác vụ cơ bản hoặc nâng cấp lên card đồ họa rời như NVIDIA GeForce GTX 1650/1660 cho nhu cầu chơi game và đồ họa cao hơn.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 1, NULL, NULL, 0, NULL),
(11, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB', 22490000, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB.jpg', 'RAM là bộ nhớ tạm thời, nơi lưu trữ dữ liệu và thông tin mà CPU cần truy cập nhanh chóng trong quá trình thực hiện các tác vụ. Khi máy tính tắt, dữ liệu trong RAM sẽ bị xóa.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 8, NULL, NULL, 0, NULL),
(12, ' RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM', 21790000, 'RamPlus.jpg', 'RAM có tốc độ truy cập nhanh hơn rất nhiều so với các loại bộ nhớ lưu trữ khác như HDD hoặc SSD. Điều này giúp CPU nhanh chóng truy xuất dữ liệu cần thiết, cải thiện hiệu suất của hệ thống.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 8, NULL, NULL, 0, NULL),
(13, 'RamPlus', 21990000, 'RamPlus.jpg', 'Dung lượng RAM thường dao động từ 4GB đến 64GB hoặc hơn, tùy thuộc vào nhu cầu sử dụng. Hệ thống với dung lượng RAM lớn có thể xử lý nhiều tác vụ đồng thời một cách mượt mà hơn.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 8, NULL, NULL, 0, NULL),
(14, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4', 21990000, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4.jpg', 'RAM cho phép người dùng mở nhiều ứng dụng và tác vụ cùng một lúc mà không làm chậm hiệu suất máy tính. Điều này rất quan trọng cho các tác vụ như chỉnh sửa video, chơi game, hoặc lập trình.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 8, NULL, NULL, 0, NULL),
(15, 'Bàn phím Rapoo NK1900 màu đen', 36990000, 'Bàn phím Rapoo NK1900 màu đen.jpg', 'Bàn phím bao gồm nhiều phím với các chức năng khác nhau, bao gồm phím chữ cái, số, ký tự đặc biệt, và các phím chức năng (F1-F12).\nCác phím thường có hình dạng và kích thước tương đồng, với ký hiệu được in trên bề mặt phím để người dùng dễ dàng nhận diện.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 2, NULL, 'wlack', 0, NULL),
(16, 'Bàn phím cơ DareU EK75 Full White Firefly switch', 3800000, 'Bàn phím cơ DareU EK75 Full White Firefly switch.jpg', 'Cung cấp cảm giác gõ chắc chắn và độ bền cao. Có nhiều loại như Cherry MX, Razer, và Romer-G.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 2, NULL, 'white', 0, NULL),
(17, ' Bàn phím cơ AKKO 5075B Plus Transparent ASA Black Piano Pro', 36990000, 'Bàn phím cơ AKKO 5075B Plus Transparent ASA Black Piano Pro.jpg', 'Sử dụng switch cơ học, mang lại cảm giác gõ tốt, phản hồi nhanh, và độ bền cao. Phù hợp cho game thủ và người dùng cần hiệu suất cao.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 2, NULL, 'black', 0, NULL),
(18, 'Màn hình Asus TUF GAMING VG249Q3A 24 Fast IPS 180Hz Gsync chuyên game', 3800000, 'Màn hình AOC Q24G4E 24.jpg', 'Asus TUF Gaming thường có các tùy chọn độ phân giải từ Full HD (1920x1080) đến 4K (3840x2160), giúp mang lại hình ảnh sắc nét và chi tiết trong từng khung hình.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 7, NULL, NULL, 0, NULL),
(19, 'Màn hình Asus TUF GAMING VG249Q3A 24 Fast IPS 180Hz Gsync chuyên game', 9490000, 'Màn hình Asus TUF GAMING VG249Q3A 24 Fast IPS 180Hz Gsync chuyên game.jpg', 'Hỗ trợ tần số quét từ 144Hz đến 360Hz, giúp hình ảnh chuyển động mượt mà, giảm thiểu hiện tượng giật lag, đặc biệt quan trọng trong các trò chơi nhanh.\n', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 7, NULL, NULL, 0, NULL),
(20, 'Màn hình Asus TUF GAMING VG249Q3A 24 Fast IPS 180Hz Gsync chuyên game', 9490000, 'Màn hình ViewSonic VX2428J 24 Fast IPS 180Hz Gsync chuyên game.jpg', 'Thời gian phản hồi thường chỉ từ 1ms đến 3ms, giúp giảm thiểu hiện tượng bóng mờ trong các tình huống chơi game nhanh, mang đến trải nghiệm hình ảnh rõ ràng và sống động.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 7, NULL, NULL, 0, NULL),
(22, 'Chuột AKKO Smart 1 Sailor Moon', 21990000, 'Chuột AKKO Smart 1 Sailor Moon.jpg', 'Chuột AKKO Smart thường tương thích tốt với nhiều hệ điều hành khác nhau, bao gồm Windows, macOS và Linux, giúp người dùng dễ dàng kết nối với các thiết bị của mình.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 4, NULL, NULL, 0, NULL),
(23, 'Chuột Logitech G102 LightSync Black', 7990000, 'Chuột Logitech G102 LightSync Black.jpg', 'Hệ thống cảm biến quang học hoặc laser cho phép chuột Logitech hoạt động mượt mà trên nhiều bề mặt khác nhau. Độ phân giải DPI (dots per inch) thường có thể điều chỉnh từ thấp đến cao, từ 800 DPI đến 16000 DPI hoặc hơn, phù hợp cho nhiều tác vụ khác nhau.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 4, NULL, 'black', 0, NULL),
(24, 'Chuột Logitech G502 Hero Gaming', 5690000, 'Chuột Logitech G502 Hero Gaming.jpg', 'Nhiều mẫu chuột Logitech được trang bị phím bấm tùy chỉnh cho phép người dùng gán các chức năng riêng biệt, rất hữu ích cho các tác vụ nhanh trong công việc hoặc khi chơi game.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 4, NULL, NULL, 0, NULL),
(25, 'Chuột Logitech G304 Wireless White', 21990000, 'Chuột Logitech G304 Wireless White.jpg', 'Các chuột không dây của Logitech thường có thời gian sử dụng pin rất ấn tượng, lên đến vài tháng hoặc thậm chí một năm, tùy thuộc vào mô hình và cách sử dụng.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 4, NULL, 'white', 0, NULL),
(26, 'Chuột Logitech G304 Wireless', 21990000, 'Chuột Logitech G304 Wireless.jpg', 'Hỗ trợ kết nối với nhiều thiết bị, bao gồm máy tính, laptop, và tablet. Một số mẫu chuột còn hỗ trợ kết nối với nhiều thiết bị cùng lúc và cho phép người dùng chuyển đổi dễ dàng giữa các thiết bị.', '2024-05-11 16:31:46.000000', '2024-05-11 16:31:46.000000', 4, NULL, NULL, 0, NULL),
(27, 'Laptop LG Gram 2023 17Z90R GAH78A5', 21900000, 'Laptop LG Gram 2023 17Z90R GAH78A5.jpg', 'Thiết kế siêu nhẹ và siêu mỏng - LG Gram nổi bật với trọng lượng siêu nhẹ, chỉ từ 1kg đến 1.3kg ngay cả ở các kích thước lớn như 15 inch và 17 inch, với khung hợp kim magnesium bền chắc nhưng rất nhẹ, giúp dễ dàng mang theo.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(28, 'Laptop LG Gram 2in1 14T90R GAH55A5', 7990000, 'Laptop LG Gram 2in1 14T90R GAH55A5.jpg', 'aptop học tập cho học sinh, sinh viên - Thường có giá thành phải chăng, màn hình từ 11-14 inch, phù hợp cho việc học online, soạn bài tập và làm các công việc văn phòng cơ bản.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(29, 'Laptop Lenovo V14 G4 IRU 83A0000TVN', 9490000, 'Laptop Lenovo V14 G4 IRU 83A0000TVN.jpg', 'Màn hình IPS sắc nét - Với màn hình IPS từ 14 đến 17 inch, độ phân giải Full HD hoặc WQXGA (2560x1600) cho các dòng 16 inch và 17 inch, LG Gram cung cấp hình ảnh rõ nét, dải màu rộng, và góc nhìn rộng, rất lý tưởng cho công việc sáng tạo và giải trí.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(30, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA1', 1240000, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA1.jpg', 'Dòng máy trạm di động với cấu hình cực kỳ mạnh mẽ, hỗ trợ CPU Intel Xeon, RAM lớn, GPU chuyên dụng để xử lý đồ họa và tính toán nặng, phù hợp cho kỹ sư, kiến trúc sư, và các nhà khoa học dữ liệu.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 5, NULL, NULL, 0, NULL),
(31, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA', 1240000, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA.jpg', 'Thiết kế bền bỉ, chắc chắn - ThinkPad nổi bật với thiết kế vuông vức, tối giản và bền bỉ, với khung máy đạt tiêu chuẩn quân sự MIL-STD-810G, chịu được điều kiện khắc nghiệt, rất phù hợp với môi trường doanh nghiệp.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 5, NULL, NULL, 0, NULL),
(32, 'Laptop Dell Vostro 3420 V4I5702W1-Gray', 21990000, 'Laptop Dell Vostro 3420 V4I5702W1-Gray.jpg', 'Cấu hình cơ bản - Trang bị bộ vi xử lý Intel hoặc AMD Ryzen tầm trung, RAM từ 4GB đến 8GB, và ổ SSD từ 128GB đến 512GB, Avita PURA đáp ứng tốt các tác vụ cơ bản như lướt web, làm việc văn phòng, và học tập.\n\n', '2024-10-31 08:02:46.000000', '2024-05-11 16:31:46.000000', 5, NULL, NULL, 0, NULL),
(33, 'Laptop Avita PURA A+ AF14A3VNF56F Silver', 11000000, 'Laptop Avita PURA A+ AF14A3VNF56F Silver.jpg', 'hời lượng pin ổn định - Thời lượng pin của Avita PURA thường kéo dài từ 6-8 giờ tùy thuộc vào tác vụ sử dụng, khá đủ cho một ngày làm việc hoặc học tập.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(34, 'Laptop Avita PURA A+ AF14A3VNF56F Black', 21990000, 'Laptop Avita PURA A+ AF14A3VNF56F Black.jpg', 'Hệ điều hành Windows bản quyền - Cài sẵn Windows 10 hoặc Windows 11 bản quyền, ASUS VivoBook có các tiện ích đi kèm như MyASUS, giúp quản lý hiệu năng, sạc pin, và hỗ trợ kỹ thuật dễ dàng.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, 'black', 0, NULL),
(35, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS', 21990000, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS.jpg', 'Cấu hình linh hoạt - Được trang bị bộ vi xử lý từ Intel Core i3 đến i7 hoặc AMD Ryzen 3 đến Ryzen 7, tùy vào model, cùng với RAM 4GB đến 16GB và ổ lưu trữ SSD từ 256GB đến 1TB. Cấu hình này đáp ứng tốt cho các tác vụ văn phòng, giải trí và thậm chí là xử lý đồ họa cơ bản.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(36, 'Laptop ASUS Vivobook S 14 OLED S5406MA PP136W', 12000000, 'Laptop ASUS Vivobook S 14 OLED S5406MA PP136W.jpg', 'Hiệu năng đồ họa tích hợp hoặc rời - VivoBook có các phiên bản sử dụng đồ họa tích hợp (Intel Iris Xe, AMD Radeon) và đồ họa rời như NVIDIA GeForce MX hoặc GTX, phục vụ cho các công việc đồ họa nhẹ, chỉnh sửa ảnh và video cơ bản.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(37, 'Laptop ASUS Vivobook 16 M1605YA MB303W', 11200000, 'Laptop ASUS Vivobook 16 M1605YA MB303W.jpg', 'Bàn phím chiclet có đèn nền - Bàn phím thiết kế dạng chiclet với khoảng cách hợp lý, phím bấm êm, tích hợp đèn nền (backlit) tiện lợi khi làm việc trong môi trường thiếu sáng.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(38, 'Laptop ASUS Vivobook 15 OLED A1505VA MA468W', 11200000, 'Laptop ASUS Vivobook 15 OLED A1505VA MA468W.jpg', 'Touchpad hỗ trợ cảm biến vân tay - Một số mẫu VivoBook có cảm biến vân tay tích hợp trên touchpad, giúp đăng nhập nhanh chóng, bảo mật hơn với Windows Hello.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(39, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W', 11200000, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W.jpg', 'Cổng kết nối đa dạng - Được trang bị đầy đủ các cổng kết nối như USB-A, USB-C, HDMI, jack âm thanh, khe đọc thẻ nhớ microSD, giúp người dùng dễ dàng kết nối với các thiết bị ngoại vi.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(40, 'Laptop Acer Aspire 5 A515 58P 71EJ', 21990000, 'Laptop Acer Aspire 5 A515 58P 71EJ.jpg', 'Thiết kế thanh lịch, chắc chắn - Acer Aspire có thiết kế đơn giản, trang nhã với vỏ ngoài làm từ nhựa hoặc kim loại nhẹ, đáp ứng yêu cầu cơ bản về tính thẩm mỹ và độ bền cho người dùng phổ thông.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(41, 'Laptop Acer Aspire 5 A515 58M 79R7', 11200000, 'Laptop Acer Aspire 5 A515 58M 79R7.jpg', 'Màn hình từ HD đến Full HD - Với các tùy chọn màn hình từ 14 đến 15.6 inch, độ phân giải từ HD đến Full HD, màn hình của Acer Aspire cho hình ảnh sắc nét, đủ dùng cho công việc văn phòng, học tập và giải trí.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 5, NULL, NULL, 0, NULL),
(42, 'PC GVN x Corsair iCUE Intel i5-14600KF VGA RTX 4060 Ti', 12000000, 'PC GVN x Corsair iCUE Intel i5-14600KF VGA RTX 4060 Ti.jpg', ' PC thường được trang bị các linh kiện mạnh mẽ, giúp xử lý nhanh chóng và hiệu quả các tác vụ phức tạp.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(43, 'PC GVN x ASUS ROG Hyperion White', 11200000, 'PC GVN x ASUS ROG Hyperion White.jpg', ' PC thường được trang bị các linh kiện mạnh mẽ, giúp xử lý nhanh chóng và hiệu quả các tác vụ phức tạp.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, 'white', 0, NULL),
(44, 'PC GVN x AORUS MASTER', 22230000, 'PC GVN x AORUS MASTER.jpg', 'PC hỗ trợ nhiều cổng kết nối, cho phép người dùng kết nối với các thiết bị ngoại vi như bàn phím, chuột, màn hình, loa, và mạng internet.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(45, 'PC GVN Intel i7-14700K', 22230000, 'PC GVN Intel i7-14700K.jpg', 'Có thể dễ dàng nâng cấp hoặc thay thế các linh kiện như RAM, ổ cứng, và card đồ họa để cải thiện hiệu suất theo nhu cầu sử dụng.\n\n', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(46, 'PC GVN Intel i7-14700K VGA RTX 4080 Super', 13400000, 'PC GVN Intel i7-14700K VGA RTX 4080 Super.jpg', ' PC có khả năng chạy nhiều hệ điều hành và phần mềm, từ các ứng dụng văn phòng đơn giản đến phần mềm đồ họa và game đòi hỏi cấu hình cao.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(47, 'PC GVN Intel i5-12400F', 13400000, 'PC GVN Intel i5-12400F.jpg', ' Với nhiều tùy chọn cấu hình và giá cả, PC có thể đáp ứng nhu cầu của nhiều đối tượng người dùng khác nhau, từ sinh viên đến chuyên gia.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(48, 'PC GVN Intel i5-12400F VGA RTX 4060', 13400000, 'PC GVN Intel i5-12400F VGA RTX 4060.jpg', ' Với nhiều tùy chọn cấu hình và giá cả, PC có thể đáp ứng nhu cầu của nhiều đối tượng người dùng khác nhau, từ sinh viên đến chuyên gia.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(49, 'PC GVN Intel i3-12100F VGA GTX 1650', 22230000, 'PC GVN Intel i3-12100F VGA GTX 1650.jpg', 'Có thể dễ dàng nâng cấp hoặc thay thế các linh kiện như RAM, ổ cứng, và card đồ họa để cải thiện hiệu suất theo nhu cầu sử dụng.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(50, 'PC GVN Intel i3-12100F VGA GTX 1644', 13400000, 'PC GVN Intel i3-12100F VGA GTX 1644.jpg', ' Với nhiều tùy chọn cấu hình và giá cả, PC có thể đáp ứng nhu cầu của nhiều đối tượng người dùng khác nhau, từ sinh viên đến chuyên gia.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(51, 'PC GVN Homework Athlon 3000G', 9000000, 'PC GVN Homework Athlon 3000G.jpg', ' Với nhiều tùy chọn cấu hình và giá cả, PC có thể đáp ứng nhu cầu của nhiều đối tượng người dùng khác nhau, từ sinh viên đến chuyên gia.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(52, 'PC GVN AMD R5-5600X VGA RG 6600', 9000000, 'PC GVN AMD R5-5600X VGA RG 6600.jpg', ' Với nhiều tùy chọn cấu hình và giá cả, PC có thể đáp ứng nhu cầu của nhiều đối tượng người dùng khác nhau, từ sinh viên đến chuyên gia.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 1, NULL, NULL, 0, NULL),
(53, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM1', 1245000, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM1.jpg', 'RAM lưu trữ dữ liệu mà CPU đang sử dụng hoặc xử lý, cho phép truy cập nhanh chóng. Khi máy tính tắt, dữ liệu trong RAM sẽ bị xóa, vì đây là loại bộ nhớ không bền vững (volatile memory).', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(54, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM', 1245000, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM.jpg', 'RAM có tốc độ truy cập nhanh hơn rất nhiều so với ổ cứng (HDD/SSD), giúp tăng tốc độ xử lý của máy tính và cải thiện hiệu suất khi chạy các ứng dụng hoặc tác vụ nặng.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(55, 'RAM Kingston FURY Renegade RGB 48GB  Limited Edition bus 8000 DDR5', 1300000, 'RAM Kingston FURY Renegade RGB 48GB  Limited Edition bus 8000 DDR5.jpg', 'RAM có dung lượng khác nhau, thường từ 4GB đến 64GB hoặc hơn. Dung lượng RAM ảnh hưởng đến khả năng đa nhiệm của máy tính; nhiều RAM cho phép chạy nhiều ứng dụng cùng lúc mà không làm chậm máy.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(56, 'RAM Kingston Fury Beast Black 8GB 3200 DDR4', 1440000, 'RAM Kingston Fury Beast Black 8GB 3200 DDR4.jpg', 'Nhanh hơn, thường được sử dụng cho bộ nhớ cache trong CPU.Thường được sử dụng làm RAM chính trong máy tính, cần phải được làm mới thường xuyên để giữ dữ liệu.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(57, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB', 1200000, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB.jpg', 'Một trong những chuẩn RAM phổ biến hiện nay, với các phiên bản như DDR3, DDR4, và DDR5. Mỗi phiên bản có tốc độ và hiệu suất khác nhau, với DDR5 hiện tại có tốc độ cao nhất.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(58, 'RAM Kingston Fury Beast 1x8GB 3600 DDR3 RGB', 2300000, 'RAM Kingston Fury Beast 1x8GB 3600 DDR3 RGB.jpg', 'Một dạng RAM đồng bộ với tốc độ bus của CPU, giúp cải thiện hiệu suất.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(59, 'RAM G.Skill Trident Z5 Royal RGB 64GB', 1000000, 'RAM G.Skill Trident Z5 Royal RGB 64GB.jpg', 'RAM được thiết kế để truyền tải dữ liệu với tốc độ cao, giúp cải thiện hiệu suất máy tính khi thực hiện các tác vụ đòi hỏi nhiều tài nguyên.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(60, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4', 2120000, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4.jpg', 'RAM có thể không tương thích với một số bo mạch chủ hoặc CPU, do đó người dùng cần kiểm tra thông số kỹ thuật trước khi nâng cấp hoặc lắp đặt RAM mới.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(61, 'Ram Corsair Vengeance RGB White 32GB6000 DDR5', 2200000, 'Ram Corsair Vengeance RGB White 32GB6000 DDR5.jpg', 'Người dùng có thể nâng cấp RAM để cải thiện hiệu suất máy tính mà không cần thay thế toàn bộ hệ thống.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, 'white', 0, NULL),
(62, 'RAM Corsair Dominator Titanium White 64GB RGB 6600 DDR5', 1400000, 'RAM Corsair Dominator Titanium White 64GB RGB 6600 DDR5.jpg', 'RAM lớn hơn cho phép người dùng mở nhiều ứng dụng cùng lúc mà không làm giảm tốc độ hệ thống, điều này rất quan trọng cho người dùng làm việc với các ứng dụng nặng như đồ họa, video, hoặc chơi game.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, 'white', 0, NULL),
(63, 'RAM Corsair Dominator Titanium White 64GB 2x32GB RGB 6000 DDR5', 120000, 'RAM Corsair Dominator Titanium White 64GB 2x32GB RGB 6000 DDR5.jpg', 'RAM lớn hơn cho phép người dùng mở nhiều ứng dụng cùng lúc mà không làm giảm tốc độ hệ thống, điều này rất quan trọng cho người dùng làm việc với các ứng dụng nặng như đồ họa, video, hoặc chơi game.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:47.000000', 8, NULL, NULL, 0, NULL),
(64, 'RAM Corsair Dominator Titanium Black 64GB RGB 6600 DDR5', 1333330, 'RAM Corsair Dominator Titanium Black 64GB RGB 6600 DDR5.jpg', 'RAM lớn hơn cho phép người dùng mở nhiều ứng dụng cùng lúc mà không làm giảm tốc độ hệ thống, điều này rất quan trọng cho người dùng làm việc với các ứng dụng nặng như đồ họa, video, hoặc chơi game.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 8, NULL, 'black', 0, NULL),
(65, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless Pink', 1190000, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless Pink.jpg', 'Chuột Logitech thường sử dụng cảm biến quang học hoặc laser, cho phép hoạt động mượt mà trên nhiều bề mặt khác nhau. Độ phân giải DPI (dots per inch) có thể điều chỉnh từ thấp đến cao, phục vụ cho nhiều tác vụ khác nhau.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 4, NULL, 'pink', 0, NULL),
(66, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless White', 120000, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless White.jpg', 'Chuột không dây của Logitech thường sử dụng công nghệ Bluetooth hoặc USB receiver, giúp giảm thiểu dây dợ và thuận tiện cho việc di chuyển.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 4, NULL, 'white', 0, NULL),
(67, ' Tai nghe Không dây Logitech Zone 300 Đen ', 124400, 'Tai nghe Không dây Logitech Zone 300 Đen.jpg ', 'Tai nghe Logitech thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, NULL, 0, NULL),
(68, 'Tai nghe Không dây Logitech Zone 300 Hồng', 104400, 'Tai nghe Không dây Logitech Zone 300 Hồng.jpg', 'Với thiết kế công thái học, nhiều mẫu tai nghe Logitech được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, 'pink', 0, NULL),
(69, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED Pink', 900000, 'l5hy1jih_3e71a044db784c5bbf451c75b25207b4_1024x1024.webp', 'Tai nghe Logitech hỗ trợ nhiều phương thức kết nối như USB, 3.5mm jack, Bluetooth, giúp người dùng dễ dàng kết nối với máy tính, laptop, điện thoại di động và các thiết bị khác.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, NULL, 0, NULL),
(70, 'Tai nghe Logitech Không dây Zone Vibe 100 Đen', 185000, 'Tai nghe Logitech Không dây Zone Vibe 100 Đen.jpg', 'Nhiều mẫu tai nghe có microphone tích hợp với công nghệ giảm tiếng ồn, giúp ghi âm và truyền tải giọng nói một cách rõ ràng, rất thích hợp cho các cuộc gọi trực tuyến và trò chuyện khi chơi game.\n', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, 'black', 0, NULL),
(71, 'Tai nghe Logitech G435 Lightspeed Wireless White', 185000, 'Tai nghe Logitech G435 Lightspeed Wireless  White.jpg', 'Tai nghe Logitech thường đi kèm với các nút điều khiển âm lượng, tạm dừng, phát hoặc tắt microphone, giúp người dùng dễ dàng điều chỉnh mà không cần phải rời khỏi thiết bị chính.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, 'white', 0, NULL),
(72, 'Tai nghe Logitech G733 LIGHTSPEED Wireless Lilac', 90000, 'Tai nghe Logitech G733 LIGHTSPEED Wireless Lilac.jpg', 'Đối với tai nghe không dây, thời gian sử dụng pin thường kéo dài từ vài giờ đến cả ngày, tùy thuộc vào mẫu mã và cách sử dụng, giúp người dùng thoải mái sử dụng trong suốt cả ngày dài.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 3, NULL, NULL, 0, NULL),
(73, 'Bàn phím Logitech G Pro X 60 Light Speed White', 382000, 'Bàn phím Logitech G Pro X 60 Light Speed White.jpg', 'Bàn phím Logitech thường được làm từ vật liệu cao cấp, có độ bền tốt và thiết kế chắc chắn, giúp kéo dài tuổi thọ sản phẩm.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 2, NULL, 'white', 0, NULL),
(74, 'Bàn phím Logitech G Pro X 60 Light Speed Black', 422000, 'Bàn phím Logitech G Pro X 60 Light Speed Black.jpg', 'Nhiều mẫu bàn phím sử dụng cơ chế phím cao cấp, cho cảm giác gõ êm ái, phản hồi nhanh và chính xác. Các loại bàn phím cơ (mechanical) của Logitech nổi bật với sự đa dạng trong lựa chọn switch, phù hợp với sở thích cá nhân của người dùng.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 2, NULL, 'black', 0, NULL),
(75, 'Bàn phím Logitech G Pro X 60 Light Speed Pink', 348000, 'Bàn phím Logitech G Pro X 60 Light Speed Pink.jpg', 'Một số bàn phím Logitech được thiết kế theo kiểu dáng công thái học, giúp giảm thiểu căng thẳng cho cổ tay và bàn tay khi sử dụng trong thời gian dài.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 2, NULL, 'pink', 0, NULL),
(76, 'Bàn phím Logitech G715 TKL Off White Tactile', 420000, 'Bàn phím Logitech G715 TKL Off White Tactile.jpg', 'Nhiều bàn phím được trang bị phím tắt và chức năng điều khiển đa phương tiện, giúp người dùng dễ dàng truy cập vào các ứng dụng và điều chỉnh âm lượng mà không cần rời tay khỏi bàn phím.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 2, NULL, 'pink', 0, NULL),
(77, 'Chuột Logitech G102 LightSync Black', 185000, 'Chuột Logitech G1022 LightSync Black.jpg', 'Một số dòng chuột chơi game có đèn LED RGB có thể tùy chỉnh, cho phép người dùng tạo ra hiệu ứng ánh sáng theo sở thích cá nhân hoặc đồng bộ với các thiết bị khác.', '2024-10-31 08:02:46.000000', '2024-10-31 08:02:46.000000', 4, NULL, 'white', 0, NULL),
(78, 'Tai Nghe Asus ROG Delta S Core', 300000, 'Tai Nghe Asus ROG Delta S Core.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, '', 0, NULL),
(79, 'Tai nghe Asus ROG Delta Core', 300000, 'Tai nghe Asus ROG Delta Core.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, 'black', 0, NULL),
(80, 'Tai nghe Asus ROG THETA 7.1', 250000, 'Tai nghe Asus ROG THETA 7.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, NULL, 0, NULL),
(81, 'Tai nghe Razer Kraken V3 X USB', 200000, 'Tai nghe Razer Kraken V3 X USB.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, 'black', 0, NULL),
(82, 'Tai nghe E-Dra EH494W White', 950000, 'Tai nghe E-Dra EH494W White.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, NULL, 0, NULL),
(83, 'Tai nghe Corsair Virtuoso RGB Wireless Pearl', 950000, 'Tai nghe Corsair Virtuoso RGB Wireless Pearl.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, NULL, 0, NULL),
(84, 'Tai nghe SteelSeries Arctis Nova 1 White', 950000, 'Tai nghe SteelSeries Arctis Nova 1 White.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:50.000000', 3, NULL, 'white', 0, NULL),
(85, 'Tai nghe Corsair HS55 Carbon', 950000, 'Tai nghe Corsair HS55 Carbon.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:46.000000', 3, NULL, 'black', 0, NULL),
(86, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED White', 950000, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED White.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:46.000000', 3, NULL, 'white', 0, NULL),
(87, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED Black', 950000, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED Black.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:46.000000', 3, NULL, NULL, 0, NULL),
(88, 'Tai nghe Logitech Không dây Zone Vibe 100 Hồng', 950000, 'Tai nghe Logitech Không dây Zone Vibe 100 Hồng.jpg', 'Tai nghe  thường được trang bị driver chất lượng cao, cung cấp âm thanh rõ ràng, mạnh mẽ và cân bằng, giúp người dùng trải nghiệm âm nhạc, phim ảnh và trò chơi với chất lượng tốt nhất.Với thiết kế công thái học, nhiều mẫu tai nghe  được trang bị đệm tai mềm mại và nhẹ, giúp người dùng thoải mái khi sử dụng trong thời gian dài mà không cảm thấy khó chịu.', '2024-11-07 08:07:46.000000', '2024-11-07 08:07:46.000000', 3, NULL, NULL, 0, NULL),
(89, 'Chuột Razer DeathAdder V3 Hyperspeed Wireless', 2300000, 'Chuột Razer DeathAdder V3 Hyperspeed Wireless.jpg', '\nChuột Razer là dòng sản phẩm chuột chơi game cao cấp từ hãng Razer, nổi tiếng với thiết kế đậm chất gaming và hiệu suất cao. Chuột Razer được ưa chuộng nhờ vào các tính năng tối ưu cho game thủ như cảm biến quang học và laser có độ phân giải cao, tốc độ phản hồi nhanh, và độ chính xác tuyệt đối.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 4, NULL, 'black', 0, NULL),
(90, 'Chuột Razer Cobra Pro Trắng', 2300000, 'Chuột Razer Cobra Pro Trắng.jpg', '\nChuột Razer là dòng sản phẩm chuột chơi game cao cấp từ hãng Razer, nổi tiếng với thiết kế đậm chất gaming và hiệu suất cao. Chuột Razer được ưa chuộng nhờ vào các tính năng tối ưu cho game thủ như cảm biến quang học và laser có độ phân giải cao, tốc độ phản hồi nhanh, và độ chính xác tuyệt đối.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 4, NULL, 'whiite', 0, NULL),
(91, 'Chuột Razer Không dây Viper V3 Pro Trắng', 2300000, 'Chuột Razer Không dây Viper V3 Pro Trắng.jpg', '\nChuột Razer là dòng sản phẩm chuột chơi game cao cấp từ hãng Razer, nổi tiếng với thiết kế đậm chất gaming và hiệu suất cao. Chuột Razer được ưa chuộng nhờ vào các tính năng tối ưu cho game thủ như cảm biến quang học và laser có độ phân giải cao, tốc độ phản hồi nhanh, và độ chính xác tuyệt đối.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 4, NULL, 'whiite', 0, NULL),
(92, 'Chuột Razer Basilisk V3', 2300000, 'Chuột Razer Basilisk V3.jpg', '\nChuột Razer là dòng sản phẩm chuột chơi game cao cấp từ hãng Razer, nổi tiếng với thiết kế đậm chất gaming và hiệu suất cao. Chuột Razer được ưa chuộng nhờ vào các tính năng tối ưu cho game thủ như cảm biến quang học và laser có độ phân giải cao, tốc độ phản hồi nhanh, và độ chính xác tuyệt đối.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 4, NULL, 'black', 0, NULL),
(93, 'Chuột Razer Orochi V2 Wireless', 800000, 'Chuột Razer Orochi V2 Wireless.jpg', '\nChuột Razer là dòng sản phẩm chuột chơi game cao cấp từ hãng Razer, nổi tiếng với thiết kế đậm chất gaming và hiệu suất cao. Chuột Razer được ưa chuộng nhờ vào các tính năng tối ưu cho game thủ như cảm biến quang học và laser có độ phân giải cao, tốc độ phản hồi nhanh, và độ chính xác tuyệt đối.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 4, NULL, 'black', 0, NULL),
(94, 'Màn hình LG 45GS95QE-B UltraGear 45\" OLED 2K 240Hz G-Sync', 30900000, 'Màn hình LG 45GS95QE-B UltraGear 45 OLED 2K 240Hz GSync.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(95, 'Màn hình LG 27US500-W Ultrafine 27\" IPS 4K HDR10', 30900000, 'Màn hình LG 27US500-W Ultrafine 27 IPS 4K HDR10.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(96, 'Màn hình cong LG 27GS60QC-B UltraGear 27\" 2K 180Hz chuyên game', 30900000, 'Màn hình cong LG 27GS60QC-B UltraGear 27 2K 180Hz chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(97, 'Màn hình LG 27GS75Q-B 27\" IPS 2K 200Hz Gsync chuyên game', 3320000, 'Màn hình LG 27GS75Q-B 27 IPS 2K 200Hz Gsync chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(98, 'Màn hình LG 24GS65F-B 24\" IPS 180Hz HDR10 Gsync chuyên game', 30900000, 'Màn hình LG 24GS65F-B 24  IPS 180Hz HDR10 Gsync chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(99, 'Màn hình LG 27GS85Q-B 27\" Nano IPS 2K 200Hz HDR10 Gsync chuyên game', 30922000, 'Màn hình LG 27GS85Q-B 27 Nano IPS 2K 200Hz HDR10 Gsync chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(100, 'Màn hình LG 27GS60F-B 27\" IPS 180Hz HDR10 Gsync chuyên game', 3720000, 'Màn hình LG 27GS60F-B 27 IPS 180Hz HDR10 Gsync chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(101, 'Màn hình LG 24GS60F-B 24\" IPS 180Hz HDR10 Gsync chuyên game', 3900000, 'Màn hình LG 24GS60F-B 24 IPS 180Hz HDR10 Gsync chuyên game.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(102, 'Màn hình LG 24GS60F-B 24\" IPS 180Hz HDR10 Gsync chuyên game', 10900000, 'Màn hình LG 24GS60F-B 24 IPS 180Hz HDR10 Gsync chuyên game1.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(103, 'Màn hình LG 25MS550-B 25\" IPS 100Hz', 20900000, 'Màn hình LG 25MS550-B 25  IPS 100Hz.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(104, 'Màn hình LG 25MS500-B 25\" IPS 100Hz', 2300000, 'Màn hình LG 25MS500-B 25 IPS 100Hz.jpg', 'Màn hình LG nổi tiếng với chất lượng hình ảnh sắc nét, công nghệ tiên tiến và thiết kế hiện đại, đáp ứng nhiều nhu cầu từ làm việc văn phòng, sáng tạo nội dung đến chơi game. LG sản xuất đa dạng dòng màn hình, từ màn hình cơ bản đến các mẫu cao cấp với công nghệ tiên tiến.', '2024-11-08 11:04:47.000000', '2024-11-08 11:04:48.000000', 7, NULL, NULL, 0, NULL),
(5783, 'macbook air 15 inch 2023', 812.34, NULL, 'This is a test product', '2024-11-15 15:26:41.062131', '2024-11-15 15:26:41.062131', 2, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint NOT NULL,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `post_id`) VALUES
(1, 1, 'Laptop Avita PURA A+ AF14A3VNF56F Black.jpg', NULL),
(2, 2, 'Laptop Avita PURA A+ AF14A3VNF56F Silver.jpg', NULL),
(3, 3, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W.jpg', NULL),
(4, 4, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS.jpg', NULL),
(5, 5, 'Laptop Dell Vostro 3420 V4I5702W1-Gray.jpg', NULL),
(6, 6, 'PC GVN Intel i5-12400F.jpg', NULL),
(7, 7, 'PC GVN x Corsair iCUE.jpg', NULL),
(8, 9, 'PC GVN x Corsair iCUo.jpg', NULL),
(9, 10, 'PC GVN x MSI Dragon ACE.jpg', NULL),
(10, 11, 'PC GVN Intel i7-14700K', NULL),
(11, 12, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB.jpg', NULL),
(13, 13, 'RamPlus.jpg', NULL),
(14, 12, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4.jpg', NULL),
(15, 15, 'Bàn phím Rapoo NK1900 màu đen.jpg', NULL),
(16, 16, 'Bàn phím cơ DareU EK75 Full White Firefly switch.jpg', NULL),
(17, 17, 'Bàn phím cơ AKKO 5075B Plus Transparent ASA Black Piano Pro.jpg', NULL),
(20, 20, 'Màn hình ViewSonic VX2428J 24 Fast IPS 180Hz Gsync chuyên game.jpg', NULL),
(21, 22, 'Chuột AKKO Smart 1 Sailor Moon.jpg', NULL),
(22, 23, 'Chuột Logitech G102 LightSync Black.jpg', NULL),
(23, 24, 'Chuột Logitech G102 LightSync White.jpg', NULL),
(24, 25, 'Chuột Logitech G502 Hero Gaming.jpg', NULL),
(25, 26, 'Chuột Logitech G304 Wireless White.jpg', NULL),
(26, 24, 'Chuột Logitech G304 Wireless.jpg', NULL),
(27, 27, 'Laptop LG Gram 2023 17Z90R GAH78A5.jpg', NULL),
(28, 28, 'Laptop LG Gram 2in1 14T90R GAH55A5.jpg', NULL),
(29, 29, 'Laptop Lenovo V14 G4 IRU 83A0000TVN.jpg', NULL),
(30, 30, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA1.jpg', NULL),
(31, 31, 'Laptop Lenovo ThinkPad P14s Gen 5 21G2003PVA.jpg', NULL),
(32, 32, 'Laptop Dell Vostro 3420 V4I5702W1-Gray.jpg', NULL),
(33, 33, 'Laptop Avita PURA A+ AF14A3VNF56F Silver.jpg', NULL),
(34, 34, 'Laptop Avita PURA A+ AF14A3VNF56F Black.jpg', NULL),
(35, 35, 'Laptop ASUS Vivobook S 15 OLED S5507QA MA089WS.jpg', NULL),
(36, 36, 'Laptop ASUS Vivobook S 14 OLED S5406MA PP136W.jpg', NULL),
(37, 37, 'Laptop ASUS Vivobook 16 M1605YA MB303W.jpg', NULL),
(38, 38, 'Laptop ASUS Vivobook 15 OLED A1505VA MA468W.jpg', NULL),
(39, 39, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W.jpg', NULL),
(40, 40, 'Laptop Acer Aspire 5 A515 58P 71EJ.jpg', NULL),
(41, 41, 'Laptop Acer Aspire 5 A515 58M 79R7.jpg', NULL),
(42, 42, 'PC GVN x Corsair iCUE Intel i5-14600KF VGA RTX 4060 Ti.jpg', NULL),
(43, 43, 'PC GVN x ASUS ROG Hyperion White.jpg', NULL),
(44, 44, 'PC GVN x AORUS MASTER.jpg', NULL),
(45, 45, 'PC GVN Intel i7-14700K.jpg', NULL),
(46, 46, 'PC GVN Intel i7-14700K VGA RTX 4080 Super.jpg', NULL),
(47, 47, 'PC GVN Intel i5-12400F.jpg', NULL),
(48, 48, 'PC GVN Intel i5-12400F VGA RTX 4060.jpg', NULL),
(49, 49, 'PC GVN Intel i3-12100F VGA GTX 1650.jpg', NULL),
(50, 50, 'PC GVN Intel i3-12100F VGA GTX 1644.jpg', NULL),
(51, 51, 'PC GVN Homework Athlon 3000G.jpg', NULL),
(52, 52, 'PC GVN AMD R5-5600X VGA RG 6600.jpg', NULL),
(53, 53, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM1.jpg', NULL),
(54, 54, 'RAM PNY XLR8 1x8GB 3200MHz DDR4 LONGDIMM.jpg', NULL),
(55, 55, 'RAM Kingston FURY Renegade RGB 48GB  Limited Edition bus 8000 DDR5.jpg', NULL),
(56, 56, 'RAM Kingston Fury Beast Black 8GB 3200 DDR4.jpg', NULL),
(57, 57, 'RAM Kingston Fury Beast 1x8GB 3600 DDR4 RGB.jpg', NULL),
(58, 58, 'RAM Kingston Fury Beast 1x8GB 3600 DDR3 RGB.jpg', NULL),
(59, 59, 'RAM G.Skill Trident Z5 Royal RGB 64GB.jpg', NULL),
(60, 60, 'RAM G.SKILL Ripjaws V 1x8GB 2800 DDR4.jpg', NULL),
(61, 61, 'Ram Corsair Vengeance RGB White 32GB6000 DDR5.jpg', NULL),
(62, 62, 'RAM Corsair Dominator Titanium White 64GB RGB 6600 DDR5.jpg', NULL),
(63, 63, 'RAM Corsair Dominator Titanium White 64GB 2x32GB RGB 6000 DDR5.jpg', NULL),
(64, 64, 'RAM Corsair Dominator Titanium Black 64GB RGB 6600 DDR5.jpg', NULL),
(65, 65, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless Pink.jpg', NULL),
(66, 66, 'Chuột Logitech G Pro X Superlight 2 Dex Wireless White.jpg', NULL),
(67, 67, 'Tai nghe Không dây Logitech Zone 300 Đen.jpg ', NULL),
(68, 68, 'Tai nghe Không dây Logitech Zone 300 Hồng.jpg', NULL),
(69, 69, 'l5hy1jih_3e71a044db784c5bbf451c75b25207b4_1024x1024.webp', NULL),
(70, 70, 'Tai nghe Logitech Không dây Zone Vibe 100 Đen.jpg', NULL),
(71, 71, 'Tai nghe Logitech G435 Lightspeed Wireless  White.jpg', NULL),
(72, 72, 'Tai nghe Logitech G733 LIGHTSPEED Wireless Lilac.jpg', NULL),
(73, 73, 'Bàn phím Logitech G Pro X 60 Light Speed White.jpg', NULL),
(74, 74, 'Bàn phím Logitech G Pro X 60 Light Speed Black.jpg', NULL),
(75, 75, 'Bàn phím Logitech G Pro X 60 Light Speed Pink.jpg', NULL),
(76, 76, 'Bàn phím Logitech G715 TKL Off White Tactile.jpg', NULL),
(77, 77, 'Chuột Logitech G1022 LightSync Black.jpg', NULL),
(78, 78, 'Tai Nghe Asus ROG Delta S Core', NULL),
(79, 79, 'Tai nghe Asus ROG Delta Core.jpg', NULL),
(80, 80, 'Tai nghe Asus ROG THETA 7.jpg', NULL),
(81, 81, 'Tai nghe Razer Kraken V3 X USB.jpg', NULL),
(82, 82, 'Tai nghe E-Dra EH494W White.jpg', NULL),
(83, 83, 'Tai nghe Corsair Virtuoso RGB Wireless Pearl.jpg', NULL),
(84, 84, 'Tai nghe SteelSeries Arctis Nova 1 White.jpg', NULL),
(85, 85, 'Tai nghe Corsair HS55 Carbon.jpg', NULL),
(86, 86, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED White.jpg', NULL),
(87, 87, 'Tai nghe Logitech G PRO X 2 LIGHTSPEED Black.jpg', NULL),
(88, 88, 'Tai nghe Logitech Không dây Zone Vibe 100 Hồng.jpg', NULL),
(89, 89, 'Chuột Razer DeathAdder V3 Hyperspeed Wireless.jpg', NULL),
(90, 90, 'Chuột Razer Cobra Pro Trắng.jpg', NULL),
(91, 91, 'Chuột Razer Không dây Viper V3 Pro Trắng.jpg', NULL),
(92, 92, 'Chuột Razer Basilisk V3.jpg', NULL),
(93, 93, 'Chuột Razer Orochi V2 Wireless.jpg', NULL),
(94, 94, 'Màn hình LG 45GS95QE-B UltraGear 45 OLED 2K 240Hz GSync.jpg', NULL),
(95, 95, 'Màn hình LG 27US500-W Ultrafine 27 IPS 4K HDR10.jpg', NULL),
(96, 96, 'Màn hình cong LG 27GS60QC-B UltraGear 27 2K 180Hz chuyên game.jpg', NULL),
(97, 97, 'Màn hình LG 27GS75Q-B 27 IPS 2K 200Hz Gsync chuyên game.jpg', NULL),
(98, 98, 'Màn hình LG 24GS65F-B 24  IPS 180Hz HDR10 Gsync chuyên game.jpg', NULL),
(99, 99, 'Màn hình LG 27GS85Q-B 27 Nano IPS 2K 200Hz HDR10 Gsync chuyên game.jpg', NULL),
(100, 100, 'Màn hình LG 27GS60F-B 27 IPS 180Hz HDR10 Gsync chuyên game.jpg', NULL),
(101, 101, 'Màn hình LG 24GS60F-B 24 IPS 180Hz HDR10 Gsync chuyên game.jpg', NULL),
(102, 102, 'Màn hình LG 24GS60F-B 24 IPS 180Hz HDR10 Gsync chuyên game1.jpg', NULL),
(103, 103, 'Màn hình LG 25MS550-B 25  IPS 100Hz.jpg', NULL),
(104, 104, 'Màn hình LG 25MS500-B 25 IPS 100Hz.jpg', NULL),
(641, 1, 'e2e94b1e-c054-48f4-ae5d-77a62e733efd_21856135672200', NULL),
(642, 1, '5f3acba3-aba5-4da8-ba80-e0e6f87c1888_22161613945900', NULL),
(643, 1, 'e61c1e49-8559-45a4-8fd4-6714e479144b_22435322564900.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `report_content` varchar(255) NOT NULL,
  `response_from_management` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `created_at`, `updated_at`, `report_content`, `response_from_management`, `user_id`, `status`) VALUES
(6, '2024-11-16 01:34:29.499623', '2024-11-17 20:10:04.074779', 'gds', 'dxqsnbfs', 47, 'Đã xử lý'),
(7, '2024-11-16 01:37:12.817338', '2024-11-16 04:08:49.342476', 'nsdjs', '123csaưcá', 47, 'Đã xử lý');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` bigint NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_accounts`
--

INSERT INTO `social_accounts` (`id`, `provider`, `provider_id`, `email`, `name`, `user_id`) VALUES
(1, '	Google', '1', 'user1@gmail.com', 'Lê Tiến Tài', 37),
(2, '	Facebook', '2', '	user2@yahoo.com', 'Phú', 36),
(3, 'Google', '3', 'user3@hotmail.com', 'Hoàng', 38),
(4, 'Twitter', '4', '	user4@gmail.com', 'Tú', 39),
(5, 'Facebook', '5', 'user5@outlook.com', 'Nghĩa', 40);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `address`, `email`, `name`, `phone`) VALUES
(1, '197 Hoang Huu Nam', '21522804@gm.uit.edu.vn', 'pham hoaivu', '0375908462');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `refresh_expiration_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `token_type`, `expiration_date`, `revoked`, `expired`, `user_id`, `is_mobile`, `refresh_token`, `refresh_expiration_date`) VALUES
(183, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMzM0NDY2NyIsInVzZXJJZCI6MzUsInN1YiI6IjMzNDQ2NjciLCJleHAiOjE3MjkxNDQ4MzB9.wLwSwTJZ8szHGZ7kslhI9zO98oMUvjbDxZmkENvZh58', 'Bearer', '2024-10-17 06:00:39.000000', 0, 0, 35, 0, '3acf2f38-a4f0-450b-af91-24b6f5231e2c', '2026-05-10 06:00:39.000000'),
(184, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMzM0NDY2NyIsInVzZXJJZCI6MzUsInN1YiI6IjMzNDQ2NjciLCJleHAiOjE3MjkxNDU2Nzh9.C3fTnU_wjn4JynjOVBTrCY7Le2dbLCjKR5nJ7UkicGE', 'Bearer', '2024-10-17 06:14:38.000000', 0, 0, 35, 0, 'd1de2b7f-9d4f-4754-86ae-90f2ba026e61', '2026-05-10 06:14:38.000000'),
(185, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDMyNzEyMTQxMiIsInVzZXJJZCI6MzYsInN1YiI6IjAzMjcxMjE0MTIiLCJleHAiOjE3MzEyNTczNjB9.-aHVrHpDHSdr7L8GnFbhYpnjlIHAayBA-WeA40yAXZU', 'Bearer', '2024-11-10 23:49:21.000000', 0, 0, 36, 0, 'd57277a7-35c0-495b-aabd-acb20ed4f1a6', '2026-06-03 23:49:21.000000'),
(198, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNCIsInVzZXJJZCI6NDIsInN1YiI6IjA4NjY3NzY4MTQiLCJleHAiOjE3MzE1OTkzMTN9.ULHl5iTNf0zaDu9jx-mDtBhFsASaJ6HLAY0RUHe94wY', 'Bearer', '2024-11-14 22:48:33.000000', 0, 0, 42, 0, '249a72cd-5f55-4f73-b5f9-17dc3ef94f6d', '2026-06-07 22:48:33.000000'),
(199, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNCIsInVzZXJJZCI6NDIsInN1YiI6IjA4NjY3NzY4MTQiLCJleHAiOjE3MzE2NTE2MDF9.iflzfBTcKi75z3J4NhptZ-mb4iGTda1Wsiq6xPta9UE', 'Bearer', '2024-11-15 13:20:02.000000', 0, 0, 42, 0, 'b8b2cb87-315f-4deb-9635-fb7a6334ef83', '2026-06-08 13:20:02.000000'),
(201, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNCIsInVzZXJJZCI6NDIsInN1YiI6IjA4NjY3NzY4MTQiLCJleHAiOjE3MzE2NTM2OTl9.0A8zy6vGuMo97Ek-GJUh76TLOZnKGhBImAl1F04Vv3Q', 'Bearer', '2024-11-15 13:55:00.000000', 0, 0, 42, 0, '456791fc-df5f-4b14-b313-e0136a8e144b', '2026-06-08 13:55:00.000000'),
(202, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNiIsInVzZXJJZCI6NDMsInN1YiI6IjA4NjY3NzY4MTYiLCJleHAiOjE3MzI3MjY4NDB9.HwgtvOputYfCveqZrlC_TSWSUN7aJfJpeyhLjCUE2H0', 'Bearer', '2024-11-28 00:00:40.000000', 0, 0, 43, 0, '7ed971e7-e1f1-4b50-a583-454284e002f1', '2026-06-21 00:00:40.000000'),
(203, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNiIsInVzZXJJZCI6NDMsInN1YiI6IjA4NjY3NzY4MTYiLCJleHAiOjE3MzI4MjA3Mzl9.qmFyQpPPlapv1CI4sJsNkFP9ohmk-5VpHYei4mpcA-c', 'Bearer', '2024-11-29 02:05:39.000000', 0, 0, 43, 0, 'a40f6799-e71a-41a3-b033-bdc4a3e5dade', '2026-06-22 02:05:39.000000'),
(204, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxMSIsInVzZXJJZCI6NDQsInN1YiI6IjA4NjY3NzY4MTEiLCJleHAiOjE3MzI4MjA4NDR9.1-VZn3DpP73LjDjpcHCIPyq3EPgYEJDXm-hB-WzKcNY', 'Bearer', '2024-11-29 02:07:24.000000', 0, 0, 44, 0, '725850ad-d0c4-4655-9864-b00825447a7b', '2026-06-22 02:07:24.000000'),
(205, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxMSIsInVzZXJJZCI6NDQsInN1YiI6IjA4NjY3NzY4MTEiLCJleHAiOjE3MzI4MjA4ODN9.l0qyHgy4iKHdxB7TlfRYQ9OaxrPkQE8U94c_T7ss_tk', 'Bearer', '2024-11-29 02:08:04.000000', 0, 0, 44, 0, '2f7f3e06-fd21-4f68-8f42-694b2b5c5083', '2026-06-22 02:08:04.000000'),
(206, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxMSIsInVzZXJJZCI6NDQsInN1YiI6IjA4NjY3NzY4MTEiLCJleHAiOjE3MzI4OTgwMDZ9.3n9u2Hsv_zI7cwnZ99PNMuqIKNgaHEvocS9oeaZpuQg', 'Bearer', '2024-11-29 23:33:26.000000', 0, 0, 44, 0, 'fb945ccc-3a8c-4d89-b26d-ad1f647d8cd0', '2026-06-22 23:33:26.000000'),
(217, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNSIsInVzZXJJZCI6NDEsInN1YiI6IjA4NjY3NzY4MTUiLCJleHAiOjE3MzM1NTkxOTF9.mxZimcvJkKGCGO6jFGUauQbicvTUxF_0vaQRg4cFL7c', 'Bearer', '2024-12-07 15:13:11.303791', 0, 0, 41, 0, '6f652c4c-2ac5-4391-8da8-b160bd2eace9', '2026-06-30 15:13:11.303791'),
(218, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNSIsInVzZXJJZCI6NDEsInN1YiI6IjA4NjY3NzY4MTUiLCJleHAiOjE3MzM1NTk0NTd9.IN25zOI37xEd8GRBn-BbH8p-A2yVXMye09xDj0-M3gc', 'Bearer', '2024-12-07 15:17:37.975117', 0, 0, 41, 0, '70a2a747-12e9-4355-bb23-1903b9f3da99', '2026-06-30 15:17:37.975117'),
(220, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDg2Njc3NjgxNSIsInVzZXJJZCI6NDEsInN1YiI6IjA4NjY3NzY4MTUiLCJleHAiOjE3MzM5MjY4MDR9.LqVwjR5JCevZB_QfczjdlZWHVe2yVrfcSH6BB1-9ExI', 'Bearer', '2024-12-11 21:20:04.418332', 0, 0, 41, 0, '9f83bcde-b9ab-4126-a7ab-aa4ab1bf0232', '2026-07-04 21:20:04.419296'),
(223, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiaHV1aG9hbmcxNDE0QGdtYWlsLmNvbSIsInVzZXJJZCI6NDUsInN1YiI6Imh1dWhvYW5nMTQxNEBnbWFpbC5jb20iLCJleHAiOjE3MzQxMDU3NTh9.Wk0d2emie81pP17wzGkakBjI6W6vhWVLG9ioMbAhL4o', 'Bearer', '2024-12-13 23:02:38.634741', 0, 0, 45, 0, 'ca33a653-7d5a-489d-9ae3-9c30940335ed', '2026-07-06 23:02:38.634741'),
(224, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiaHV1aG9hbmcxNDE0QGdtYWlsLmNvbSIsInVzZXJJZCI6NDUsInN1YiI6Imh1dWhvYW5nMTQxNEBnbWFpbC5jb20iLCJleHAiOjE3MzQxMDk0NzV9.CGtr20uwsPLvywRmyGtImyPPFilkfCFTQUJQMetc1m8', 'Bearer', '2024-12-14 00:04:35.802650', 0, 0, 45, 0, 'fd709b49-c5d7-46cc-ad43-437e9d897fe3', '2026-07-07 00:04:35.802650'),
(225, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiaHV1aG9hbmcxNDE0QGdtYWlsLmNvbSIsInVzZXJJZCI6NDUsInN1YiI6Imh1dWhvYW5nMTQxNEBnbWFpbC5jb20iLCJleHAiOjE3MzQxMTkxMDB9.j8LJAsyMclonxcCqNv_NphLbHo-pE0IqkkD8tNN1SDo', 'Bearer', '2024-12-14 02:45:00.636001', 0, 0, 45, 0, '28f3b75d-fda9-44b1-a320-8fc242e8f915', '2026-07-07 02:45:00.636001'),
(226, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjE1MjI4MDRAZ20udWl0LmVkdS52biIsInVzZXJJZCI6NDcsInN1YiI6IjIxNTIyODA0QGdtLnVpdC5lZHUudm4iLCJleHAiOjE3MzQyNDMwMzF9.aNmWkRoRoyfIhp8DKigZtx0oBxXyDAF3dVJjZ0wJ_A0', 'Bearer', '2024-12-15 13:10:31.971717', 0, 0, 47, 0, '23ae5e0b-789e-4707-9407-e032b1b542dd', '2026-07-08 13:10:31.972275'),
(227, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjE1MjI4MDRAZ20udWl0LmVkdS52biIsInVzZXJJZCI6NDcsInN1YiI6IjIxNTIyODA0QGdtLnVpdC5lZHUudm4iLCJleHAiOjE3MzQyNDMxMjJ9.3Mq5efohXdfR0FzZi95sv05GZz9T9RA63Nji_6fJYxk', 'Bearer', '2024-12-15 13:12:02.064687', 0, 0, 47, 0, 'd17529ea-50ae-4cbb-a747-3200defa5a40', '2026-07-08 13:12:02.064687'),
(228, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMjE1MjI4MDRAZ20udWl0LmVkdS52biIsInVzZXJJZCI6NDcsInN1YiI6IjIxNTIyODA0QGdtLnVpdC5lZHUudm4iLCJleHAiOjE3MzQyNzQyOTZ9.wS6A7bcwYG6iUq0mWavFaiF7n8mObo3P3-JTi2DFNCE', 'Bearer', '2024-12-15 21:51:37.088936', 0, 0, 47, 0, 'acdaf3b0-5bb2-470d-90b8-f0eb3a99953f', '2026-07-08 21:51:37.088936'),
(229, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoidnVuYW0xMjMxMjM0QGdtYWlsLmNvbSIsInVzZXJJZCI6NTAsInN1YiI6InZ1bmFtMTIzMTIzNEBnbWFpbC5jb20iLCJleHAiOjE3MzQyNzQ2MjJ9._61PEnsDeihzoCZeIxam7fbPK3x4e6CFs0SkEyFam7E', 'Bearer', '2024-12-15 21:57:02.327889', 0, 0, 50, 0, '370e2365-1d14-401f-b996-82d3dcfdd66b', '2026-07-08 21:57:02.328536'),
(234, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDM3NTkwODQ2MiIsInVzZXJJZCI6NDksInN1YiI6IjAzNzU5MDg0NjIiLCJleHAiOjE3MzQ0MTQ2MzF9.sJEDSY00S09etDIwz9yA0Q91OenHFt1LvuldnuFEubg', 'Bearer', '2024-12-17 12:50:31.354005', 0, 0, 49, 0, '18ab164a-915e-4a91-b5cb-a7f6e0134530', '2026-07-10 12:50:31.354005'),
(235, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDM3NTkwODQ2MiIsInVzZXJJZCI6NDksInN1YiI6IjAzNzU5MDg0NjIiLCJleHAiOjE3MzQ0NDA3MDl9.7ecWRrpdRmUOaMRnZoiuihXewQxjN2IjvV21Dj5ESCQ', 'Bearer', '2024-12-17 20:05:09.987062', 0, 0, 49, 0, '54ac2625-9f0d-49e1-90c9-e1afd9a428f6', '2026-07-10 20:05:09.987062'),
(236, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDM3NTkwODQ2MiIsInVzZXJJZCI6NDksInN1YiI6IjAzNzU5MDg0NjIiLCJleHAiOjE3MzQ0NDA4Mjl9.jE7KM8-a3_2E9YeNVZAR0rmAZrX1ed6l6IThVJFz6Gk', 'Bearer', '2024-12-17 20:07:09.885759', 0, 0, 49, 0, '70eb0ffe-b870-48cc-a7a3-a568ea553013', '2026-07-10 20:07:09.885759');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` datetime(6) DEFAULT NULL,
  `facebook_account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google_account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT '1',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`, `email`, `profile_image`) VALUES
(35, 'John Smith', '3344667', 'This is John\'s address', '$2a$10$m7oZkosuABPiFyE6hSqkE.q98Ele2TwFePdrZ4/QFUwkwpa3XkKgW', '2024-09-17 05:59:09.000000', '2024-09-17 05:59:09.000000', 1, '1999-10-23 00:00:00.000000', '0', '0', 2, '', NULL),
(36, 'Phú', '0327121412', 'HCM', '$2a$10$WBRt3GrCdOzvFswL12CN8uI0vsMWFb0z7br4Mn6HzMhgC3/zeTD2O', '2024-10-11 23:48:31.000000', '2024-10-11 23:48:31.000000', 1, '2003-10-27 00:00:00.000000', '0', '0', 1, '', NULL),
(37, 'Lê Tiến Tài', '901234567', ' Quận 1', '12345678', '2024-10-11 23:48:31.000000', '2024-09-17 05:59:09.000000', 1, '2003-12-06 00:00:00.000000', '0', '0', 2, '', NULL),
(38, 'Trần Hữu Hoàng', '901234565', ' Quận 1', '12345678', '2024-09-17 05:59:09.000000', '2024-09-17 05:59:09.000000', 1, '2003-10-23 00:00:00.000000', '0', '0', 2, '', NULL),
(39, 'Phan Thanh Tú', '901234563', ' Quận 1', '12345678', '2024-09-17 05:59:09.000000', '2024-09-17 05:59:09.000000', 1, '2003-10-23 00:00:00.000000', '0', '0', 2, '', NULL),
(40, 'Lê Huỳnh Việt Anh', '901234562', 'HCM', '12345678', '2024-09-17 05:59:09.000000', '2024-09-17 05:59:09.000000', 1, '2003-01-12 00:00:00.000000', '0', '0', 2, '', NULL),
(41, 'Tran Huu Hoang', '0866776815', 'Go vap', '$2a$10$OrED/AwSTv7yU7FDAV2lnuutJtNf0nfuhvAJMiJURsdA5fFNc09Aq', '2024-10-15 19:52:02.000000', '2024-10-15 19:52:02.000000', 1, '2003-10-23 00:00:00.000000', '0', '0', 2, '', NULL),
(42, 'Tran Huu Hoang 2', '0866776814', 'Go vap 1', '$2a$10$oTHG8qXFmpZADqWScq2.QOamhqI06B.mooj6VflTp7ncMe3gGbj0C', '2024-10-15 20:09:43.000000', '2024-10-15 20:09:43.000000', 1, '2002-10-23 00:00:00.000000', '0', '0', 1, '', NULL),
(43, 'hoang', '0866776816', '123', '$2a$10$LSetlp95XnNM8djpLfctE.6ktNDsEXwY5k4E/JphNbxEJPmFDX6X6', '2024-10-29 00:00:35.000000', '2024-10-29 00:00:35.000000', 1, '2003-10-23 00:00:00.000000', '0', '0', 1, '', NULL),
(44, 'Tran Huu Hoang111', '0866776811', 'Go vap', '$2a$10$nXQ5z83DR9GmU/d9VUtgz.X1StGBJi06ALkFbncNaHKSLJndq3nvS', '2024-10-30 02:07:18.000000', '2024-10-30 02:07:18.000000', 1, '2003-10-23 00:00:00.000000', '0', '0', 2, '', NULL),
(45, '3395_Trần Hữu Hoàng', NULL, NULL, '', '2024-11-05 01:20:18.000000', '2024-11-05 01:20:18.000000', 1, NULL, NULL, '109021013756176419090', 1, 'huuhoang1414@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocK8AzxisKZCjCaOR8L2sqMhMfvlhkIojVvH6NFt7foRDPNAl_8=s96-c'),
(47, 'VŨ PHẠM HOÀI', NULL, NULL, '', '2024-11-15 13:10:31.834775', '2024-11-15 13:10:31.834775', 1, NULL, NULL, '111494217381400690526', 1, '21522804@gm.uit.edu.vn', 'https://lh3.googleusercontent.com/a/ACg8ocI5-EzsEMNW33sOt1VaVCCu-riEoGyDSb9Ud7RCxBR6-ABLCD18=s96-c'),
(49, 'Phạm Hoài Vũ', '0375908462', '197 Hoang Huu Nam', '$2a$10$0RWqfJFJVFjlH0UI0kxeLuXDUTUMehOIGmpxZemW9zCBsFEgFTUBy', '2024-11-15 21:56:30.633966', '2024-11-15 21:56:30.633966', 1, '1111-11-11 07:00:00.000000', '0', '0', 2, '', NULL),
(50, 'vũ phạm', NULL, NULL, '', '2024-11-15 21:57:02.181307', '2024-11-15 21:57:02.181307', 1, NULL, NULL, '108216041975817168687', 1, 'vunam1231234@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocJDQAlFzcAEkV02DZJFRcyb3ZBc8nwKsfRz7jqxHMOvlNAsfw=s96-c'),
(51, 'Phạm Hoài Vũ', '0375908621', '197 Hoang Huu Nam', '$2a$10$doG6vbhH0H6Dc4Ypb7tD1epqFdUVzkZ2UO3RNacrioPhBL172ALt.', '2024-11-15 22:01:57.675318', '2024-11-15 22:01:57.675318', 1, '1111-11-11 07:00:00.000000', '0', '0', 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `location`, `name`, `created_at`, `updated_at`) VALUES
(1, 'anksl', 'nska', '2024-11-16 13:48:19.166484', '2024-11-16 13:48:19.166484'),
(2, 'sa', 'sá', '2024-11-16 14:03:25.268048', '2024-11-16 14:03:25.268048'),
(3, 'sa', 'sá', '2024-11-17 12:41:45.865489', '2024-11-17 12:41:45.865489');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `quantity`, `product_id`, `warehouse_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 2, NULL, '2024-11-16 14:13:08.869812'),
(5, 50, 9, 1, NULL, NULL),
(7, 50, 42, 1, NULL, NULL),
(9, 50, 44, 1, NULL, NULL),
(10, 50, 45, 1, NULL, NULL),
(11, 50, 46, 1, NULL, NULL),
(12, 50, 47, 1, NULL, NULL),
(13, 50, 48, 1, NULL, NULL),
(14, 50, 49, 1, NULL, NULL),
(15, 50, 50, 1, NULL, NULL),
(16, 50, 51, 1, NULL, NULL),
(17, 50, 52, 1, NULL, NULL),
(18, 50, 15, 1, NULL, NULL),
(19, 50, 16, 1, NULL, NULL),
(20, 50, 17, 1, NULL, NULL),
(21, 50, 73, 1, NULL, NULL),
(22, 50, 74, 1, NULL, NULL),
(23, 50, 75, 1, NULL, NULL),
(24, 50, 76, 1, NULL, NULL),
(25, 50, 5783, 1, NULL, NULL),
(26, 50, 67, 1, NULL, NULL),
(27, 50, 68, 1, NULL, NULL),
(28, 50, 69, 1, NULL, NULL),
(29, 50, 70, 1, NULL, NULL),
(30, 50, 71, 1, NULL, NULL),
(31, 50, 72, 1, NULL, NULL),
(32, 50, 78, 1, NULL, NULL),
(33, 50, 79, 1, NULL, NULL),
(34, 50, 80, 1, NULL, NULL),
(35, 50, 81, 1, NULL, NULL),
(36, 50, 82, 1, NULL, NULL),
(37, 50, 83, 1, NULL, NULL),
(38, 50, 84, 1, NULL, NULL),
(39, 50, 85, 1, NULL, NULL),
(40, 50, 86, 1, NULL, NULL),
(41, 50, 87, 1, NULL, NULL),
(42, 50, 88, 1, NULL, NULL),
(43, 50, 22, 1, NULL, NULL),
(44, 50, 23, 1, NULL, NULL),
(45, 50, 24, 1, NULL, NULL),
(46, 50, 25, 1, NULL, NULL),
(47, 50, 26, 1, NULL, NULL),
(48, 50, 65, 1, NULL, NULL),
(49, 50, 66, 1, NULL, NULL),
(50, 50, 77, 1, NULL, NULL),
(51, 50, 89, 1, NULL, NULL),
(52, 50, 90, 1, NULL, NULL),
(53, 50, 91, 1, NULL, NULL),
(54, 50, 92, 1, NULL, NULL),
(55, 50, 93, 1, NULL, NULL),
(56, 50, 1, 1, NULL, NULL),
(57, 50, 2, 1, NULL, NULL),
(58, 50, 3, 1, NULL, NULL),
(59, 50, 4, 1, NULL, NULL),
(60, 50, 5, 1, NULL, NULL),
(61, 50, 27, 1, NULL, NULL),
(62, 50, 28, 1, NULL, NULL),
(63, 50, 29, 1, NULL, NULL),
(64, 50, 30, 1, NULL, NULL),
(65, 50, 31, 1, NULL, NULL),
(66, 50, 32, 1, NULL, NULL),
(67, 50, 33, 1, NULL, NULL),
(68, 50, 34, 1, NULL, NULL),
(69, 50, 35, 1, NULL, NULL),
(70, 50, 36, 1, NULL, NULL),
(71, 50, 37, 1, NULL, NULL),
(72, 50, 38, 1, NULL, NULL),
(73, 50, 39, 1, NULL, NULL),
(74, 50, 40, 1, NULL, NULL),
(75, 50, 41, 1, NULL, NULL),
(76, 50, 18, 1, NULL, NULL),
(77, 50, 19, 1, NULL, NULL),
(78, 50, 20, 1, NULL, NULL),
(79, 50, 94, 1, NULL, NULL),
(80, 50, 95, 1, NULL, NULL),
(81, 50, 96, 1, NULL, NULL),
(82, 50, 97, 1, NULL, NULL),
(83, 50, 98, 1, NULL, NULL),
(84, 50, 99, 1, NULL, NULL),
(85, 50, 100, 1, NULL, NULL),
(86, 50, 101, 1, NULL, NULL),
(87, 50, 102, 1, NULL, NULL),
(88, 50, 103, 1, NULL, NULL),
(89, 50, 104, 1, NULL, NULL),
(90, 50, 11, 1, NULL, NULL),
(91, 50, 12, 1, NULL, NULL),
(92, 50, 13, 1, NULL, NULL),
(93, 50, 14, 1, NULL, NULL),
(94, 50, 53, 1, NULL, NULL),
(95, 50, 54, 1, NULL, NULL),
(96, 50, 55, 1, NULL, NULL),
(97, 50, 56, 1, NULL, NULL),
(98, 50, 57, 1, NULL, NULL),
(99, 50, 58, 1, NULL, NULL),
(100, 50, 59, 1, NULL, NULL),
(101, 50, 60, 1, NULL, NULL),
(102, 50, 61, 1, NULL, NULL),
(103, 50, 62, 1, NULL, NULL),
(104, 50, 63, 1, NULL, NULL),
(105, 50, 64, 1, NULL, NULL),
(130, 10, 6, 1, '2024-11-17 16:02:29.079011', '2024-11-17 16:02:29.079011'),
(131, 111, 7, 1, '2024-11-17 19:09:00.759552', '2024-11-17 19:09:00.759552'),
(132, 11111, 10, 1, '2024-11-17 19:11:43.357412', '2024-11-17 19:11:43.357412'),
(133, 11111, 43, 1, '2024-11-17 19:13:13.600473', '2024-11-17 19:13:13.600473'),
(134, 1222222, 3, 2, '2024-11-17 19:14:34.667521', '2024-11-17 19:14:34.667521');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebooks`
--
ALTER TABLE `facebooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_coupon` (`coupon_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_order_details_coupon` (`coupon_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `FK6i174ixi9087gcvvut45em7fd` (`supplier_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`),
  ADD KEY `FKswghniyoofjlsmkwu8bjri0kw` (`post_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2m5r3qy83vqcqlkgr6n815mcn` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `facebooks`
--
ALTER TABLE `facebooks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5784;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK6i174ixi9087gcvvut45em7fd` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKswghniyoofjlsmkwu8bjri0kw` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD CONSTRAINT `FK2m5r3qy83vqcqlkgr6n815mcn` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
