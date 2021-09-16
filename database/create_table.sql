-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: jspservletjdbc
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bxh`
--
USE `heroku_e12243d2329c42b`;

DROP TABLE IF EXISTS `bxh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bxh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameteam` varchar(255) NOT NULL,
  `nummatch` int(11) DEFAULT '0',
  `won` int(11) DEFAULT '0',
  `drawn` int(11) DEFAULT '0',
  `lost` int(11) DEFAULT '0',
  `gd` int(11) DEFAULT '0',
  `totalscore` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bxh`
--

LOCK TABLES `bxh` WRITE;
/*!40000 ALTER TABLE `bxh` DISABLE KEYS */;
INSERT INTO `bxh` VALUES (1,'Arsenal',0,0,0,0,0,0),(2,'Aston Villa',0,0,0,0,0,0),(3,'Brentford',0,0,0,0,0,0),(4,'Brighton & Hove Albion',0,0,0,0,0,0),(5,'Burnley',0,0,0,0,0,0),(6,'Chelsea',0,0,0,0,0,0),(7,'Crystal Palace',0,0,0,0,0,0),(8,'Everton',0,0,0,0,0,0),(9,'Leeds United',0,0,0,0,0,0),(10,'Leicester City',0,0,0,0,0,0),(11,'Liverpool',0,0,0,0,0,0),(12,'Manchester City',0,0,0,0,0,0),(13,'Manchester United',0,0,0,0,0,0),(14,'Newcastle United',0,0,0,0,0,0),(15,'Norwich City',0,0,0,0,0,0),(16,'Southampton',0,0,0,0,0,0),(17,'Tottenham Hotspur',0,0,0,0,0,0),(18,'Watford',0,0,0,0,0,0),(19,'West Ham United',0,0,0,0,0,0),(20,'Wolverhampton Wanderers',0,0,0,0,0,0);
/*!40000 ALTER TABLE `bxh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `percent` double DEFAULT '0',
  `view` bigint(20) DEFAULT '0',
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tin tức chung','tin-tuc-chung',18.75,53,NULL,NULL,NULL,NULL),(2,'Giải thưởng','giai-thuong',18.75,94,NULL,NULL,NULL,NULL),(3,'Cộng đồng','cong-dong',6.25,5,NULL,NULL,NULL,NULL),(4,'Tưởng nhớ','tuong-nho',0,0,NULL,NULL,NULL,NULL),(5,'Chiến thuật','chien-thuat',6.25,2,NULL,NULL,NULL,NULL),(6,'Chuyển nhượng','chuyen-nhuong',12.5,11,NULL,NULL,NULL,NULL),(7,'Tài năng trẻ','tai-nang-tre',0,0,NULL,NULL,NULL,NULL),(8,'Video','video',37.5,43,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `new_id` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_comment_news` (`new_id`),
  CONSTRAINT `fk_comment_news` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infoteam`
--

DROP TABLE IF EXISTS `infoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `infoteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameteam` varchar(255) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `stadium` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infoteam`
--

LOCK TABLES `infoteam` WRITE;
/*!40000 ALTER TABLE `infoteam` DISABLE KEYS */;
INSERT INTO `infoteam` VALUES (1,'Arsenal','ARS','https://resources.premierleague.com/premierleague/badges/50/t3.png','Emirates Stadium'),(2,'Aston Villa','AVL','https://resources.premierleague.com/premierleague/badges/50/t7.png','Villa Park'),(3,'Brentford','BRE','https://resources.premierleague.com/premierleague/badges/50/t94.png','Brentford Community Stadium'),(4,'Brighton & Hove Albion','BRI','https://resources.premierleague.com/premierleague/badges/50/t36.png','Falmer Stadium'),(5,'Burnley','BUR','https://resources.premierleague.com/premierleague/badges/50/t90.png','	Turf Moor'),(6,'Chelsea','CHE','https://resources.premierleague.com/premierleague/badges/50/t8.png','Stamford Bridge'),(7,'Crystal Palace','CRY','https://resources.premierleague.com/premierleague/badges/50/t31.png','Selhurst Park'),(8,'Everton','EVE','https://resources.premierleague.com/premierleague/badges/50/t11.png','Goodison Park'),(9,'Leeds United','LEE','https://resources.premierleague.com/premierleague/badges/50/t2.png','Elland Road'),(10,'Leicester City','LEI','https://resources.premierleague.com/premierleague/badges/50/t13.png','King Power Stadium'),(11,'Liverpool','LIV','https://resources.premierleague.com/premierleague/badges/50/t14.png','Anfield'),(12,'Manchester City','MCI','https://resources.premierleague.com/premierleague/badges/50/t43.png','City of Manchester Stadium'),(13,'Manchester United','MUN','https://resources.premierleague.com/premierleague/badges/50/t1.png','Old Trafford'),(14,'Newcastle United','NEW','https://resources.premierleague.com/premierleague/badges/50/t4.png','St James\' Park'),(15,'Norwich City','NOR','https://resources.premierleague.com/premierleague/badges/50/t45.png','Carrow Road'),(16,'Southampton','SOU','https://resources.premierleague.com/premierleague/badges/50/t20.png','St Mary\'s Stadium'),(17,'Tottenham Hotspur','TOT','https://resources.premierleague.com/premierleague/badges/50/t6.png','	Tottenham Hotspur Stadium'),(18,'Watford','WAT','https://resources.premierleague.com/premierleague/badges/50/t57.png','	Vicarage Road'),(19,'West Ham United','WHU','https://resources.premierleague.com/premierleague/badges/50/t21.png','	London Stadium'),(20,'Wolverhampton Wanderers','WOL','https://resources.premierleague.com/premierleague/badges/50/t39.png','Molineux Stadium');
/*!40000 ALTER TABLE `infoteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `shortdescription` text,
  `content` text,
  `categoryid` bigint(20) DEFAULT NULL,
  `rate` int(11) DEFAULT '0',
  `view` bigint(20) DEFAULT '0',
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_category` (`categoryid`),
  CONSTRAINT `fk_news_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Vị trí FPL: Dựa vào Kane trước các đội hạng thấp hơn','https://resources.premierleague.com/photos/2021/04/15/61412697-aa4a-49ce-8def-b3c5be5d6a2b/GettyImages-1231434479.jpg?width=909&height=620','The Scout về lý do tại sao tiền đạo của Spurs là cầu thủ năng suất nhất khi đối mặt với các đội nửa dưới','Tiền đạo Harry Kane thống trị hạng mục tiền đạo vào năm 2020/21, ghi 23 bàn và cung cấp 14 đường kiến ​​tạo trong 35 lần ra sân. Tiền đạo của Tottenham Hotspur đã ghi được 242 điểm trong sự nghiệp, chỉ đứng sau 244 của tiền vệ Bruno Fernandes của Manchester United . Thật vậy, tổng số điểm đó đã nhiều hơn 48 điểm so với tiền đạo ghi nhiều bàn thứ hai, Patrick Bamford cho Leeds United . Tất cả các bàn thắng 2020/21 của Kane Màn trình diễn của Kane trước các đối thủ thấp hơn trong bảng Premier League là chìa khóa thành công của anh ấy. Hầu hết các lượt về trước các đội 10 đội cuối Người chơi	Chức vụ	Lợi nhuận	Bàn thắng	Hỗ trợ Kane	FWD	22	14	số 8 Fernandes	MID	17	9	số 8 Bamford	FWD	16	13	3 Salah	MID	14	9	5 Rashford	MID	14	số 8	6 Con trai 	MID	14	số 8	6 Vardy	FWD	14	6	số 8 Anh ấy đã tạo ra 22 trong số 37 lần trở lại của mình cho chiến dịch chống lại các đội nửa dưới, với cả 14 bàn thắng và 8 pha kiến ​​tạo trong',1,1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(52,'Vị trí FPL: Lingard cho thấy lời hứa với phong độ hàng đầu của giải đấu','https://resources.premierleague.com/photos/2021/06/06/4bd4b73e-8d2e-4eec-bc15-93e0696d7c34/lingard-west-ham-cele.png?width=930&height=620','a','<h6 style=\"text-align:start\"><span style=\"font-size:1.8rem\"><span style=\"font-family:PremierSans-Bold,Arial,\"><span style=\"color:#37003c\"><span style=\"background-color:#ffffff\">Tiền vệ</span></span></span></span></h6>\n\n<p style=\"text-align:start\"><span style=\"font-size:14px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,\"><span style=\"background-color:#ffffff\">Việc chuyển đến&nbsp;<a href=\"https://www.premierleague.com/clubs/25/West-Ham-United/overview\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\">West Ham United</a>&nbsp;cho mượn&nbsp;đ&atilde; gi&uacute;p biến tiềm năng của Jesse Lingard trong Fantasy m&ugrave;a n&agrave;y.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:14px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,\"><span style=\"background-color:#ffffff\">Tiền vệ n&agrave;y đ&atilde; kh&ocirc;ng thể g&oacute;p mặt trong bất kỳ&nbsp;trận đấu n&agrave;o trong 21 trận đấu đầu ti&ecirc;n&nbsp;của&nbsp;<a href=\"https://www.premierleague.com/clubs/12/Manchester-United/overview\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\">Manchester United</a>&nbsp;trước khi gia nhập Hammers v&agrave;o th&aacute;ng Gi&ecirc;ng.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:14px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,\"><span style=\"background-color:#ffffff\">Tuy nhi&ecirc;n, Lingard đ&atilde; ph&aacute;t triển mạnh mẽ dưới thời David Moyes, ghi 9 b&agrave;n v&agrave; cung cấp 5 đường kiến ​​tạo sau 16 lần ra s&acirc;n.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:14px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,\"><span style=\"background-color:#ffffff\">Trung b&igrave;nh 6,6 điểm mỗi trận (ppm) của anh ấy giống với điểm của Bruno Fernandes, người đ&atilde; kết th&uacute;c m&ugrave;a giải với tư c&aacute;ch l&agrave; cầu thủ ghi nhiều điểm nhất trong Fantasy.&nbsp;</span></span></span></span></p>\n',1,1,4,'2021-06-08 19:10:25','2021-06-10 17:38:27','admin','admin'),(53,'Dias được mệnh danh là Cầu thủ xuất sắc nhất mùa của EA SPORTS','https://resources.premierleague.com/photos/2021/06/04/c951935a-93e1-45b2-ad65-01ea7c029642/SeasonAwards-GOTS-Winners.png?width=1000&height=563','','',2,0,0,'2021-06-08 19:14:50','2021-06-10 17:38:47','admin','admin'),(55,'Carragher: Dias đã lấp đầy khoảng trống mà Kompany để lại','https://resources.premierleague.com/photos/2021/07/02/bcc9cfa8-57b1-4de1-b1da-1e14c448aa5c/GettyImages-1318893041.jpg?width=860&height=573','','',3,0,5,'2021-06-08 19:15:47',NULL,'admin',NULL),(89,'Rót cho vơi bớt đi sầu lo - Sol7 x Yuno','https://resources.premierleague.com/photos/2021/06/06/4bd4b73e-8d2e-4eec-bc15-93e0696d7c34/lingard-west-ham-cele.png?width=930&height=620','','<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/RP7hGYHw9pY\" title=\"YouTube video player\" width=\"560\"></iframe></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:20px\"><em><strong>R&oacute;t cho vơi bớt đi sầu lo - Sol7</strong></em></span></p>\n',8,0,7,'2021-06-12 09:36:24','2021-06-25 08:16:16','admin','admin'),(95,'Tieu de tin tuc ngoai hang Anh','https://resources.premierleague.com/photos/2021/06/23/a6ee15ef-44fd-4921-94f6-e87a21648bcb/lamptey-ayling-bhalee-composite.png?width=500&height=333','','',2,0,3,'2021-06-22 17:17:29','2021-06-24 17:46:07','admin','admin'),(97,'Summer 2021 Latest Transfers & News','https://resources.premierleague.com/photos/2021/06/21/2147974e-c015-436a-996c-b693e16e48ee/Emmanuel-Dennis-WAT-2.jpg?width=500&height=333','','',6,0,8,'2021-06-24 17:44:53','2021-06-24 17:45:29','admin','admin'),(98,'Foden: Tôi đã đạt được một bước tiến lớn','https://resources.premierleague.com/photos/2021/06/14/cd9d7dea-33f0-4317-a6b2-c08a87fbe875/SeasonAwards-YPOTS-Foden-Editorial.png?width=930&height=620','Ngôi sao của Man City và đội tuyển Anh phát biểu sau khi nhận giải thưởng Cầu thủ trẻ xuất sắc nhất mùa giải 2020/21 của Hublot ','<p><span style=\"font-size:18px\">Đ&oacute; l&agrave; một bước đột ph&aacute; trong 12 th&aacute;ng đối với tiền vệ Phil Foden của Manchester City, người đang đại diện cho đội tuyển Anh tại UEFA Euro 2020 sau khi gi&agrave;nh chức v&ocirc; địch Premier League v&agrave; giải Cầu thủ trẻ xuất sắc nhất m&ugrave;a giải của Hublot v&agrave;o năm 2020/21.</span></p>\n\n<p><span style=\"font-size:18px\">Sau khi nhận được giải thưởng của Hublot khi đang l&agrave;m nhiệm vụ quốc tế, Foden đ&atilde; tiết lộ sự vui mừng của anh ấy về những tiến bộ m&agrave; anh ấy đ&atilde; đạt được để chống lại sự cạnh tranh mạnh mẽ v&agrave; gi&agrave;nh được giải thưởng.</span></p>\n\n<p><span style=\"font-size:18px\">&quot;Rất vui khi gi&agrave;nh được n&oacute;,&quot; Foden n&oacute;i. &quot;N&oacute; c&oacute; thể xảy ra theo cả hai c&aacute;ch. C&oacute; rất nhiều t&agrave;i năng trẻ tuyệt vời trong năm nay.</span></p>\n\n<p><span style=\"font-size:18px\">&quot;Đ&oacute; l&agrave; một m&ugrave;a giải tuyệt vời đối với t&ocirc;i. T&ocirc;i đ&atilde; rất th&iacute;ch n&oacute;. T&ocirc;i rất vui v&igrave; đ&atilde; ghi được rất nhiều b&agrave;n thắng trong năm nay v&agrave; t&ocirc;i nghĩ rằng m&igrave;nh đ&atilde; đạt được một bước tiến trong trận đấu của m&igrave;nh.&quot;</span></p>\n\n<p><span style=\"font-size:18px\">Tiền vệ của Man City đ&atilde; tạo ra một số khoảnh khắc quan trọng trong m&ugrave;a giải trước, ghi 9 b&agrave;n v&agrave; cung cấp 5 đường kiến ​​tạo trong 28 lần ra s&acirc;n ở giải đấu.</span></p>\n\n<p><span style=\"font-size:18px\">Nhưng anh ấy đ&atilde; x&aacute;c định chiến thắng 4-1 trước nh&agrave; v&ocirc; địch Liverpool 2019/20 l&agrave; điểm nhấn của anh ấy trong chiến dịch, với chiến thắng đầu ti&ecirc;n của Man City tại Anfield kể từ năm 2003.</span></p>\n\n<p><span style=\"font-size:18px\">&quot;Ch&uacute;ng t&ocirc;i đ&atilde; kh&ocirc;ng gi&agrave;nh chiến thắng ở đ&oacute; qu&aacute; l&acirc;u v&agrave; t&ocirc;i nghĩ rằng điều đ&oacute; chỉ mang lại cho ch&uacute;ng t&ocirc;i sự tự tin để tiếp tục v&agrave; gi&agrave;nh chức v&ocirc; địch giải đấu,&quot; anh n&oacute;i.</span></p>\n\n<p><span style=\"font-size:18px\">[B&igrave;nh luận vi&ecirc;n] B&acirc;y giờ, Cancelo. Đ&atilde; tự đưa m&igrave;nh v&agrave;o một số vị tr&iacute; tuyệt vời trong hiệp đầu ti&ecirc;n đ&oacute;, h&atilde;y l&agrave;m như vậy một lần nữa ở đ&acirc;y.</span></p>\n\n<p><span style=\"font-size:18px\">C&aacute;ch Foden gi&agrave;nh giải Cầu thủ trẻ xuất sắc nhất m&ugrave;a của Hublot</span></p>\n\n<p><span style=\"font-size:18px\">C&ugrave;ng xem những khoảnh khắc kỳ diệu đ&atilde; gi&uacute;p tiền vệ của Man City trở th&agrave;nh cầu thủ xuất sắc nhất từ ​​23 tuổi trở xuống v&agrave;o đầu năm 2020/21</span></p>\n\n<p><span style=\"font-size:18px\">Chơi</span></p>\n\n<p><span style=\"font-size:18px\">Tắt tiếng</span></p>\n\n<p><span style=\"font-size:18px\">Giờ hiện tại 0:09</span></p>\n\n<p><span style=\"font-size:18px\">/</span></p>\n\n<p><span style=\"font-size:18px\">Thời lượng 1:06</span></p>\n\n<p><span style=\"font-size:18px\">Đ&atilde; tải: 29,87%</span></p>\n\n<p><span style=\"font-size:18px\">Ch&uacute; th&iacute;ch</span></p>\n\n<p><span style=\"font-size:18px\">Mức chất lượng</span></p>\n\n<p><span style=\"font-size:18px\">Picture-in-PictureFullscreen</span></p>\n\n<p><span style=\"font-size:18px\">CC</span></p>\n\n<p><span style=\"font-size:18px\">QUẢNG C&Aacute;O</span></p>\n\n<p><span style=\"font-size:18px\">M&ocirc; tả &acirc;m thanh c&oacute; sẵn</span></p>\n\n<p><span style=\"font-size:18px\">Foden, người đ&oacute;ng vai ch&iacute;nh trong chiến thắng 1-0 của Anh trước Croatia trong trận mở m&agrave;n UEFA Euro 2020 v&agrave;o Chủ nhật, đ&atilde; nhanh ch&oacute;ng ca ngợi tầm ảnh hưởng của huấn luyện vi&ecirc;n Man City đối với sự ph&aacute;t triển của tr&ograve; chơi của anh ấy.</span></p>\n\n<p><span style=\"font-size:18px\">&quot;Mỗi ng&agrave;y anh ấy c&oacute; rất nhiều chi tiết để cải thiện mọi cầu thủ,&quot; anh ấy n&oacute;i th&ecirc;m. &quot;T&ocirc;i cảm thấy như anh ấy đ&atilde; cải thiện tr&ograve; chơi của t&ocirc;i rất nhiều v&agrave; t&ocirc;i chỉ th&iacute;ch l&agrave;m việc với anh ấy mỗi ng&agrave;y.&quot;</span></p>\n\n<p><span style=\"font-size:18px\">Cầu thủ 21 tuổi l&agrave; một trong s&aacute;u cầu thủ Anh được đề cử cho giải thưởng n&agrave;y, c&ugrave;ng với Dominic Calvert-Lewin, Mason Mount, Marcus Rashford, Declan Rice v&agrave; Bukayo Saka, v&agrave; Foden tin rằng đ&acirc;y l&agrave; thời điểm đặc biệt để được tham gia v&agrave;o đội tuyển quốc gia. đội.</span></p>\n\n<p><span style=\"font-size:18px\">&quot;T&ocirc;i tin rằng đ&oacute; c&oacute; lẽ l&agrave; một trong những đội tuyển Anh mạnh nhất m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; trong một thời gian d&agrave;i&quot;, anh ấy n&oacute;i th&ecirc;m. &quot;Rất nhiều cầu thủ tuyệt vời. T&ocirc;i cảm thấy may mắn khi được ở đ&acirc;y với họ b&acirc;y giờ v&agrave; chia sẻ c&ugrave;ng một đội với họ.&quot;</span></p>\n\n<p><span style=\"font-size:18px\">Xem: Foden gi&agrave;nh giải Cầu thủ trẻ xuất sắc nhất m&ugrave;a của Hublot<br />\nXem: Những ng&ocirc;i sao Premier League tỏa s&aacute;ng tại UEFA Euro 2020</span></p>\n\n<p>&nbsp;</p>\n',2,0,91,'2021-06-25 08:51:59','2021-07-02 18:04:52','admin','admin'),(99,'Villa đồng ý ký hợp đồng với Buendia từ Norwich Villa đồng ý ký hợp đồng với Buendia từ Norwich','https://resources.premierleague.com/photos/2021/06/14/7d96dd3a-2eb9-40b3-8242-6fe943d85b03/Nike-Aerowsculpt-2021-22-ball.jpeg?width=860&height=573','','',8,1,4,'2021-06-25 21:28:13',NULL,'admin',NULL),(100,'On this day in 2011: Man Utd sign De Gea','https://resources.premierleague.com/photos/2020/06/26/2e67af37-e90b-49cc-b746-2cf3984c07a7/OMHxiMKg.jpg?width=860&height=573','','',8,0,3,'2021-06-29 08:40:42',NULL,'admin',NULL),(101,'FPL in demand: Robertson deserving of more interest','https://resources.premierleague.com/photos/2021/06/25/f5431368-67aa-4a42-b09e-64c14495485b/GettyImages-1319675268.jpg?width=500&height=333','','',8,0,5,'2021-06-29 08:41:46',NULL,'admin',NULL),(102,' Lựa chọn tuyển trạch viên: Đội hình ban đầu cho mùa giải FPL mới Đăng ký sớm để tăng cơ hội tham gia FPL','https://resources.premierleague.com/photos/2021/06/25/ea984f00-e553-4700-80a8-d13dbd5bfb5d/GettyImages-1319887209-1-.jpg?width=500&height=333','','',8,0,4,'2021-06-29 08:42:43','2021-07-03 01:03:44','admin','admin'),(104,'Leicester ký hợp đồng với tiền vệ Soumare của Lille','https://resources.premierleague.com/photos/2021/07/02/2d4fb1ae-a27b-48a0-8f33-4982af1884be/GettyImages-1233216145.jpg?width=862&height=620','Cầu thủ người Pháp chuyển đến sân vận động King Power từ nhà vô địch Ligue 1 theo hợp đồng 5 năm','<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">Leicester City đ&atilde; th&ocirc;ng b&aacute;o về việc k&yacute; hợp đồng với tiền vệ Boubakary Soumare từ nh&agrave; v&ocirc; địch Ph&aacute;p Lille.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">Cầu thủ 22 tuổi đ&atilde; đồng &yacute; một hợp đồng 5 năm v&agrave; sẽ gia nhập&nbsp;<a href=\"https://www.premierleague.com/clubs/26/Leicester-City/overview\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\">Leicester</a>&nbsp;t&ugrave;y thuộc v&agrave;o Premier League v&agrave; giải ph&oacute;ng mặt bằng quốc tế.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">&ldquo;T&ocirc;i thực sự tự h&agrave;o khi đến Premier League v&agrave; một c&acirc;u lạc bộ lớn như Leicester,&rdquo; Soumare n&oacute;i tr&ecirc;n&nbsp;<a href=\"https://www.lcfc.com/news/2182482/boubakary-soumar-joins-leicester-city-from-lille?utm_source=premier-league-website&amp;utm_campaign=website&amp;utm_medium=link\" rel=\"noopener\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\" target=\"_blank\">trang web ch&iacute;nh thức của c&acirc;u lạc bộ.</a>&nbsp;&nbsp;&ldquo;N&oacute; sẽ thực sự gi&uacute;p t&ocirc;i ph&aacute;t triển lối chơi v&agrave; tiến bộ với tư c&aacute;ch l&agrave; một cầu thủ.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">&ldquo;Leicester l&agrave; một c&acirc;u lạc bộ rất tham vọng.&nbsp;Khi họ n&oacute;i với t&ocirc;i về kế hoạch của họ v&agrave; những g&igrave; họ muốn ở t&ocirc;i, t&ocirc;i biết ngay rằng t&ocirc;i muốn đến. &quot;</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">Soumare đ&atilde; c&oacute; 40 lần ra s&acirc;n tr&ecirc;n mọi đấu trường trong m&ugrave;a giải trước khi Lille gi&agrave;nh chức v&ocirc; địch đầu ti&ecirc;n trong 10 m&ugrave;a giải.&nbsp;Anh ấy cũng đ&atilde; 8 lần ra s&acirc;n ở UEFA Europa League.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">Tiền vệ trung t&acirc;m bắt đầu sự nghiệp của m&igrave;nh tại Paris FC v&agrave; sau đ&oacute; c&oacute; s&aacute;u năm tại học viện của Paris Saint-Germain.&nbsp;Anh gia nhập Lille v&agrave;o năm 2017 v&agrave; c&oacute; 84 lần ra s&acirc;n cho c&acirc;u lạc bộ, ghi được một b&agrave;n thắng.</span></span></span></span></p>\n\n<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\"><a href=\"https://www.premierleague.com/news/2181246\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\">Tuyển thủ</a>&nbsp;U21 Ph&aacute;p trở th&agrave;nh bản hợp đồng m&ugrave;a h&egrave; thứ hai của Leicester, sau khi&nbsp;<a href=\"https://www.premierleague.com/news/2181246\" style=\"-webkit-font-smoothing:antialiased; box-sizing:border-box; text-decoration:none; color:#e90052\">Patson Daka</a>&nbsp;đến từ RB Salzburg.</span></span></span></span></p>\n',6,1,4,'2021-07-02 18:01:51',NULL,'admin',NULL),(105,'PHÁP - THỤY SĨ | SIÊU KINH ĐIỂN KỊCH TÍNH NHẤT GIẢI ĐẤU ĐẾN NHỮNG QUẢ PENALTY CUỐI CÙNG | EURO 2020','https://static.standard.co.uk/2021/06/25/16/euro2020franceswitzerland.jpg','','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8Vn-mzMqaG4\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',8,1,20,'2021-07-02 18:10:06','2021-07-02 18:10:47','admin','admin'),(106,'Italia vs Lukaku: Màn đối đầu với con quái vật mà mình nuôi nấng','https://media.thethao.vn//uploads/2021/07/02/italia-vs-lukaku-man-doi-dau-voi-con-quai-vat-ma-minh-nuoi-nang_18637.jpg','Nếu không chuyển sang Serie A vào mùa hè 2019 thì liệu Romelu Lukaku có được như ngày hôm nay?','<p><span style=\"font-size:16px\">To x&aacute;c l&agrave; từ m&agrave; Lukaku đ&atilde; nghe trong cả cuộc đời m&igrave;nh. Năm 11 tuổi, anh thậm ch&iacute; to gấp đ&ocirc;i ch&uacute;ng bạn đồng trang lứa trong một trận b&oacute;ng. Đến năm 13 tuổi, Lukaku đ&atilde; đạt được chiều cao trung b&igrave;nh của đ&agrave;n &ocirc;ng ch&acirc;u &Acirc;u. Những năm th&aacute;ng thi đấu tại Anh đ&atilde; đắp th&ecirc;m cơ bắp cho cơ thể cao lớn n&agrave;y, biến Lukaku th&agrave;nh một người khổng lồ lực lưỡng.</span></p>\n\n<p><span style=\"font-size:16px\">Nhưng to như thế kh&ocirc;ng đồng nghĩ với trưởng th&agrave;nh. Tiệc t&ugrave;ng, ch&acirc;n d&agrave;i, si&ecirc;u xe... Lukaku đều chơi hết nấc ở xứ sương m&ugrave;. Nhưng những cuộc th&aacute;c loạn đ&oacute; kh&ocirc;ng gi&uacute;p Lukaku c&oacute; được bản lĩnh đương đầu với th&aacute;ch thức. Anh chỉ c&oacute; thể chơi hay ở những đội b&oacute;ng bậc trung như West Brom hay Everton, nhưng chết ngợp tại Chelsea v&agrave; Man United.</span></p>\n\n<p><span style=\"font-size:16px\">M&agrave;n &quot;chạy trốn&quot; khỏi Old Trafford mới thật buồn cười. Lukaku lấy l&yacute; do để tập trung muộn cho chuyến du đấu m&ugrave;a h&egrave; của Quỷ đỏ. Sau đ&oacute;... cắt đứt li&ecirc;n lạc với đội b&oacute;ng chủ quản. MU chỉ biết tin về Lukaku khi thấy trang chủ Anderlecht đăng tải những bức ảnh của anh. Th&igrave; ra tiền đạo người Bỉ trở về đội b&oacute;ng cũ để xin tập nhờ v&agrave; g&acirc;y sức &eacute;p với MU.</span></p>\n\n<p><span style=\"font-size:16px\"><img alt=\"\" src=\"https://media.thethao.vn//uploads/2021/07/02/italia-vs-lukaku-man-doi-dau-voi-con-quai-vat-ma-minh-nuoi-nang_18637.jpg\" /></span></p>\n\n<p><span style=\"font-size:16px\">Lukaku kh&ocirc;ng muốn ở lại MU nữa v&agrave; chọn c&aacute;ch &quot;trẻ con&quot; nhất c&oacute; thể để khiến BLĐ đội chủ s&acirc;n Old Trafford phải chấp nhận việc ra đi. Giữa ho&agrave;n cảnh &quot;đi đ&acirc;u cũng được, miễn kh&ocirc;ng phải quay lại Manchester&quot;, may thay, Lukaku đ&atilde; đến được với Inter Milan v&agrave; m&ocirc;i trường b&oacute;ng đ&aacute; Italia.</span></p>\n\n<p><span style=\"font-size:16px\">Sự tĩnh lặng, điềm đạm của Serie A đ&atilde; c&acirc;n bằng cuộc sống của Lukaku. Anh đ&atilde; nh&igrave;n thấu bản th&acirc;n m&igrave;nh, biết đ&acirc;u l&agrave; điểm mạnh v&agrave; điểm yếu để tập trung ho&agrave;n thiện bộ kỹ năng. C&ugrave;ng với sự hướng dẫn của một người cầu to&agrave;n như Antonio Conte, Lukaku đ&atilde; tiến bộ thần tốc.</span></p>\n\n<p><span style=\"font-size:16px\">Từ một một &quot;g&atilde; hề&quot; đỡ quả b&oacute;ng cũng kh&ocirc;ng xong ở xứ sương m&ugrave;, Lukaku đ&atilde; vươn m&igrave;nh trở th&agrave;nh một trung phong ho&agrave;n thiện tại đất nước h&igrave;nh chiếc ủng. Đừng n&oacute;i l&agrave; đỡ bước một, giờ Lukaku c&oacute; thể giữ b&oacute;ng, đi b&oacute;ng, dứt điểm v&agrave; đặc biệt l&agrave; kiến tạo. V&igrave; sao lại n&oacute;i l&agrave; &quot;đặc biệt&quot;? Bởi Lukaku được những người thầy sơ khai của m&igrave;nh đ&agrave;o tạo để trở th&agrave;nh một s&aacute;t thủ. Trước khi đến &Yacute;, Lukaku đi đ&acirc;u cũng chỉ để đ&aacute;p ứng y&ecirc;u cầu ghi b&agrave;n của chủ đầu tư.</span></p>\n\n<p><span style=\"font-size:16px\">Nhưng ở Inter l&agrave; một Lukaku rất kh&aacute;c, biết d&ugrave;ng sức m&igrave;nh đ&oacute;ng g&oacute;p v&agrave;o lối chơi tập thể chứ kh&ocirc;ng chỉ dừng lại ở c&aacute;c b&agrave;n thắng. Thế n&ecirc;n, d&ugrave; lu&ocirc;n thất bại trước Ciro Immobile hay Cristiano Ronaldo ở cuộc đua Vua ph&aacute; lưới Serie A, Lukaku vẫn lu&ocirc;n nằm trong đội h&igrave;nh ti&ecirc;u biểu của Serie A 2 m&ugrave;a qua. Ch&iacute;nh Lukaku đ&atilde; gi&uacute;p Inter k&eacute;o đổ đế chế Juventus đ&atilde; thống trị b&oacute;ng đ&aacute; Italia suốt một thập kỷ.</span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><img alt=\"\" src=\"https://media.thethao.vn//uploads/2021/07/02/italia-vs-lukaku-man-doi-dau-voi-con-quai-vat-ma-minh-nuoi-nang_18638.jpg\" style=\"height:694px; width:1024px\" /><em>Lukaku tỏa s&aacute;ng trong m&agrave;u &aacute;o Inter Milan</em></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p><span style=\"font-size:16px\">Kh&ocirc;ng chỉ ph&aacute;t triển với tư c&aacute;ch cầu thủ, Lukaku c&ograve;n trưởng th&agrave;nh hơn về mặt t&iacute;nh c&aacute;ch ở tuổi 28. Khi Conte v&agrave; Lautaro Martinez x&iacute;ch m&iacute;ch tr&ecirc;n s&acirc;n, ch&iacute;nh Lukaku đ&atilde; tổ chức một cuộc... đấm bốc vui vẻ để giảng h&ograve;a cho hai thầy tr&ograve;.</span></p>\n\n<p><span style=\"font-size:16px\">Khi hay tin Christian Eriksen gặp tai ương ở EURO 2020, Lukaku l&agrave; một trong những người h&agrave;nh động nhiều nhất. Gạt đi những giọt nước mắt, Lukaku chủ động gọi điện hỏi thăm người bạn th&acirc;n của m&igrave;nh. Sau trận đấu gặp chủ nh&agrave; Đan Mạch, vẫn l&agrave; Lukaku chủ động đến bệnh viện để được nh&igrave;n thấy Eriksen.</span></p>\n\n<p><span style=\"font-size:16px\">Sự chu đ&aacute;o, ấm &aacute;p n&agrave;y của Lukaku kh&aacute;c xa h&igrave;nh ảnh một cậu b&eacute; &quot;trẻ tr&acirc;u&quot; ng&agrave;y n&agrave;o ở Premier League. Mỗi người chọn cho m&igrave;nh một c&aacute;ch lớn l&ecirc;n kh&aacute;c nhau. Với Lukaku, anh chọn những điều b&igrave;nh thường nhất, nhưng lại gần gũi nhất l&agrave;m động lực cho m&igrave;nh.</span></p>\n\n<p><span style=\"font-size:16px\">V&agrave; đ&oacute; c&oacute; lẽ l&agrave; n&eacute;t tương đồng Lukaku nh&igrave;n ra được ở bản th&acirc;n v&agrave; thần tượng Michael Jordan, th&ocirc;ng qua bộ phim t&agrave;i liệu nổi tiếng &quot;The Last Dance&quot;.&nbsp;</span></p>\n\n<p><span style=\"font-size:16px\">&quot;Khi t&ocirc;i xem &quot;The Last Dance&quot;, c&aacute;i c&aacute;ch Jordan n&oacute;i về việc th&uacute;c đẩy bản th&acirc;n khiến cho t&ocirc;i thầm nghĩ: &quot;Ồ, th&igrave; ra m&igrave;nh kh&ocirc;ng đơn độc&quot;. T&ocirc;i kh&ocirc;ng n&oacute;i t&ocirc;i l&agrave; Michael Jordan, nhưng nhiều người sẽ cần thứ động lực đ&oacute;, t&ocirc;i kh&ocirc;ng phải người duy nhất. Cristiano Ronaldo lu&ocirc;n muốn trở th&agrave;nh cầu thủ giỏi nhất v&agrave; ph&aacute; mọi kỷ lục, Kylian Mbappe muốn thắng mọi giải đấu v&agrave; trở th&agrave;nh nh&agrave; v&ocirc; địch vĩ đại tiếp theo. Mỗi người đều cần một thứ g&igrave; đ&oacute; để th&uacute;c đẩy bản th&acirc;n. T&ocirc;i cũng thế&quot;, Lukaku chia sẻ với ESPN.</span></p>\n\n<p><span style=\"font-size:16px\"><img alt=\"\" src=\"https://media.thethao.vn//uploads/2021/07/02/italia-vs-lukaku-man-doi-dau-voi-con-quai-vat-ma-minh-nuoi-nang_18639.jpg\" style=\"height:599px; width:1024px\" /></span></p>\n\n<p><span style=\"font-size:16px\">Tho&aacute;t khỏi sự ồn &agrave;o của truyền th&ocirc;ng Anh, ngồi ngẫm nghĩ những triết l&yacute; trong &quot;The Last Dance&quot; đ&atilde; gi&uacute;p Lukaku đạt đến cảnh giới mới. Anh vẫn c&oacute; sức mạnh của một con &quot;qu&aacute;i vật&quot;, nhưng l&agrave; một con qu&aacute;i vật điềm tĩnh. Lukaku ph&acirc;n bổ sức mạnh si&ecirc;u nhi&ecirc;n của m&igrave;nh một c&aacute;ch hợp l&yacute; hơn, để kh&ocirc;ng bị người kh&aacute;c coi chỉ l&agrave; một kẻ cậy sức.</span></p>\n\n<p><span style=\"font-size:16px\">Những người Italia, như Conte đ&atilde; dạy cho Lukaku điều đ&oacute;. V&agrave; giờ những người Italia kh&aacute;c như Bonucci, Chiellini sẽ cố gắng chế ngự n&oacute;. Họ c&oacute; l&agrave;m được kh&ocirc;ng khi Lukaku b&acirc;y giờ hiểu m&igrave;nh phải mang th&ecirc;m cả trọng tr&aacute;ch của De Bruyne v&agrave; Eden Hazard. Buộc Lukaku phải bung to&agrave;n bộ sức mạnh sẽ l&agrave; điều tồi tệ cuối c&ugrave;ng d&agrave;nh cho mọi hậu vệ.</span></p>\n',1,1,47,'2021-07-03 01:01:30',NULL,'admin',NULL),(112,'Leicester ký hợp đồng với tiền vệ Soumare của Lille','https://resources.premierleague.com/photos/2021/06/25/ea984f00-e553-4700-80a8-d13dbd5bfb5d/GettyImages-1319887209-1-.jpg?width=500&height=333','Cầu thủ người Pháp chuyển đến sân vận động King Power từ nhà vô địch Ligue 1 theo hợp đồng 5 năm','<p style=\"text-align:start\"><span style=\"font-size:16px\"><span style=\"color:#242424\"><span style=\"font-family:PremierSans-Regular,Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif\"><span style=\"background-color:#ffffff\">Leicester City đ&atilde; th&ocirc;ng b&aacute;o về việc k&yacute; hợp đồng với tiền vệ Boubakary Soumare từ nh&agrave; v&ocirc; địch Ph&aacute;p Lille.</span></span></span></span></p>',5,0,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`heroku_b5e4417a4ce256b`@`us-cdbr-east-04.cleardb.com`*/ /*!50003 TRIGGER `after_news_insert` AFTER INSERT ON `news` FOR EACH ROW BEGIN
	insert into view_new(id_new) values (NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recent_result`
--

DROP TABLE IF EXISTS `recent_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recent_result` (
  `teamname` int(11) NOT NULL,
  `recent_result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teamname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recent_result`
--

LOCK TABLES `recent_result` WRITE;
/*!40000 ALTER TABLE `recent_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `recent_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultmatch`
--

DROP TABLE IF EXISTS `resultmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resultmatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week` int(11) DEFAULT NULL,
  `team1` varchar(255) DEFAULT NULL,
  `goal1` int(11) DEFAULT NULL,
  `team2` varchar(255) DEFAULT NULL,
  `goal2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultmatch`
--

LOCK TABLES `resultmatch` WRITE;
/*!40000 ALTER TABLE `resultmatch` DISABLE KEYS */;
INSERT INTO `resultmatch` VALUES (13,1,'MUN',3,'MCI',3),(17,1,'BRE',1,'ARS',3),(18,1,'MUN',1,'LEE',0),(19,1,'BUR',3,'BRI',3),(20,1,'CHE',2,'CRY',1),(25,1,'NOR',2,'LIV',3);
/*!40000 ALTER TABLE `resultmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN','ADMIN',NULL,NULL,NULL,NULL),(2,'USER','USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week` int(11) DEFAULT NULL,
  `matchdate` varchar(255) DEFAULT NULL,
  `matchtime` varchar(255) DEFAULT NULL,
  `team1` varchar(255) DEFAULT NULL,
  `team2` varchar(255) DEFAULT NULL,
  `stadium` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,1,'14/8/2021','2:00','BRE','ARS','Brentford Community Stadium'),(108,1,'14/8/2021','18:30','MUN','LEE','Old Trafford'),(109,1,'14/8/2021','21:00','BUR','BRI','	Turf Moor'),(110,1,'14/8/2021','21:00','CHE','CRY','Stamford Bridge'),(111,1,'14/8/2021','21:00','EVE','SOU','Goodison Park'),(112,1,'14/8/2021','21:00','LEI','WOL','King Power Stadium'),(113,1,'14/8/2021','21:00','WAT','AVL','	Vicarage Road'),(114,1,'14/8/2021','23:30','NOR','LIV','Carrow Road'),(115,1,'15/8/2021','20:00','NEW','WHU','St James\' Park'),(116,1,'15/8/2021','22:30','TOT','MCI','	Tottenham Hotspur Stadium'),(123,2,'12/7/2021','2: 00 AM','WAT','LIV','Anfield');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `avatar` text,
  `status` int(11) DEFAULT '1',
  `roleid` bigint(20) DEFAULT '2',
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`roleid`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','Admin','mq19052002@gmail.com','0327991343',19,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRroEgbNDuaOUKKZZUKr_HeyC5Tlf2HzFC33w&usqp=CAU',1,1,'2021-06-08 19:10:25','2021-06-08 19:10:25',NULL,NULL),(2,'nguyenvana','123456','Nguyen Van An','mq19052002@gmail.com','0327991343',19,'',1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(3,'nguyenvanb','123456','nguyen van b','mq19052002@gmail.com	','0327991343',NULL,'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/61342789_141466123663995_8069364639961448448_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=3nuTsogLE60AX_Ywcnp&_nc_ht=scontent-hkt1-2.xx&oh=ec9c0ba0cce513dd949600b7228fe245&oe=60DD2FDC',1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(5,'nambui','123456','Bui Nam','mq19052002@gmail.com	','0327991343',NULL,'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/61342789_141466123663995_8069364639961448448_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=3nuTsogLE60AX_Ywcnp&_nc_ht=scontent-hkt1-2.xx&oh=ec9c0ba0cce513dd949600b7228fe245&oe=60DD2FDC',1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(12,'khoale','123456','Le Phuoc Khoa','mq19052002@gmail.com','0327991343',0,'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/61342789_141466123663995_8069364639961448448_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=3nuTsogLE60AX_Ywcnp&_nc_ht=scontent-hkt1-2.xx&oh=ec9c0ba0cce513dd949600b7228fe245&oe=60DD2FDC',1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(18,'quoctran','123456','Tran minh quoc','mq19052002@gmail.com	','0327991343',NULL,'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/61342789_141466123663995_8069364639961448448_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=3nuTsogLE60AX_Ywcnp&_nc_ht=scontent-hkt1-2.xx&oh=ec9c0ba0cce513dd949600b7228fe245&oe=60DD2FDC',1,2,'2021-06-08 19:10:25',NULL,NULL,NULL),(28,'minhquoc','123456','Trần Minh Quốc','mq19052002@gmail.com	','0327991343',NULL,'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/61342789_141466123663995_8069364639961448448_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=3nuTsogLE60AX_Ywcnp&_nc_ht=scontent-hkt1-2.xx&oh=ec9c0ba0cce513dd949600b7228fe245&oe=60DD2FDC',1,1,'2021-06-08 19:10:25',NULL,NULL,NULL),(37,'minhminh','123456','Trần Minh Quốc','mq19052002@gmail.com','0327991343',18,'https://www.esafety.gov.au/sites/default/files/2019-08/Remove%20images%20and%20video.jpg',1,2,'2021-06-27 15:39:24',NULL,NULL,NULL),(38,'tuilaminhquoc','123456','Trần Minh Quốc','mq19052002@gmail.com','+84327991343',19,NULL,1,2,'2021-07-01 18:07:14',NULL,NULL,NULL),(39,'tranminhquoc','123456','Tran Minh Quoc','mq19052002@gmail.com','+84327991343',19,'',1,2,'2021-07-04 09:05:48',NULL,NULL,NULL),(40,'minhquoc123','123456','Tran Minh Quoc','mq19052002@gmail.com','+84327991343',19,'',1,2,'2021-07-05 21:14:34',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_new`
--

DROP TABLE IF EXISTS `view_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `view_new` (
  `id_new` bigint(20) NOT NULL,
  `dateview` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_new`),
  CONSTRAINT `view_new_ibfk_1` FOREIGN KEY (`id_new`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_new`
--

LOCK TABLES `view_new` WRITE;
/*!40000 ALTER TABLE `view_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-06 11:52:29
