-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (16,NULL,NULL,'banner 1','Giảm giá ','getinspired3.jpg'),(17,NULL,NULL,'banner 2','2','getinspired2.jpg'),(19,NULL,NULL,'banner 3','1','main-slider4.jpg');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (8,'Áo Nam','1','2018-12-05 02:00:03','2018-12-05 02:00:03'),(9,'Áo Nữ','0','2018-12-05 02:00:03','2018-12-05 02:00:03'),(12,'Quần Nam','1','2018-12-05 02:40:33','2018-12-05 02:40:33'),(13,'Quần Nữ','0','2018-12-05 02:40:33','2018-12-05 02:40:33'),(16,'Giày Nam','1','2018-12-05 02:46:36','2018-12-05 02:46:36'),(17,'Giày Nữ','0','2018-12-05 02:46:36','2018-12-05 02:46:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(1) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_id_foreign` (`user_id`),
  KEY `comments_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2018_11_09_080918_create_users_table',1),(2,'2018_11_09_081552_create_categories_table',2),(3,'2018_11_09_081726_create_products_table',3),(4,'2018_11_09_082627_create_comments_table',4),(5,'2018_11_09_083430_create_orders_table',5),(6,'2018_11_09_084157_create_order_details_table',6),(7,'2018_12_04_125829_create_banner_table',7),(8,'2018_12_13_150854_create_productsize_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_details` (
  `order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `commented` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (25,91,1,15,0),(26,94,1,16,0);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_id_foreign` (`user_id`),
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (15,18,'Đại học Bách Khoa Hà Nội','0961989725',159000,'2019-05-20 14:02:37','2019-05-20 14:02:37','dinhngocndtk@gmail.com','Đang giao hàng'),(16,14,'nha TC bach khoa','0947060528',115000,'2019-05-21 06:45:20','2019-05-21 06:45:20','nguyendeptrai@gmail.com','Đã hủy');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `updated_at_UNIQUE` (`updated_at`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (91,'Áo thun nam cổ bẻ cao cấp logo đẹp',129000,'detailbig1.jpg','- Áo thun nam sọc ngang cổ bẻ cao cấp mang đến sự sang trọng Thiết kế áo trơn tạo sự đơn giản thanh lịch nhưng vô cùng đẳng cấp với logo nổi tạo ấn tượng mạnh với người nhìn.\r\n- Cùng với chất liệu thun cá sấu cao cấp, co dãn và thấm hút mồ hôi tuyệt vời, áo đem lại sự thoải mái tuyệt đối cho người mặc.\r\n- Nhanh tay mua ngay 5 áo mặc suốt tuần nào các chàng trai!',8,'2019-05-20 13:56:58','2019-05-20 13:56:58',NULL,NULL),(92,'Áo thun nam ngắn tay không cổ co dãn 4 chiều phong cách Hàn Quốc',185000,'c80f51a5b05f2a0d23b8fc458f82b18d.jpg','- Nhãn hiệu: HanLu. (Thời trang phong cách Hàn Quốc) \r\n- Xuất sứ: Quảng Châu, Trung Quốc \r\n- Sản phẩm nguyên vẹn, có đầy đủ tem mác ',8,'2019-05-20 14:19:35','2019-05-20 14:19:35',NULL,NULL),(94,'Áo Thun Nam Everest AokNAM407 - Xám',85000,'f7997c7b4b958bd288eb517f1966bf02.jpg','Áo thun in chữ trước ngực trẻ trung',8,'2019-05-20 14:26:38','2019-05-20 14:26:38',NULL,NULL),(101,'Áo Sơ Mi Nam Form Rông Kẻ Sọc Tay Lỡ Zavans',150000,'64cb8c4395a22118f26cf43e1794586f.jpg','Chất liệu vải mềm và thoáng mát',8,'2019-05-20 14:40:27','2019-05-20 14:40:27',NULL,NULL),(103,'áo sơ mi nam cao cấp',180000,'product2_2.jpg','được làm từ chất liệu thiên nhiên, thoáng mát, phong cách thời trang mới mẻ, phù hợp với giới trẻ',8,'2019-05-21 07:05:16','2019-05-21 07:05:16',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsize`
--

DROP TABLE IF EXISTS `productsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productsize` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(5) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quantity` int(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idproduct_idx` (`product_id`),
  CONSTRAINT `idproduct` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsize`
--

LOCK TABLES `productsize` WRITE;
/*!40000 ALTER TABLE `productsize` DISABLE KEYS */;
INSERT INTO `productsize` VALUES (9,91,'M',10),(10,91,'L',12),(11,91,'XL',12),(13,91,'M',2),(14,103,'M',3);
/*!40000 ALTER TABLE `productsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'quản trị viên1','quantrivien@gmail.com','$2y$10$jO0FTkfyRWNxeGhzsW7CyuJzNRfISBNaZPAq.0V.dVrS8plI5SKe2',3,'1544687485images.jpg',NULL,'0124256458','2018-12-10 09:02:44','2018-12-13 00:58:59'),(11,'nhân viên','nhanvien@gmail.com','$2y$10$fsoL20G8QeD7FOWH5nrViuvN7GDi8Ro9ry/xkIpps2Rg7oRjQaN4i',2,'default-avatar.jpeg',NULL,'01551656685','2018-12-10 09:03:04','2018-12-10 09:03:04'),(12,'khách hàng','khachhang@gmail.com','$2y$10$ONiZMvanl72sI4jpXRFQ/u/6F5YRS6XHgEOvtRFMicmh.ahDOElsC',2,NULL,'Nam Định','09619865878','2018-12-10 09:04:38','2019-05-13 08:22:07'),(13,'lê duy anh','leduyanh@gmail.com','$2y$10$uegrQHWglo2WkCHVx.OtWOx45.q.JL8wtEQXV9DgAqVTFZQidiUZ2',1,'default-avatar.jpeg',NULL,NULL,'2018-12-13 01:27:30','2018-12-13 01:27:30'),(14,'Phạm Văn Nguyên','nguyendeptrai@gmail.com','25f9e794323b453885f5181f1b624d0b',1,'nguyendeptrai.jpg','thanh hóa','0947060528','2018-12-13 01:27:30','2019-05-21 06:46:18'),(15,'nguyen dep trai hahaha','hahahaha@gmail.com','e10adc3949ba59abbe56e057f20f883e',1,'nguyendeptrai.jpg','Quảng Xương - Thanh Hóa','0947060528','2019-04-25 16:06:30','2019-05-01 09:31:17'),(16,'nguyen','ngkhfjdkhf@gmail.com','e10adc3949ba59abbe56e057f20f883e',1,NULL,'Hà Nội','021578124','2019-04-25 17:19:09','2019-05-13 08:19:55'),(18,'Nguyen Dinh Ngoc','dinhngocndtk@gmail.com','b6d69d58c159edf188555f8df3f8a66f',3,'dinhngocndtk@gmail.com','Ha Noi','0961989725','2019-05-20 02:53:32','2019-05-20 15:41:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 14:23:39
