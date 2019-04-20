-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AUTHORS`
--

DROP TABLE IF EXISTS `AUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHORS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHORS`
--

LOCK TABLES `AUTHORS` WRITE;
/*!40000 ALTER TABLE `AUTHORS` DISABLE KEYS */;
INSERT INTO `AUTHORS` VALUES (1,'Robert','Martin'),(2,'Steve','McConnell'),(3,'Joshua','Bloch'),(4,'Kathy','Sierra'),(5,'Bert','Bates'),(6,'Donald','Knuth');
/*!40000 ALTER TABLE `AUTHORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHORS_TO_BOOKS`
--

DROP TABLE IF EXISTS `AUTHORS_TO_BOOKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHORS_TO_BOOKS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` bigint(20) DEFAULT NULL,
  `BOOK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTHORS_TO_BOOKS__LANGUAGE` (`AUTHOR_ID`),
  KEY `FK_AUTHORS_TO_BOOKS__BOOK` (`BOOK_ID`),
  CONSTRAINT `FK_AUTHORS_TO_BOOKS__BOOK` FOREIGN KEY (`BOOK_ID`) REFERENCES `BOOKS` (`ID`),
  CONSTRAINT `FK_AUTHORS_TO_BOOKS__LANGUAGE` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `AUTHORS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHORS_TO_BOOKS`
--

LOCK TABLES `AUTHORS_TO_BOOKS` WRITE;
/*!40000 ALTER TABLE `AUTHORS_TO_BOOKS` DISABLE KEYS */;
INSERT INTO `AUTHORS_TO_BOOKS` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,4,10),(11,5,10),(12,4,11),(13,5,11),(14,4,12),(15,5,12);
/*!40000 ALTER TABLE `AUTHORS_TO_BOOKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOKS`
--

DROP TABLE IF EXISTS `BOOKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOKS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `PUBLISHER` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `IMAGE_PATH` varchar(255) DEFAULT NULL,
  `PUBLICATION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKS`
--

