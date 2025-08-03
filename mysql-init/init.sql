-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brandName` varchar(50) DEFAULT NULL,
  `brandImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'criss-coss','./images/brands/criss-coss-logo.svg'),(2,'freestyle','./images/brands/freestyle-logo.svg'),(3,'giovanni','./images/brands/giovanni-logo.svg'),(4,'grasshoppers','./images/brands/grasshoppers-logo.svg'),(5,'hi-tec','./images/brands/hi-tec-logo.svg'),(6,'mancini','./images/brands/mancini-logo.svg'),(7,'pierre-cardin','./images/brands/pierre-cardin-logo.svg'),(8,'pitbull','./images/brands/pitbull-logo.svg'),(9,'smart-steps','./images/brands/smart-steps-logo.svg'),(10,'sugar-spice','./images/brands/sugar-spice-logo.svg'),(11,'terraPOD','./images/brands/terraPOD-logo.svg'),(12,'tommy','./images/brands/tommy-logo.svg'),(13,'unreal','./images/brands/unreal-logo.svg'),(14,'ipanema','./images/brands/ipanema-logo.svg');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `size` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProductImages` (`product_id`),
  CONSTRAINT `FK_ProductImages` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-17.jpg?v=1746604549&width=200'),(2,1,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-18.jpg?v=1746604549&width=200'),(3,2,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-49.jpg?v=1746604137&width=200'),(4,2,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-50.jpg?v=1746604137&width=200'),(5,3,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-45.jpg?v=1746603465&width=200'),(6,3,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-46.jpg?v=1746603465&width=200'),(7,4,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-17.jpg?v=1745911063'),(8,4,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-18.jpg?v=1745911063'),(9,5,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-77_1.jpg?v=1745581396&width=200'),(10,5,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-79.jpg?v=1745581396&width=200'),(11,6,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-61.jpg?v=1745580231&width=200'),(12,6,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-62.jpg?v=1745580231&width=200'),(13,7,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-57.jpg?v=1745569556&width=200'),(14,7,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayMENS-58.jpg?v=1745569556&width=200'),(15,8,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-69.jpg?v=1745569231&width=200'),(16,8,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-70.jpg?v=1745569231&width=200'),(17,9,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-125.jpg?v=1745568151&width=200'),(18,9,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-126.jpg?v=1745568188&width=200'),(19,10,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-5.jpg?v=1745329239&width=200'),(20,10,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-6.jpg?v=1745329239&width=200'),(21,11,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-1.jpg?v=1745328936&width=200'),(22,11,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-2.jpg?v=1745328939&width=200'),(23,12,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-13.jpg?v=1745328311&width=200'),(24,12,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-14.jpg?v=1745328311&width=200'),(25,13,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-9.jpg?v=1745327678&width=200'),(26,13,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MensBRAND-10.jpg?v=1745327678&width=200'),(27,14,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-5.jpg?v=1745313628&width=200'),(28,14,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-6.jpg?v=1745313628&width=200'),(29,15,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-73.jpg?v=1745313068&width=200'),(30,15,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-74.jpg?v=1745313068&width=200'),(31,16,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-129_1.jpg?v=1745312533&width=200'),(32,16,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-131_1.jpg?v=1745312533&width=200'),(33,17,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-49.jpg?v=1745311790&width=200'),(34,17,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneMENS-50.jpg?v=1745311790&width=200'),(35,18,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-73.jpg?v=1744627461&width=200'),(36,18,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-74.jpg?v=1744627461&width=200'),(37,19,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-81.jpg?v=1744627116&width=200'),(38,19,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-82.jpg?v=1744627116&width=200'),(39,20,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/FebMens_-69_1.jpg?v=1744376606&width=200'),(40,20,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/FebMens_-70_1.jpg?v=1744376606&width=200'),(41,21,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-77_1.jpg?v=1744626800&width=200'),(42,21,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilMens-78_1.jpg?v=1744626800&width=200'),(43,22,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-45.jpg?v=1746608064&width=200'),(44,22,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-46.jpg?v=1746608064&width=200'),(45,23,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-49.jpg?v=1746606952&width=200'),(46,23,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-50.jpg?v=1746606952&width=200'),(47,24,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-33.jpg?v=1746606668&width=200'),(48,24,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-34.jpg?v=1746606668&width=200'),(49,25,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-29.jpg?v=1746606113&width=200'),(50,25,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-30.jpg?v=1746606113&width=200'),(51,26,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-53.jpg?v=1746434476&width=200'),(52,26,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-54.jpg?v=1746434476&width=200'),(53,27,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-57.jpg?v=1746433823&width=200'),(54,27,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-58.jpg?v=1746433823&width=200'),(55,28,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MyJKkBlD0T5VPiSW6vRbVwTdr9qvAIi2nA9_sUV_xqw.jpg?v=1746012056&width=200'),(56,28,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/4JQrvyOUvlfts5WWC-teN7YUYfAjuJvzuztGinSloE8.jpg?v=1746012056&width=200'),(57,29,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-253.jpg?v=1745933642&width=200'),(58,29,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-254.jpg?v=1745933642&width=200'),(59,30,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-21.jpg?v=1745932966&width=200'),(60,30,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-22.jpg?v=1745932966&width=200'),(61,31,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-25.jpg?v=1745932673&width=200'),(62,31,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-26.jpg?v=1745932673&width=200'),(63,32,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-5_cd55736d-6b65-405b-8dd2-df08d8c06043.jpg?v=1745931689&width=200'),(64,32,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-6_633900b3-33f1-4d15-90f8-2a6f1f3d9b50.jpg?v=1745931689&width=200'),(65,33,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-45.jpg?v=1745931353&width=200'),(66,33,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-46.jpg?v=1745931353&width=200'),(67,34,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-41.jpg?v=1745930802&width=200'),(68,34,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-42.jpg?v=1745930802&width=200'),(69,35,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-161.jpg?v=1745930499&width=200'),(70,35,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-162.jpg?v=1745930499&width=200'),(71,36,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-157.jpg?v=1745930116&width=200'),(72,36,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-158.jpg?v=1745930116&width=200'),(73,37,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-153.jpg?v=1745929200&width=200'),(74,37,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-154.jpg?v=1745929200&width=200'),(75,38,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-41.jpg?v=1745926920&width=200'),(76,38,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-42.jpg?v=1745926920&width=200'),(77,39,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-37.jpg?v=1745926618&width=200'),(78,39,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-38.jpg?v=1745926618&width=200'),(79,40,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-21_fd0caee9-f30e-4ddd-a451-2792d4d4bb94.jpg?v=1745926208&width=200'),(80,40,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-22_b97857c0-c686-4a0d-bf81-e49385205c9c.jpg?v=1745926208&width=200'),(81,41,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-125.jpg?v=1745925845&width=200'),(82,41,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-126.jpg?v=1745925845&width=200'),(83,42,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-189.jpg?v=1745925523&width=200'),(84,42,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-190.jpg?v=1745925523&width=200'),(85,43,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-17.jpg?v=1745925151&width=200'),(86,43,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-18.jpg?v=1745925151&width=200'),(87,44,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-13.jpg?v=1745921353&width=200'),(88,44,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-14.jpg?v=1745921353&width=200'),(89,45,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-165.jpg?v=1745921037&width=200'),(90,45,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-167.jpg?v=1745921037&width=200'),(91,46,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-169.jpg?v=1745920644&width=200'),(92,46,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-170.jpg?v=1745920644&width=200'),(93,47,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-117.jpg?v=1745920087&width=200'),(94,47,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-118.jpg?v=1745920087&width=200'),(95,48,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-65.jpg?v=1745919598&width=200'),(96,48,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-66.jpg?v=1745919598&width=200'),(97,49,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-81.jpg?v=1745918968&width=200'),(98,49,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-82.jpg?v=1745918968&width=200'),(99,50,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-69.jpg?v=1745918340&width=200'),(100,50,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-70.jpg?v=1745918340&width=200'),(101,51,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-213.jpg?v=1745917966&width=200'),(102,51,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-214.jpg?v=1745917966&width=200'),(103,52,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-5.jpg?v=1745917580&width=200'),(104,52,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-6.jpg?v=1745917580&width=200'),(105,53,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-1.jpg?v=1745917178&width=200'),(106,53,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayLADIES-2.jpg?v=1745917178&width=200'),(107,54,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-49.jpg?v=1745916663&width=200'),(108,54,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-50.jpg?v=1745916663&width=200'),(109,55,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-17.jpg?v=1745916313&width=200'),(110,55,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-18.jpg?v=1745916313&width=200'),(111,56,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-57.jpg?v=1745914860&width=200'),(112,56,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-58.jpg?v=1745914860&width=200'),(113,57,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-73.jpg?v=1745912463&width=200'),(114,57,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-74.jpg?v=1745912463&width=200'),(115,58,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-69.jpg?v=1745912172&width=200'),(116,58,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-70.jpg?v=1745912172&width=200'),(117,59,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-81.jpg?v=1745911896&width=200'),(118,59,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-82.jpg?v=1745911896&width=200'),(119,60,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-77.jpg?v=1745911563&width=200'),(120,60,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-78.jpg?v=1745911563&width=200'),(121,61,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-197.jpg?v=1745478946&width=200'),(122,61,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-198.jpg?v=1745478946&width=200'),(123,62,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-193.jpg?v=1745478301&width=200'),(124,62,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-194.jpg?v=1745478301&width=200'),(125,63,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-137.jpg?v=1745477730&width=200'),(126,63,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadies-138.jpg?v=1745477730&width=200'),(127,64,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-65.jpg?v=1744827592&width=200'),(128,64,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-66.jpg?v=1744827592&width=200'),(129,65,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-61.jpg?v=1744827084&width=200'),(130,65,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-62.jpg?v=1744827084&width=200'),(131,66,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-21.jpg?v=1744824362&width=200'),(132,66,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-22.jpg?v=1744824362&width=200'),(133,67,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-25.jpg?v=1744824062&width=200'),(134,67,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-26.jpg?v=1744824062&width=200'),(135,68,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-9.jpg?v=1744823753&width=200'),(136,68,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-10.jpg?v=1744823753&width=200'),(137,69,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-1.jpg?v=1744823501&width=200'),(138,69,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-2.jpg?v=1744823501&width=200'),(139,70,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-5_30f39cb0-75e3-4ff4-b2a2-470396b68efb.jpg?v=1744823196&width=200'),(140,70,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-6_9d129475-7e9f-4edb-9ac2-962f31dfff75.jpg?v=1744823202&width=200'),(141,71,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-13.jpg?v=1744823095&width=200'),(142,71,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilLadiesEXTRA-14.jpg?v=1744823095&width=200'),(143,72,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-17.jpg?v=1746622660&width=200'),(144,72,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-18.jpg?v=1746622660&width=200'),(145,73,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-25.jpg?v=1746622245&width=200'),(146,73,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-26.jpg?v=1746622245&width=200'),(147,74,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-21.jpg?v=1746621526&width=200'),(148,74,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-22.jpg?v=1746621526&width=200'),(149,75,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-73.jpg?v=1746620930&width=200'),(150,75,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-74.jpg?v=1746620930&width=200'),(151,76,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-69.jpg?v=1746620438&width=200'),(152,76,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-70.jpg?v=1746620438&width=200'),(153,77,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-53.jpg?v=1746619904&width=200'),(154,77,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-54.jpg?v=1746619904&width=200'),(155,78,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-57.jpg?v=1746619339&width=200'),(156,78,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-58.jpg?v=1746619339&width=200'),(157,79,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-33.jpg?v=1746618683&width=200'),(158,79,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-34.jpg?v=1746618683&width=200'),(159,80,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-41.jpg?v=1746617534&width=200'),(160,80,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-42.jpg?v=1746617534&width=200'),(161,81,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-37.jpg?v=1746610943&width=200'),(162,81,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-38.jpg?v=1746610943&width=200'),(163,82,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-65.jpg?v=1746610419&width=200'),(164,82,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-66.jpg?v=1746610419&width=200'),(165,83,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-29.jpg?v=1746609413&width=200'),(166,83,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-30.jpg?v=1746609413&width=200'),(167,84,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-45.jpg?v=1746608947&width=200'),(168,84,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-46.jpg?v=1746608947&width=200'),(169,85,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MarchKids-33.jpg?v=1746012888&width=200'),(170,85,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MarchKids-34.jpg?v=1746012888&width=200'),(171,86,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneKIDS-1_b43dc707-2d94-4f7e-8802-9a4d9155f00f.jpg?v=1746012544&width=200'),(172,86,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/JuneKIDS-2.jpg?v=1746012544&width=200'),(173,87,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-69.jpg?v=1744829250&width=200'),(174,87,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-70.jpg?v=1744829250&width=200'),(175,88,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-61.jpg?v=1744828891&width=200'),(176,88,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/MayKIDS-62.jpg?v=1744828891&width=200'),(177,89,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-57.jpg?v=1744828288&width=200'),(178,89,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-58.jpg?v=1744828288&width=200'),(179,90,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-61.jpg?v=1744827914&width=200'),(180,90,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-62.jpg?v=1744827914&width=200'),(181,91,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-5.jpg?v=1744626008&width=200'),(182,91,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-6.jpg?v=1744626008&width=200'),(183,92,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-9.jpg?v=1744625650&width=200'),(184,92,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-10.jpg?v=1744625650&width=200'),(185,93,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-1.jpg?v=1744614900&width=200'),(186,93,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-2.jpg?v=1744614900&width=200'),(187,94,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-33.jpg?v=1744382709&width=200'),(188,94,'https://cdn.shopify.com/s/files/1/0384/6379/9429/files/AprilKids-34.jpg?v=1744382709&width=200');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `stock` int DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sporty Sneaker','men','Grey',4,'pierre-cardin',7),(2,'Stitching Binding Slipper','men','black',10,'grasshoppers',4),(3,'Stitching Binding Slipper','men','Tan',7,'mancini',6),(4,'Mountain Pro','men','Brown',3,'unreal',13),(5,'Toe Bumper Sneaker','men','White',10,'tommy',12),(6,'Utility Boots','men','Black',5,'terrapod',11),(7,'Utility Boots','men','Brown',2,'ipanema',14),(8,'Apron Lace Up','men','Black',2,'pitbull',8),(9,'Micro Loafer Slipper','men','Tan',7,'hi-tec',5),(10,'Ruan','men','Brown',7,'unreal',13),(11,'Pursuit','men','Black',2,'grasshoppers',4),(12,'Rooikat','men','Brown',2,'pierre-cardin',7),(13,'Yster','men','Tan',10,'tommy',12),(14,'Mesh Insert Sneaker','men','Black',8,'mancini',6),(15,'Panels Sneaker','men','Tan',8,'terrapod',11),(16,'Micro Loafer Slipper','men','Navy',6,'hi-tec',5),(17,'Knitted Sneaker','men','Grey',1,'ipanema',14),(18,'Formal Lace Up','men','Brown',2,'pitbull',8),(19,'Brogue Lace Up','men','Tan',7,'hi-tec',5),(20,'Smart Sneaker','men','Black',0,'pierre-cardin',7),(21,'Brogue Lace Up','men','Blue',9,'ipanema',14),(22,'Comfort Snow Boot','women','Black',1,'ipanema',14),(23,'Comfort Snow Boot','women','Brown',9,'hi-tec',5),(24,'Heart Bootie Slipper','women','Grey',6,'freestyle',2),(25,'Heart Bootie Slipper','women','Grey',7,'grasshoppers',4),(26,'Chunky Sock Boot','women','Grey',0,'giovanni',3),(27,'Chunky Sock Boot','women','Grey',7,'criss-coss',1),(28,'Patent Brogue Loafer','women','Grey',1,'ipanema',14),(29,'Platform Block Heel Boot','women','Grey',7,'grasshoppers',4),(30,'Diamante Essemtial Flat Sandals','women','Grey',5,'hi-tec',5),(31,'Diamante Essential Flat Sandal','women','Grey',2,'freestyle',2),(32,'Jewelled Sling Back Sandal','women','Grey',9,'criss-coss',1),(33,'Hybrid Clog','women','Grey',7,'giovanni',3),(34,'Hybrid Clog','women','Grey',5,'giovanni',3),(35,'Chunky Mesh Trainer','women','Grey',7,'criss-coss',1),(36,'Chunky Mesh Trainer','women','Grey',10,'grasshoppers',4),(37,'Two Tone Platform Sneaker','women','Grey',3,'hi-tec',5),(38,'Rain Boot','women','Grey',8,'ipanema',14),(39,'Rain Boot','women','Grey',6,'freestyle',2),(40,'Thong Kitten Heel Sandal','women','Grey',7,'grasshoppers',4),(41,'Court Sneaker','women','Grey',9,'hi-tec',5),(42,'Mary Jane Heel','women','Grey',8,'giovanni',3),(43,'Platform Sneaker','women','Grey',8,'criss-coss',1),(44,'Platform Sneaker','women','Grey',3,'freestyle',2),(45,'Brogue Lace Up','women','Grey',6,'ipanema',14),(46,'Brogue Lace Up','women','Grey',6,'hi-tec',5),(47,'Retro Trainer','women','Grey',7,'giovanni',3),(48,'Rider Boot','women','Grey',5,'freestyle',2),(49,'Over the Knee Boot','women','Grey',7,'ipanema',14),(50,'Laces Detail Knee-High Boot','women','Grey',5,'grasshoppers',4),(51,'Plush Furry Bootie Slipper','women','Grey',9,'criss-coss',1),(52,'Platform Retro Runner','women','Grey',9,'giovanni',3),(53,'Platform Retro Runner','women','Grey',9,'criss-coss',1),(54,'Round Toe Block Heel','women','Grey',8,'freestyle',2),(55,'Comfort Flat Mule','women','Grey',1,'ipanema',14),(56,'Knit Kitten Court Shoe','women','Grey',6,'hi-tec',5),(57,'Chennile Knit Mule Slipper','women','Grey',7,'grasshoppers',4),(58,'Chennile Knit Mule Slipper','women','Grey',6,'grasshoppers',4),(59,'Platform Hybrid Mule Slipper','women','Grey',4,'freestyle',2),(60,'Platform Hybrid Mule Slipper','women','Grey',9,'hi-tec',5),(61,'Wedge Sandal with Velcro Strap','women','Grey',10,'criss-coss',1),(62,'Wedge Sandal with Velcro Strap','women','Grey',6,'ipanema',14),(63,'Gusset Slip On Sneaker','women','Grey',9,'giovanni',3),(64,'Ankle Snow Boot','women','Grey',5,'criss-coss',1),(65,'Ankle Snow Boot','women','Grey',10,'ipanema',14),(66,'Moccassin','women','Grey',9,'grasshoppers',4),(67,'Moccasin','women','Grey',8,'giovanni',3),(68,'Patent Court Shoe','women','Grey',0,'hi-tec',5),(69,'Patent Court Shoe','women','Grey',7,'freestyle',2),(70,'Patent Court Shoe','women','Grey',5,'giovanni',3),(71,'Elastic Topline Block Heel','women','Grey',9,'ipanema',14),(72,'Panel Sneaker','kids','Grey',6,'sugar-spice',10),(73,'Double Velcro Boot','kids','Green',9,'pitbull',8),(74,'Panel Sneaker','kids','Blue',3,'tommy',12),(75,'Stacked Lace up Boots','kids','Grey',2,'terrapod',11),(76,'Stacked Lace up Boots','kids','Nude',7,'smart-steps',9),(77,'Winner Lace Up Boots','kids','Tan',3,'unreal',13),(78,'Hiker Boot','kids','Brown',1,'pitbull',8),(79,'Glitter Boots with Ribbon Laces','kids','Black',7,'smart-steps',9),(80,'Trendy Velcro Boot','kids','Pink',2,'terrapod',11),(81,'Trendy Velcro Boot','kids','Multi',2,'sugar-spice',10),(82,'Chunky Fur Chelsea','kids','Tan',4,'unreal',13),(83,'Cleated Boots','kids','Chocolate',5,'tommy',12),(84,'Studded Western Boots','kids','Chocolate',10,'terrapod',11),(85,'Trendy Mary Jane','kids','Black',3,'pitbull',8),(86,'Hiker Sneaker','kids','Black',6,'smart-steps',9),(87,'Glitter Outsole Boot','kids','Black',8,'sugar-spice',10),(88,'Apron Lace Up Boot','kids','Tan',4,'unreal',13),(89,'Dino Novelty Clog','kids','Green',2,'tommy',12),(90,'Fur Lined Clog','kids','Blue',4,'terrapod',11),(91,'Mzansi Snow Boot','kids','Lilac',9,'unreal',13),(92,'Mzansi Snow Boots','kids','Tan',10,'pitbull',8),(93,'Bump Toe Boot','kids','Nude',9,'sugar-spice',10),(94,'Trendy Rain Boots','kids','Pink',1,'tommy',12);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sizes` (`product_id`),
  CONSTRAINT `FK_Sizes` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,1,459.95,6,2),(2,1,469.95,7,2),(3,1,479.95,8,0),(4,1,489.95,9,10),(5,2,159.95,6,6),(6,2,169.95,7,10),(7,2,179.95,8,2),(8,2,189.95,9,4),(9,2,199.95,10,7),(10,2,209.95,11,8),(11,3,159.95,6,3),(12,3,169.95,7,6),(13,3,179.95,8,0),(14,3,189.95,9,1),(15,3,199.95,10,5),(16,3,209.95,11,1),(17,4,2249.95,6,9),(18,4,2259.95,7,1),(19,4,2269.95,8,2),(20,4,2279.95,9,1),(21,4,2289.95,10,9),(22,5,299.95,6,8),(23,5,309.95,7,8),(24,5,319.95,8,5),(25,6,539.95,6,3),(26,6,549.95,7,3),(27,7,539.95,6,9),(28,7,549.95,7,0),(29,8,579.95,8,4),(30,8,589.95,9,6),(31,8,599.95,10,7),(32,8,609.95,11,0),(33,9,189.95,6,1),(34,9,199.95,7,3),(35,9,209.95,8,10),(36,9,219.95,9,9),(37,9,229.95,10,5),(38,9,239.95,11,8),(39,10,1499.95,6,3),(40,10,1509.95,7,6),(41,10,1519.95,8,9),(42,10,1529.95,9,3),(43,10,1539.95,10,10),(44,10,1549.95,11,6),(45,11,1499.95,6,5),(46,11,1509.95,7,6),(47,11,1519.95,8,7),(48,11,1529.95,9,10),(49,11,1539.95,10,5),(50,11,1549.95,11,7),(51,12,1599.95,6,6),(52,12,1609.95,7,0),(53,12,1619.95,8,7),(54,12,1629.95,9,3),(55,12,1639.95,10,8),(56,12,1649.95,11,5),(57,13,1199.95,6,1),(58,13,1209.95,7,5),(59,13,1219.95,8,8),(60,13,1229.95,9,0),(61,13,1239.95,10,1),(62,13,1249.95,11,4),(63,14,459.95,6,2),(64,14,469.95,7,1),(65,14,479.95,8,6),(66,14,489.95,9,9),(67,14,499.95,10,3),(68,14,509.95,11,8),(69,15,439.95,6,5),(70,15,449.95,7,4),(71,15,459.95,8,8),(72,15,469.95,9,6),(73,15,479.95,10,7),(74,15,489.95,11,1),(75,16,189.95,6,1),(76,16,199.95,7,6),(77,16,209.95,8,9),(78,16,219.95,9,5),(79,16,229.95,10,7),(80,16,239.95,11,0),(81,17,299.95,6,8),(82,17,309.95,7,0),(83,17,319.95,8,7),(84,17,329.95,9,8),(85,17,339.95,10,8),(86,17,349.95,11,10),(87,18,559.95,5,10),(88,18,569.95,6,7),(89,18,579.95,7,0),(90,18,589.95,8,2),(91,18,599.95,9,1),(92,18,609.95,10,4),(93,19,559.95,5,10),(94,19,569.95,6,10),(95,19,579.95,7,10),(96,19,589.95,8,0),(97,19,599.95,9,7),(98,19,609.95,10,0),(99,20,359.95,6,9),(100,20,369.95,7,3),(101,20,379.95,8,9),(102,20,389.95,9,8),(103,20,399.95,10,2),(104,20,409.95,11,5),(105,21,559.95,5,4),(106,21,569.95,6,3),(107,21,579.95,7,5),(108,21,589.95,8,9),(109,21,599.95,9,3),(110,21,609.95,10,1),(111,22,499.95,3,6),(112,22,509.95,4,1),(113,22,519.95,5,0),(114,22,529.95,6,9),(115,22,539.95,7,9),(116,22,549.95,8,9),(117,23,499.95,3,1),(118,23,509.95,4,0),(119,23,519.95,5,9),(120,23,529.95,6,0),(121,23,539.95,7,3),(122,23,549.95,8,8),(123,24,259.95,3,4),(124,24,269.95,4,2),(125,24,279.95,5,1),(126,24,289.95,6,9),(127,24,299.95,7,2),(128,24,309.95,8,0),(129,25,259.95,3,3),(130,25,269.95,4,3),(131,25,279.95,5,9),(132,25,289.95,6,8),(133,25,299.95,7,1),(134,25,309.95,8,2),(135,26,499.95,5,6),(136,26,509.95,6,4),(137,26,519.95,7,0),(138,27,499.95,4,0),(139,27,509.95,5,7),(140,27,519.95,6,0),(141,27,529.95,7,8),(142,28,399.95,3,1),(143,28,409.95,4,6),(144,28,419.95,5,8),(145,28,429.95,6,7),(146,28,439.95,7,2),(147,28,449.95,8,4),(148,29,599.95,3,8),(149,29,609.95,4,10),(150,29,619.95,5,9),(151,29,629.95,6,5),(152,29,639.95,7,2),(153,29,649.95,8,8),(154,30,179.95,3,4),(155,30,189.95,4,10),(156,30,199.95,5,2),(157,30,209.95,6,1),(158,30,219.95,7,3),(159,30,229.95,8,3),(160,31,179.95,3,3),(161,31,189.95,4,8),(162,31,199.95,5,2),(163,31,209.95,6,6),(164,31,219.95,7,5),(165,31,229.95,8,7),(166,32,179.95,3,9),(167,32,189.95,4,7),(168,32,199.95,5,2),(169,32,209.95,6,0),(170,32,219.95,7,5),(171,32,229.95,8,4),(172,33,299.95,3,0),(173,33,309.95,4,7),(174,33,319.95,5,8),(175,33,329.95,6,3),(176,33,339.95,7,1),(177,33,349.95,8,2),(178,34,299.95,3,4),(179,34,309.95,4,4),(180,34,319.95,5,1),(181,34,329.95,6,4),(182,34,339.95,7,1),(183,34,349.95,8,10),(184,35,399.95,3,10),(185,35,409.95,4,0),(186,35,419.95,5,6),(187,35,429.95,6,4),(188,35,439.95,7,7),(189,35,449.95,8,0),(190,36,399.95,3,2),(191,36,409.95,4,7),(192,36,419.95,5,1),(193,36,429.95,6,4),(194,36,439.95,7,3),(195,36,449.95,8,3),(196,37,399.95,3,9),(197,37,409.95,4,3),(198,37,419.95,5,6),(199,37,429.95,6,4),(200,37,439.95,7,4),(201,38,399.95,3,10),(202,38,409.95,4,9),(203,38,419.95,5,0),(204,38,429.95,6,2),(205,39,399.95,3,9),(206,39,409.95,4,6),(207,39,419.95,5,4),(208,40,299.95,5,10),(209,40,309.95,6,5),(210,40,319.95,7,4),(211,40,329.95,8,2),(212,41,359.95,6,8),(213,41,369.95,7,3),(214,41,379.95,8,5),(215,42,399.95,3,3),(216,42,409.95,4,2),(217,42,419.95,5,0),(218,43,499.95,3,7),(219,43,509.95,4,7),(220,43,519.95,5,7),(221,43,529.95,6,1),(222,43,539.95,7,8),(223,44,499.95,3,9),(224,44,509.95,4,6),(225,44,519.95,5,7),(226,44,529.95,6,6),(227,44,539.95,7,4),(228,45,369.95,3,8),(229,45,379.95,4,3),(230,45,389.95,5,0),(231,45,399.95,6,6),(232,45,409.95,7,0),(233,45,419.95,8,6),(234,46,369.95,3,1),(235,46,379.95,4,6),(236,46,389.95,5,10),(237,46,399.95,6,1),(238,46,409.95,7,1),(239,46,419.95,8,0),(240,47,399.95,3,4),(241,47,409.95,4,1),(242,47,419.95,5,7),(243,47,429.95,6,10),(244,47,439.95,7,5),(245,47,449.95,8,0),(246,48,699.95,3,8),(247,48,709.95,4,5),(248,48,719.95,5,8),(249,48,729.95,6,8),(250,48,739.95,7,7),(251,48,749.95,8,7),(252,49,699.95,3,6),(253,49,709.95,4,5),(254,49,719.95,5,3),(255,49,729.95,6,2),(256,49,739.95,7,3),(257,49,749.95,8,2),(258,50,699.95,3,10),(259,50,709.95,4,3),(260,50,719.95,5,9),(261,50,729.95,6,6),(262,50,739.95,7,2),(263,50,749.95,8,10),(264,51,259.95,3,8),(265,51,269.95,4,4),(266,51,279.95,5,3),(267,51,289.95,6,6),(268,51,299.95,7,2),(269,51,309.95,8,2),(270,52,359.95,3,1),(271,52,369.95,4,5),(272,52,379.95,5,2),(273,52,389.95,6,1),(274,52,399.95,7,4),(275,52,409.95,8,7),(276,53,359.95,3,10),(277,53,369.95,4,9),(278,53,379.95,5,3),(279,53,389.95,6,8),(280,53,399.95,7,7),(281,53,409.95,8,3),(282,54,359.95,3,7),(283,54,369.95,4,9),(284,54,379.95,5,6),(285,54,389.95,6,2),(286,54,399.95,7,1),(287,54,409.95,8,2),(288,55,299.95,3,9),(289,55,309.95,4,3),(290,55,319.95,5,4),(291,55,329.95,6,9),(292,55,339.95,7,4),(293,55,349.95,8,1),(294,56,359.95,3,7),(295,56,369.95,4,1),(296,56,379.95,5,0),(297,56,389.95,6,3),(298,56,399.95,7,0),(299,56,409.95,8,2),(300,57,159.95,3,4),(301,57,169.95,4,1),(302,57,179.95,5,0),(303,57,189.95,6,9),(304,57,199.95,7,0),(305,57,209.95,8,1),(306,58,159.95,3,4),(307,58,169.95,4,9),(308,58,179.95,5,0),(309,58,189.95,6,0),(310,58,199.95,7,9),(311,58,209.95,8,1),(312,59,239.95,3,1),(313,59,249.95,4,7),(314,59,259.95,5,1),(315,60,239.95,6,4),(316,60,249.95,7,7),(317,60,259.95,8,9),(318,61,259.95,3,6),(319,61,269.95,4,7),(320,61,279.95,5,4),(321,61,289.95,6,0),(322,61,299.95,7,7),(323,61,309.95,8,8),(324,62,259.95,3,6),(325,62,269.95,4,7),(326,62,279.95,5,0),(327,62,289.95,6,2),(328,62,299.95,7,9),(329,62,309.95,8,0),(330,63,499.95,3,8),(331,63,509.95,4,8),(332,63,519.95,5,5),(333,63,529.95,6,8),(334,63,539.95,7,10),(335,63,549.95,8,6),(336,64,499.95,3,1),(337,64,509.95,4,4),(338,64,519.95,5,0),(339,64,529.95,6,8),(340,64,539.95,7,9),(341,64,549.95,8,1),(342,65,499.95,3,10),(343,65,509.95,4,0),(344,65,519.95,5,6),(345,65,529.95,6,1),(346,65,539.95,7,0),(347,65,549.95,8,5),(348,66,599.95,3,6),(349,66,609.95,4,7),(350,66,619.95,5,3),(351,66,629.95,6,9),(352,66,639.95,7,8),(353,66,649.95,8,1),(354,67,599.95,3,9),(355,67,609.95,4,4),(356,67,619.95,5,6),(357,67,629.95,6,0),(358,67,639.95,7,0),(359,67,649.95,8,1),(360,68,599.95,3,7),(361,68,609.95,4,7),(362,68,619.95,5,8),(363,68,629.95,6,9),(364,68,639.95,7,8),(365,68,649.95,8,9),(366,69,599.95,3,6),(367,69,609.95,4,4),(368,69,619.95,5,2),(369,69,629.95,6,10),(370,69,639.95,7,5),(371,69,649.95,8,4),(372,70,599.95,3,7),(373,70,609.95,4,4),(374,70,619.95,5,5),(375,70,629.95,6,0),(376,70,639.95,7,10),(377,70,649.95,8,8),(378,71,599.95,3,7),(379,71,609.95,4,5),(380,71,619.95,5,10),(381,71,629.95,6,8),(382,71,639.95,7,8),(383,71,649.95,8,4),(384,72,199.95,3,4),(385,72,209.95,4,4),(386,72,219.95,5,3),(387,72,229.95,6,3),(388,72,239.95,7,7),(389,72,249.95,8,8),(390,73,249.95,3,2),(391,73,259.95,4,5),(392,73,269.95,5,5),(393,73,279.95,6,6),(394,73,289.95,7,3),(395,73,299.95,8,9),(396,74,199.95,3,1),(397,74,209.95,4,7),(398,74,219.95,5,8),(399,75,359.95,5,8),(400,75,369.95,6,10),(401,75,379.95,7,2),(402,75,389.95,8,6),(403,76,339.95,5,8),(404,76,349.95,6,3),(405,76,359.95,7,1),(406,76,369.95,8,7),(407,77,339.95,3,1),(408,77,349.95,4,1),(409,77,359.95,5,7),(410,77,369.95,6,10),(411,77,379.95,7,4),(412,77,389.95,8,2),(413,78,339.95,3,3),(414,78,349.95,4,0),(415,78,359.95,5,3),(416,78,369.95,6,0),(417,78,379.95,7,8),(418,78,389.95,8,10),(419,79,249.95,3,10),(420,79,259.95,4,6),(421,79,269.95,5,2),(422,79,279.95,6,9),(423,79,289.95,7,10),(424,79,299.95,8,4),(425,80,249.95,3,1),(426,80,259.95,4,9),(427,80,269.95,5,0),(428,80,279.95,6,2),(429,80,289.95,7,0),(430,80,299.95,8,6),(431,81,249.95,6,6),(432,81,259.95,7,7),(433,81,269.95,8,4),(434,82,299.95,3,8),(435,82,309.95,4,0),(436,83,249.95,3,1),(437,83,259.95,4,7),(438,84,339.95,6,1),(439,84,349.95,7,10),(440,84,359.95,8,8),(441,85,289.95,3,7),(442,85,299.95,4,3),(443,85,309.95,5,1),(444,85,319.95,6,6),(445,86,239.95,3,7),(446,86,249.95,4,3),(447,86,259.95,5,3),(448,86,269.95,6,4),(449,86,279.95,7,1),(450,86,289.95,8,5),(451,87,249.95,3,1),(452,87,259.95,4,6),(453,87,269.95,5,6),(454,87,279.95,6,0),(455,87,289.95,7,10),(456,88,339.95,3,9),(457,88,349.95,4,9),(458,88,359.95,5,8),(459,88,369.95,6,7),(460,88,379.95,7,2),(461,88,389.95,8,6),(462,89,99.95,3,3),(463,89,109.95,4,9),(464,89,119.95,5,3),(465,89,129.95,6,1),(466,89,139.95,7,3),(467,89,149.95,8,4),(468,90,99.95,3,7),(469,90,109.95,4,1),(470,90,119.95,5,0),(471,90,129.95,6,3),(472,90,139.95,7,2),(473,90,149.95,8,5),(474,91,249.95,3,9),(475,91,259.95,4,6),(476,91,269.95,5,6),(477,91,279.95,6,3),(478,91,289.95,7,5),(479,91,299.95,8,9),(480,92,249.95,3,3),(481,92,259.95,4,6),(482,92,269.95,5,3),(483,92,279.95,6,10),(484,92,289.95,7,6),(485,92,299.95,8,10),(486,93,249.95,3,4),(487,93,259.95,4,2),(488,93,269.95,5,2),(489,93,279.95,6,5),(490,93,289.95,7,2),(491,93,299.95,8,9),(492,94,149.95,3,8),(493,94,159.95,4,2),(494,94,169.95,5,10),(495,94,179.95,6,4),(496,94,189.95,7,8),(497,94,199.95,8,0);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mihlayokuphela@gmail.com','$2b$10$qvmgYRddt.SOs5nFojmIBupN89ZaYEKIdL6X2Y.R0epuq5uOEwFOC'),(2,'mihla@gmail.com','$2b$10$iGjQ0gZ0TJ9kXHryj5ZubOk3WmYLw8JD.gIeKcm6/sDqc88Oxtcrq');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 21:05:06
