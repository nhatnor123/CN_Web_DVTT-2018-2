-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	8.0.15

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (9,'2018-12-04 07:03:59','2018-12-06 00:06:51','Thời trang nữ','Bộ sưu tập ưa thích của bạn. Giảm giá lên đến 90%','1544079642Jenny-Packham-bridesmaids-banner-e1515440096808.jpg'),(10,'2018-12-04 17:54:31','2018-12-06 00:08:46','Thời trang nam','Thương hiệu thời trang nam Hàn Quốc đẹp giá rẻ','1544080126cropped-image-for-banner-sized.jpg'),(11,'2018-12-06 00:08:41','2018-12-06 00:08:41','Fashionshop tưng bừng khai trương','Mua sắm thả ga không lo về giá','1544080121banner-fashion-588116619.jpg');
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
INSERT INTO `categories` VALUES (8,'áo','1','2018-12-05 02:00:03','2018-12-05 02:00:03'),(9,'áo','0','2018-12-05 02:00:03','2018-12-05 02:00:03'),(12,'quần','1','2018-12-05 02:40:33','2018-12-05 02:40:33'),(13,'quần','0','2018-12-05 02:40:33','2018-12-05 02:40:33'),(16,'giày','1','2018-12-05 02:46:36','2018-12-05 02:46:36'),(17,'giày','0','2018-12-05 02:46:36','2018-12-05 02:46:36');
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
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Chất lượng sản phẩm tốt','Tôi thấy chất lượng sản phẩm sau khi dùng rất tốt, bền, đẹp. ủng hộ shop',4,15,48,NULL,NULL),(12,'sdfsdfsdfdsf','sdafsadfasdfasdfsadf',2,15,48,'2019-04-30 14:54:21','2019-04-30 14:54:21'),(13,'sản phẩm tốt','kjasdhfkjashfkjaslfhaklsjfhksjadfhkasjdfhaskdjf',2,15,49,'2019-04-30 14:57:05','2019-04-30 14:57:05'),(14,'sản phẩm lỗi','đường chỉ may không chắc chắn',1,15,48,'2019-04-30 15:00:47','2019-04-30 15:00:47'),(15,'sản phẩm lỗi','sản phẩm không được đẹp như hình',1,15,50,'2019-04-30 15:03:20','2019-04-30 15:03:20'),(16,'sản phẩm tốt','146545156465454sdfkasfkjashfkjashfkjsadf',4,14,51,'2019-05-01 15:22:38','2019-05-01 15:22:38'),(17,'sản phẩm không như mong đợi','chất lượng không được như quảng cáo, hơi thất vọng với shop',2,14,52,'2019-05-01 15:23:42','2019-05-01 15:23:42'),(18,'sản phẩm tốt','rất đáng đồng tiền bỏ ra, tiếp tục ủng hộ shop',5,14,52,'2019-05-01 15:54:36','2019-05-01 15:54:36'),(19,'gdfghdfsghsdfg','ádfasdgdsaghasdghasdgdsgadgasdgsdg',4,15,48,'2019-05-01 16:18:33','2019-05-01 16:18:33'),(20,'sadfsadfasdfsad','ádgasdgasdgasdgasdgasdgasdgaskdlfhasdjklfhjkasldfhasdjklfhasdjklfhasdjklfhjsdfhkasjd',5,14,50,'2019-05-01 16:22:07','2019-05-01 16:22:07'),(21,'tạm được','sản phẩm tốt trong tầm giá',3,14,54,'2019-05-01 16:38:30','2019-05-01 16:38:30'),(22,'sdafasdfasdfasdfasd','adsgasdgasdgasdgsdagasdgasdg',5,15,55,'2019-05-01 16:51:45','2019-05-01 16:51:45'),(23,'nhận xét lần 2','akdsjgfasdfhsjkl;afhjkl;áhfjksalhfljkasdhfjksdahlfkas',4,15,55,'2019-05-01 16:53:02','2019-05-01 16:53:02'),(24,'sdafsdafsad','ghsdafweltrhokjbdsgmkasdbgf,kjeawg',4,15,55,'2019-05-01 16:57:09','2019-05-01 16:57:09'),(25,'sdfsdafsdafgsdagf','dsghdfsawejioutr;ealfj lwerhjfioewroiuewhyrwebu iorh ưeijr',5,14,55,'2019-05-01 17:00:10','2019-05-01 17:00:10'),(26,'ádasdasdasd','saghsdtewrtrytrjytjytjk',3,15,56,'2019-05-01 17:05:12','2019-05-01 17:05:12'),(27,'ewrwerewrt','reywerutitrtyyiuiouytryrey',2,15,53,'2019-05-01 17:15:31','2019-05-01 17:15:31'),(28,'sdafasdfsdf','ádfasdfasdfasdfasdgfasdgsdfyhtryutrjhygkjhklj',3,15,53,'2019-05-01 17:17:19','2019-05-01 17:17:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (13,48,2,1,1),(14,48,1,8,1),(15,50,1,8,1),(16,48,2,1,0),(17,48,1,9,1),(18,49,1,9,1),(21,51,1,11,1),(22,52,1,11,1),(24,52,2,14,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,10,'đại học bách khoa hà nội','0124256458',2750000,'2018-12-14 02:25:49','2018-12-14 02:36:40','quantrivien@gmail.com','Đã hủy!'),(2,10,'hà nội','0947189286',2540000,'2018-12-14 02:25:49','2018-12-14 02:36:40','quantrivien@gmail.com','Đang vận chuyển'),(3,10,'thanh hóa','0947060528',1700000,'2019-04-26 17:47:25','2019-04-26 17:47:25','Cdsfdsfdf@gmail.com','Chờ xử lý'),(4,15,'ngÃµ 79, há» ba máº«u','0947060528',200000,'2019-04-27 04:28:05','2019-04-27 04:28:05','hahahaha@gmail.com','Chờ xử lý'),(5,15,'ngõ 79, hồ ba mẫu','0947060528',550000,'2019-04-27 04:33:32','2019-04-27 04:33:32','hahahaha@gmail.com','Chờ xử lý'),(6,15,'ngõ 79, hồ ba mẫu','0947060528',200000,'2019-04-27 04:42:54','2019-04-27 04:42:54','hahahaha@gmail.com','Chờ xử lý'),(7,15,'thanh hóa','32153454',370000,'2019-04-28 04:14:31','2019-04-28 04:14:31','hahahaha@gmail.com','Chờ xử lý'),(8,15,'Số nhà 10, ngách 241/10 ngõ 79 hồ ba mẫu','32153454',550000,'2019-04-28 04:18:46','2019-04-28 04:18:46','hahahaha@gmail.com','Đã nhận'),(9,15,'đại học bách khoa hà nội','0947060528',370000,'2019-04-29 11:20:29','2019-04-29 11:20:29','hahahaha@gmail.com','Chờ xử lý'),(11,14,'Nhà TC Đại học bách khoa','0947060528',680000,'2019-05-01 14:53:35','2019-05-01 14:53:35','nguyendeptrai@gmail.com','Chờ xử lý'),(14,14,'ngõ 79, hồ ba mẫu','0947060528',870000,'2019-05-01 15:51:00','2019-05-01 15:51:00','nguyendeptrai@gmail.com','Chờ xử lý');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color`
--

DROP TABLE IF EXISTS `product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_color` (
  `idproduct_color` int(11) NOT NULL,
  `idproduct` int(10) unsigned DEFAULT NULL,
  `color` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idproduct_color`),
  KEY `idproduct` (`idproduct`),
  CONSTRAINT `product_color_ibfk_1` FOREIGN KEY (`idproduct`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color`
--

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` VALUES (1,48,'red',NULL,NULL);
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_image` (
  `idproduct_image` int(10) NOT NULL,
  `idproduct` int(10) unsigned DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idproduct_image`),
  KEY `idproduct` (`idproduct`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`idproduct`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
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
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (48,'áo thun',170000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:26:18','2018-12-16 07:26:18','ao-thun-48'),(49,'áo nỉ cao cấp',200000,'product2.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:27:19','2018-12-16 07:27:19','ao-ni-cao-cap-49'),(50,'áo ấm mới',350000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:28:02','2018-12-16 07:28:02','ao-am-moi-50'),(51,'áo nam tay dài',230000,'product3.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:28:42','2018-12-16 07:28:42','ao-nam-tay-dai-51'),(52,'áo khoác nam',420000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:29:05','2018-12-16 07:29:05','ao-khoac-nam-52'),(53,'áo nam xắn tay',180000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:29:35','2018-12-16 07:29:35','ao-nam-xan-tay-53'),(54,'áo sơ mi đẹp',260000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:30:08','2018-12-16 07:30:08','ao-so-mi-dep-54'),(55,'áo thun tay lửng',99000,'product1.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:30:36','2018-12-16 07:30:36','ao-thun-tay-lung-55'),(56,'áo sơ mi đen',260000,'product2.jpg','Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật',8,'2018-12-16 07:31:22','2018-12-16 07:31:22','ao-so-mi-den-56'),(57,'áo khoác ấm',460000,'1544970775chon-ao-khoac-nam-2.jpg','mô tả',8,'2018-12-16 07:32:55','2018-12-16 07:32:55','ao-khoac-am-57'),(58,'áo cộc tay',120000,'1544970811IMG_8193.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',8,'2018-12-16 07:33:31','2018-12-16 07:33:31','ao-coc-tay-58'),(63,'giày đen đế trắn',260000,'15449718924e29f0a1804e3ddc742622f915810cf5.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:51:32','2018-12-16 07:51:32','giay-den-de-tran-63'),(64,'quần kaki xanh',900000,'15449719424_1.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',12,'2018-12-16 07:52:22','2018-12-16 07:52:22','quan-kaki-xanh-64'),(65,'quần vải',299000,'1544971976quan-tay-den-qt92-8705-slide-products-59aff20aee155.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',12,'2018-12-16 07:52:56','2018-12-16 07:52:56','quan-vai-65'),(66,'giày da cao cấp',600000,'15449720113897731870_1334666211.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:53:31','2018-12-16 07:53:31','giay-da-cao-cap-66'),(67,'quần tụt',300000,'154497208229213855_417626018699271_5367966155082301440_n.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',12,'2018-12-16 07:54:42','2018-12-16 07:54:42','quan-tut-67'),(68,'giày cao cấp',950000,'1544972122giay-nam-rammstein-1499344779-1-3047370-1499344779.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:55:22','2018-12-16 07:55:22','giay-cao-cap-68'),(69,'giày sọc trắng',500000,'1544972146giay-nam-phong-cach-sport-1.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:55:46','2018-12-16 07:55:46','giay-soc-trang-69'),(70,'quần hiphop',360000,'1544972176quan-bo-1.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',12,'2018-12-16 07:56:16','2018-12-16 07:56:16','quan-hiphop-70'),(71,'quần thun',99000,'1544972197quan-dai-nam-aristino-apa1701.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',12,'2018-12-16 07:56:37','2018-12-16 07:56:37','quan-thun-71'),(72,'giày hoa',250000,'1544972290Giày-nam-họa-tiết-260.png','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:58:10','2018-12-16 07:58:10','giay-hoa-72'),(73,'giày xám cao cấp',390000,'1544972315giay-nam-giay-nam-giay-nam-1m4G3-yIjkeN_simg_ab1f47_350x350_maxb.png','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',16,'2018-12-16 07:58:35','2018-12-16 07:58:35','giay-xam-cao-cap-73'),(74,'áo thun xanh',250000,'154497251855004C-1-960x960-0.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',9,'2018-12-16 08:01:58','2018-12-16 08:01:58','ao-thun-xanh-74'),(75,'áo trễ vai',360000,'154497254020160825170840_95316.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',9,'2018-12-16 08:02:20','2018-12-16 08:02:20','ao-tre-vai-75'),(76,'áo thun cộc tay',260000,'1544972564a1d4857ca2448dbd6777a09085cc6560.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',9,'2018-12-16 08:02:44','2018-12-16 08:02:44','ao-thun-coc-tay-76'),(77,'quần ống rộng',340000,'15449725961_dc86b431-21ee-465c-95ec-131df0585ccd_grande.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',13,'2018-12-16 08:03:16','2018-12-16 08:03:16','quan-ong-rong-77'),(78,'quần thun xám',250000,'1544972615sahadeal.vn-14781298084138.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',13,'2018-12-16 08:03:35','2018-12-16 08:03:35','quan-thun-xam-78'),(79,'giày đế cao',650000,'1544972657gbn63-3.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',17,'2018-12-16 08:04:17','2018-12-16 08:04:17','giay-de-cao-79'),(80,'giày trắng',720000,'1544972676giay-nu-the-thao-sport-moi-2018-vahs-1m4G3-2RkIXW_simg_d0daf0_800x1200_max.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',17,'2018-12-16 08:04:36','2018-12-16 08:04:36','giay-trang-80'),(81,'giày da cao cấp',260000,'1544972691giay-nu-the-thao-sport-moi-2018-vahs-1m4G3-2RkIXW_simg_d0daf0_800x1200_max.jpg','Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật',17,'2018-12-16 08:04:51','2018-12-16 08:04:51','giay-da-cao-cap-81');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsize`
--

DROP TABLE IF EXISTS `productsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productsize` (
  `size_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_image_idproduct_image` int(10) NOT NULL,
  PRIMARY KEY (`size_id`),
  KEY `fk_productsize_product_image1_idx` (`product_image_idproduct_image`),
  CONSTRAINT `fk_productsize_product_image1` FOREIGN KEY (`product_image_idproduct_image`) REFERENCES `product_image` (`idproduct_image`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsize`
--

LOCK TABLES `productsize` WRITE;
/*!40000 ALTER TABLE `productsize` DISABLE KEYS */;
INSERT INTO `productsize` VALUES (2,2,37,'2018-12-16 07:26:18','2018-12-16 07:26:18',0),(3,3,38,'2018-12-16 07:26:18','2018-12-16 07:26:18',0),(4,12,39,'2018-12-16 07:26:18','2018-12-16 07:26:18',0),(5,10,40,'2018-12-16 07:26:18','2018-12-16 07:26:18',0),(6,324,37,'2018-12-16 07:27:19','2018-12-16 07:27:19',0),(7,23,38,'2018-12-16 07:27:19','2018-12-16 07:27:19',0),(8,2,39,'2018-12-16 07:27:19','2018-12-16 07:27:19',0),(9,12,40,'2018-12-16 07:27:19','2018-12-16 07:27:19',0),(10,32,42,'2018-12-16 07:27:19','2018-12-16 07:27:19',0),(11,1,36,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(12,23,38,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(13,2,39,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(14,12,40,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(15,1,41,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(16,12,42,'2018-12-16 07:28:02','2018-12-16 07:28:02',0),(17,12,36,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(18,23,37,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(19,2,39,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(20,324,41,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(21,8,42,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(22,8,43,'2018-12-16 07:28:42','2018-12-16 07:28:42',0),(23,1,36,'2018-12-16 07:29:05','2018-12-16 07:29:05',0),(24,1,38,'2018-12-16 07:29:05','2018-12-16 07:29:05',0),(25,2,40,'2018-12-16 07:29:05','2018-12-16 07:29:05',0),(26,12,42,'2018-12-16 07:29:05','2018-12-16 07:29:05',0),(27,12,43,'2018-12-16 07:29:05','2018-12-16 07:29:05',0),(28,12,36,'2018-12-16 07:29:35','2018-12-16 07:29:35',0),(29,1,38,'2018-12-16 07:29:35','2018-12-16 07:29:35',0),(30,2,40,'2018-12-16 07:29:35','2018-12-16 07:29:35',0),(31,2,41,'2018-12-16 07:29:35','2018-12-16 07:29:35',0),(32,23,43,'2018-12-16 07:29:35','2018-12-16 07:29:35',0),(33,12,36,'2018-12-16 07:30:08','2018-12-16 07:30:08',0),(34,23,38,'2018-12-16 07:30:08','2018-12-16 07:30:08',0),(35,2,41,'2018-12-16 07:30:08','2018-12-16 07:30:08',0),(36,12,36,'2018-12-16 07:30:36','2018-12-16 07:30:36',0),(37,1,38,'2018-12-16 07:30:36','2018-12-16 07:30:36',0),(38,2,40,'2018-12-16 07:30:36','2018-12-16 07:30:36',0),(39,8,43,'2018-12-16 07:30:36','2018-12-16 07:30:36',0),(40,1,36,'2018-12-16 07:31:22','2018-12-16 07:31:22',0),(41,12,38,'2018-12-16 07:31:22','2018-12-16 07:31:22',0),(42,23,40,'2018-12-16 07:31:22','2018-12-16 07:31:22',0),(43,23,42,'2018-12-16 07:31:22','2018-12-16 07:31:22',0),(44,12,37,'2018-12-16 07:32:55','2018-12-16 07:32:55',0),(45,12,39,'2018-12-16 07:32:55','2018-12-16 07:32:55',0),(46,23,41,'2018-12-16 07:32:55','2018-12-16 07:32:55',0),(47,12,42,'2018-12-16 07:32:55','2018-12-16 07:32:55',0),(48,1,36,'2018-12-16 07:33:31','2018-12-16 07:33:31',0),(49,12,38,'2018-12-16 07:33:31','2018-12-16 07:33:31',0),(50,2,39,'2018-12-16 07:33:31','2018-12-16 07:33:31',0),(51,324,40,'2018-12-16 07:33:31','2018-12-16 07:33:31',0),(52,1,43,'2018-12-16 07:33:31','2018-12-16 07:33:31',0),(65,23,37,'2018-12-16 07:51:32','2018-12-16 07:51:32',0),(66,8,39,'2018-12-16 07:51:32','2018-12-16 07:51:32',0),(67,23,41,'2018-12-16 07:51:32','2018-12-16 07:51:32',0),(68,1,43,'2018-12-16 07:51:32','2018-12-16 07:51:32',0),(69,12,37,'2018-12-16 07:52:22','2018-12-16 07:52:22',0),(70,2,39,'2018-12-16 07:52:22','2018-12-16 07:52:22',0),(71,23,40,'2018-12-16 07:52:22','2018-12-16 07:52:22',0),(72,1,42,'2018-12-16 07:52:22','2018-12-16 07:52:22',0),(73,2,36,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(74,23,37,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(75,1,38,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(76,2,40,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(77,8,41,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(78,23,43,'2018-12-16 07:52:56','2018-12-16 07:52:56',0),(79,1,36,'2018-12-16 07:53:31','2018-12-16 07:53:31',0),(80,2,37,'2018-12-16 07:53:31','2018-12-16 07:53:31',0),(81,1,38,'2018-12-16 07:53:31','2018-12-16 07:53:31',0),(82,8,39,'2018-12-16 07:53:31','2018-12-16 07:53:31',0),(83,1,37,'2018-12-16 07:54:42','2018-12-16 07:54:42',0),(84,324,39,'2018-12-16 07:54:42','2018-12-16 07:54:42',0),(85,8,40,'2018-12-16 07:54:42','2018-12-16 07:54:42',0),(86,23,41,'2018-12-16 07:54:42','2018-12-16 07:54:42',0),(87,12,36,'2018-12-16 07:55:22','2018-12-16 07:55:22',0),(88,12,38,'2018-12-16 07:55:22','2018-12-16 07:55:22',0),(89,2,39,'2018-12-16 07:55:22','2018-12-16 07:55:22',0),(90,324,40,'2018-12-16 07:55:22','2018-12-16 07:55:22',0),(91,2,41,'2018-12-16 07:55:22','2018-12-16 07:55:22',0),(92,1,37,'2018-12-16 07:55:46','2018-12-16 07:55:46',0),(93,12,38,'2018-12-16 07:55:46','2018-12-16 07:55:46',0),(94,8,40,'2018-12-16 07:55:46','2018-12-16 07:55:46',0),(95,23,42,'2018-12-16 07:55:46','2018-12-16 07:55:46',0),(96,12,37,'2018-12-16 07:56:16','2018-12-16 07:56:16',0),(97,8,39,'2018-12-16 07:56:16','2018-12-16 07:56:16',0),(98,2,40,'2018-12-16 07:56:16','2018-12-16 07:56:16',0),(99,23,43,'2018-12-16 07:56:16','2018-12-16 07:56:16',0),(100,1,36,'2018-12-16 07:56:37','2018-12-16 07:56:37',0),(101,8,39,'2018-12-16 07:56:37','2018-12-16 07:56:37',0),(102,213,40,'2018-12-16 07:56:37','2018-12-16 07:56:37',0),(103,23,42,'2018-12-16 07:56:37','2018-12-16 07:56:37',0),(104,23,43,'2018-12-16 07:56:37','2018-12-16 07:56:37',0),(105,1,37,'2018-12-16 07:58:10','2018-12-16 07:58:10',0),(106,23,38,'2018-12-16 07:58:10','2018-12-16 07:58:10',0),(107,1,40,'2018-12-16 07:58:10','2018-12-16 07:58:10',0),(108,1,37,'2018-12-16 07:58:35','2018-12-16 07:58:35',0),(109,12,38,'2018-12-16 07:58:35','2018-12-16 07:58:35',0),(110,1,40,'2018-12-16 07:58:35','2018-12-16 07:58:35',0),(111,1,42,'2018-12-16 07:58:35','2018-12-16 07:58:35',0),(112,12,43,'2018-12-16 07:58:35','2018-12-16 07:58:35',0),(113,1,36,'2018-12-16 08:01:58','2018-12-16 08:01:58',0),(114,1,39,'2018-12-16 08:01:58','2018-12-16 08:01:58',0),(115,12,41,'2018-12-16 08:01:58','2018-12-16 08:01:58',0),(116,2,42,'2018-12-16 08:01:58','2018-12-16 08:01:58',0),(117,21,43,'2018-12-16 08:01:58','2018-12-16 08:01:58',0),(118,21,37,'2018-12-16 08:02:20','2018-12-16 08:02:20',0),(119,32,39,'2018-12-16 08:02:20','2018-12-16 08:02:20',0),(120,21,40,'2018-12-16 08:02:20','2018-12-16 08:02:20',0),(121,32,42,'2018-12-16 08:02:20','2018-12-16 08:02:20',0),(122,12,36,'2018-12-16 08:02:44','2018-12-16 08:02:44',0),(123,1,38,'2018-12-16 08:02:44','2018-12-16 08:02:44',0),(124,8,39,'2018-12-16 08:02:44','2018-12-16 08:02:44',0),(125,12,43,'2018-12-16 08:02:44','2018-12-16 08:02:44',0),(126,12,37,'2018-12-16 08:03:16','2018-12-16 08:03:16',0),(127,2,39,'2018-12-16 08:03:16','2018-12-16 08:03:16',0),(128,8,40,'2018-12-16 08:03:16','2018-12-16 08:03:16',0),(129,8,41,'2018-12-16 08:03:16','2018-12-16 08:03:16',0),(130,2,42,'2018-12-16 08:03:16','2018-12-16 08:03:16',0),(131,1,36,'2018-12-16 08:03:35','2018-12-16 08:03:35',0),(132,1,38,'2018-12-16 08:03:35','2018-12-16 08:03:35',0),(133,8,40,'2018-12-16 08:03:35','2018-12-16 08:03:35',0),(134,8,41,'2018-12-16 08:03:35','2018-12-16 08:03:35',0),(135,12,37,'2018-12-16 08:04:17','2018-12-16 08:04:17',0),(136,8,39,'2018-12-16 08:04:17','2018-12-16 08:04:17',0),(137,8,40,'2018-12-16 08:04:17','2018-12-16 08:04:17',0),(138,12,42,'2018-12-16 08:04:17','2018-12-16 08:04:17',0),(139,12,36,'2018-12-16 08:04:36','2018-12-16 08:04:36',0),(140,8,39,'2018-12-16 08:04:36','2018-12-16 08:04:36',0),(141,8,40,'2018-12-16 08:04:36','2018-12-16 08:04:36',0),(142,8,41,'2018-12-16 08:04:36','2018-12-16 08:04:36',0),(143,1,37,'2018-12-16 08:04:51','2018-12-16 08:04:51',0),(144,8,39,'2018-12-16 08:04:51','2018-12-16 08:04:51',0),(145,2,41,'2018-12-16 08:04:51','2018-12-16 08:04:51',0),(146,2,42,'2018-12-16 08:04:51','2018-12-16 08:04:51',0);
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
  `address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'quản trị viên1','quantrivien@gmail.com','$2y$10$jO0FTkfyRWNxeGhzsW7CyuJzNRfISBNaZPAq.0V.dVrS8plI5SKe2',3,'1544687485images.jpg',NULL,'0124256458','2018-12-10 09:02:44','2018-12-13 00:58:59'),(11,'nhân viên','nhanvien@gmail.com','$2y$10$fsoL20G8QeD7FOWH5nrViuvN7GDi8Ro9ry/xkIpps2Rg7oRjQaN4i',2,'default-avatar.jpeg',NULL,'01551656685','2018-12-10 09:03:04','2018-12-10 09:03:04'),(12,'khách hàng','khachhang@gmail.com','$2y$10$ONiZMvanl72sI4jpXRFQ/u/6F5YRS6XHgEOvtRFMicmh.ahDOElsC',1,'1544510381banner-fashion-588116619.jpg',NULL,'012251524515','2018-12-10 09:04:38','2018-12-12 23:46:51'),(13,'lê duy anh','leduyanh@gmail.com','$2y$10$uegrQHWglo2WkCHVx.OtWOx45.q.JL8wtEQXV9DgAqVTFZQidiUZ2',1,'default-avatar.jpeg',NULL,NULL,'2018-12-13 01:27:30','2018-12-13 01:27:30'),(14,'Phạm Văn Nguyên','nguyendeptrai@gmail.com','e10adc3949ba59abbe56e057f20f883e',1,'nguyendeptrai.jpg','thanh hóa','0947060528','2018-12-13 01:27:30','2019-05-01 14:54:19'),(15,'nguyen dep trai hahaha','hahahaha@gmail.com','e10adc3949ba59abbe56e057f20f883e',1,'nguyendeptrai.jpg','Quảng Xương - Thanh Hóa','0947060528','2019-04-25 16:06:30','2019-05-01 09:31:17'),(16,'nguyen','ngkhfjdkhf@gmail.com','e10adc3949ba59abbe56e057f20f883e',1,'',NULL,'121321354','2019-04-25 17:19:09','2019-04-25 17:19:09'),(17,'nguyenpham','sljflksajfklsdjf@gmail.com','11041998bkhn',1,'',NULL,'131454564','2019-04-25 17:33:49','2019-04-29 16:35:03');
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

-- Dump completed on 2019-05-02  0:28:13
