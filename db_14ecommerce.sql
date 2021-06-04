/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.17-MariaDB : Database - db_paktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_paktikum_prognet` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_paktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

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

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values (10,'pastibisa08','$2y$10$t/43nuASSK5EYc52.XJYbeZogcOnCIw2SiaJ44jB/KjQCipOOXeuW','pastibisa','IMG_8796.JPG','08733474970',NULL,'2021-03-17 14:23:21','2021-03-17 14:23:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (17,15,3,1,NULL,'2021-05-29 14:39:51','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (24,15,3,1,NULL,'2021-05-30 12:26:46','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (25,15,2,1,NULL,'2021-05-30 15:07:43','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (27,15,3,1,NULL,'2021-05-30 19:32:04','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (30,15,1,1,NULL,'2021-05-31 10:07:32','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (31,15,1,1,NULL,'2021-05-31 10:10:14','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (32,15,2,1,NULL,'2021-05-31 13:02:56','checkedout');
insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values (33,15,2,1,NULL,'2021-05-31 13:08:54','checkedout');

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cities` */

insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (1,1,17,'Badung','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (2,1,32,'Bangli','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (3,1,94,'Buleleng','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (4,1,114,'Denpasar','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (5,1,128,'Gianyar','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (6,1,161,'Jembrana','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (7,1,170,'Karangasem','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (8,1,197,'Klungkung','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (9,1,447,'Tabanan','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (10,2,27,'Bangka','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (11,2,28,'Bangka Barat','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (12,2,29,'Bangka Selatan','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (13,2,30,'Bangka Tengah','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (14,2,56,'Belitung','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (15,2,57,'Belitung Timur','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (16,2,334,'Pangkal Pinang','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (17,3,106,'Cilegon','2021-05-15 01:31:33','2021-05-15 01:31:33');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (18,3,232,'Lebak','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (19,3,331,'Pandeglang','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (20,3,402,'Serang','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (21,3,403,'Serang','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (22,3,455,'Tangerang','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (23,3,456,'Tangerang','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (24,3,457,'Tangerang Selatan','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (25,4,62,'Bengkulu','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (26,4,63,'Bengkulu Selatan','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (27,4,64,'Bengkulu Tengah','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (28,4,65,'Bengkulu Utara','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (29,4,175,'Kaur','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (30,4,183,'Kepahiang','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (31,4,233,'Lebong','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (32,4,294,'Muko Muko','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (33,4,379,'Rejang Lebong','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (34,4,397,'Seluma','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (35,5,39,'Bantul','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (36,5,135,'Gunung Kidul','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (37,5,210,'Kulon Progo','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (38,5,419,'Sleman','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (39,5,501,'Yogyakarta','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (40,6,151,'Jakarta Barat','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (41,6,152,'Jakarta Pusat','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (42,6,153,'Jakarta Selatan','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (43,6,154,'Jakarta Timur','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (44,6,155,'Jakarta Utara','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (45,6,189,'Kepulauan Seribu','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (46,7,77,'Boalemo','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (47,7,88,'Bone Bolango','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (48,7,129,'Gorontalo','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (49,7,130,'Gorontalo','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (50,7,131,'Gorontalo Utara','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (51,7,361,'Pohuwato','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (52,8,50,'Batang Hari','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (53,8,97,'Bungo','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (54,8,156,'Jambi','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (55,8,194,'Kerinci','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (56,8,280,'Merangin','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (57,8,293,'Muaro Jambi','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (58,8,393,'Sarolangun','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (59,8,442,'Sungaipenuh','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (60,8,460,'Tanjung Jabung Barat','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (61,8,461,'Tanjung Jabung Timur','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (62,8,471,'Tebo','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (63,9,22,'Bandung','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (64,9,23,'Bandung','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (65,9,24,'Bandung Barat','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (66,9,34,'Banjar','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (67,9,54,'Bekasi','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (68,9,55,'Bekasi','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (69,9,78,'Bogor','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (70,9,79,'Bogor','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (71,9,103,'Ciamis','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (72,9,104,'Cianjur','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (73,9,107,'Cimahi','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (74,9,108,'Cirebon','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (75,9,109,'Cirebon','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (76,9,115,'Depok','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (77,9,126,'Garut','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (78,9,149,'Indramayu','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (79,9,171,'Karawang','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (80,9,211,'Kuningan','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (81,9,252,'Majalengka','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (82,9,332,'Pangandaran','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (83,9,376,'Purwakarta','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (84,9,428,'Subang','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (85,9,430,'Sukabumi','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (86,9,431,'Sukabumi','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (87,9,440,'Sumedang','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (88,9,468,'Tasikmalaya','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (89,9,469,'Tasikmalaya','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (90,10,37,'Banjarnegara','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (91,10,41,'Banyumas','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (92,10,49,'Batang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (93,10,76,'Blora','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (94,10,91,'Boyolali','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (95,10,92,'Brebes','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (96,10,105,'Cilacap','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (97,10,113,'Demak','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (98,10,134,'Grobogan','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (99,10,163,'Jepara','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (100,10,169,'Karanganyar','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (101,10,177,'Kebumen','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (102,10,181,'Kendal','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (103,10,196,'Klaten','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (104,10,209,'Kudus','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (105,10,249,'Magelang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (106,10,250,'Magelang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (107,10,344,'Pati','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (108,10,348,'Pekalongan','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (109,10,349,'Pekalongan','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (110,10,352,'Pemalang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (111,10,375,'Purbalingga','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (112,10,377,'Purworejo','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (113,10,380,'Rembang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (114,10,386,'Salatiga','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (115,10,398,'Semarang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (116,10,399,'Semarang','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (117,10,427,'Sragen','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (118,10,433,'Sukoharjo','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (119,10,445,'Surakarta (Solo)','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (120,10,472,'Tegal','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (121,10,473,'Tegal','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (122,10,476,'Temanggung','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (123,10,497,'Wonogiri','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (124,10,498,'Wonosobo','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (125,11,31,'Bangkalan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (126,11,42,'Banyuwangi','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (127,11,51,'Batu','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (128,11,74,'Blitar','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (129,11,75,'Blitar','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (130,11,80,'Bojonegoro','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (131,11,86,'Bondowoso','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (132,11,133,'Gresik','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (133,11,160,'Jember','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (134,11,164,'Jombang','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (135,11,178,'Kediri','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (136,11,179,'Kediri','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (137,11,222,'Lamongan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (138,11,243,'Lumajang','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (139,11,247,'Madiun','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (140,11,248,'Madiun','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (141,11,251,'Magetan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (142,11,255,'Malang','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (143,11,256,'Malang','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (144,11,289,'Mojokerto','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (145,11,290,'Mojokerto','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (146,11,305,'Nganjuk','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (147,11,306,'Ngawi','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (148,11,317,'Pacitan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (149,11,330,'Pamekasan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (150,11,342,'Pasuruan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (151,11,343,'Pasuruan','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (152,11,363,'Ponorogo','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (153,11,369,'Probolinggo','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (154,11,370,'Probolinggo','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (155,11,390,'Sampang','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (156,11,409,'Sidoarjo','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (157,11,418,'Situbondo','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (158,11,441,'Sumenep','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (159,11,444,'Surabaya','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (160,11,487,'Trenggalek','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (161,11,489,'Tuban','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (162,11,492,'Tulungagung','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (163,12,61,'Bengkayang','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (164,12,168,'Kapuas Hulu','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (165,12,176,'Kayong Utara','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (166,12,195,'Ketapang','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (167,12,208,'Kubu Raya','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (168,12,228,'Landak','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (169,12,279,'Melawi','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (170,12,364,'Pontianak','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (171,12,365,'Pontianak','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (172,12,388,'Sambas','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (173,12,391,'Sanggau','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (174,12,395,'Sekadau','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (175,12,415,'Singkawang','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (176,12,417,'Sintang','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (177,13,18,'Balangan','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (178,13,33,'Banjar','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (179,13,35,'Banjarbaru','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (180,13,36,'Banjarmasin','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (181,13,43,'Barito Kuala','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (182,13,143,'Hulu Sungai Selatan','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (183,13,144,'Hulu Sungai Tengah','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (184,13,145,'Hulu Sungai Utara','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (185,13,203,'Kotabaru','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (186,13,446,'Tabalong','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (187,13,452,'Tanah Bumbu','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (188,13,454,'Tanah Laut','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (189,13,466,'Tapin','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (190,14,44,'Barito Selatan','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (191,14,45,'Barito Timur','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (192,14,46,'Barito Utara','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (193,14,136,'Gunung Mas','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (194,14,167,'Kapuas','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (195,14,174,'Katingan','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (196,14,205,'Kotawaringin Barat','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (197,14,206,'Kotawaringin Timur','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (198,14,221,'Lamandau','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (199,14,296,'Murung Raya','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (200,14,326,'Palangka Raya','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (201,14,371,'Pulang Pisau','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (202,14,405,'Seruyan','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (203,14,432,'Sukamara','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (204,15,19,'Balikpapan','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (205,15,66,'Berau','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (206,15,89,'Bontang','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (207,15,214,'Kutai Barat','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (208,15,215,'Kutai Kartanegara','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (209,15,216,'Kutai Timur','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (210,15,341,'Paser','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (211,15,354,'Penajam Paser Utara','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (212,15,387,'Samarinda','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (213,16,96,'Bulungan (Bulongan)','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (214,16,257,'Malinau','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (215,16,311,'Nunukan','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (216,16,450,'Tana Tidung','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (217,16,467,'Tarakan','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (218,17,48,'Batam','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (219,17,71,'Bintan','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (220,17,172,'Karimun','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (221,17,184,'Kepulauan Anambas','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (222,17,237,'Lingga','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (223,17,302,'Natuna','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (224,17,462,'Tanjung Pinang','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (225,18,21,'Bandar Lampung','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (226,18,223,'Lampung Barat','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (227,18,224,'Lampung Selatan','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (228,18,225,'Lampung Tengah','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (229,18,226,'Lampung Timur','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (230,18,227,'Lampung Utara','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (231,18,282,'Mesuji','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (232,18,283,'Metro','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (233,18,355,'Pesawaran','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (234,18,356,'Pesisir Barat','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (235,18,368,'Pringsewu','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (236,18,458,'Tanggamus','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (237,18,490,'Tulang Bawang','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (238,18,491,'Tulang Bawang Barat','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (239,18,496,'Way Kanan','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (240,19,14,'Ambon','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (241,19,99,'Buru','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (242,19,100,'Buru Selatan','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (243,19,185,'Kepulauan Aru','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (244,19,258,'Maluku Barat Daya','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (245,19,259,'Maluku Tengah','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (246,19,260,'Maluku Tenggara','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (247,19,261,'Maluku Tenggara Barat','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (248,19,400,'Seram Bagian Barat','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (249,19,401,'Seram Bagian Timur','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (250,19,488,'Tual','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (251,20,138,'Halmahera Barat','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (252,20,139,'Halmahera Selatan','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (253,20,140,'Halmahera Tengah','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (254,20,141,'Halmahera Timur','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (255,20,142,'Halmahera Utara','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (256,20,191,'Kepulauan Sula','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (257,20,372,'Pulau Morotai','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (258,20,477,'Ternate','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (259,20,478,'Tidore Kepulauan','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (260,21,1,'Aceh Barat','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (261,21,2,'Aceh Barat Daya','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (262,21,3,'Aceh Besar','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (263,21,4,'Aceh Jaya','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (264,21,5,'Aceh Selatan','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (265,21,6,'Aceh Singkil','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (266,21,7,'Aceh Tamiang','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (267,21,8,'Aceh Tengah','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (268,21,9,'Aceh Tenggara','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (269,21,10,'Aceh Timur','2021-05-15 01:31:58','2021-05-15 01:31:58');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (270,21,11,'Aceh Utara','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (271,21,20,'Banda Aceh','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (272,21,59,'Bener Meriah','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (273,21,72,'Bireuen','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (274,21,127,'Gayo Lues','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (275,21,230,'Langsa','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (276,21,235,'Lhokseumawe','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (277,21,300,'Nagan Raya','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (278,21,358,'Pidie','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (279,21,359,'Pidie Jaya','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (280,21,384,'Sabang','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (281,21,414,'Simeulue','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (282,21,429,'Subulussalam','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (283,22,68,'Bima','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (284,22,69,'Bima','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (285,22,118,'Dompu','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (286,22,238,'Lombok Barat','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (287,22,239,'Lombok Tengah','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (288,22,240,'Lombok Timur','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (289,22,241,'Lombok Utara','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (290,22,276,'Mataram','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (291,22,438,'Sumbawa','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (292,22,439,'Sumbawa Barat','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (293,23,13,'Alor','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (294,23,58,'Belu','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (295,23,122,'Ende','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (296,23,125,'Flores Timur','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (297,23,212,'Kupang','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (298,23,213,'Kupang','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (299,23,234,'Lembata','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (300,23,269,'Manggarai','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (301,23,270,'Manggarai Barat','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (302,23,271,'Manggarai Timur','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (303,23,301,'Nagekeo','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (304,23,304,'Ngada','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (305,23,383,'Rote Ndao','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (306,23,385,'Sabu Raijua','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (307,23,412,'Sikka','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (308,23,434,'Sumba Barat','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (309,23,435,'Sumba Barat Daya','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (310,23,436,'Sumba Tengah','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (311,23,437,'Sumba Timur','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (312,23,479,'Timor Tengah Selatan','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (313,23,480,'Timor Tengah Utara','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (314,24,16,'Asmat','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (315,24,67,'Biak Numfor','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (316,24,90,'Boven Digoel','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (317,24,111,'Deiyai (Deliyai)','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (318,24,117,'Dogiyai','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (319,24,150,'Intan Jaya','2021-05-15 01:32:02','2021-05-15 01:32:02');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (320,24,157,'Jayapura','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (321,24,158,'Jayapura','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (322,24,159,'Jayawijaya','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (323,24,180,'Keerom','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (324,24,193,'Kepulauan Yapen (Yapen Waropen)','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (325,24,231,'Lanny Jaya','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (326,24,263,'Mamberamo Raya','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (327,24,264,'Mamberamo Tengah','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (328,24,274,'Mappi','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (329,24,281,'Merauke','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (330,24,284,'Mimika','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (331,24,299,'Nabire','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (332,24,303,'Nduga','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (333,24,335,'Paniai','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (334,24,347,'Pegunungan Bintang','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (335,24,373,'Puncak','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (336,24,374,'Puncak Jaya','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (337,24,392,'Sarmi','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (338,24,443,'Supiori','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (339,24,484,'Tolikara','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (340,24,495,'Waropen','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (341,24,499,'Yahukimo','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (342,24,500,'Yalimo','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (343,25,124,'Fakfak','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (344,25,165,'Kaimana','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (345,25,272,'Manokwari','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (346,25,273,'Manokwari Selatan','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (347,25,277,'Maybrat','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (348,25,346,'Pegunungan Arfak','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (349,25,378,'Raja Ampat','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (350,25,424,'Sorong','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (351,25,425,'Sorong','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (352,25,426,'Sorong Selatan','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (353,25,449,'Tambrauw','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (354,25,474,'Teluk Bintuni','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (355,25,475,'Teluk Wondama','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (356,26,60,'Bengkalis','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (357,26,120,'Dumai','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (358,26,147,'Indragiri Hilir','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (359,26,148,'Indragiri Hulu','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (360,26,166,'Kampar','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (361,26,187,'Kepulauan Meranti','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (362,26,207,'Kuantan Singingi','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (363,26,350,'Pekanbaru','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (364,26,351,'Pelalawan','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (365,26,381,'Rokan Hilir','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (366,26,382,'Rokan Hulu','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (367,26,406,'Siak','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (368,27,253,'Majene','2021-05-15 01:32:06','2021-05-15 01:32:06');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (369,27,262,'Mamasa','2021-05-15 01:32:06','2021-05-15 01:32:06');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (370,27,265,'Mamuju','2021-05-15 01:32:06','2021-05-15 01:32:06');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (371,27,266,'Mamuju Utara','2021-05-15 01:32:06','2021-05-15 01:32:06');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (372,27,362,'Polewali Mandar','2021-05-15 01:32:06','2021-05-15 01:32:06');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (373,28,38,'Bantaeng','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (374,28,47,'Barru','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (375,28,87,'Bone','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (376,28,95,'Bulukumba','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (377,28,123,'Enrekang','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (378,28,132,'Gowa','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (379,28,162,'Jeneponto','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (380,28,244,'Luwu','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (381,28,245,'Luwu Timur','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (382,28,246,'Luwu Utara','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (383,28,254,'Makassar','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (384,28,275,'Maros','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (385,28,328,'Palopo','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (386,28,333,'Pangkajene Kepulauan','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (387,28,336,'Parepare','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (388,28,360,'Pinrang','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (389,28,396,'Selayar (Kepulauan Selayar)','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (390,28,408,'Sidenreng Rappang/Rapang','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (391,28,416,'Sinjai','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (392,28,423,'Soppeng','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (393,28,448,'Takalar','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (394,28,451,'Tana Toraja','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (395,28,486,'Toraja Utara','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (396,28,493,'Wajo','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (397,29,25,'Banggai','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (398,29,26,'Banggai Kepulauan','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (399,29,98,'Buol','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (400,29,119,'Donggala','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (401,29,291,'Morowali','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (402,29,329,'Palu','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (403,29,338,'Parigi Moutong','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (404,29,366,'Poso','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (405,29,410,'Sigi','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (406,29,482,'Tojo Una-Una','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (407,29,483,'Toli-Toli','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (408,30,53,'Bau-Bau','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (409,30,85,'Bombana','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (410,30,101,'Buton','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (411,30,102,'Buton Utara','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (412,30,182,'Kendari','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (413,30,198,'Kolaka','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (414,30,199,'Kolaka Utara','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (415,30,200,'Konawe','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (416,30,201,'Konawe Selatan','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (417,30,202,'Konawe Utara','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (418,30,295,'Muna','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (419,30,494,'Wakatobi','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (420,31,73,'Bitung','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (421,31,81,'Bolaang Mongondow (Bolmong)','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (422,31,82,'Bolaang Mongondow Selatan','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (423,31,83,'Bolaang Mongondow Timur','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (424,31,84,'Bolaang Mongondow Utara','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (425,31,188,'Kepulauan Sangihe','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (426,31,190,'Kepulauan Siau Tagulandang Biaro (Sitaro)','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (427,31,192,'Kepulauan Talaud','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (428,31,204,'Kotamobagu','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (429,31,267,'Manado','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (430,31,285,'Minahasa','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (431,31,286,'Minahasa Selatan','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (432,31,287,'Minahasa Tenggara','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (433,31,288,'Minahasa Utara','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (434,31,485,'Tomohon','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (435,32,12,'Agam','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (436,32,93,'Bukittinggi','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (437,32,116,'Dharmasraya','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (438,32,186,'Kepulauan Mentawai','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (439,32,236,'Lima Puluh Koto/Kota','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (440,32,318,'Padang','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (441,32,321,'Padang Panjang','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (442,32,322,'Padang Pariaman','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (443,32,337,'Pariaman','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (444,32,339,'Pasaman','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (445,32,340,'Pasaman Barat','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (446,32,345,'Payakumbuh','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (447,32,357,'Pesisir Selatan','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (448,32,394,'Sawah Lunto','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (449,32,411,'Sijunjung (Sawah Lunto Sijunjung)','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (450,32,420,'Solok','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (451,32,421,'Solok','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (452,32,422,'Solok Selatan','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (453,32,453,'Tanah Datar','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (454,33,40,'Banyuasin','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (455,33,121,'Empat Lawang','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (456,33,220,'Lahat','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (457,33,242,'Lubuk Linggau','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (458,33,292,'Muara Enim','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (459,33,297,'Musi Banyuasin','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (460,33,298,'Musi Rawas','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (461,33,312,'Ogan Ilir','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (462,33,313,'Ogan Komering Ilir','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (463,33,314,'Ogan Komering Ulu','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (464,33,315,'Ogan Komering Ulu Selatan','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (465,33,316,'Ogan Komering Ulu Timur','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (466,33,324,'Pagar Alam','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (467,33,327,'Palembang','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (468,33,367,'Prabumulih','2021-05-15 01:32:14','2021-05-15 01:32:14');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (469,34,15,'Asahan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (470,34,52,'Batu Bara','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (471,34,70,'Binjai','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (472,34,110,'Dairi','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (473,34,112,'Deli Serdang','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (474,34,137,'Gunungsitoli','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (475,34,146,'Humbang Hasundutan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (476,34,173,'Karo','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (477,34,217,'Labuhan Batu','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (478,34,218,'Labuhan Batu Selatan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (479,34,219,'Labuhan Batu Utara','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (480,34,229,'Langkat','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (481,34,268,'Mandailing Natal','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (482,34,278,'Medan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (483,34,307,'Nias','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (484,34,308,'Nias Barat','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (485,34,309,'Nias Selatan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (486,34,310,'Nias Utara','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (487,34,319,'Padang Lawas','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (488,34,320,'Padang Lawas Utara','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (489,34,323,'Padang Sidempuan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (490,34,325,'Pakpak Bharat','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (491,34,353,'Pematang Siantar','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (492,34,389,'Samosir','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (493,34,404,'Serdang Bedagai','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (494,34,407,'Sibolga','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (495,34,413,'Simalungun','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (496,34,459,'Tanjung Balai','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (497,34,463,'Tapanuli Selatan','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (498,34,464,'Tapanuli Tengah','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (499,34,465,'Tapanuli Utara','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (500,34,470,'Tebing Tinggi','2021-05-15 01:32:16','2021-05-15 01:32:16');
insert  into `cities`(`id`,`province_id`,`city_id`,`title`,`created_at`,`updated_at`) values (501,34,481,'Toba Samosir','2021-05-15 01:32:16','2021-05-15 01:32:16');

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`) values (3,'JNE','2021-03-17 09:16:31','2021-03-17 09:16:47');
insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`) values (9,'TIKI','2021-05-30 00:18:43','2021-05-30 00:18:43');
insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`) values (10,'POS','2021-05-30 00:18:51','2021-05-30 00:18:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values (1,1,5,'2021-05-28','2021-06-13','2021-04-03 14:45:42','2021-05-27 18:16:32');
insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values (2,2,5,'2021-05-28','2021-06-13','2021-05-28 02:17:34',NULL);
insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values (3,3,7,'2021-05-30','2021-06-13','2021-05-28 02:18:14',NULL);
insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values (4,1,3,'2021-05-28','2021-06-13','2021-05-28 10:29:21',NULL);

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

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (2,'2014_10_12_100000_create_password_resets_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (3,'2019_02_15_123603_create_admins_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (4,'2019_02_15_123744_create_sellers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (5,'2019_02_15_125445_create_products_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (6,'2019_02_15_130341_create_product_images_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (7,'2019_02_15_131114_create_transactions_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (8,'2019_02_15_131132_create_transaction_details_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (9,'2019_02_15_132352_create_product_categories_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (10,'2019_02_15_132701_create_carts_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (11,'2019_02_15_134220_create_wishlists_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (12,'2019_02_16_044815_create_rates_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (13,'2019_02_16_045411_create_product_reviews_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (14,'2019_02_16_062504_create_qna_products_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (15,'2019_02_16_063238_create_shopping_voucers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (16,'2019_02_16_064643_create_couriers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (17,'2019_02_16_102028_create_notifications_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (18,'2019_02_16_103007_create_seller_notifications_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (19,'2019_02_16_103024_create_user_notifications_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (21,'2019_08_19_000000_create_failed_jobs_table',2);
insert  into `migrations`(`id`,`migration`,`batch`) values (22,'2021_05_15_012019_create_provinces_table',3);
insert  into `migrations`(`id`,`migration`,`batch`) values (23,'2021_05_15_012048_create_cities_table',3);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values ('kitabisa@gmail.com','$2y$10$kq68rioOcPEnAROkYc661OCuESHE4PAQ6/IxmjHX5l1gs51./tqP2','2021-02-28 02:04:46');

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

insert  into `product_categories`(`id`,`category_name`,`created_at`,`updated_at`) values (1,'Pocophone','2021-03-19 01:28:57','2021-03-19 01:28:57');
insert  into `product_categories`(`id`,`category_name`,`created_at`,`updated_at`) values (3,'Xiaomi','2021-03-19 14:53:14','2021-03-19 14:53:14');
insert  into `product_categories`(`id`,`category_name`,`created_at`,`updated_at`) values (6,'Apple','2021-03-25 11:48:02','2021-03-25 11:48:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values (1,1,1,'2021-04-03 14:24:24','2021-04-03 14:24:24');
insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values (2,2,1,'2021-04-24 23:45:02','2021-04-24 23:45:02');
insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values (3,1,3,'2021-05-22 00:12:57','2021-05-22 00:12:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values (6,2,'1619308002_.jpg','2021-04-24 23:46:42','2021-04-24 23:46:42');
insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values (7,3,'1619308025_.jpg','2021-04-24 23:47:05','2021-04-24 23:47:05');
insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values (8,1,'1619308039_.jpg','2021-04-24 23:47:19','2021-04-24 23:47:19');
insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values (10,1,'1621824512_.jpg','2021-05-24 02:48:32','2021-05-24 02:48:32');

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
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

insert  into `product_reviews`(`id`,`product_id`,`user_id`,`rate`,`content`,`created_at`,`updated_at`) values (1,2,17,5,'Mantap bagus banget!','2021-05-28 15:33:41','2021-05-28 15:33:41');
insert  into `product_reviews`(`id`,`product_id`,`user_id`,`rate`,`content`,`created_at`,`updated_at`) values (2,1,17,5,'Sangat recommended untuk gamer!','2021-05-29 17:01:25','2021-05-29 17:01:25');

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

insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`weight`) values (1,'Redmi Note 9 Pro',3000000,'Redmi Note 9 Pro dilengkapi dengan kamera quad level flagship. Kamera utama 64MP dengan jelas mengabadikan momen favoritmu dan lensa sudut ultra lebar, lensa makro, dan sensor kedalaman, akan memastikan kamu untuk mendapatkan hasil terbaik dari momen yang ingin kamu abadikan.',5,'2021-03-24 13:46:08','2021-05-30 20:52:24',50,1000);
insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`weight`) values (2,'Poco X3 Pro',3500000,'POCO adalah semua yang Anda butuhkan, tidak ada yang tidak Anda butuhkan.',5,'2021-03-25 12:55:52','2021-05-30 19:19:03',48,1000);
insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`weight`) values (3,'iPhone 12 Pro MAX',24000000,'Sistem kamera Pro yang menghadirkan fotografi pencahayaan rendah ke tingkat lebih tinggi — bahkan dengan peningkatan yang signifikan di iPhone 12 Pro Max. ',4,'2021-03-27 23:04:25','2021-05-30 13:31:49',32,1000);

/*Table structure for table `provinces` */

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `provinces` */

insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (1,1,'Bali','2021-05-15 01:31:30','2021-05-15 01:31:30');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (2,2,'Bangka Belitung','2021-05-15 01:31:31','2021-05-15 01:31:31');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (3,3,'Banten','2021-05-15 01:31:32','2021-05-15 01:31:32');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (4,4,'Bengkulu','2021-05-15 01:31:34','2021-05-15 01:31:34');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (5,5,'DI Yogyakarta','2021-05-15 01:31:35','2021-05-15 01:31:35');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (6,6,'DKI Jakarta','2021-05-15 01:31:36','2021-05-15 01:31:36');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (7,7,'Gorontalo','2021-05-15 01:31:38','2021-05-15 01:31:38');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (8,8,'Jambi','2021-05-15 01:31:39','2021-05-15 01:31:39');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (9,9,'Jawa Barat','2021-05-15 01:31:40','2021-05-15 01:31:40');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (10,10,'Jawa Tengah','2021-05-15 01:31:42','2021-05-15 01:31:42');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (11,11,'Jawa Timur','2021-05-15 01:31:44','2021-05-15 01:31:44');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (12,12,'Kalimantan Barat','2021-05-15 01:31:45','2021-05-15 01:31:45');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (13,13,'Kalimantan Selatan','2021-05-15 01:31:47','2021-05-15 01:31:47');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (14,14,'Kalimantan Tengah','2021-05-15 01:31:48','2021-05-15 01:31:48');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (15,15,'Kalimantan Timur','2021-05-15 01:31:49','2021-05-15 01:31:49');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (16,16,'Kalimantan Utara','2021-05-15 01:31:51','2021-05-15 01:31:51');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (17,17,'Kepulauan Riau','2021-05-15 01:31:52','2021-05-15 01:31:52');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (18,18,'Lampung','2021-05-15 01:31:53','2021-05-15 01:31:53');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (19,19,'Maluku','2021-05-15 01:31:55','2021-05-15 01:31:55');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (20,20,'Maluku Utara','2021-05-15 01:31:56','2021-05-15 01:31:56');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (21,21,'Nanggroe Aceh Darussalam (NAD)','2021-05-15 01:31:57','2021-05-15 01:31:57');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (22,22,'Nusa Tenggara Barat (NTB)','2021-05-15 01:31:59','2021-05-15 01:31:59');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (23,23,'Nusa Tenggara Timur (NTT)','2021-05-15 01:32:00','2021-05-15 01:32:00');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (24,24,'Papua','2021-05-15 01:32:01','2021-05-15 01:32:01');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (25,25,'Papua Barat','2021-05-15 01:32:03','2021-05-15 01:32:03');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (26,26,'Riau','2021-05-15 01:32:04','2021-05-15 01:32:04');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (27,27,'Sulawesi Barat','2021-05-15 01:32:05','2021-05-15 01:32:05');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (28,28,'Sulawesi Selatan','2021-05-15 01:32:07','2021-05-15 01:32:07');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (29,29,'Sulawesi Tengah','2021-05-15 01:32:08','2021-05-15 01:32:08');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (30,30,'Sulawesi Tenggara','2021-05-15 01:32:09','2021-05-15 01:32:09');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (31,31,'Sulawesi Utara','2021-05-15 01:32:10','2021-05-15 01:32:10');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (32,32,'Sumatera Barat','2021-05-15 01:32:12','2021-05-15 01:32:12');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (33,33,'Sumatera Selatan','2021-05-15 01:32:13','2021-05-15 01:32:13');
insert  into `provinces`(`id`,`province_id`,`title`,`created_at`,`updated_at`) values (34,34,'Sumatera Utara','2021-05-15 01:32:14','2021-05-15 01:32:14');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `response` */

insert  into `response`(`id`,`review_id`,`admin_id`,`content`,`created_at`,`updated_at`) values (1,1,10,'Terima kasih telah berbelanja di Phone Store! :) -Admin','2021-05-28 16:18:49','2021-05-28 16:18:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  KEY `id` (`id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

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

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'vigyan','vigyanmelati@yahoo.com','','aktif',NULL,'27e80ebc907bd57004986be9e6f2dd83',NULL,NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (2,'test','test456@gmail.com','user.png',NULL,NULL,'3e98af29b5b023bcc4be360047ce9aef',NULL,'2021-02-21 05:47:22','2021-02-21 05:47:22');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (3,'coba123','coba123@gmail.com','Blue and Red Formal School Lunch Menu(2).png',NULL,NULL,'f27bb2d0162506ad34f6fae9ff572862',NULL,'2021-02-21 05:58:30','2021-02-21 05:58:30');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (4,'vimel','vimel28@gmail.com','S__123199492.jpg',NULL,NULL,'c17c4015d9ea107035a99045906a8b17',NULL,'2021-02-25 12:49:15','2021-02-25 12:49:15');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (5,'ekawati','ekawati08@gmail.com','Blue and Red Formal School Lunch Menu(2).png',NULL,NULL,'ba93782e3d9c548c6699a6c80f10b8d9',NULL,'2021-02-25 12:55:22','2021-02-25 12:55:22');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (6,'bisauhuy','bisauhuy@gmail.com','S__123199492.jpg',NULL,NULL,'1ca1a5c0c879c49190f11bf6e8e29771',NULL,'2021-02-25 12:56:52','2021-02-25 12:56:52');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (7,'kitabisa','kitabisa@gmail.com','bg',NULL,NULL,'c3ec0f7b054e729c5a716c8125839829',NULL,NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (8,'kitacoba','kitacoba@gmail.com',NULL,NULL,NULL,'$2y$10$CDv5ZFhv2yZFpx71S34qwukUlr0r17SntTGKSRAvOtY9VPeMu21WW',NULL,'2021-02-28 02:04:00','2021-02-28 02:04:00');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (9,'melati08','melati08@gmail.com','S__123199492.jpg','Sudah Terdaftar',NULL,'$2y$10$.qI.B0HLn4LYRzED/ZW4QeFn6EerPv/lH50t0gne5UYoCh7a3vUQS',NULL,'2021-02-28 02:10:09','2021-02-28 02:10:09');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (10,'rustiawan','rustiawan@gmail.com','index.jpg','Sudah Terdaftar','2021-02-28 04:17:47','$2y$10$hmj3HZZBxIs7IpybA79GCOflPXdS.d0xHLDrrmv.OfR7XZZyUe1sa','4moRHfw73UVEm9nEgyiNHzFntulAOMT661gCMw0YEg37px9khZynq39gAXRR','2021-02-28 04:17:05','2021-02-28 04:19:00');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (11,'vigyan234','vigyan234@gmail.com','index.jpg','Sudah Terdaftar',NULL,'$2y$10$9FSBj9aTsVYGvrs5wuA8uO.BleP89RDohVqt5vQh4tXIjYpcZIRDe',NULL,'2021-02-28 05:52:56','2021-02-28 05:52:56');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (12,'cobacoba','kristikumala@gmail.com','IMG_8788.JPG',NULL,NULL,'$2y$10$WGLK5Z2S7ujBXndSelogYO2vRKonsVVIioS4LiWuwhjyGjD8mxpRu',NULL,'2021-03-17 12:19:26','2021-03-17 12:19:26');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (13,'vigyanmelati','vigyanmelati08@yahoo.com',NULL,NULL,NULL,'$2y$10$NR1HKzLNjeJUkKzhzKraXeVjnRBv8RHb3/BKl1X/MiTTL1kivAMc.',NULL,'2021-03-19 00:19:25','2021-03-19 00:19:25');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (14,'kusuma','kusumadewi@gmail.com',NULL,NULL,NULL,'$2y$10$x5n5rSglka5Jsmn0fcfz6.3A3nUPuswfHTXYdH8zQfl.YXL63N2pm',NULL,'2021-03-19 00:27:44','2021-03-19 00:27:44');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (15,'cobadulu','cobadulu@gmail.com','IMG_8788.PNG','Sudah Terdaftar','2021-03-24 12:19:52','$2y$10$Jt./odmpBgLorwC9AOh8Iu58bXEdbUqdZyDwApNlZwQgWRWFa8HIm',NULL,'2021-03-24 12:17:53','2021-03-24 12:19:52');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (16,'komang','komang@gmail.com','user.png','1','2021-03-25 05:23:33','$2y$10$GILlXAxeR6RdwGmVSsD/5OwJAJilxPer27E8TKN8X23/YeNd.5AGe',NULL,'2021-03-25 05:23:05','2021-03-25 05:23:33');
insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (17,'ayu','ayu@gmail.com','IMG_8788.PNG','1','2021-03-25 10:56:08','$2y$10$ig7sYYu.q9UzqaN5ZPq1Ueofgv813nSwIT3nFYSlQ40b3fMofVbuS',NULL,'2021-03-25 10:55:41','2021-03-25 10:56:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
