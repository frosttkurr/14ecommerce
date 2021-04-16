/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - db_paktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_paktikum_prognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_paktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

LOCK TABLES `admin_notifications` WRITE;

UNLOCK TABLES;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

LOCK TABLES `admins` WRITE;

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values 
(1,'coba123','2e3b95f861f9685e17c4bb5c356881b7','','','',NULL,NULL,NULL),
(2,'awan08','$2y$10$Il/Rz8Dqn8KLdePf.LOVWeAFVvRg.zHf6cNMh1/EWaVBcgTgkvicG','awan','IMG_8788.JPG','085237594798',NULL,'2021-03-14 05:00:09','2021-03-14 05:00:09'),
(5,'vigyan08','$2y$10$DFNi8oK.qBzyDJmpOPd6yeXN8OFFVRRUTSpSNyk3sdwY1HAAR/X2e','vigyan','IMG_8796.JPG','082247716884',NULL,'2021-03-14 05:08:48','2021-03-14 05:08:48'),
(6,'kristi08','$2y$10$wguh1ZwJ9/.E2VYZHyu5hO337AE70C6Ihn.wjWZGBXTmBQtNziBVO','kristi','IMG_8796.JPG','083723673884',NULL,'2021-03-14 05:11:59','2021-03-14 05:11:59'),
(7,'mama08','$2y$10$jlEbXo9czlU5Xl7CHE/Qe.1Cj0kmm2gEV6n1dVONGzaeC8J5OD0ki','mama','IMG_8788.JPG','0839738749',NULL,'2021-03-14 05:14:26','2021-03-14 05:14:26'),
(8,'uhuy123','$2y$10$tLJciG39uk1DcDP4oPMrX.CbEZndFClUzlFjtfB.NqW4AfNuEsJw2','uhuy08','des2.png','0290389479',NULL,'2021-03-14 05:18:45','2021-03-14 05:18:45'),
(9,'jaya123','$2y$10$ME60U7jCePvc.UxT4Gd/RuYjcOuFQQKWZcUAAiinu4n.f9JsXhd0u','jaya','IMG_8796.JPG','020847479',NULL,'2021-03-16 13:19:27','2021-03-16 13:19:27'),
(10,'pastibisa08','$2y$10$t/43nuASSK5EYc52.XJYbeZogcOnCIw2SiaJ44jB/KjQCipOOXeuW','pastibisa','IMG_8796.JPG','08733474970',NULL,'2021-03-17 14:23:21','2021-03-17 14:23:21'),
(12,'sukses123','2e3b95f861f9685e17c4bb5c356881b7','sukses','','086327188173',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

LOCK TABLES `carts` WRITE;

UNLOCK TABLES;

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

LOCK TABLES `couriers` WRITE;

insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`) values 
(3,'JNT','2021-03-17 09:16:31','2021-03-17 09:16:47');

UNLOCK TABLES;

/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

LOCK TABLES `discounts` WRITE;

insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values 
(1,1,20,'2021-04-03','2021-04-05','2021-04-03 14:45:42','2021-04-03 14:45:42');

UNLOCK TABLES;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

LOCK TABLES `failed_jobs` WRITE;

UNLOCK TABLES;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_02_15_123603_create_admins_table',1),
(4,'2019_02_15_123744_create_sellers_table',1),
(5,'2019_02_15_125445_create_products_table',1),
(6,'2019_02_15_130341_create_product_images_table',1),
(7,'2019_02_15_131114_create_transactions_table',1),
(8,'2019_02_15_131132_create_transaction_details_table',1),
(9,'2019_02_15_132352_create_product_categories_table',1),
(10,'2019_02_15_132701_create_carts_table',1),
(11,'2019_02_15_134220_create_wishlists_table',1),
(12,'2019_02_16_044815_create_rates_table',1),
(13,'2019_02_16_045411_create_product_reviews_table',1),
(14,'2019_02_16_062504_create_qna_products_table',1),
(15,'2019_02_16_063238_create_shopping_voucers_table',1),
(16,'2019_02_16_064643_create_couriers_table',1),
(17,'2019_02_16_102028_create_notifications_table',1),
(18,'2019_02_16_103007_create_seller_notifications_table',1),
(19,'2019_02_16_103024_create_user_notifications_table',1),
(21,'2019_08_19_000000_create_failed_jobs_table',2);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('kitabisa@gmail.com','$2y$10$kq68rioOcPEnAROkYc661OCuESHE4PAQ6/IxmjHX5l1gs51./tqP2','2021-02-28 02:04:46');

UNLOCK TABLES;

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

LOCK TABLES `product_categories` WRITE;

insert  into `product_categories`(`id`,`category_name`,`created_at`,`updated_at`) values 
(1,'samsung','2021-03-19 01:28:57','2021-03-19 01:28:57'),
(3,'xiaomi','2021-03-19 14:53:14','2021-03-19 14:53:14'),
(6,'casi','2021-03-25 11:48:02','2021-03-25 11:48:11');

UNLOCK TABLES;

/*Table structure for table `product_category_details` */

DROP TABLE IF EXISTS `product_category_details`;

CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

LOCK TABLES `product_category_details` WRITE;

insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values 
(1,1,1,'2021-04-03 14:24:24','2021-04-03 14:24:24');

UNLOCK TABLES;

/*Table structure for table `product_images` */

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

LOCK TABLES `product_images` WRITE;

insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values 
(1,1,'8076_.jpg','2021-03-24 13:46:08','2021-03-24 13:46:08'),
(2,2,'9728_.png','2021-03-25 12:55:52','2021-03-25 12:55:52'),
(3,3,'4115_.jpg','2021-03-27 23:04:25','2021-03-27 23:04:25'),
(5,1,'1617460307_.png','2021-04-03 14:31:47','2021-04-03 14:31:47');

UNLOCK TABLES;

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

LOCK TABLES `product_reviews` WRITE;

UNLOCK TABLES;

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

LOCK TABLES `products` WRITE;

insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`weight`) values 
(1,'xiamo',3000000,'good',4,'2021-03-24 13:46:08','2021-03-24 13:46:08',12,23),
(2,'apa',80000,'jelek',3,'2021-03-25 12:55:52','2021-03-25 12:55:52',32,6),
(3,'iphone 6s',80000000,'wow',4,'2021-03-27 23:04:25','2021-03-27 23:04:25',6,5);

UNLOCK TABLES;

/*Table structure for table `response` */

DROP TABLE IF EXISTS `response`;

CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `response` */

LOCK TABLES `response` WRITE;

UNLOCK TABLES;

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

LOCK TABLES `transaction_details` WRITE;

UNLOCK TABLES;

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired','canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

LOCK TABLES `transactions` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

LOCK TABLES `user_notifications` WRITE;

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'vigyan','vigyanmelati@yahoo.com','','aktif',NULL,'27e80ebc907bd57004986be9e6f2dd83',NULL,NULL,NULL),
(2,'test','test456@gmail.com','user.png',NULL,NULL,'3e98af29b5b023bcc4be360047ce9aef',NULL,'2021-02-21 05:47:22','2021-02-21 05:47:22'),
(3,'coba123','coba123@gmail.com','Blue and Red Formal School Lunch Menu(2).png',NULL,NULL,'f27bb2d0162506ad34f6fae9ff572862',NULL,'2021-02-21 05:58:30','2021-02-21 05:58:30'),
(4,'vimel','vimel28@gmail.com','S__123199492.jpg',NULL,NULL,'c17c4015d9ea107035a99045906a8b17',NULL,'2021-02-25 12:49:15','2021-02-25 12:49:15'),
(5,'ekawati','ekawati08@gmail.com','Blue and Red Formal School Lunch Menu(2).png',NULL,NULL,'ba93782e3d9c548c6699a6c80f10b8d9',NULL,'2021-02-25 12:55:22','2021-02-25 12:55:22'),
(6,'bisauhuy','bisauhuy@gmail.com','S__123199492.jpg',NULL,NULL,'1ca1a5c0c879c49190f11bf6e8e29771',NULL,'2021-02-25 12:56:52','2021-02-25 12:56:52'),
(7,'kitabisa','kitabisa@gmail.com','bg',NULL,NULL,'c3ec0f7b054e729c5a716c8125839829',NULL,NULL,NULL),
(8,'kitacoba','kitacoba@gmail.com',NULL,NULL,NULL,'$2y$10$CDv5ZFhv2yZFpx71S34qwukUlr0r17SntTGKSRAvOtY9VPeMu21WW',NULL,'2021-02-28 02:04:00','2021-02-28 02:04:00'),
(9,'melati08','melati08@gmail.com','S__123199492.jpg','Sudah Terdaftar',NULL,'$2y$10$.qI.B0HLn4LYRzED/ZW4QeFn6EerPv/lH50t0gne5UYoCh7a3vUQS',NULL,'2021-02-28 02:10:09','2021-02-28 02:10:09'),
(10,'rustiawan','rustiawan@gmail.com','index.jpg','Sudah Terdaftar','2021-02-28 04:17:47','$2y$10$hmj3HZZBxIs7IpybA79GCOflPXdS.d0xHLDrrmv.OfR7XZZyUe1sa','4moRHfw73UVEm9nEgyiNHzFntulAOMT661gCMw0YEg37px9khZynq39gAXRR','2021-02-28 04:17:05','2021-02-28 04:19:00'),
(11,'vigyan234','vigyan234@gmail.com','index.jpg','Sudah Terdaftar',NULL,'$2y$10$9FSBj9aTsVYGvrs5wuA8uO.BleP89RDohVqt5vQh4tXIjYpcZIRDe',NULL,'2021-02-28 05:52:56','2021-02-28 05:52:56'),
(12,'cobacoba','kristikumala@gmail.com','IMG_8788.JPG',NULL,NULL,'$2y$10$WGLK5Z2S7ujBXndSelogYO2vRKonsVVIioS4LiWuwhjyGjD8mxpRu',NULL,'2021-03-17 12:19:26','2021-03-17 12:19:26'),
(13,'vigyanmelati','vigyanmelati08@yahoo.com',NULL,NULL,NULL,'$2y$10$NR1HKzLNjeJUkKzhzKraXeVjnRBv8RHb3/BKl1X/MiTTL1kivAMc.',NULL,'2021-03-19 00:19:25','2021-03-19 00:19:25'),
(14,'kusuma','kusumadewi@gmail.com',NULL,NULL,NULL,'$2y$10$x5n5rSglka5Jsmn0fcfz6.3A3nUPuswfHTXYdH8zQfl.YXL63N2pm',NULL,'2021-03-19 00:27:44','2021-03-19 00:27:44'),
(15,'cobadulu','cobadulu@gmail.com','IMG_8788.JPG','Sudah Terdaftar','2021-03-24 12:19:52','$2y$10$Jt./odmpBgLorwC9AOh8Iu58bXEdbUqdZyDwApNlZwQgWRWFa8HIm',NULL,'2021-03-24 12:17:53','2021-03-24 12:19:52'),
(16,'komang','komang@gmail.com','user.png','1','2021-03-25 05:23:33','$2y$10$GILlXAxeR6RdwGmVSsD/5OwJAJilxPer27E8TKN8X23/YeNd.5AGe',NULL,'2021-03-25 05:23:05','2021-03-25 05:23:33'),
(17,'ayu','ayu@gmail.com','user.png','1','2021-03-25 10:56:08','$2y$10$ig7sYYu.q9UzqaN5ZPq1Ueofgv813nSwIT3nFYSlQ40b3fMofVbuS',NULL,'2021-03-25 10:55:41','2021-03-25 10:56:08');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
