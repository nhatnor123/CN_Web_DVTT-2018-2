-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 16, 2018 lúc 04:05 PM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashionshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `created_at`, `updated_at`, `title`, `description`, `images`) VALUES
(9, '2018-12-04 07:03:59', '2018-12-06 00:06:51', 'Thời trang nữ', 'Bộ sưu tập ưa thích của bạn. Giảm giá lên đến 90%', '1544079642Jenny-Packham-bridesmaids-banner-e1515440096808.jpg'),
(10, '2018-12-04 17:54:31', '2018-12-06 00:08:46', 'Thời trang nam', 'Thương hiệu thời trang nam Hàn Quốc đẹp giá rẻ', '1544080126cropped-image-for-banner-sized.jpg'),
(11, '2018-12-06 00:08:41', '2018-12-06 00:08:41', 'Fashionshop tưng bừng khai trương', 'Mua sắm thả ga không lo về giá', '1544080121banner-fashion-588116619.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `sex`, `created_at`, `updated_at`) VALUES
(8, 'áo', '1', '2018-12-05 02:00:03', '2018-12-05 02:00:03'),
(9, 'áo', '0', '2018-12-05 02:00:03', '2018-12-05 02:00:03'),
(12, 'quần', '1', '2018-12-05 02:40:33', '2018-12-05 02:40:33'),
(13, 'quần', '0', '2018-12-05 02:40:33', '2018-12-05 02:40:33'),
(16, 'giày', '1', '2018-12-05 02:46:36', '2018-12-05 02:46:36'),
(17, 'giày', '0', '2018-12-05 02:46:36', '2018-12-05 02:46:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_11_09_080918_create_users_table', 1),
(2, '2018_11_09_081552_create_categories_table', 2),
(3, '2018_11_09_081726_create_products_table', 3),
(4, '2018_11_09_082627_create_comments_table', 4),
(5, '2018_11_09_083430_create_orders_table', 5),
(6, '2018_11_09_084157_create_order_details_table', 6),
(7, '2018_12_04_125829_create_banner_table', 7),
(8, '2018_12_13_150854_create_productsize_table', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `id`, `address`, `phone`, `pay`, `created_at`, `updated_at`, `email`, `status`) VALUES
(1, 10, 'quản trị viên1, dsadasda', '0124256458', '2750000', '2018-12-14 02:25:49', '2018-12-14 02:36:40', 'quantrivien@gmail.com', 'Đã hủy!');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `pr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `pr_name`, `price`, `avatar`, `images`, `description`, `category_id`, `created_at`, `updated_at`, `slug`) VALUES
(48, 'áo thun', 170000, '154497037808_407773-510x570.jpg', '154497037808_407773-510x570.jpg,1544970378Ao_nam_tay_dai_thun_4_chieu_co_gian_tot_b8888.JPG,1544970378ao-khoac-nam-uniqlo-3-lop--wm54.png', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:26:18', '2018-12-16 07:26:18', 'ao-thun-48'),
(49, 'áo nỉ cao cấp', 200000, '154497043941CCgIU5rhL.jpg', '1544970439ao-khoac-nam-uniqlo-3-lop--wm54.png,15449704391705_9_1.jpg,1544970439Ao_nam_tay_dai_thun_4_chieu_co_gian_tot_b8888.JPG', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:27:19', '2018-12-16 07:27:19', 'ao-ni-cao-cap-49'),
(50, 'áo ấm mới', 350000, '15449704821705_9_1.jpg', '15449704821705_9_1.jpg,1544970482ao-thun-tay-lung-1-form-11.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:28:02', '2018-12-16 07:28:02', 'ao-am-moi-50'),
(51, 'áo nam tay dài', 230000, '1544970522Ao_nam_tay_dai_thun_4_chieu_co_gian_tot_b8888.JPG', '1544970522ao-khoac-nam-uniqlo-3-lop--wm54.png,1544970522ao-nam-chat-da-ca-day-dep-1475315524-708296-1475315524.jpg,1544970522ao-so-mi-nam-3.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:28:42', '2018-12-16 07:28:42', 'ao-nam-tay-dai-51'),
(52, 'áo khoác nam', 420000, '1544970545ao-khoac-nam-uniqlo-3-lop--wm54.png', '1544970545ao-nam-14112016173441.jpg,1544970545ao-nam-chat-da-ca-day-dep-1475315524-708296-1475315524.jpg,1544970545ao-somi-lua-nam-cao-capao-somi-namao-nam-somiao-so-mi-nam-1m4G3-6IwJjC_simg_ab1f47_350x350_maxb.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:29:05', '2018-12-16 07:29:05', 'ao-khoac-nam-52'),
(53, 'áo nam xắn tay', 180000, '1544970575ao-nam-14112016173441.jpg', '1544970575ao-nam-chat-da-ca-day-dep-1475315524-708296-1475315524.jpg,1544970575ao-somi-lua-nam-cao-capao-somi-namao-nam-somiao-so-mi-nam-1m4G3-6IwJjC_simg_ab1f47_350x350_maxb.jpg,1544970575ao-so-mi-nam-3.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:29:35', '2018-12-16 07:29:35', 'ao-nam-xan-tay-53'),
(54, 'áo sơ mi đẹp', 260000, '1544970608ao-somi-lua-nam-cao-capao-somi-namao-nam-somiao-so-mi-nam-1m4G3-6IwJjC_simg_ab1f47_350x350_maxb.jpg', '1544970608ao-so-mi-nam-3.jpg,1544970608sm142-m-l-xl.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:30:08', '2018-12-16 07:30:08', 'ao-so-mi-dep-54'),
(55, 'áo thun tay lửng', 99000, '1544970636ao-thun-tay-lung-1-form-11.jpg', '1544970636chon-ao-khoac-nam-2.jpg,1544970636IMG_8193.jpg,1544970636Nam-o-kho-c-qu-n-s-ng-y-trang-qu-n-o-nam-o-kho.jpg_640x640.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:30:36', '2018-12-16 07:30:36', 'ao-thun-tay-lung-55'),
(56, 'áo sơ mi đen', 260000, '1544970682sm142-m-l-xl.jpg', '1544970682ao-somi-lua-nam-cao-capao-somi-namao-nam-somiao-so-mi-nam-1m4G3-6IwJjC_simg_ab1f47_350x350_maxb.jpg,1544970682ao-so-mi-nam-3.jpg,1544970682ao-thun-tay-lung-1-form-11.jpg', 'Chất liệu vải jean thô dày bền bỉ\r\n\r\nMàu vải được nhộm kỹ hạn chế ra màu khi giặt\r\n\r\nForm áo rộng trẻ trung\r\n\r\nĐường may tinh tế, chuẩn từng chi tiết\r\n\r\nThiết kế vá rách nổi bật', 8, '2018-12-16 07:31:22', '2018-12-16 07:31:22', 'ao-so-mi-den-56'),
(57, 'áo khoác ấm', 460000, '1544970775chon-ao-khoac-nam-2.jpg', NULL, 'mô tả', 8, '2018-12-16 07:32:55', '2018-12-16 07:32:55', 'ao-khoac-am-57'),
(58, 'áo cộc tay', 120000, '1544970811IMG_8193.jpg', '154497081108_407773-510x570.jpg,1544970811tải xuống.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 8, '2018-12-16 07:33:31', '2018-12-16 07:33:31', 'ao-coc-tay-58'),
(63, 'giày đen đế trắn', 260000, '15449718924e29f0a1804e3ddc742622f915810cf5.jpg', '1544971892changeshop.jpg,1544971892giay-nam-chat-lu-1477330598-1009088-1477330598.jpg,1544971892Giày-nam-họa-tiết-260.png', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:51:32', '2018-12-16 07:51:32', 'giay-den-de-tran-63'),
(64, 'quần kaki xanh', 900000, '15449719424_1.jpg', NULL, 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 12, '2018-12-16 07:52:22', '2018-12-16 07:52:22', 'quan-kaki-xanh-64'),
(65, 'quần vải', 299000, '1544971976quan-tay-den-qt92-8705-slide-products-59aff20aee155.jpg', '1544971976f71c99dafcc0a6cc951b05384b4afaaf.jpg,1544971976quan-jogger-ni-nam-1m4G3-FcCcSC.jpg,1544971976quan-tay-den-qt92-8705-slide-products-59aff20aee155.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 12, '2018-12-16 07:52:56', '2018-12-16 07:52:56', 'quan-vai-65'),
(66, 'giày da cao cấp', 600000, '15449720113897731870_1334666211.jpg', '1544972011225518035524img-0223.jpg,1544972011giay-nam-han-quoc-da-mau-den-kieu-dang-don-gian-ma-dep-ms-hq113-hq113.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:53:31', '2018-12-16 07:53:31', 'giay-da-cao-cap-66'),
(67, 'quần tụt', 300000, '154497208229213855_417626018699271_5367966155082301440_n.jpg', '1544972082quan-bo-1.jpg,1544972082quan-dai-nam-aristino-apa1701.jpg,1544972082quan-jogger-ni-nam-1m4G3-FcCcSC.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 12, '2018-12-16 07:54:42', '2018-12-16 07:54:42', 'quan-tut-67'),
(68, 'giày cao cấp', 950000, '1544972122giay-nam-rammstein-1499344779-1-3047370-1499344779.jpg', '1544972122changeshop.jpg,1544972122giay-nam-phong-cach-sport-1.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:55:22', '2018-12-16 07:55:22', 'giay-cao-cap-68'),
(69, 'giày sọc trắng', 500000, '1544972146giay-nam-phong-cach-sport-1.jpg', '1544972146changeshop.jpg,1544972146Giày-nam-họa-tiết-260.png', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:55:46', '2018-12-16 07:55:46', 'giay-soc-trang-69'),
(70, 'quần hiphop', 360000, '1544972176quan-bo-1.jpg', '1544972176quan-jogger-ni-nam-1m4G3-FcCcSC.jpg,1544972176quan-kaki-xanh-den-qk161-8271.jpg,1544972176quan-tay-den-qt92-8705-slide-products-59aff20aee155.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 12, '2018-12-16 07:56:16', '2018-12-16 07:56:16', 'quan-hiphop-70'),
(71, 'quần thun', 99000, '1544972197quan-dai-nam-aristino-apa1701.jpg', '154497219706144547388C376131VI32H01.jpg,1544972197quan-dai-nam-aristino-apa1701.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 12, '2018-12-16 07:56:37', '2018-12-16 07:56:37', 'quan-thun-71'),
(72, 'giày hoa', 250000, '1544972290Giày-nam-họa-tiết-260.png', '1544972290giay-nam-giay-nam-giay-nam-1m4G3-yIjkeN_simg_ab1f47_350x350_maxb.png', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:58:10', '2018-12-16 07:58:10', 'giay-hoa-72'),
(73, 'giày xám cao cấp', 390000, '1544972315giay-nam-giay-nam-giay-nam-1m4G3-yIjkeN_simg_ab1f47_350x350_maxb.png', '1544972315changeshop.jpg,1544972315giay-nam-chat-lu-1477330598-1009088-1477330598.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 16, '2018-12-16 07:58:35', '2018-12-16 07:58:35', 'giay-xam-cao-cap-73'),
(74, 'áo thun xanh', 250000, '154497251855004C-1-960x960-0.jpg', NULL, 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 9, '2018-12-16 08:01:58', '2018-12-16 08:01:58', 'ao-thun-xanh-74'),
(75, 'áo trễ vai', 360000, '154497254020160825170840_95316.jpg', '1544972540ao_so_mi_nu_co_dung_ca_tinh_7226.jpg,1544972540ao_so_mi_voan_co_v_chui_dau_ngan_tay__4__800x800.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 9, '2018-12-16 08:02:20', '2018-12-16 08:02:20', 'ao-tre-vai-75'),
(76, 'áo thun cộc tay', 260000, '1544972564a1d4857ca2448dbd6777a09085cc6560.jpg', '1544972564a0024de-ao-nu-tre-vai-den-dep-va-ca-tinh-hinh-anh-1.jpg,1544972564ao_so_mi_voan_co_v_chui_dau_ngan_tay__4__800x800.jpg,1544972564ao-kieu-nu-1m4G3-OS8Xpj_simg_ab1f47_350x350_maxb.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 9, '2018-12-16 08:02:44', '2018-12-16 08:02:44', 'ao-thun-coc-tay-76'),
(77, 'quần ống rộng', 340000, '15449725961_dc86b431-21ee-465c-95ec-131df0585ccd_grande.jpg', '1544972596quan-nu-quan-jean-nu-dep-glq041-1m4G3-GNtP0g_simg_d0daf0_800x1200_max.jpg,1544972596quan-tay-cong-so-quan-ton-dang-2.png,1544972596sahadeal.vn-14781298084138.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 13, '2018-12-16 08:03:16', '2018-12-16 08:03:16', 'quan-ong-rong-77'),
(78, 'quần thun xám', 250000, '1544972615sahadeal.vn-14781298084138.jpg', '1544972615quan-nu-quan-jean-nu-dep-glq041-1m4G3-GNtP0g_simg_d0daf0_800x1200_max.jpg,1544972615quan-tay-cong-so-quan-ton-dang-2.png,1544972615sahadeal.vn-14781298084138.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 13, '2018-12-16 08:03:35', '2018-12-16 08:03:35', 'quan-thun-xam-78'),
(79, 'giày đế cao', 650000, '1544972657gbn63-3.jpg', '1544972657giay-nu-co-cao-phong-cach-ca-tinh-bm065d-1m4G3-NwMN59_simg_ab1f47_350x350_maxb.jpg,1544972657giay-slip-nu-de-tang-chieu-cao-5cm-mau-den-gl80-1.jpg', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 17, '2018-12-16 08:04:17', '2018-12-16 08:04:17', 'giay-de-cao-79'),
(80, 'giày trắng', 720000, '1544972676giay-nu-the-thao-sport-moi-2018-vahs-1m4G3-2RkIXW_simg_d0daf0_800x1200_max.jpg', '1544972676giay-nu-teen-2018-hang-qc-1522567047-1-5798714-1522567047.jpg,1544972676giay-nu-thoi-trang-sh6064-gia-re.png', 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 17, '2018-12-16 08:04:36', '2018-12-16 08:04:36', 'giay-trang-80'),
(81, 'giày da cao cấp', 260000, '1544972691giay-nu-the-thao-sport-moi-2018-vahs-1m4G3-2RkIXW_simg_d0daf0_800x1200_max.jpg', NULL, 'Chất liệu vải jean thô dày bền bỉ Màu vải được nhộm kỹ hạn chế ra màu khi giặt Form áo rộng trẻ trung Đường may tinh tế, chuẩn từng chi tiết Thiết kế vá rách nổi bật', 17, '2018-12-16 08:04:51', '2018-12-16 08:04:51', 'giay-da-cao-cap-81');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productsize`
--

CREATE TABLE `productsize` (
  `size_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productsize`
--

INSERT INTO `productsize` (`size_id`, `quantity`, `size`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 2, 37, 48, '2018-12-16 07:26:18', '2018-12-16 07:26:18'),
(3, 3, 38, 48, '2018-12-16 07:26:18', '2018-12-16 07:26:18'),
(4, 12, 39, 48, '2018-12-16 07:26:18', '2018-12-16 07:26:18'),
(5, 10, 40, 48, '2018-12-16 07:26:18', '2018-12-16 07:26:18'),
(6, 324, 37, 49, '2018-12-16 07:27:19', '2018-12-16 07:27:19'),
(7, 23, 38, 49, '2018-12-16 07:27:19', '2018-12-16 07:27:19'),
(8, 2, 39, 49, '2018-12-16 07:27:19', '2018-12-16 07:27:19'),
(9, 12, 40, 49, '2018-12-16 07:27:19', '2018-12-16 07:27:19'),
(10, 32, 42, 49, '2018-12-16 07:27:19', '2018-12-16 07:27:19'),
(11, 1, 36, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(12, 23, 38, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(13, 2, 39, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(14, 12, 40, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(15, 1, 41, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(16, 12, 42, 50, '2018-12-16 07:28:02', '2018-12-16 07:28:02'),
(17, 12, 36, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(18, 23, 37, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(19, 2, 39, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(20, 324, 41, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(21, 8, 42, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(22, 8, 43, 51, '2018-12-16 07:28:42', '2018-12-16 07:28:42'),
(23, 1, 36, 52, '2018-12-16 07:29:05', '2018-12-16 07:29:05'),
(24, 1, 38, 52, '2018-12-16 07:29:05', '2018-12-16 07:29:05'),
(25, 2, 40, 52, '2018-12-16 07:29:05', '2018-12-16 07:29:05'),
(26, 12, 42, 52, '2018-12-16 07:29:05', '2018-12-16 07:29:05'),
(27, 12, 43, 52, '2018-12-16 07:29:05', '2018-12-16 07:29:05'),
(28, 12, 36, 53, '2018-12-16 07:29:35', '2018-12-16 07:29:35'),
(29, 1, 38, 53, '2018-12-16 07:29:35', '2018-12-16 07:29:35'),
(30, 2, 40, 53, '2018-12-16 07:29:35', '2018-12-16 07:29:35'),
(31, 2, 41, 53, '2018-12-16 07:29:35', '2018-12-16 07:29:35'),
(32, 23, 43, 53, '2018-12-16 07:29:35', '2018-12-16 07:29:35'),
(33, 12, 36, 54, '2018-12-16 07:30:08', '2018-12-16 07:30:08'),
(34, 23, 38, 54, '2018-12-16 07:30:08', '2018-12-16 07:30:08'),
(35, 2, 41, 54, '2018-12-16 07:30:08', '2018-12-16 07:30:08'),
(36, 12, 36, 55, '2018-12-16 07:30:36', '2018-12-16 07:30:36'),
(37, 1, 38, 55, '2018-12-16 07:30:36', '2018-12-16 07:30:36'),
(38, 2, 40, 55, '2018-12-16 07:30:36', '2018-12-16 07:30:36'),
(39, 8, 43, 55, '2018-12-16 07:30:36', '2018-12-16 07:30:36'),
(40, 1, 36, 56, '2018-12-16 07:31:22', '2018-12-16 07:31:22'),
(41, 12, 38, 56, '2018-12-16 07:31:22', '2018-12-16 07:31:22'),
(42, 23, 40, 56, '2018-12-16 07:31:22', '2018-12-16 07:31:22'),
(43, 23, 42, 56, '2018-12-16 07:31:22', '2018-12-16 07:31:22'),
(44, 12, 37, 57, '2018-12-16 07:32:55', '2018-12-16 07:32:55'),
(45, 12, 39, 57, '2018-12-16 07:32:55', '2018-12-16 07:32:55'),
(46, 23, 41, 57, '2018-12-16 07:32:55', '2018-12-16 07:32:55'),
(47, 12, 42, 57, '2018-12-16 07:32:55', '2018-12-16 07:32:55'),
(48, 1, 36, 58, '2018-12-16 07:33:31', '2018-12-16 07:33:31'),
(49, 12, 38, 58, '2018-12-16 07:33:31', '2018-12-16 07:33:31'),
(50, 2, 39, 58, '2018-12-16 07:33:31', '2018-12-16 07:33:31'),
(51, 324, 40, 58, '2018-12-16 07:33:31', '2018-12-16 07:33:31'),
(52, 1, 43, 58, '2018-12-16 07:33:31', '2018-12-16 07:33:31'),
(65, 23, 37, 63, '2018-12-16 07:51:32', '2018-12-16 07:51:32'),
(66, 8, 39, 63, '2018-12-16 07:51:32', '2018-12-16 07:51:32'),
(67, 23, 41, 63, '2018-12-16 07:51:32', '2018-12-16 07:51:32'),
(68, 1, 43, 63, '2018-12-16 07:51:32', '2018-12-16 07:51:32'),
(69, 12, 37, 64, '2018-12-16 07:52:22', '2018-12-16 07:52:22'),
(70, 2, 39, 64, '2018-12-16 07:52:22', '2018-12-16 07:52:22'),
(71, 23, 40, 64, '2018-12-16 07:52:22', '2018-12-16 07:52:22'),
(72, 1, 42, 64, '2018-12-16 07:52:22', '2018-12-16 07:52:22'),
(73, 2, 36, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(74, 23, 37, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(75, 1, 38, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(76, 2, 40, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(77, 8, 41, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(78, 23, 43, 65, '2018-12-16 07:52:56', '2018-12-16 07:52:56'),
(79, 1, 36, 66, '2018-12-16 07:53:31', '2018-12-16 07:53:31'),
(80, 2, 37, 66, '2018-12-16 07:53:31', '2018-12-16 07:53:31'),
(81, 1, 38, 66, '2018-12-16 07:53:31', '2018-12-16 07:53:31'),
(82, 8, 39, 66, '2018-12-16 07:53:31', '2018-12-16 07:53:31'),
(83, 1, 37, 67, '2018-12-16 07:54:42', '2018-12-16 07:54:42'),
(84, 324, 39, 67, '2018-12-16 07:54:42', '2018-12-16 07:54:42'),
(85, 8, 40, 67, '2018-12-16 07:54:42', '2018-12-16 07:54:42'),
(86, 23, 41, 67, '2018-12-16 07:54:42', '2018-12-16 07:54:42'),
(87, 12, 36, 68, '2018-12-16 07:55:22', '2018-12-16 07:55:22'),
(88, 12, 38, 68, '2018-12-16 07:55:22', '2018-12-16 07:55:22'),
(89, 2, 39, 68, '2018-12-16 07:55:22', '2018-12-16 07:55:22'),
(90, 324, 40, 68, '2018-12-16 07:55:22', '2018-12-16 07:55:22'),
(91, 2, 41, 68, '2018-12-16 07:55:22', '2018-12-16 07:55:22'),
(92, 1, 37, 69, '2018-12-16 07:55:46', '2018-12-16 07:55:46'),
(93, 12, 38, 69, '2018-12-16 07:55:46', '2018-12-16 07:55:46'),
(94, 8, 40, 69, '2018-12-16 07:55:46', '2018-12-16 07:55:46'),
(95, 23, 42, 69, '2018-12-16 07:55:46', '2018-12-16 07:55:46'),
(96, 12, 37, 70, '2018-12-16 07:56:16', '2018-12-16 07:56:16'),
(97, 8, 39, 70, '2018-12-16 07:56:16', '2018-12-16 07:56:16'),
(98, 2, 40, 70, '2018-12-16 07:56:16', '2018-12-16 07:56:16'),
(99, 23, 43, 70, '2018-12-16 07:56:16', '2018-12-16 07:56:16'),
(100, 1, 36, 71, '2018-12-16 07:56:37', '2018-12-16 07:56:37'),
(101, 8, 39, 71, '2018-12-16 07:56:37', '2018-12-16 07:56:37'),
(102, 213, 40, 71, '2018-12-16 07:56:37', '2018-12-16 07:56:37'),
(103, 23, 42, 71, '2018-12-16 07:56:37', '2018-12-16 07:56:37'),
(104, 23, 43, 71, '2018-12-16 07:56:37', '2018-12-16 07:56:37'),
(105, 1, 37, 72, '2018-12-16 07:58:10', '2018-12-16 07:58:10'),
(106, 23, 38, 72, '2018-12-16 07:58:10', '2018-12-16 07:58:10'),
(107, 1, 40, 72, '2018-12-16 07:58:10', '2018-12-16 07:58:10'),
(108, 1, 37, 73, '2018-12-16 07:58:35', '2018-12-16 07:58:35'),
(109, 12, 38, 73, '2018-12-16 07:58:35', '2018-12-16 07:58:35'),
(110, 1, 40, 73, '2018-12-16 07:58:35', '2018-12-16 07:58:35'),
(111, 1, 42, 73, '2018-12-16 07:58:35', '2018-12-16 07:58:35'),
(112, 12, 43, 73, '2018-12-16 07:58:35', '2018-12-16 07:58:35'),
(113, 1, 36, 74, '2018-12-16 08:01:58', '2018-12-16 08:01:58'),
(114, 1, 39, 74, '2018-12-16 08:01:58', '2018-12-16 08:01:58'),
(115, 12, 41, 74, '2018-12-16 08:01:58', '2018-12-16 08:01:58'),
(116, 2, 42, 74, '2018-12-16 08:01:58', '2018-12-16 08:01:58'),
(117, 21, 43, 74, '2018-12-16 08:01:58', '2018-12-16 08:01:58'),
(118, 21, 37, 75, '2018-12-16 08:02:20', '2018-12-16 08:02:20'),
(119, 32, 39, 75, '2018-12-16 08:02:20', '2018-12-16 08:02:20'),
(120, 21, 40, 75, '2018-12-16 08:02:20', '2018-12-16 08:02:20'),
(121, 32, 42, 75, '2018-12-16 08:02:20', '2018-12-16 08:02:20'),
(122, 12, 36, 76, '2018-12-16 08:02:44', '2018-12-16 08:02:44'),
(123, 1, 38, 76, '2018-12-16 08:02:44', '2018-12-16 08:02:44'),
(124, 8, 39, 76, '2018-12-16 08:02:44', '2018-12-16 08:02:44'),
(125, 12, 43, 76, '2018-12-16 08:02:44', '2018-12-16 08:02:44'),
(126, 12, 37, 77, '2018-12-16 08:03:16', '2018-12-16 08:03:16'),
(127, 2, 39, 77, '2018-12-16 08:03:16', '2018-12-16 08:03:16'),
(128, 8, 40, 77, '2018-12-16 08:03:16', '2018-12-16 08:03:16'),
(129, 8, 41, 77, '2018-12-16 08:03:16', '2018-12-16 08:03:16'),
(130, 2, 42, 77, '2018-12-16 08:03:16', '2018-12-16 08:03:16'),
(131, 1, 36, 78, '2018-12-16 08:03:35', '2018-12-16 08:03:35'),
(132, 1, 38, 78, '2018-12-16 08:03:35', '2018-12-16 08:03:35'),
(133, 8, 40, 78, '2018-12-16 08:03:35', '2018-12-16 08:03:35'),
(134, 8, 41, 78, '2018-12-16 08:03:35', '2018-12-16 08:03:35'),
(135, 12, 37, 79, '2018-12-16 08:04:17', '2018-12-16 08:04:17'),
(136, 8, 39, 79, '2018-12-16 08:04:17', '2018-12-16 08:04:17'),
(137, 8, 40, 79, '2018-12-16 08:04:17', '2018-12-16 08:04:17'),
(138, 12, 42, 79, '2018-12-16 08:04:17', '2018-12-16 08:04:17'),
(139, 12, 36, 80, '2018-12-16 08:04:36', '2018-12-16 08:04:36'),
(140, 8, 39, 80, '2018-12-16 08:04:36', '2018-12-16 08:04:36'),
(141, 8, 40, 80, '2018-12-16 08:04:36', '2018-12-16 08:04:36'),
(142, 8, 41, 80, '2018-12-16 08:04:36', '2018-12-16 08:04:36'),
(143, 1, 37, 81, '2018-12-16 08:04:51', '2018-12-16 08:04:51'),
(144, 8, 39, 81, '2018-12-16 08:04:51', '2018-12-16 08:04:51'),
(145, 2, 41, 81, '2018-12-16 08:04:51', '2018-12-16 08:04:51'),
(146, 2, 42, 81, '2018-12-16 08:04:51', '2018-12-16 08:04:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `level`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `avatar`, `phone`, `flag`) VALUES
(10, 'quản trị viên1', 'quantrivien@gmail.com', '$2y$10$jO0FTkfyRWNxeGhzsW7CyuJzNRfISBNaZPAq.0V.dVrS8plI5SKe2', 3, NULL, 'hWdm6649USNW9JC4ur9EFOhp0dyCkc05ZCImrC8U0bfhhaRCQBcAQOkHddT9', '2018-12-10 09:02:44', '2018-12-13 00:58:59', '1544687485images.jpg', '0124256458', 0),
(11, 'nhân viên', 'nhanvien@gmail.com', '$2y$10$fsoL20G8QeD7FOWH5nrViuvN7GDi8Ro9ry/xkIpps2Rg7oRjQaN4i', 2, NULL, NULL, '2018-12-10 09:03:04', '2018-12-10 09:03:04', 'default-avatar.jpeg', '01551656685', 0),
(12, 'khách hàng', 'khachhang@gmail.com', '$2y$10$ONiZMvanl72sI4jpXRFQ/u/6F5YRS6XHgEOvtRFMicmh.ahDOElsC', 1, NULL, 'C6q0AWxN03980DMzHG8iJNSJJO54OZGxdRuUqikADzXON9dB4ouF29NN6wJ1', '2018-12-10 09:04:38', '2018-12-12 23:46:51', '1544510381banner-fashion-588116619.jpg', '012251524515', 0),
(13, 'lê duy anh', 'leduyanh@gmail.com', '$2y$10$uegrQHWglo2WkCHVx.OtWOx45.q.JL8wtEQXV9DgAqVTFZQidiUZ2', 1, NULL, 'YTKRkL7NZ2Rf8xvIFOaYk76MW5nwwOwcCTf2omK7qye8mX4tryiUxhxsThRV', '2018-12-13 01:27:30', '2018-12-13 01:27:30', 'default-avatar.jpeg', NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comments_id_foreign` (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_id_foreign` (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `productsize`
--
ALTER TABLE `productsize`
  ADD PRIMARY KEY (`size_id`),
  ADD KEY `productsize_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `productsize`
--
ALTER TABLE `productsize`
  MODIFY `size_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--products
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `productsize`
--
ALTER TABLE `productsize`
  ADD CONSTRAINT `productsize_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
