-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mynbadb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `coach_country`
--

DROP TABLE IF EXISTS `coach_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_country` (
  `coach_id` int NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`coach_id`),
  KEY `country_id_idx` (`country_id`),
  CONSTRAINT `coach_id2` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`),
  CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_country`
--

LOCK TABLES `coach_country` WRITE;
/*!40000 ALTER TABLE `coach_country` DISABLE KEYS */;
INSERT INTO `coach_country` VALUES (11,566),(28,688),(1,840),(2,840),(3,840),(4,840),(5,840),(6,840),(7,840),(8,840),(9,840),(10,840),(12,840),(13,840),(14,840),(15,840),(16,840),(18,840),(19,840),(20,840),(21,840),(22,840),(23,840),(24,840),(25,840),(26,840),(27,840),(29,840),(30,840),(40,840);
/*!40000 ALTER TABLE `coach_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coached_by`
--

DROP TABLE IF EXISTS `coached_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coached_by` (
  `coach_id` int NOT NULL,
  `team_id` int DEFAULT NULL,
  PRIMARY KEY (`coach_id`),
  KEY `team_id2_idx` (`team_id`),
  CONSTRAINT `coach_id` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`),
  CONSTRAINT `team_id2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coached_by`
--

LOCK TABLES `coached_by` WRITE;
/*!40000 ALTER TABLE `coached_by` DISABLE KEYS */;
INSERT INTO `coached_by` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(40,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `coached_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Quin','Snyder',NULL),(2,'Joe','Mazulla',NULL),(3,'Jacque','Vaughn',NULL),(4,'Steve','Clifford',NULL),(5,'Billy ','Donovan',''),(6,'J.B','Bickerstaff',NULL),(7,'Jason','Kidd',NULL),(8,'Michael','Malone',NULL),(9,'Monty ','Williams',NULL),(10,'Steve','Kerr',NULL),(11,'Ime','Udoka',NULL),(12,'Rick','Carlisle',NULL),(13,'Tyronn','Lue',NULL),(14,'Darvin','Ham',NULL),(15,'Taylor ','Jenkins',NULL),(16,'Erik','Spoelstra',NULL),(18,'Chris ','Finch',NULL),(19,'Willie ','Green',NULL),(20,'Tom','Thibodeau',NULL),(21,'Mark','Daigneault',NULL),(22,'Jamahl','Mosley',NULL),(23,'Nick','Nurse',NULL),(24,'Frank ','Vogel',NULL),(25,'Chauncey','Billups',NULL),(26,'Mike','Brown',NULL),(27,'Gregg','Popovich',NULL),(28,'Darko','Rajakovic',NULL),(29,'Will','Hardy',NULL),(30,'Wes','Unseld ','Jr.'),(40,'Adrian','Griffin','');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conferences` (
  `conference_id` int NOT NULL,
  `conference_name` varchar(45) NOT NULL,
  PRIMARY KEY (`conference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferences`
--

LOCK TABLES `conferences` WRITE;
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` VALUES (1,'East'),(2,'West');
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int NOT NULL,
  `country_name` varchar(45) NOT NULL,
  `two_letter_code` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (4,'Afghanistan','AF'),(8,'Albania','AL'),(10,'Antarctica','AQ'),(12,'Algeria','DZ'),(16,'American Samoa','AS'),(20,'Andorra','AD'),(24,'Angola','AO'),(28,'Antigua and Barbuda','AG'),(31,'Azerbaijan','AZ'),(32,'Argentina','AR'),(36,'Australia','AU'),(40,'Austria','AT'),(44,'Bahamas (the)','BS'),(48,'Bahrain','BH'),(50,'Bangladesh','BD'),(51,'Armenia','AM'),(52,'Barbados','BB'),(56,'Belgium','BE'),(60,'Bermuda','BM'),(64,'Bhutan','BT'),(68,'Bolivia (Plurinational State of)','BO'),(70,'Bosnia and Herzegovina','BA'),(72,'Botswana','BW'),(74,'Bouvet Island','BV'),(76,'Brazil','BR'),(84,'Belize','BZ'),(86,'British Indian Ocean Territory (the)','IO'),(90,'Solomon Islands','SB'),(92,'Virgin Islands (British)','VG'),(96,'Brunei Darussalam','BN'),(100,'Bulgaria','BG'),(104,'Myanmar','MM'),(108,'Burundi','BI'),(112,'Belarus','BY'),(116,'Cambodia','KH'),(120,'Cameroon','CM'),(124,'Canada','CA'),(132,'Cabo Verde','CV'),(136,'Cayman Islands (the)','KY'),(140,'Central African Republic (the)','CF'),(144,'Sri Lanka','LK'),(148,'Chad','TD'),(152,'Chile','CL'),(156,'China','CN'),(158,'Taiwan (Province of China)','TW'),(162,'Christmas Island','CX'),(166,'Cocos (Keeling) Islands (the)','CC'),(170,'Colombia','CO'),(174,'Comoros (the)','KM'),(175,'Mayotte','YT'),(178,'Congo (the)','CG'),(180,'Congo (the Democratic Republic of the)','CD'),(184,'Cook Islands (the)','CK'),(188,'Costa Rica','CR'),(191,'Croatia','HR'),(192,'Cuba','CU'),(196,'Cyprus','CY'),(203,'Czechia','CZ'),(204,'Benin','BJ'),(208,'Denmark','DK'),(212,'Dominica','DM'),(214,'Dominican Republic (the)','DO'),(218,'Ecuador','EC'),(222,'El Salvador','SV'),(226,'Equatorial Guinea','GQ'),(231,'Ethiopia','ET'),(232,'Eritrea','ER'),(233,'Estonia','EE'),(234,'Faroe Islands (the)','FO'),(238,'Falkland Islands (the) [Malvinas]','FK'),(239,'South Georgia and the South Sandwich Islands','GS'),(242,'Fiji','FJ'),(246,'Finland','FI'),(248,'Åland Islands','AX'),(250,'France','FR'),(254,'French Guiana','GF'),(258,'French Polynesia','PF'),(260,'French Southern Territories (the)','TF'),(262,'Djibouti','DJ'),(266,'Gabon','GA'),(268,'Georgia','GE'),(270,'Gambia (the)','GM'),(275,'Palestine, State of','PS'),(276,'Germany','DE'),(288,'Ghana','GH'),(292,'Gibraltar','GI'),(296,'Kiribati','KI'),(300,'Greece','GR'),(304,'Greenland','GL'),(308,'Grenada','GD'),(312,'Guadeloupe','GP'),(316,'Guam','GU'),(320,'Guatemala','GT'),(324,'Guinea','GN'),(328,'Guyana','GY'),(332,'Haiti','HT'),(334,'Heard Island and McDonald Islands','HM'),(336,'Holy See (the)','VA'),(340,'Honduras','HN'),(344,'Hong Kong','HK'),(348,'Hungary','HU'),(352,'Iceland','IS'),(356,'India','IN'),(360,'Indonesia','ID'),(364,'Iran (Islamic Republic of)','IR'),(368,'Iraq','IQ'),(372,'Ireland','IE'),(376,'Israel','IL'),(380,'Italy','IT'),(384,'Côte d\'Ivoire','CI'),(388,'Jamaica','JM'),(392,'Japan','JP'),(398,'Kazakhstan','KZ'),(400,'Jordan','JO'),(404,'Kenya','KE'),(408,'Korea (the Democratic People\'s Republic of)','KP'),(410,'Korea (the Republic of)','KR'),(414,'Kuwait','KW'),(417,'Kyrgyzstan','KG'),(418,'Lao People\'s Democratic Republic (the)','LA'),(422,'Lebanon','LB'),(426,'Lesotho','LS'),(428,'Latvia','LV'),(430,'Liberia','LR'),(434,'Libya','LY'),(438,'Liechtenstein','LI'),(440,'Lithuania','LT'),(442,'Luxembourg','LU'),(446,'Macao','MO'),(450,'Madagascar','MG'),(454,'Malawi','MW'),(458,'Malaysia','MY'),(462,'Maldives','MV'),(466,'Mali','ML'),(470,'Malta','MT'),(474,'Martinique','MQ'),(478,'Mauritania','MR'),(480,'Mauritius','MU'),(484,'Mexico','MX'),(492,'Monaco','MC'),(496,'Mongolia','MN'),(498,'Moldova (the Republic of)','MD'),(499,'Montenegro','ME'),(500,'Montserrat','MS'),(504,'Morocco','MA'),(508,'Mozambique','MZ'),(512,'Oman','OM'),(516,'Namibia','NA'),(520,'Nauru','NR'),(524,'Nepal','NP'),(528,'Netherlands (the)','NL'),(531,'Curaçao','CW'),(533,'Aruba','AW'),(534,'Sint Maarten (Dutch part)','SX'),(535,'Bonaire, Sint Eustatius and Saba','BQ'),(540,'New Caledonia','NC'),(548,'Vanuatu','VU'),(554,'New Zealand','NZ'),(558,'Nicaragua','NI'),(562,'Niger (the)','NE'),(566,'Nigeria','NG'),(570,'Niue','NU'),(574,'Norfolk Island','NF'),(578,'Norway','NO'),(580,'Northern Mariana Islands (the)','MP'),(581,'United States Minor Outlying Islands (the)','UM'),(583,'Micronesia (Federated States of)','FM'),(584,'Marshall Islands (the)','MH'),(585,'Palau','PW'),(586,'Pakistan','PK'),(591,'Panama','PA'),(598,'Papua New Guinea','PG'),(600,'Paraguay','PY'),(604,'Peru','PE'),(608,'Philippines (the)','PH'),(612,'Pitcairn','PN'),(616,'Poland','PL'),(620,'Portugal','PT'),(624,'Guinea-Bissau','GW'),(626,'Timor-Leste','TL'),(630,'Puerto Rico','PR'),(634,'Qatar','QA'),(638,'Réunion','RE'),(642,'Romania','RO'),(643,'Russian Federation (the)','RU'),(646,'Rwanda','RW'),(652,'Saint Barthélemy','BL'),(654,'Saint Helena, Ascension and Tristan da Cunha','SH'),(659,'Saint Kitts and Nevis','KN'),(660,'Anguilla','AI'),(662,'Saint Lucia','LC'),(663,'Saint Martin (French part)','MF'),(666,'Saint Pierre and Miquelon','PM'),(670,'Saint Vincent and the Grenadines','VC'),(674,'San Marino','SM'),(678,'Sao Tome and Principe','ST'),(682,'Saudi Arabia','SA'),(686,'Senegal','SN'),(688,'Serbia','RS'),(690,'Seychelles','SC'),(694,'Sierra Leone','SL'),(702,'Singapore','SG'),(703,'Slovakia','SK'),(704,'Viet Nam','VN'),(705,'Slovenia','SI'),(706,'Somalia','SO'),(710,'South Africa','ZA'),(716,'Zimbabwe','ZW'),(724,'Spain','ES'),(728,'South Sudan','SS'),(729,'Sudan (the)','SD'),(732,'Western Sahara','EH'),(740,'Suriname','SR'),(744,'Svalbard and Jan Mayen','SJ'),(748,'Eswatini','SZ'),(752,'Sweden','SE'),(756,'Switzerland','CH'),(760,'Syrian Arab Republic','SY'),(762,'Tajikistan','TJ'),(764,'Thailand','TH'),(768,'Togo','TG'),(772,'Tokelau','TK'),(776,'Tonga','TO'),(780,'Trinidad and Tobago','TT'),(784,'United Arab Emirates (the)','AE'),(788,'Tunisia','TN'),(792,'Turkey','TR'),(795,'Turkmenistan','TM'),(796,'Turks and Caicos Islands (the)','TC'),(798,'Tuvalu','TV'),(800,'Uganda','UG'),(804,'Ukraine','UA'),(807,'Republic of North Macedonia','MK'),(818,'Egypt','EG'),(831,'Guernsey','GG'),(832,'Jersey','JE'),(833,'Isle of Man','IM'),(834,'Tanzania, United Republic of','TZ'),(840,'United States of America (the)','US'),(850,'Virgin Islands (U.S.)','VI'),(854,'Burkina Faso','BF'),(858,'Uruguay','UY'),(860,'Uzbekistan','UZ'),(862,'Venezuela (Bolivarian Republic of)','VE'),(876,'Wallis and Futuna','WF'),(882,'Samoa','WS'),(887,'Yemen','YE'),(894,'Zambia','ZM');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `division_id` int NOT NULL AUTO_INCREMENT,
  `division_name` varchar(45) NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Atlantic'),(2,'Central'),(3,'Southeast'),(4,'Northwest'),(5,'Pacific'),(6,'Southwest');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_conf`
--

DROP TABLE IF EXISTS `loc_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loc_conf` (
  `location_id` int NOT NULL,
  `conference_id` int DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `lc_conference_id_idx` (`conference_id`),
  CONSTRAINT `lc_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`conference_id`),
  CONSTRAINT `lc_location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_conf`
--

LOCK TABLES `loc_conf` WRITE;
/*!40000 ALTER TABLE `loc_conf` DISABLE KEYS */;
INSERT INTO `loc_conf` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(9,1),(12,1),(15,1),(16,1),(19,1),(21,1),(22,1),(27,1),(29,1),(33,1),(7,2),(8,2),(10,2),(11,2),(13,2),(14,2),(17,2),(18,2),(20,2),(23,2),(24,2),(25,2),(26,2),(28,2);
/*!40000 ALTER TABLE `loc_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_div`
--

DROP TABLE IF EXISTS `loc_div`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loc_div` (
  `location_id` int NOT NULL,
  `division_id` int DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `ld_division_id_idx` (`division_id`),
  CONSTRAINT `ld_division_id` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`),
  CONSTRAINT `ld_location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_div`
--

LOCK TABLES `loc_div` WRITE;
/*!40000 ALTER TABLE `loc_div` DISABLE KEYS */;
INSERT INTO `loc_div` VALUES (2,1),(3,1),(19,1),(22,1),(27,1),(5,2),(6,2),(9,2),(12,2),(16,2),(1,3),(4,3),(15,3),(21,3),(29,3),(8,4),(17,4),(20,4),(24,4),(28,4),(33,4),(10,5),(13,5),(23,5),(25,5),(7,6),(11,6),(14,6),(18,6),(26,6);
/*!40000 ALTER TABLE `loc_div` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(45) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Atlanta'),(2,'Boston'),(3,'Brooklyn'),(4,'Charlotte'),(5,'Chicago'),(6,'Cleveland'),(7,'Dallas'),(8,'Denver'),(9,'Detroit'),(10,'Golden State'),(11,'Houston'),(12,'Indiana'),(13,'Los Angeles'),(14,'Memphis'),(15,'Miami'),(16,'Milwaukee'),(17,'Minnesota'),(18,'New Orleans'),(19,'New York'),(20,'Oklahoma City'),(21,'Orlando'),(22,'Philadelphia'),(23,'Phoenix'),(24,'Portland'),(25,'Sacramento'),(26,'San Antonio'),(27,'Toronto '),(28,'Utah'),(29,'Washington'),(33,'Tanauan');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_country`
--

DROP TABLE IF EXISTS `player_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_country` (
  `player_id` int NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `country_id2_idx` (`country_id`),
  CONSTRAINT `country_id2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `player_id3` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_country`
--

LOCK TABLES `player_country` WRITE;
/*!40000 ALTER TABLE `player_country` DISABLE KEYS */;
INSERT INTO `player_country` VALUES (12,24),(46,36),(108,36),(111,36),(112,36),(182,36),(314,36),(347,36),(368,36),(472,40),(193,44),(421,44),(68,56),(420,56),(155,70),(213,70),(400,70),(171,76),(239,92),(386,120),(469,120),(485,120),(27,124),(29,124),(91,124),(110,124),(116,124),(132,124),(157,124),(169,124),(177,124),(194,124),(200,124),(225,124),(260,124),(301,124),(309,124),(337,124),(348,124),(351,124),(374,124),(417,124),(449,124),(468,124),(493,124),(526,124),(163,180),(207,180),(251,180),(158,191),(499,191),(440,196),(24,214),(436,214),(487,246),(60,250),(154,250),(218,250),(298,250),(342,250),(354,250),(360,250),(393,250),(426,250),(451,250),(466,250),(509,250),(532,250),(370,268),(117,276),(222,276),(345,276),(365,276),(367,276),(471,276),(283,300),(290,300),(506,376),(124,380),(495,380),(510,380),(59,388),(42,392),(235,392),(407,392),(22,428),(362,428),(312,440),(86,466),(259,554),(401,566),(414,566),(457,566),(479,566),(515,566),(566,608),(31,620),(475,662),(15,686),(2,688),(121,688),(187,688),(356,688),(361,688),(450,688),(104,705),(138,705),(103,724),(173,724),(252,724),(425,728),(413,729),(6,756),(71,756),(84,792),(174,792),(389,792),(497,792),(28,804),(446,804),(454,807),(1,840),(3,840),(4,840),(5,840),(7,840),(8,840),(9,840),(10,840),(11,840),(13,840),(14,840),(16,840),(17,840),(18,840),(19,840),(20,840),(21,840),(23,840),(25,840),(26,840),(30,840),(32,840),(33,840),(34,840),(35,840),(36,840),(37,840),(38,840),(39,840),(40,840),(41,840),(43,840),(44,840),(45,840),(47,840),(48,840),(49,840),(50,840),(51,840),(52,840),(53,840),(54,840),(55,840),(56,840),(57,840),(58,840),(61,840),(62,840),(63,840),(64,840),(65,840),(66,840),(67,840),(69,840),(70,840),(72,840),(73,840),(74,840),(75,840),(76,840),(77,840),(78,840),(79,840),(80,840),(81,840),(82,840),(83,840),(85,840),(87,840),(88,840),(89,840),(90,840),(92,840),(93,840),(94,840),(95,840),(96,840),(97,840),(98,840),(99,840),(100,840),(101,840),(102,840),(105,840),(106,840),(107,840),(109,840),(113,840),(114,840),(115,840),(118,840),(119,840),(120,840),(122,840),(123,840),(125,840),(126,840),(127,840),(128,840),(129,840),(130,840),(131,840),(133,840),(134,840),(135,840),(136,840),(137,840),(139,840),(140,840),(141,840),(142,840),(143,840),(144,840),(145,840),(146,840),(147,840),(148,840),(149,840),(150,840),(151,840),(152,840),(153,840),(156,840),(159,840),(160,840),(161,840),(162,840),(164,840),(165,840),(166,840),(167,840),(168,840),(170,840),(172,840),(175,840),(176,840),(178,840),(179,840),(180,840),(181,840),(183,840),(184,840),(185,840),(186,840),(188,840),(189,840),(190,840),(191,840),(192,840),(195,840),(196,840),(197,840),(198,840),(199,840),(201,840),(202,840),(203,840),(204,840),(205,840),(206,840),(208,840),(209,840),(210,840),(211,840),(212,840),(214,840),(215,840),(216,840),(217,840),(219,840),(220,840),(221,840),(223,840),(224,840),(226,840),(227,840),(228,840),(229,840),(230,840),(231,840),(232,840),(233,840),(234,840),(236,840),(237,840),(238,840),(240,840),(241,840),(242,840),(243,840),(244,840),(245,840),(246,840),(247,840),(248,840),(249,840),(250,840),(253,840),(254,840),(255,840),(256,840),(257,840),(258,840),(261,840),(262,840),(263,840),(264,840),(265,840),(266,840),(267,840),(268,840),(269,840),(270,840),(271,840),(272,840),(273,840),(274,840),(276,840),(277,840),(278,840),(279,840),(280,840),(281,840),(282,840),(284,840),(285,840),(286,840),(287,840),(288,840),(289,840),(291,840),(292,840),(293,840),(294,840),(295,840),(296,840),(297,840),(299,840),(300,840),(302,840),(303,840),(304,840),(305,840),(306,840),(307,840),(308,840),(310,840),(311,840),(313,840),(315,840),(316,840),(317,840),(318,840),(319,840),(320,840),(321,840),(322,840),(323,840),(324,840),(325,840),(326,840),(327,840),(328,840),(329,840),(330,840),(331,840),(332,840),(333,840),(334,840),(335,840),(336,840),(338,840),(339,840),(340,840),(341,840),(343,840),(344,840),(346,840),(349,840),(350,840),(352,840),(353,840),(355,840),(357,840),(358,840),(359,840),(363,840),(364,840),(366,840),(369,840),(371,840),(372,840),(373,840),(375,840),(376,840),(377,840),(378,840),(380,840),(381,840),(382,840),(383,840),(384,840),(385,840),(387,840),(388,840),(390,840),(391,840),(392,840),(394,840),(395,840),(396,840),(397,840),(398,840),(399,840),(402,840),(403,840),(404,840),(405,840),(406,840),(408,840),(409,840),(410,840),(411,840),(412,840),(415,840),(416,840),(418,840),(419,840),(422,840),(423,840),(424,840),(427,840),(428,840),(429,840),(430,840),(431,840),(432,840),(433,840),(434,840),(435,840),(437,840),(438,840),(439,840),(441,840),(442,840),(443,840),(444,840),(445,840),(447,840),(448,840),(452,840),(453,840),(455,840),(456,840),(458,840),(459,840),(460,840),(461,840),(462,840),(463,840),(464,840),(465,840),(467,840),(470,840),(473,840),(474,840),(476,840),(478,840),(480,840),(481,840),(482,840),(483,840),(484,840),(486,840),(488,840),(489,840),(490,840),(491,840),(492,840),(494,840),(496,840),(498,840),(500,840),(501,840),(502,840),(503,840),(504,840),(505,840),(507,840),(508,840),(511,840),(512,840),(513,840),(514,840),(516,840),(517,840),(518,840),(519,840),(520,840),(521,840),(522,840),(523,840),(524,840),(525,840),(527,840),(528,840),(529,840),(530,840),(531,840);
/*!40000 ALTER TABLE `player_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) NOT NULL,
  `experience` int DEFAULT NULL,
  `college` varchar(200) DEFAULT NULL,
  `jersey_num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Dejounte','Murray',NULL,'SG','September 19 1996',6,'Washington','5'),(2,'Bogdan','Bogdanovic',NULL,'SG','August 18 1992',6,NULL,'13'),(3,'Jalen','Johnson',NULL,'SF','December 18 2001',2,'Duke','1'),(4,'De\'Andre','Hunter',NULL,'SF','December 2 1997',4,'Virginia','12'),(5,'Saddiq','Bey',NULL,'SF','April 9 1999',3,'Villanova','41'),(6,'Clint','Capela',NULL,'C','May 18 1994',9,NULL,'15'),(7,'Onyeka','Okongwu',NULL,'C','December 11 2000',3,'USC','17'),(8,'Trae','Young',NULL,'PG','September 19 1998',5,'Oklahoma','11'),(9,'AJ','Griffin',NULL,'SF','August 25 2003',1,'Duke','14'),(10,'Wesley','Matthews',NULL,'SG','October 14 1986',14,'Marquette','32'),(11,'Garrison','Mathews',NULL,'SG','October 24 1996',4,'Lipscomb','25'),(12,'Bruno','Fernando',NULL,'C','August 15 1998',4,'Maryland','24'),(13,'Trent','Forrest',NULL,'SG','June 12 1998',3,'Florida State','2'),(14,'Kobe','Bufkin',NULL,'SG','September 21 2003',0,'Michigan','4'),(15,'Mouhamed','Gueye',NULL,'PF','November 9 2002',0,'Washington State','18'),(16,'Miles','Norris',NULL,'PF','April 15 2000',0,'College of San Francisco',NULL),(17,'Seth','Lundy',NULL,'SF','April 2 2000',0,'Penn State',NULL),(18,'Jayson','Tatum',NULL,'PF','March 3 1998',6,'Duke','0'),(19,'Sam','Hauser',NULL,'SF','December 8 1997',2,'Marquette Virginia','30'),(20,'Payton','Pritchard',NULL,'PG','January 28 1998',3,'Oregon','11'),(21,'Jaylen','Brown',NULL,'SF','October 24 1996',7,'California','7'),(22,'Kristaps','Porzingis',NULL,'C','August 2 1995',7,NULL,'8'),(23,'Jrue','Holiday',NULL,'PG','June 12 1990',14,'UCLA','4'),(24,'Al','Horford',NULL,'C','June 3 1986',16,'Florida','42'),(25,'Derrick','White',NULL,'SG','July 2 1994',6,'Colorado Springs ','9'),(26,'Luke','Kornet',NULL,'C','July 15 1995',6,'Vanderbilt','40'),(27,'Oshae','Brissett',NULL,'SF','June 20 1998',4,'Syracuse','12'),(28,'Svi','Mykhailiuk',NULL,'SF','June 10 1997',5,'Kansas','50'),(29,'Dalano','Banton',NULL,'PG','November 7 1999',2,'Nebraska','45'),(30,'Lamar','Stevens',NULL,'PF','July 9 1997',3,'Penn State','77'),(31,'Neemias','Queta',NULL,'C','July 13 1999',2,'Utah State University','88'),(32,'Jordan','Walsh',NULL,'SF','March 3 2004',0,'Arkansas',NULL),(33,'JD','Davison',NULL,'SG','October 3 2002',1,'Alabama',NULL),(34,'Nathan','Knight',NULL,'PF','September 20 1997',3,'William & Mary',NULL),(35,'Mikal','Bridges',NULL,'SF','August 30 1996',5,'Villanova','1'),(36,'Dorian','Finney-Smith',NULL,'PF','May 4 1993',7,'Florida','28'),(37,'Royce','O\'Neale',NULL,'SF','June 5 1993',6,'Denver Baylor','0'),(38,'Day\'Ron','Sharpe',NULL,'C','November 6 2001',2,'UNC','20'),(39,'Lonnie','Walker','IV','SG','December 14 1998',5,'Miami (FL)','8'),(40,'Spencer','Dinwiddie',NULL,'PG','April 6 1993',9,'Colorado','26'),(41,'Dennis','Smith','Jr.','PG','November 25 1997',6,'NC State','4'),(42,'Cam','Thomas',NULL,'SG','October 13 2001',2,'LSU','24'),(43,'Trendon','Watford',NULL,'PF','November 9 2000',2,'LSU','9'),(44,'Cameron','Johnson',NULL,'PF','March 3 1996',4,'Pitt UNC','2'),(45,'Nic','Claxton',NULL,'C','April 17 1999',4,'Georgia','33'),(46,'Ben','Simmons',NULL,'PG','July 20 1996',5,'LSU','10'),(47,'Armoni','Brooks',NULL,'PG','June 5 1998',2,'Houston','13'),(48,'Harry','Giles',NULL,'C','April 22 1998',3,'Duke','14'),(49,'Jalen','Wilson',NULL,'PF','November 4 2000',0,'Kansas','22'),(50,'Noah','Clowney',NULL,'PF','July 14 2004',0,'Alabama',NULL),(51,'Dariq','Whitehead',NULL,'SF','August 1 2004',0,'Duke',NULL),(52,'Keon','Johnson',NULL,'SG','March 10 2002',2,'Tennessee',NULL),(53,'LaMelo','Ball',NULL,'PG','August 22 2001',3,NULL,'1'),(54,'Mark','Williams',NULL,'C','December 16 2001',1,'Duke','5'),(55,'JT','Thor',NULL,'PF','August 26 2002',2,'Auburn','21'),(56,'P.J.','Washington',NULL,'PF','August 23 1998',4,'Kentucky','25'),(57,'Gordon','Hayward',NULL,'SF','March 23 1990',13,'Butler','20'),(58,'Brandon','Miller',NULL,'SF','November 22 2002',0,'Alabama','24'),(59,'Nick','Richards',NULL,'C','November 29 1997',3,'Kentucky','4'),(60,'Théo','Maledon',NULL,'PG','June 12 2001',3,NULL,'9'),(61,'Bryce','McGowens',NULL,'SG','November 8 2002',1,'Nebraska','7'),(62,'Ish','Smith',NULL,'PG','July 5 1988',13,'Wake Forest','14'),(63,'Nick','Smith','Jr.','SG','April 18 2004',0,'Arkansas','8'),(64,'Terry','Rozier',NULL,'SG','March 17 1994',8,'Louisville','3'),(65,'Miles','Bridges',NULL,'SF','March 21 1998',4,'Michigan State','0'),(66,'Leaky','Black',NULL,'SF','June 14 1999',0,'UNC','12'),(67,'Amari','Bailey',NULL,'PG','February 17 2004',0,'UCLA','10'),(68,'Frank','Ntilikina',NULL,'PG','July 28 1998',6,NULL,NULL),(69,'Cody','Martin',NULL,'SF','September 28 1995',4,'NC State Nevada',NULL),(70,'James','Bouknight',NULL,'SG','September 18 2000',2,'UConn',NULL),(71,'Nikola','Vucevic',NULL,'C','October 24 1990',12,'USC','9'),(72,'Coby','White',NULL,'PG','February 16 2000',4,'UNC','0'),(73,'Patrick','Williams',NULL,'PF','August 26 2001',3,'Florida State','44'),(74,'Andre','Drummond',NULL,'C','August 10 1993',11,'UConn','3'),(75,'Jevon','Carter',NULL,'PG','September 14 1995',5,'West Virginia','5'),(76,'Torrey','Craig',NULL,'SF','December 19 1990',6,'USC Upstate','13'),(77,'Zach','LaVine',NULL,'SG','March 10 1995',9,'UCLA','8'),(78,'DeMar','DeRozan',NULL,'SF','August 7 1989',14,'USC','11'),(79,'Alex','Caruso',NULL,'SG','February 28 1994',6,'Texas A&M','6'),(80,'Ayo','Dosunmu',NULL,'SG','January 17 2000',2,'Illinois','12'),(81,'Julian','Phillips',NULL,'SF','November 5 2003',0,'Tennessee','15'),(82,'Dalen','Terry',NULL,'SG','July 12 2002',1,'Arizona','25'),(83,'Terry','Taylor',NULL,'PF','September 23 1999',2,'Austin Peay State University','32'),(84,'Onuralp','Bitim',NULL,'SG','March 31 1999',0,NULL,'17'),(85,'Lonzo','Ball',NULL,'PG','October 27 1997',5,'UCLA',NULL),(86,'Adama','Sanogo',NULL,'PF','February 12 2002',0,'UConn',NULL),(87,'Evan','Mobley',NULL,'PF','June 18 2001',2,'USC','4'),(88,'Max','Strus',NULL,'SF','March 28 1996',4,'Lewis (IL) DePaul','1'),(89,'Georges','Niang',NULL,'PF','June 17 1993',7,'Iowa State','20'),(90,'Dean','Wade',NULL,'PF','November 20 1996',4,'Kansas State','32'),(91,'Tristan','Thompson',NULL,'PF','March 13 1991',12,'Texas','12'),(92,'Caris','LeVert',NULL,'SG','August 25 1994',7,'Michigan','3'),(93,'Donovan','Mitchell',NULL,'SG','September 7 1996',6,'Louisville','45'),(94,'Darius','Garland',NULL,'PG','January 26 2000',4,'Vanderbilt','10'),(95,'Jarrett','Allen',NULL,'C','April 21 1998',6,'Texas','31'),(96,'Craig','Porter','Jr.','PG','February 26 2000',0,'Wichita State','9'),(97,'Damian','Jones',NULL,'C','June 30 1995',7,'Vanderbilt','30'),(98,'Sam','Merrill',NULL,'SG','May 15 1996',3,'Utah State University','5'),(99,'Emoni','Bates',NULL,'SF','January 28 2004',0,'Michigan','21'),(100,'Isaac','Okoro',NULL,'SF','January 26 2001',3,'Auburn','35'),(101,'Ty','Jerome',NULL,'SG','July 8 1997',4,'Virginia','2'),(102,'Isaiah','Mobley',NULL,'PF','September 24 1999',1,'USC','15'),(103,'Ricky','Rubio',NULL,'PG','October 21 1990',12,NULL,NULL),(104,'Luka','Doncic',NULL,'PG','February 28 1999',5,NULL,'77'),(105,'Tim','Hardaway','Jr.','SF','March 16 1992',10,'Michigan','10'),(106,'Grant','Williams',NULL,'PF','November 30 1998',4,'Tennessee','3'),(107,'Derrick','Jones','Jr.','SF','February 15 1997',7,'UNLV','55'),(108,'Josh','Green',NULL,'SG','November 16 2000',3,'Arizona','8'),(109,'Dereck','Lively','II','C','February 12 2004',0,'Duke','2'),(110,'Dwight','Powell',NULL,'C','July 20 1991',9,'Stanford','7'),(111,'Dante','Exum',NULL,'PG','July 13 1995',6,NULL,'0'),(112,'Kyrie','Irving',NULL,'SG','March 23 1992',12,'Duke','11'),(113,'Jaden','Hardy',NULL,'SG','July 5 2002',1,NULL,'1'),(114,'Seth','Curry',NULL,'SG','August 23 1990',9,'Duke','30'),(115,'Richaun','Holmes',NULL,'C','October 15 1993',8,'Bowling Green','20'),(116,'Olivier-Maxence','Prosper',NULL,'PF','July 3 2002',0,'Clemson Marquette','18'),(117,'Maxi','Kleber',NULL,'C','January 29 1992',6,NULL,'42'),(118,'Markieff','Morris',NULL,'PF','September 2 1989',12,'Kansas','88'),(119,'Greg','Brown','III','PF','September 1 2001',2,'Texas',NULL),(120,'Dexter','Dennis',NULL,'SG','February 9 1999',0,'Texas A&M',NULL),(121,'Nikola','Jokic',NULL,'C','February 19 1995',8,NULL,'15'),(122,'Michael','Porter','Jr.','SF','June 29 1998',4,'Missouri','1'),(123,'Aaron','Gordon','','PF','September 16 1995',9,'Arizona','50'),(124,'Reggie','Jackson',NULL,'PG','April 16 1990',12,'Boston College','7'),(125,'Kentavious','Caldwell-Pope',NULL,'SG','February 18 1993',10,'Georgia','5'),(126,'Christian','Braun',NULL,'SG','April 17 2001',1,'Kansas','0'),(127,'Zeke','Nnaji',NULL,'PF','January 9 2001',3,'Arizona','22'),(128,'Peyton','Watson',NULL,'SF','September 11 2002',1,'UCLA','8'),(129,'Julian','Strawther',NULL,'SF','April 18 2002',0,'Gonzaga','3'),(130,'Jalen','Pickett',NULL,'SG','October 22 1999',0,'Penn State','24'),(131,'Collin','Gillespie',NULL,'PG','June 25 1999',0,'Villanova','21'),(132,'Jamal','Murray',NULL,'PG','February 23 1997',6,'Kentucky','27'),(133,'Justin','Holiday',NULL,'SG','April 5 1989',10,'Washington','9'),(134,'Hunter','Tyson',NULL,'PF','June 13 2000',0,'Clemson','4'),(135,'Braxton','Key',NULL,'SF','February 14 1997',2,'Virginia','11'),(136,'DeAndre','Jordan',NULL,'C','July 21 1988',15,'Texas A&M','6'),(137,'Jay','Huff',NULL,'C','August 25 1998',2,'Virginia',NULL),(138,'Vlatko','Cancar',NULL,'PF','April 10 1997',4,NULL,NULL),(139,'Cade','Cunningham',NULL,'PG','September 25 2001',2,'Oklahoma State','2'),(140,'Isaiah','Stewart',NULL,'PF','May 22 2001',3,'Washington','28'),(141,'Ausar','Thompson',NULL,'SF','January 30 2003',0,NULL,'9'),(142,'Marvin','Bagley','III','C','March 14 1999',5,'Duke','35'),(143,'Marcus','Sasser',NULL,'PG','September 21 2000',0,'Houston','25'),(144,'Killian','Hayes',NULL,'PG','July 27 2001',3,NULL,'7'),(145,'Jaden','Ivey',NULL,'SG','February 13 2002',1,'Purdue','23'),(146,'Stanley','Umude',NULL,'SG','April 12 1999',1,'Arkansas','17'),(147,'Alec','Burks',NULL,'SG','July 20 1991',12,'Colorado','14'),(148,'Jalen','Duren',NULL,'C','November 18 2003',1,'Memphis','0'),(149,'James','Wiseman',NULL,'C','March 31 2001',2,'Memphis','13'),(150,'Joe','Harris',NULL,'SG','September 6 1991',9,'Virginia','31'),(151,'Jared','Rhoden',NULL,'SG','August 27 1999',1,'Seton Hall','8'),(152,'Kevin','Knox',NULL,'SF','August 11 1999',5,'Kentucky','24'),(153,'Isaiah','Livers',NULL,'PF','July 28 1998',2,'Michigan','12'),(154,'Malcolm','Cazalon',NULL,'SG','August 27 2001',0,NULL,'20'),(155,'Bojan','Bogdanovic',NULL,'PF','April 18 1989',9,NULL,NULL),(156,'Monte','Morris',NULL,'PG','June 27 1995',6,'Iowa State',NULL),(157,'Andrew','Wiggins',NULL,'SF','February 23 1995',9,'Kansas','22'),(158,'Dario','Šaric',NULL,'C','April 8 1994',6,NULL,'20'),(159,'Chris','Paul',NULL,'PG','May 6 1985',18,'Wake Forest','3'),(160,'Moses','Moody',NULL,'SG','May 31 2002',2,'Arkansas','4'),(161,'Kevon','Looney',NULL,'C','February 6 1996',8,'UCLA','5'),(162,'Klay','Thompson',NULL,'SF','February 8 1990',10,'Washington State','11'),(163,'Jonathan','Kuminga',NULL,'PF','October 6 2002',2,NULL,'0'),(164,'Stephen','Curry',NULL,'PG','March 14 1988',14,'Davidson','30'),(165,'Gary','Payton','II','SG','December 1 1992',7,'Oregon State','0'),(166,'Trayce','Jackson-Davis',NULL,'PF','February 22 2000',0,'Indiana','32'),(167,'Brandin','Podziemski',NULL,'SG','February 25 2003',0,'Santa Clara','2'),(168,'Draymond','Green',NULL,'PF','March 4 1990',11,'Michigan State','23'),(169,'Cory','Joseph',NULL,'PG','August 20 1991',12,'Texas','1'),(170,'Lester','Quinones',NULL,'SG','November 16 2000',1,'Memphis','25'),(171,'Gui','Santos',NULL,'PF','June 22 2002',0,NULL,'15'),(172,'Jerome','Robinson',NULL,'SG','February 22 1997',3,'Boston College','18'),(173,'Usman','Garuba',NULL,'PF','March 9 2002',2,NULL,NULL),(174,'Alperen','Sengün',NULL,'C','July 25 2002',2,NULL,'28'),(175,'Jalen','Green',NULL,'SG','February 9 2002',2,NULL,'4'),(176,'Fred','VanVleet',NULL,'PG','February 25 1994',7,'Wichita State','5'),(177,'Dillon','Brooks',NULL,'SF','January 22 1996',6,'Oregon','9'),(178,'Jabari','Smith','Jr.','PF','May 13 2003',1,'Auburn','10'),(179,'Jae\'Sean','Tate',NULL,'SF','October 28 1995',3,'Ohio State','8'),(180,'Jeff','Green',NULL,'PF','August 28 1986',15,'Georgetown','32'),(181,'Aaron','Holiday',NULL,'PG','September 30 1996',5,'UCLA','0'),(182,'Jock','Landale',NULL,'C','October 25 1995',2,'Saint Mary\'s','2'),(183,'Tari','Eason',NULL,'PF','May 10 2001',1,'LSU','17'),(184,'Reggie','Bullock',NULL,'SF','March 16 1991',10,'UNC','25'),(185,'Amen','Thompson',NULL,'SF','January 30 2003',0,NULL,'1'),(186,'Jeenathan','Williams',NULL,'SG','February 12 1999',1,'Buffalo','19'),(187,'Boban','Marjanovic',NULL,'C','August 15 1988',8,NULL,'51'),(188,'Cam','Whitmore',NULL,'SF','July 8 2004',0,'Villanova','7'),(189,'Jermaine','Samuels',NULL,'SF','November 13 1998',0,'Villanova','0'),(190,'Nate','Hinton',NULL,'SG','June 8 1999',2,'Houston','14'),(191,'Victor','Oladipo',NULL,'SG','May 4 1992',10,'Indiana',NULL),(192,'Myles','Turner',NULL,'C','March 24 1996',8,'Texas','33'),(193,'Buddy','Hield',NULL,'SF','December 17 1992',7,'Oklahoma','7'),(194,'Bennedict','Mathurin',NULL,'SF','June 19 2002',1,'Arizona','0'),(195,'Obi','Toppin',NULL,'PF','March 4 1998',3,'Dayton','1'),(196,'Bruce','Brown',NULL,'SG','August 15 1996',5,'Miami (FL)','11'),(197,'Tyrese','Haliburton',NULL,'PG','February 29 2000',3,'Iowa State','0'),(198,'Aaron','Nesmith',NULL,'SF','October 16 1999',3,'Vanderbilt','23'),(199,'Jalen','Smith',NULL,'C','March 16 2000',3,'Maryland','25'),(200,'Andrew','Nembhard',NULL,'PG','January 16 2000',1,'Gonzaga','2'),(201,'T.J.','McConnell',NULL,'PG','March 25 1992',8,'Arizona','9'),(202,'Isaiah','Jackson',NULL,'C','January 10 2002',2,'Kentucky','22'),(203,'Ben','Sheppard',NULL,'SG','July 16 2001',0,'Belmont','26'),(204,'Jordan','Nwora',NULL,'SF','September 9 1998',3,'Louisville','13'),(205,'Jarace','Walker',NULL,'PF','September 4 2003',0,'Houston','5'),(206,'Isaiah','Wong',NULL,'SG','January 28 2001',0,'Miami (FL)',NULL),(207,'Oscar','Tshiebwe',NULL,'PF','November 27 1999',0,'Kentucky',NULL),(208,'Kendall','Brown',NULL,'SG','May 11 2003',1,'Baylor',NULL),(209,'Paul','George',NULL,'PF','May 2 1990',13,'Fresno State','13'),(210,'Kawhi','Leonard',NULL,'SF','June 29 1991',11,'San Diego State','2'),(211,'Norman','Powell',NULL,'SG','May 25 1993',8,'UCLA','24'),(212,'Russell','Westbrook',NULL,'PG','November 12 1988',15,'UCLA','0'),(213,'Ivica','Zubac',NULL,'C','March 18 1997',7,NULL,'40'),(214,'P.J.','Tucker',NULL,'PF','May 5 1985',12,'Texas','17'),(215,'James','Harden',NULL,'SG','August 26 1989',14,'Arizona State','1'),(216,'Bones','Hyland',NULL,'PG','September 14 2000',2,'VCU','5'),(217,'Terance','Mann',NULL,'SG','October 18 1996',4,'Florida State','14'),(218,'Moussa','Diabaté ',NULL,'C','January 21 2002',1,'Michigan','25'),(219,'Amir','Coffey',NULL,'SF','June 17 1997',4,'Minnesota','7'),(220,'Mason','Plumlee',NULL,'C','March 5 1990',10,'Duke','44'),(221,'Kobe','Brown',NULL,'PF','January 1 2000',0,'Missouri','21'),(222,'Daniel','Theis',NULL,'C','April 4 1992',6,NULL,'10'),(223,'Jordan','Miller',NULL,'SF','January 23 2000',0,'George Mason Miami (FL)','11'),(224,'Brandon','Boston','Jr.','SF','November 28 2001',2,'Kentucky',NULL),(225,'Joshua','Primo',NULL,'SG','December 24 2002',2,'Alabama',NULL),(226,'Xavier','Moon',NULL,'SG','January 2 1995',2,'Morehead State University',NULL),(227,'D\'Angelo','Russell',NULL,'PG','February 23 1996',8,'Ohio State','1'),(228,'Austin','Reaves',NULL,'SG','May 29 1998',2,'Oklahoma','15'),(229,'Christian','Wood',NULL,'PF','September 27 1995',7,'UNLV','35'),(230,'LeBron','James',NULL,'PF','December 30 1984',20,NULL,'23'),(231,'Anthony','Davis',NULL,'C','March 11 1993',11,'Kentucky','3'),(232,'Cam','Reddish',NULL,'SF','September 1 1999',4,'Duke','5'),(233,'Taurean','Prince',NULL,'PF','March 22 1994',7,'Baylor','12'),(234,'Jaxson','Hayes',NULL,'C','May 23 2000',4,'Texas','11'),(235,'Rui','Hachimura',NULL,'PF','February 8 1998',4,'Gonzaga','28'),(236,'Max','Christie',NULL,'SG','February 10 2003',1,'Michigan State','10'),(237,'Maxwell','Lewis',NULL,'SF','July 27 2002',0,'Pepperdine','21'),(238,'Gabe','Vincent',NULL,'PG','June 14 1996',4,'UC Santa Barbara','7'),(239,'D\'Moi','Hodge',NULL,'SG','December 20 1998',0,'University Missouri','55'),(240,'Colin','Castleton ',NULL,'C','May 25 2000',0,'Michigan Florida','14'),(241,'Alex','Fudge',NULL,'SF','May 6 2003',0,'LSU Florida','17'),(242,'Jalen','Hood-Schifino',NULL,'SG','June 19 2003',0,'Indiana',NULL),(243,'Jarred','Vanderbilt',NULL,'PF','April 3 1999',5,'Kentucky',NULL),(244,'Desmond','Bane',NULL,'SG','June 25 1998',3,'TCU','22'),(245,'Jaren','Jackson','Jr.','C','September 15 1999',5,'Michigan State','13'),(246,'David','Roddy',NULL,'PF','March 27 2001',1,'Colorado State','21'),(247,'Ziaire','Williams',NULL,'SF','September 12 2001',2,'Stanford','8'),(248,'John','Konchar',NULL,'SF','March 22 1996',4,'Purdue-Fort Wayne','46'),(249,'Marcus','Smart',NULL,'PG','March 6 1994',9,'Oklahoma State','36'),(250,'Kenneth','Lofton','Jr.','PF','August 14 2002',1,'Louisiana Tech','6'),(251,'Bismack','Biyombo',NULL,'C','August 28 1992',12,NULL,'18'),(252,'Santi','Aldama',NULL,'PF','January 10 2001',2,'Loyola (MD)','7'),(253,'Luke','Kennard',NULL,'SG','June 24 1996',6,'Duke','10'),(254,'Derrick','Rose',NULL,'PG','October 4 1988',14,'Memphis','23'),(255,'Xavier','Tillman','Sr.','C','January 12 1999',3,'Michigan State','2'),(256,'Jake','LaRavia',NULL,'PF','November 3 2001',1,'Wake Forest','3'),(257,'Gregory','Jackson','II','PF','December 17 2004',0,'South Carolina','45'),(258,'Ja','Morant',NULL,'PG','August 10 1999',4,'Murray State',NULL),(259,'Steven','Adams',NULL,'C','July 20 1993',10,'Pitt',NULL),(260,'Brandon','Clarke',NULL,'PF','September 19 1996',4,'Gonzaga',NULL),(261,'Jaime','Jaquez','Jr.','SF','February 18 2001',0,'UCLA','11'),(262,'Duncan','Robinson',NULL,'SF','April 22 1994',5,'Michigan','55'),(263,'Kyle','Lowry',NULL,'PG','March 25 1986',17,'Villanova','7'),(264,'Bam','Adebayo',NULL,'C','July 18 1997',6,'Kentucky','13'),(265,'Jimmy','Butler',NULL,'PF','September 14 1989',12,'Marquette','22'),(266,'Josh','Richardson',NULL,'SG','September 15 1993',8,'Tennessee','0'),(267,'Haywood','Highsmith',NULL,'PF','December 9 1996',3,'Wheeling University','24'),(268,'Thomas','Bryant',NULL,'C','July 31 1997',6,'Indiana','31'),(269,'Kevin','Love',NULL,'PF','September 7 1988',15,'UCLA','42'),(270,'Dru','Smith',NULL,'SG','December 30 1997',1,'University of Evansville Missouri','9'),(271,'Tyler','Herro',NULL,'SG','January 20 2000',4,'Kentucky','14'),(272,'Caleb','Martin',NULL,'SF','September 28 1995',4,'NC State Nevada','16'),(273,'Orlando','Robinson',NULL,'C','July 10 2000',1,'Fresno State','25'),(274,'Jamal','Cain',NULL,'PF','March 20 1999',1,'Marquette Oakland','8'),(275,'Nikola','Jovic',NULL,'PF','June 9 2003',1,NULL,'5'),(276,'Cole','Swider',NULL,'SF','May 8 1999',1,'Villanova Syracuse','21'),(277,'R.J.','Hampton',NULL,'PG','February 7 2001',3,NULL,'4'),(278,'Brook','Lopez',NULL,'C','April 1 1988',15,'Stanford','11'),(279,'Bobby','Portis',NULL,'PF','February 10 1995',8,'Arkansas','9'),(280,'Malik','Beasley',NULL,'SG','November 26 1996',7,'Florida State','5'),(281,'Cameron','Payne',NULL,'PG','August 8 1994',8,'Murray State','15'),(282,'Pat','Connaughton',NULL,'SF','January 6 1993',8,'Notre Dame','24'),(283,'Giannis','Antetokounmpo',NULL,'PF','December 6 1994',10,NULL,'34'),(284,'Damian','Lillard',NULL,'PG','July 15 1990',11,'Weber State','0'),(285,'Khris','Middleton',NULL,'SF','August 12 1991',11,'Texas A&M','22'),(286,'MarJon','Beauchamp',NULL,'SF','October 12 2000',1,'Yakima Valley Community College','3'),(287,'Andre','Jackson','Jr.','SG','November 13 2001',0,'UConn','44'),(288,'Jae','Crowder',NULL,'PF','July 6 1990',11,'Marquette','99'),(289,'A.J.','Green',NULL,'SG','September 27 1999',1,'University of Northern Iowa','20'),(290,'Thanasis','Antetokounmpo',NULL,'PF','July 18 1992',5,NULL,'43'),(291,'Robin','Lopez',NULL,'C','April 1 1988',15,'Stanford','42'),(292,'Chris','Livingston',NULL,'SF','October 15 2003',0,'Kentucky','7'),(293,'TyTy','Washington','Jr.','PG','November 15 2001',1,'Kentucky','23'),(294,'Marques','Bolden',NULL,'C','April 17 1998',2,'Duke','12'),(295,'Anthony','Edwards',NULL,'SG','August 5 2001',3,'Georgia','5'),(296,'Karl-Anthony','Towns',NULL,'PF','November 15 1995',8,'Kentucky','32'),(297,'Naz','Reid',NULL,'C','August 26 1999',4,'LSU','11'),(298,'Rudy','Gobert',NULL,'C','June 26 1992',10,NULL,'27'),(299,'Mike','Conley',NULL,'PG','October 11 1987',16,'Ohio State','10'),(300,'Kyle','Anderson',NULL,'PF','September 20 1993',9,'UCLA','1'),(301,'Nickeil','Alexander-Walker',NULL,'SG','September 2 1998',4,'Virginia Tech','9'),(302,'Shake','Milton',NULL,'SG','September 26 1996',5,'SMU','18'),(303,'Jaden','McDaniels',NULL,'SF','September 29 2000',3,'Washington','3'),(304,'Troy','Brown','Jr.','SF','July 28 1999',5,'Oregon','23'),(305,'Josh','Minott',NULL,'SF','November 25 2002',1,'Memphis','8'),(306,'Jordan','McLaughlin',NULL,'PG','April 9 1996',4,'USC','6'),(307,'Luka','Garza',NULL,'C','December 27 1998',2,'Iowa','55'),(308,'Daishen','Nix',NULL,'PG','February 13 2002',2,NULL,'12'),(309,'Leonard','Miller',NULL,'SF','November 26 2003',0,NULL,'33'),(310,'Wendell','Moore','Jr.','SG','September 18 2001',1,'Duke','7'),(311,'Jaylen','Clark',NULL,'SG','October 13 2001',0,'UCLA',NULL),(312,'Jonas','Valanciunas',NULL,'C','May 6 1992',11,NULL,'17'),(313,'Jordan','Hawkins',NULL,'SG','April 29 2002',0,'UConn','24'),(314,'Dyson','Daniels',NULL,'PG','March 17 2003',1,NULL,'11'),(315,'Brandon','Ingram',NULL,'SF','September 2 1997',7,'Duke','14'),(316,'Zion','Williamson',NULL,'PF','July 6 2000',3,'Duke','1'),(317,'Herbert','Jones',NULL,'SF','October 6 1998',2,'Alabama','5'),(318,'Matt','Ryan',NULL,'SF','April 17 1997',2,'Notre Dame ','37'),(319,'Larry','Nance','Jr.','C','January 1 1993',8,'Wyoming','22'),(320,'Cody','Zeller',NULL,'C','October 5 1992',10,'Indiana','40'),(321,'Kira','Lewis','Jr.','PG','April 6 2001',3,'Alabama','13'),(322,'Naji','Marshall',NULL,'SF','January 24 1998',3,'Xavier','8'),(323,'Jeremiah','Robinson-Earl',NULL,'PF','November 3 2000',2,'Villanova','50'),(324,'CJ','McCollum',NULL,'PG','September 19 1991',10,'Lehigh','3'),(325,'Jose','Alvarado',NULL,'PG','April 12 1998',2,'Georgia Tech','15'),(326,'E.J.','Liddell',NULL,'PF','December 18 2000',0,'Ohio State','32'),(327,'Trey','Murphy','III','SF','June 18 2000',2,'Virginia',NULL),(328,'Jalen','Brunson',NULL,'PG','August 31 1996',5,'Villanova','11'),(329,'Julius','Randle',NULL,'PF','November 29 1994',9,'Kentucky','30'),(330,'Immanuel','Quickley',NULL,'SG','June 17 1999',3,'Kentucky','5'),(331,'Donte','DiVincenzo',NULL,'SG','January 31 1997',5,'Villanova','0'),(332,'Josh','Hart',NULL,'SF','March 6 1995',6,'Villanova','3'),(333,'Mitchell','Robinson',NULL,'C','April 1 1998',5,'Western Kentucky','23'),(334,'Isaiah','Hartenstein',NULL,'C','May 5 1998',5,NULL,'55'),(335,'Quentin','Grimes',NULL,'SG','May 8 2000',2,'Kansas Houston','6'),(336,'Miles','McBride',NULL,'PG','September 8 2000',2,'West Virginia','2'),(337,'RJ','Barrett',NULL,'SG','June 14 2000',4,'Duke','9'),(338,'Jericho','Sims',NULL,'C','October 20 1998',2,'Texas','45'),(339,'DaQuan','Jeffries',NULL,'SG','August 30 1997',4,'Oral Roberts Tulsa','8'),(340,'Ryan','Arcidiacono',NULL,'PG','March 26 1994',6,'Villanova','51'),(341,'Dylan','Windler',NULL,'SF','September 22 1996',3,'Belmont','20'),(342,'Evan','Fournier',NULL,'SG','October 29 1992',11,NULL,'13'),(343,'Jacob','Toppin',NULL,'SF','May 8 2000',0,'Kentucky',NULL),(344,'Charlie','Brown','Jr.','SG','February 2 1997',3,'Saint Joseph\'s',NULL),(345,'Duane','Washington','Jr.','SG','March 24 2000',2,'Ohio State',NULL),(346,'Chet','Holmgren',NULL,'C','May 1 2002',0,'Gonzaga','7'),(347,'Josh','Giddey',NULL,'SG','October 10 2002',2,NULL,'3'),(348,'Luguentz','Dort',NULL,'SF','April 19 1999',4,'Arizona State','5'),(349,'Isaiah','Joe',NULL,'SG','July 2 1999',3,'Arkansas','11'),(350,'Cason','Wallace',NULL,'SG','November 7 2003',0,'Kentucky','22'),(351,'Shai','Gilgeous-Alexander',NULL,'PG','July 12 1998',5,'Kentucky','2'),(352,'Jalen','Williams',NULL,'PF','April 14 2001',1,'Santa Clara','8'),(353,'Aaron','Wiggins',NULL,'SG','January 2 1999',2,'Maryland','21'),(354,'Ousmane','Dieng',NULL,'PF','May 21 2003',1,NULL,'13'),(355,'Jaylin','Williams',NULL,'C','June 29 2002',1,'Arkansas','6'),(356,'Vasilije','Micic',NULL,'PG','January 13 1994',0,NULL,'29'),(357,'Lindy','Waters','III','SG','July 28 1997',2,'Oklahoma State','12'),(358,'Kenrich','Williams',NULL,'PF','December 2 1994',5,'TCU','34'),(359,'Tre','Mann',NULL,'PG','February 3 2001',2,'Florida','23'),(360,'Olivier','Sarr',NULL,'C','February 20 1999',2,'Kentucky','30'),(361,'Aleksej','Pokusevski',NULL,'PF','December 26 2001',3,NULL,'17'),(362,'Davis','Bertans',NULL,'PF','November 12 1992',7,NULL,'9'),(363,'Keyontae','Johnson',NULL,'SF','May 24 2000',0,'Kansas State','18'),(364,'Paolo','Banchero',NULL,'PF','November 12 2002',1,'Duke','5'),(365,'Franz','Wagner',NULL,'SF','August 27 2001',2,'Michigan','22'),(366,'Cole','Anthony',NULL,'PG','May 15 2000',3,'UNC','50'),(367,'Moritz','Wagner',NULL,'C','April 26 1997',5,'Michigan','21'),(368,'Joe','Ingles',NULL,'SF','October 2 1987',9,NULL,'7'),(369,'Jalen','Suggs',NULL,'SG','June 3 2001',2,'Gonzaga','4'),(370,'Goga','Bitadze',NULL,'C','July 20 1999',4,NULL,'35'),(371,'Jonathan','Isaac',NULL,'PF','October 3 1997',4,'Florida State','1'),(372,'Anthony','Black',NULL,'PG','January 20 2004',0,'Arkansas','0'),(373,'Gary','Harris',NULL,'SG','September 14 1994',9,'Michigan State','14'),(374,'Caleb','Houstan',NULL,'SF','January 9 2003',1,'Michigan','2'),(375,'Chuma','Okeke',NULL,'SF','August 18 1998',3,'Auburn','3'),(376,'Markelle','Fultz',NULL,'PG','May 29 1998',6,'Washington','20'),(377,'Wendell','Carter','Jr.','C','April 16 1999',5,'Duke','34'),(378,'Jett','Howard',NULL,'SF','September 14 2003',0,'Michigan','13'),(379,'Admiral','Schofield',NULL,'PF','March 30 1997',3,'Tennessee','25'),(380,'Trevelin','Queen',NULL,'SG','February 25 1997',2,'New Mexico State',NULL),(381,'Tyrese','Maxey',NULL,'PG','November 4 2000',3,'Kentucky','0'),(382,'Tobias','Harris',NULL,'PF','July 15 1992',12,'Tennessee','12'),(383,'De\'Anthony','Melton',NULL,'SG','May 28 1998',5,'USC','8'),(384,'Paul','Reed',NULL,'C','June 14 1999',3,'DePaul','44'),(385,'Patrick','Beverley',NULL,'PG','July 12 1988',11,'Arkansas','22'),(386,'Joel','Embiid',NULL,'C','March 16 1994',7,'Kansas','21'),(387,'Robert','Covington',NULL,'SF','December 14 1990',10,'Tennessee State','33'),(388,'Jaden','Springer',NULL,'SG','September 25 2002',2,'Tennessee','11'),(389,'Furkan','Korkmaz',NULL,'SG','July 24 1997',6,NULL,'30'),(390,'Danuel','House','Jr.','SF','June 7 1993',7,'Texas A&M','25'),(391,'Kelly','Oubre','Jr.','SF','December 9 1995',8,'Kansas','9'),(392,'Marcus','Morris',NULL,'PF','September 2 1989',12,'Kansas','5'),(393,'Nicolas','Batum',NULL,'PF','December 14 1988',15,NULL,'40'),(394,'Mo','Bamba',NULL,'C','May 12 1998',5,'Texas','7'),(395,'KJ','Martin',NULL,'SF','January 6 2001',3,NULL,'1'),(396,'Terquavion','Smith ',NULL,'PG','December 31 2002',0,'NC State',NULL),(397,'Javonte','Smart',NULL,'PG','June 3 1999',1,'LSU',NULL),(398,'Ricky','Council','IV ','SG','August 3 2001',0,'Arkansas',NULL),(399,'Grayson','Allen',NULL,'SG','October 8 1995',5,'Duke','8'),(400,'Jusuf','Nurkic',NULL,'C','August 23 1994',9,NULL,'20'),(401,'Josh','Okogie',NULL,'SG','September 1 1998',5,'Georgia Tech','2'),(402,'Jordan','Goodwin',NULL,'PG','October 23 1998',2,'Saint Louis','0'),(403,'Kevin','Durant',NULL,'PF','September 29 1988',15,'Texas','35'),(404,'Eric','Gordon',NULL,'SG','December 25 1988',15,'Indiana','23'),(405,'Drew','Eubanks',NULL,'C','February 1 1997',5,'Oregon State','14'),(406,'Keita','Bates-Diop',NULL,'SF','January 23 1996',5,'Ohio State','21'),(407,'Yuta','Watanabe',NULL,'SF','October 13 1994',5,'George Washington','18'),(408,'Nassir','Little',NULL,'PF','February 11 2000',4,'UNC','25'),(409,'Devin','Booker',NULL,'SG','October 30 1996',8,'Kentucky','1'),(410,'Chimezie','Metu',NULL,'C','March 22 1997',5,'USC','4'),(411,'Bradley','Beal',NULL,'SG','June 28 1993',11,'Florida','3'),(412,'Saben','Lee',NULL,'PG','June 23 1999',3,'Vanderbilt','38'),(413,'Bol','Bol',NULL,'PF','November 16 1999',4,'Oregon','11'),(414,'Udoka','Azubuike',NULL,'C','September 17 1999',3,'Kansas','27'),(415,'Damion','Lee',NULL,'SG','October 21 1992',6,'Louisville',NULL),(416,'Jerami','Grant',NULL,'PF','March 12 1994',9,'Syracuse','9'),(417,'Shaedon','Sharpe',NULL,'SG','May 30 2003',1,'Kentucky','17'),(418,'Jabari','Walker',NULL,'SF','July 30 2002',1,'Colorado','34'),(419,'Matisse','Thybulle',NULL,'SF','March 4 1997',4,'Washington','4'),(420,'Toumani','Camara',NULL,'PF','May 8 2000',0,'Dayton','33'),(421,'Deandre','Ayton',NULL,'C','July 23 1998',5,'Arizona','2'),(422,'Skylar','Mays',NULL,'PG','September 5 1997',3,'LSU','5'),(423,'Malcolm','Brogdon',NULL,'PG','December 11 1992',7,'Virginia','11'),(424,'Kris','Murray',NULL,'SF','August 19 2000',0,'Iowa','8'),(425,'Duop','Reath',NULL,'C','June 26 1996',0,'LSU','26'),(426,'Rayan','Rupert',NULL,'SG','May 31 2004',0,NULL,'72'),(427,'Scoot','Henderson',NULL,'PG','February 3 2004',0,NULL,'0'),(428,'Robert','Williams',NULL,'C','October 17 1997',5,'Texas A&M','35'),(429,'Jamaree','Bouyea',NULL,'PG','June 27 1999',1,'San Francisco','21'),(430,'Justin','Minaya',NULL,'SF','March 26 1999',1,NULL,'24'),(431,'Ish','Wainright',NULL,'SF','September 12 1994',2,'Baylor','23'),(432,'Anfernee','Simons',NULL,'SG','June 8 1999',5,NULL,'1'),(433,'Domantas','Sabonis',NULL,'C','May 3 1996',7,'Gonzaga','10'),(434,'Malik','Monk',NULL,'SG','February 4 1998',6,'Kentucky','0'),(435,'Harrison','Barnes',NULL,'PF','May 30 1992',11,'UNC','40'),(436,'Chris','Duarte',NULL,'SF','June 13 1997',2,'Oregon','3'),(437,'Kevin','Huerter',NULL,'SG','August 27 1998',5,'Maryland','9'),(438,'Keegan','Murray',NULL,'SF','August 19 2000',1,'Iowa','13'),(439,'JaVale','McGee',NULL,'C','January 19 1988',15,'Nevada','0'),(440,'Sasha','Vezenkov',NULL,'PF','August 6 1995',0,NULL,'7'),(441,'Davion','Mitchell',NULL,'PG','September 5 1998',2,'Auburn Baylor','15'),(442,'Kessler','Edwards',NULL,'SF','August 9 2000',2,'Pepperdine','17'),(443,'De\'Aaron','Fox',NULL,'PG','December 20 1997',6,'Kentucky','5'),(444,'Keon','Ellis',NULL,'SG','January 8 2000',1,'Alabama','23'),(445,'Colby','Jones',NULL,'SG','May 28 2002',0,'Xavier','20'),(446,'Alex','Len',NULL,'C','June 16 1993',10,'Maryland','25'),(447,'Jordan','Ford',NULL,'PG','May 26 1998',0,'Saint Mary\'s','31'),(448,'Jalen','Slawson',NULL,'SF','October 22 1999',0,'Furman University','18'),(449,'Trey','Lyles',NULL,'PF','November 5 1995',8,'Kentucky','41'),(450,'Filip','Petrušev',NULL,'C','April 15 2000',0,'Gonzaga','33'),(451,'Victor','Wembanyama',NULL,'PF','January 4 2004',0,NULL,'1'),(452,'Zach','Collins',NULL,'C','November 19 1997',5,'Gonzaga','23'),(453,'Jeremy','Sochan',NULL,'PG','May 20 2003',1,'Baylor','10'),(454,'Cedi','Osman',NULL,'SF','April 8 1995',6,NULL,'16'),(455,'Malaki','Branham',NULL,'SG','May 12 2003',1,'Ohio State','22'),(456,'Doug','McDermott',NULL,'SF','January 3 1992',9,'Creighton','17'),(457,'Charles','Bassey',NULL,'C','October 28 2000',2,'Western Kentucky','28'),(458,'Keldon','Johnson',NULL,'SF','October 11 1999',4,'Kentucky','3'),(459,'Tre','Jones',NULL,'PG','January 8 2000',3,'Duke','33'),(460,'Devin','Vassell',NULL,'SG','August 23 2000',3,'Florida State','24'),(461,'Julian','Champagnie',NULL,'SF','June 29 2001',1,'St. John\'s','30'),(462,'Dominick','Barlow',NULL,'PF','May 26 2003',1,NULL,'26'),(463,'Sandro','Mamukelashvili',NULL,'C','May 23 1999',2,'Seton Hall','54'),(464,'Blake','Wesley',NULL,'SG','March 16 2003',1,'Notre Dame','14'),(465,'Devonte\'','Graham',NULL,'PG','February 22 1995',5,'Kansas','4'),(466,'Sidy','Cissoko',NULL,'SF','April 2 2004',0,NULL,'25'),(467,'Sir\'Jabari','Rice',NULL,'PG','December 28 1998',0,'Texas',NULL),(468,'Charles','Bediako',NULL,'C','March 10 2002',0,'Alabama',NULL),(469,'Pascal','Siakam',NULL,'PF','April 2 1994',7,'New Mexico State','43'),(470,'Scottie','Barnes',NULL,'SG','August 1 2001',2,'Florida State','4'),(471,'Dennis','Schröder',NULL,'PG','September 15 1993',10,NULL,'17'),(472,'Jakob','Poeltl',NULL,'C','October 15 1995',7,'Utah','19'),(473,'Malachi','Flynn',NULL,'PG','May 10 1998',3,'San Diego State','22'),(474,'Gradey','Dick',NULL,'SG','November 20 2003',0,'Kansas','1'),(475,'Chris','Boucher',NULL,'PF','January 11 1993',6,'Oregon','25'),(476,'Gary','Trent','Jr.','SG','January 18 1999',5,'Duke','33'),(477,'OG','Anunoby',NULL,'SF','July 17 1997',6,'Indiana','3'),(478,'Jalen','McDaniels',NULL,'SF','January 31 1998',4,'San Diego State','2'),(479,'Precious','Achiuwa',NULL,'C','September 19 1999',3,'Memphis','5'),(480,'Otto','Porter','Jr.','SF','June 3 1993',10,'Georgetown','32'),(481,'Garrett','Temple',NULL,'SG','May 8 1986',13,'LSU','14'),(482,'Thaddeus','Young',NULL,'PF','June 21 1988',16,'Georgia Tech','21'),(483,'Markquis','Nowell',NULL,'SG','December 25 1999',0,'Kansas State','24'),(484,'Ron','Harper','Jr.','PF','April 12 2000',1,'Rutgers University','8'),(485,'Christian','Koloko',NULL,'C','June 20 2000',1,'Arizona',NULL),(486,'Javon','Freeman-Liberty',NULL,'PG','October 20 1999',0,'Valparaiso DePaul',NULL),(487,'Lauri','Markkanen',NULL,'PF','May 22 1997',6,'Arizona','23'),(488,'Jordan','Clarkson',NULL,'SG','June 7 1992',9,'Missouri','0'),(489,'John','Collins',NULL,'PF','September 23 1997',6,'Wake Forest','20'),(490,'Collin','Sexton',NULL,'SG','January 4 1999',5,'Alabama','2'),(491,'Talen','Horton-Tucker',NULL,'PG','November 25 2000',4,'Iowa State','5'),(492,'Keyonte','George',NULL,'PG','November 8 2003',0,'Baylor','3'),(493,'Kelly','Olynyk',NULL,'C','April 19 1991',10,'Gonzaga','41'),(494,'Ochai','Agbaji',NULL,'SG','April 20 2000',1,'Kansas','30'),(495,'Simone','Fontecchio',NULL,'SF','December 9 1995',1,NULL,'16'),(496,'Kris','Dunn',NULL,'PG','March 18 1994',7,'Providence','11'),(497,'Omer','Yurtseven',NULL,'C','June 19 1998',2,'Georgetown','77'),(498,'Walker','Kessler',NULL,'C','July 26 2001',1,'Auburn','24'),(499,'Luka','Šamanic',NULL,'PF','January 9 2000',3,NULL,'19'),(500,'Taylor','Hendricks',NULL,'PF','November 22 2003',0,'Central Florida','0'),(501,'Brice','Sensabaugh',NULL,'SF','October 30 2003',0,'Ohio State','8'),(502,'Johnny','Juzang',NULL,'SG','March 17 2001',1,'UCLA',NULL),(503,'Josh','Christopher',NULL,'SG','December 8 2001',2,'Arizona State',NULL),(504,'Kyle','Kuzma',NULL,'PF','July 24 1995',6,'Utah','33'),(505,'Jordan','Poole',NULL,'SG','June 19 1999',4,'Michigan','13'),(506,'Deni','Avdija',NULL,'SF','January 3 2001',3,NULL,'8'),(507,'Tyus','Jones',NULL,'PG','May 10 1996',8,'Duke','5'),(508,'Corey','Kispert',NULL,'SF','March 3 1999',2,'Gonzaga','24'),(509,'Bilal','Coulibaly',NULL,'SF','July 26 2004',0,NULL,'0'),(510,'Danilo','Gallinari',NULL,'PF','August 8 1988',13,NULL,'88'),(511,'Daniel','Gafford',NULL,'C','October 1 1998',4,'Arkansas','21'),(512,'Landry','Shamet',NULL,'SG','March 13 1997',5,'Wichita State','20'),(513,'Johnny','Davis',NULL,'SG','February 27 2002',1,'Wisconsin','1'),(514,'Delon','Wright',NULL,'PG','April 26 1992',8,'Utah','55'),(515,'Eugene','Omoruyi',NULL,'SF','February 14 1997',2,'Oregon','97'),(516,'Ryan','Rollins',NULL,'PG','July 3 2002',1,'Toledo','9'),(517,'Anthony','Gill',NULL,'PF','October 17 1992',3,'Virginia','16'),(518,'Mike','Muscala',NULL,'C','July 1 1991',10,'Bucknell','35'),(519,'Jared','Butler',NULL,'SG','August 25 2000',2,'Baylor','4'),(520,'Patrick','Baldwin','Jr.','SF','November 18 2002',1,'UW-Milwaukee','7'),(521,'John','Butler ',NULL,'C','December 4 2002',1,'Florida State',NULL),(522,'Moses','Brown',NULL,'C','October 13 1999',4,'UCLA','10'),(523,'Danny','Green',NULL,'SG','June 22 1987',14,'UNC','14'),(524,'Kaiser','Gates',NULL,'SF','November 8 1996',0,'Xavier','12'),(525,'Dereon','Seabron',NULL,'SG','May 26 2000',1,'NC State','0'),(526,'Lindell','Wigginton',NULL,'PG','March 28 1998',2,'Iowa State','28'),(527,'Jacob','Gilyard',NULL,'PG','July 14 1998',1,'Richmond','0'),(528,'Shaquille','Harrison',NULL,'SG','October 6 1993',6,'Tulsa ','1'),(529,'Jaylen','Nowell',NULL,'SG','July 9 1999',4,'Washington','24'),(530,'Vince','Williams','Jr.','SG','August 30 2000',1,'VCU','5'),(531,'Colin','Castleton',NULL,'C','May 25 2000',0,'Florida','14'),(532,'Moussa','Diabaté',NULL,'C','January 21 2002',1,'Michigan','25'),(566,'Angelo Louis','Flores','','PG','January 10 2002',0,'UP Tacloban','7');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays_at`
--

DROP TABLE IF EXISTS `plays_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plays_at` (
  `team_id` int NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `pa_location_id_idx` (`location_id`),
  CONSTRAINT `pa_location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `pa_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays_at`
--

LOCK TABLES `plays_at` WRITE;
/*!40000 ALTER TABLE `plays_at` DISABLE KEYS */;
INSERT INTO `plays_at` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,13),(15,14),(16,15),(17,16),(18,17),(19,18),(20,19),(21,20),(22,21),(23,22),(24,23),(25,24),(26,25),(27,26),(28,27),(29,28),(30,29);
/*!40000 ALTER TABLE `plays_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays_for`
--

DROP TABLE IF EXISTS `plays_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plays_for` (
  `player_id` int NOT NULL,
  `team_id` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `player_id_for` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays_for`
--

LOCK TABLES `plays_for` WRITE;
/*!40000 ALTER TABLE `plays_for` DISABLE KEYS */;
INSERT INTO `plays_for` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(566,1),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,4),(54,4),(55,4),(56,4),(57,4),(58,4),(59,4),(60,4),(61,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,4),(70,4),(71,5),(72,5),(73,5),(74,5),(75,5),(76,5),(77,5),(78,5),(79,5),(80,5),(81,5),(82,5),(83,5),(84,5),(85,5),(86,5),(87,6),(88,6),(89,6),(90,6),(91,6),(92,6),(93,6),(94,6),(95,6),(96,6),(97,6),(98,6),(99,6),(100,6),(101,6),(102,6),(103,6),(104,7),(105,7),(106,7),(107,7),(108,7),(109,7),(110,7),(111,7),(112,7),(113,7),(114,7),(115,7),(116,7),(117,7),(118,7),(119,7),(120,7),(121,8),(122,8),(123,8),(124,8),(125,8),(126,8),(127,8),(128,8),(129,8),(130,8),(131,8),(132,8),(133,8),(134,8),(135,8),(136,8),(137,8),(138,8),(139,9),(140,9),(141,9),(142,9),(143,9),(144,9),(145,9),(146,9),(147,9),(148,9),(149,9),(150,9),(151,9),(152,9),(153,9),(154,9),(155,9),(156,9),(157,10),(158,10),(159,10),(160,10),(161,10),(162,10),(163,10),(164,10),(165,10),(166,10),(167,10),(168,10),(169,10),(170,10),(171,10),(172,10),(173,10),(174,11),(175,11),(176,11),(177,11),(178,11),(179,11),(180,11),(181,11),(182,11),(183,11),(184,11),(185,11),(186,11),(187,11),(188,11),(189,11),(190,11),(191,11),(192,12),(193,12),(194,12),(195,12),(196,12),(197,12),(198,12),(199,12),(200,12),(201,12),(202,12),(203,12),(204,12),(205,12),(206,12),(207,12),(208,12),(209,13),(210,13),(211,13),(212,13),(213,13),(214,13),(215,13),(216,13),(217,13),(218,13),(219,13),(220,13),(221,13),(222,13),(223,13),(224,13),(225,13),(226,13),(532,13),(227,14),(228,14),(229,14),(230,14),(231,14),(232,14),(233,14),(234,14),(235,14),(236,14),(237,14),(238,14),(239,14),(240,14),(241,14),(242,14),(243,14),(531,14),(244,15),(245,15),(246,15),(247,15),(248,15),(249,15),(250,15),(251,15),(252,15),(253,15),(254,15),(255,15),(256,15),(257,15),(258,15),(259,15),(260,15),(527,15),(528,15),(529,15),(530,15),(261,16),(262,16),(263,16),(264,16),(265,16),(266,16),(267,16),(268,16),(269,16),(270,16),(271,16),(272,16),(273,16),(274,16),(275,16),(276,16),(277,16),(278,17),(279,17),(280,17),(281,17),(282,17),(283,17),(284,17),(285,17),(286,17),(287,17),(288,17),(289,17),(290,17),(291,17),(292,17),(293,17),(294,17),(526,17),(295,18),(296,18),(297,18),(298,18),(299,18),(300,18),(301,18),(302,18),(303,18),(304,18),(305,18),(306,18),(307,18),(308,18),(309,18),(310,18),(311,18),(312,19),(313,19),(314,19),(315,19),(316,19),(317,19),(318,19),(319,19),(320,19),(321,19),(322,19),(323,19),(324,19),(325,19),(326,19),(327,19),(524,19),(525,19),(328,20),(329,20),(330,20),(331,20),(332,20),(333,20),(334,20),(335,20),(336,20),(337,20),(338,20),(339,20),(340,20),(341,20),(342,20),(343,20),(344,20),(345,20),(346,21),(347,21),(348,21),(349,21),(350,21),(351,21),(352,21),(353,21),(354,21),(355,21),(356,21),(357,21),(358,21),(359,21),(360,21),(361,21),(362,21),(363,21),(364,22),(365,22),(366,22),(367,22),(368,22),(369,22),(370,22),(371,22),(372,22),(373,22),(374,22),(375,22),(376,22),(377,22),(378,22),(379,22),(380,22),(381,23),(382,23),(383,23),(384,23),(385,23),(386,23),(387,23),(388,23),(389,23),(390,23),(391,23),(392,23),(393,23),(394,23),(395,23),(396,23),(397,23),(398,23),(523,23),(399,24),(400,24),(401,24),(402,24),(403,24),(404,24),(405,24),(406,24),(407,24),(408,24),(409,24),(410,24),(411,24),(412,24),(413,24),(414,24),(415,24),(416,25),(417,25),(418,25),(419,25),(420,25),(421,25),(422,25),(423,25),(424,25),(425,25),(426,25),(427,25),(428,25),(429,25),(430,25),(431,25),(432,25),(522,25),(433,26),(434,26),(435,26),(436,26),(437,26),(438,26),(439,26),(440,26),(441,26),(442,26),(443,26),(444,26),(445,26),(446,26),(447,26),(448,26),(449,26),(450,26),(451,27),(452,27),(453,27),(454,27),(455,27),(456,27),(457,27),(458,27),(459,27),(460,27),(461,27),(462,27),(463,27),(464,27),(465,27),(466,27),(467,27),(468,27),(469,28),(470,28),(471,28),(472,28),(473,28),(474,28),(475,28),(476,28),(477,28),(478,28),(479,28),(480,28),(481,28),(482,28),(483,28),(484,28),(485,28),(486,28),(487,29),(488,29),(489,29),(490,29),(491,29),(492,29),(493,29),(494,29),(495,29),(496,29),(497,29),(498,29),(499,29),(500,29),(501,29),(502,29),(503,29),(504,30),(505,30),(506,30),(507,30),(508,30),(509,30),(510,30),(511,30),(512,30),(513,30),(514,30),(515,30),(516,30),(517,30),(518,30),(519,30),(520,30),(521,30);
/*!40000 ALTER TABLE `plays_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) NOT NULL,
  `found_year` int NOT NULL,
  `team_abbrv` varchar(45) DEFAULT NULL,
  `team_color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Hawks',1946,'ATL','#c8102e'),(2,'Celtics',1946,'BOS','#007A33'),(3,'Nets',1967,'BRK','#000000'),(4,'Hornets',1988,'CHO','#00788C'),(5,'Bulls',1966,'CHI','#CE1141'),(6,'Cavaliers',1970,'CLE','#860038'),(7,'Mavericks',1980,'DAL','#00538C'),(8,'Nuggets',1967,'DEN','#0E2240'),(9,'Pistons',1941,'DET','#1D42BA'),(10,'Warriors',1946,'GSW','#FFC72C'),(11,'Rockets',1967,'HOU','#CE1141'),(12,'Pacers',1967,'IND','#FDBB30'),(13,'Clippers',1970,'LAC','#C8102E'),(14,'Lakers',1947,'LAL','#552583'),(15,'Grizzlies',1995,'MEM','#5D76A9'),(16,'Heat',1988,'MIA','#98002E'),(17,'Bucks',1968,'MIL','#00471B'),(18,'Timberwolves',1989,'MIN','#0C2340'),(19,'Pelicans',2002,'NOP','#0C2340'),(20,'Knicks',1946,'NYK','#006BB6'),(21,'Thunder',1967,'OKC','#007AC1'),(22,'Magic',1989,'ORL','#0077C0'),(23,'76ers',1946,'PHI','#006BB6'),(24,'Suns',1968,'PHO','#1D1160'),(25,'Trail Blazers',1970,'POR','#E03A3E'),(26,'Kings',1923,'SAC','#5A2D81'),(27,'Spurs',1967,'SAS','#C4CED4'),(28,'Raptors',1995,'TOR','#CE1141'),(29,'Jazz',1974,'UTA','#002B5C'),(30,'Wizards',1961,'WAS','#002B5C');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Angelo','Flores','','12345','admin1','admin'),(10,'','','','12345','admin2','user'),(11,'Adrienne','Flores','Jr.','12312','admin12','admin'),(29,'Angelo Louis','Flores','Jr.','clevelandcavaliers23','angeloflores875','admin'),(30,'Angelo','Flores','','123456','admin45','user'),(31,'','','','12345','user2','user');
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

-- Dump completed on 2024-06-02 22:50:27