LOCK TABLES `BOOKS` WRITE;
/*!40000 ALTER TABLE `BOOKS` DISABLE KEYS */;
INSERT INTO `BOOKS` VALUES (1,'The Clean Coder: A Code of Conduct for Professional Programmers','Prentice Hall','Even bad code can function. But if code isn\'t clean, it can bring a development\n                organization to its knees. Every year, countless hours and significant resources are lost because of\n                poorly written code. But it doesn\'t have to be that way.','/images/Clean_Coder.jpg','2011-05-13 00:00:00'),(2,'Clean Architecture','Prentice Hall','By applying universal rules of software architecture, you can dramatically\n                improve developer productivity throughout the life of any software system. Now, building upon the\n                success of his best-selling books Clean Code and The Clean Coder, legendary software craftsman Robert C.\n                Martin (“Uncle Bob”) reveals those rules and helps you apply them.','/images/Clean_architecture.jpg','2017-09-12 00:00:00'),(3,'Чистый код. Создание, анализ и рефакторинг','Питер','Плохой код может работать, но он будет мешать развитию проекта и\n                компании-разработчика, требуя дополнительные ресурсы на поддержку и «укрощение».\n\n                Каким же должен быть код? Эта книга полна реальных примеров, позволяющих взглянуть на код с различных\n                направлений: сверху вниз, снизу вверх и даже изнутри. Вы узнаете много нового о коде. Более того,\n                научитесь отличать хороший код от плохого, узнаете, как писать хороший код и как преобразовать плохой\n                код в хороший.','/images/Clean_Coder(ru).jpg','2019-09-12 00:00:00'),(4,'Чистая архитектура. Искусство разработки программного обеспечения','Питер','«Чистую архитектуру» обязаны прочитать разработчики всех уровней, системные\n                аналитики, архитекторы и каждый программист, который желает подняться по карьерной лестнице или хотя бы\n                повлиять на людей, которые занимаются данной работой.','/images/Clean_architecture(ru).jpg','2019-09-12 00:00:00'),(5,'Идеальный программист. Как стать профессионалом разработки ПО','Питер','В этой книге легендарный эксперт Роберт Мартин (более известный в сообществе как\n                «Дядюшка Боб»), автор бестселлера «Чистый код», рассказывает о том, что значит «быть профессиональным\n                программистом», описывая методы, инструменты и практики разработки «идеального ПО». Книга насыщена\n                практическими советами в отношении всех аспектов программирования: от оценки проекта и написания кода до\n                рефакторинга и тестирования.','/images/Ideal_programmer(ru).jpg','2019-09-12 00:00:00'),(6,'Совершенный код','Русская редакция','Более 10 лет первое издание этой книги считалось одним из лучших практических\n                руководств по программированию. Сейчас эта книга полностью обновлена с учетом современных тенденций и\n                технологий и дополнена сотнями новых примеров, иллюстрирующих искусство и науку программирования.\n                Опираясь на академические исследования, с одной стороны, и практический опыт коммерческих разработок ПО\n                - с другой, автор синтезировал из самых эффективных методик и наиболее эффективных принципов ясное\n                прагматичное руководство. Каков бы ни был ваш профессиональный уровень, с какими бы средствами\n                разработками вы ни работали, какова бы ни была сложность вашего проекта, в этой книге вы найдете нужную\n                информацию, она заставит вас размышлять и поможет создать совершенный код.','/images/Complete_code(ru).jpg','2019-09-12 00:00:00'),(7,'Code Complete: A Practical Handbook of Software Construction, Second Edition','Microsoft Press','Widely considered one of the best practical guides to programming, Steve\n                McConnell’s original CODE COMPLETE has been helping developers write better software for more than a\n                decade. Now this classic book has been fully updated and revised with leading-edge practices—and\n                hundreds of new code samples—illustrating the art and science of software construction. Capturing the\n                body of knowledge available from research, academia, and everyday commercial practice, McConnell\n                synthesizes the most effective techniques and must-know principles into clear, pragmatic guidance. No\n                matter what your experience level, development environment, or project size, this book will inform and\n                stimulate your thinking—and help you build the highest quality code.','/images/Complete_code.jpg','2017-09-12 00:00:00'),(8,'Effective Java','Addison-Wesley Professional','Java has changed dramatically since the previous edition of Effective Java was\n                published shortly after the release of Java 6. This Jolt award-winning classic has now been thoroughly\n                updated to take full advantage of the latest language and library features. The support in modern Java\n                for multiple paradigms increases the need for specific best-practices advice, and this book delivers.','/images/Effective_java.jpg','2017-12-18 00:00:00'),(9,'Эффективное программирование','ДМК','Каждое правило, представленное в виде короткого законченного эссе, содержит\n                описание проблемы, примеры программного кода, а также случаи из практики этого необычайно компетентного\n                автора. В эссе включены специальные советы, обсуждение тонкостей языка Java, для иллюстрации выбраны\n                превосходные примеры программ. На протяжении всей книги критически оцениваются распространенные идиомы\n                языка Java и шаблоны разработки, даются полезные советы и методики.','/images/Effective_java(ru).jpg','2013-12-18 00:00:00'),(10,'Head First Java','O\'Reilly Media','Learning a complex new language is no easy task especially when it s an\n                object-oriented computer programming language like Java. You might think the problem is your brain. It\n                seems to have a mind of its own, a mind that doesn\'t always want to take in the dry, technical stuff\n                you\'re forced to study.','/images/Head_First_Java.jpg','2005-02-18 00:00:00'),(11,'Head First EJB','O\'Reilly Media','What do Ford Financial, IBM, and Victoria\'s Secret have in common? Enterprise\n                JavaBeans (EJB). As the industry standard for platform-independent reusable business components, EJB has\n                just become Sun Microsystem\'s latest developer certification. Whether you want to be certifiable or just\n                want to learn the technology inside and out, Head First EJB will get you there in the least painful way.\n                And with the greatest understanding.You\'ll learn not just what the technology is, but more importantly,\n                why it is, and what it is and isn\'t good for. You\'ll learn tricks and tips for EJB development, along\n                with tricks and tips for passing this latest, very challenging Sun Certified Business Component\n                Developer (SCBCD) exam.','/images/Head_First_EJB.jpg','2005-02-18 00:00:00'),(12,'Изучаем Java','Эксмо','\"Изучаем Java\" — это не просто книга. Она не только научит вас теории языка Java\n                и объектно-ориентированного программирования, она сделает вас программистом. В ее основу положен\n                уникальный метод обучения на практике. В отличие от классических учебников информация дается не в\n                текстовом, а в визуальном представлении. Вы освоите в деле все самое нужное: синтаксис и концепции\n                языка, работу с потоками, работу в сети, распределенное программирование. Вся теория закрепляется\n                интереснейшими примерами и тестами.','/images/Head_First_Java(ru).jpg','2015-02-18 00:00:00');
/*!40000 ALTER TABLE `BOOKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('ADD_BOOK_TABLE','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',1,'EXECUTED','7:f6a102bc0aaa7e733174ed3d69641724','sql; createTable tableName=LANGUAGES; createTable tableName=AUTHORS; createTable tableName=BOOKS; insert tableName=LANGUAGES; insert tableName=LANGUAGES','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_LINK_TABLES','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',2,'EXECUTED','7:06e95a2945971bbdb1c1e0f88f3e1611','createTable tableName=LANGUAGES_TO_BOOKS; createTable tableName=AUTHORS_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('INSERT_AUTHORS_#1','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',3,'EXECUTED','7:12161f75ee1304fba6909411c32e4283','insert tableName=AUTHORS; insert tableName=AUTHORS; insert tableName=AUTHORS; insert tableName=AUTHORS; insert tableName=AUTHORS; insert tableName=AUTHORS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('INSERT_BOOKS','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',4,'EXECUTED','7:906d7c71d30f72e9835ac80d536dab43','insert tableName=BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_LINK_RECORDS','dds','db/db.changelog.xml','2019-04-10 11:57:59',5,'EXECUTED','7:d1116dc466e4d27ab5e52042ee7215e5','insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_2','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',6,'EXECUTED','7:0995f94c67fa21e58c93ea18f49abfa6','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_3','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',7,'EXECUTED','7:68b9e65c1f36a47521ea00cca340ffa9','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_4','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',8,'EXECUTED','7:30d225fe537e49d4db56b83f2b935284','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_5','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',9,'EXECUTED','7:fcf7cb1e3c0ff7893ce7bb4bda40fd6d','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_6','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',10,'EXECUTED','7:46877ce1f4d125a9ab8ca99f79367af5','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_7','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',11,'EXECUTED','7:281e97d3f19e0fb6c67f7b62f06616f2','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_8','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',12,'EXECUTED','7:8e7a8964434bf6a210e77d4f7de207cf','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_9','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',13,'EXECUTED','7:f5d06d26698d2a139ecfbf9237a1adfd','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_10','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',14,'EXECUTED','7:bb377012fc9b26d539adee22035593ae','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_11','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',15,'EXECUTED','7:9f5877adc339b29d46cabbfa6ab54c73','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854'),('ADD_BOOK_12','dulevich','db/db.changelog.xml','2019-04-10 11:57:59',16,'EXECUTED','7:6fb7f74f94963466cddba09e0ca06a55','insert tableName=BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=AUTHORS_TO_BOOKS; insert tableName=LANGUAGES_TO_BOOKS','',NULL,'3.5.3',NULL,NULL,'4886678854');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANGUAGES`
--

DROP TABLE IF EXISTS `LANGUAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LANGUAGES` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `ISO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANGUAGES`
--

LOCK TABLES `LANGUAGES` WRITE;
/*!40000 ALTER TABLE `LANGUAGES` DISABLE KEYS */;
INSERT INTO `LANGUAGES` VALUES (1,'English','en'),(2,'Russian','ru');
/*!40000 ALTER TABLE `LANGUAGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANGUAGES_TO_BOOKS`
--

DROP TABLE IF EXISTS `LANGUAGES_TO_BOOKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LANGUAGES_TO_BOOKS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` bigint(20) DEFAULT NULL,
  `BOOK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LANGUAGES_TO_BOOKS__LANGUAGE` (`LANGUAGE_ID`),
  KEY `FK_LANGUAGES_TO_BOOKS__BOOK` (`BOOK_ID`),
  CONSTRAINT `FK_LANGUAGES_TO_BOOKS__BOOK` FOREIGN KEY (`BOOK_ID`) REFERENCES `BOOKS` (`ID`),
  CONSTRAINT `FK_LANGUAGES_TO_BOOKS__LANGUAGE` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANGUAGES_TO_BOOKS`
--

LOCK TABLES `LANGUAGES_TO_BOOKS` WRITE;
/*!40000 ALTER TABLE `LANGUAGES_TO_BOOKS` DISABLE KEYS */;
INSERT INTO `LANGUAGES_TO_BOOKS` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,1,7),(8,1,8),(9,2,9),(10,1,10),(11,1,11),(12,2,12);
/*!40000 ALTER TABLE `LANGUAGES_TO_BOOKS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 23:40:56
