-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agencia
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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Amazonas'),(2,'Ancash'),(3,'Apurimac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Cusco'),(8,'Huancavelica'),(9,'Huanuco'),(10,'Ica'),(11,'Junin'),(12,'Lambayeque'),(13,'La Libertad'),(14,'Lima'),(15,'Loreto'),(16,'Madre de Dios'),(17,'Moquegua'),(18,'Pasco'),(19,'Piura'),(20,'Puno'),(21,'San Martin'),(22,'Tacna'),(23,'Tumbes'),(24,'Ucayali');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `evitar_eliminacion_ciudad` BEFORE DELETE ON `ciudad` FOR EACH ROW BEGIN
    DECLARE num_reservas INT;
    
    -- Verificar si existen reservas asociadas a la ciudad que se desea eliminar
    SELECT COUNT(*) INTO num_reservas FROM reserva WHERE nombre_ciudad = OLD.nombre;
    
    -- Si hay reservas asociadas, evita la eliminación de la ciudad
    IF num_reservas > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede eliminar esta ciudad, hay reservas asociadas a la misma';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dni` int NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `encriptar_contraseña_cliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    SET NEW.password = SHA2(NEW.password, 256); -- Encriptar la contraseña al insertar un nuevo cliente
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_contraseña_cliente` BEFORE UPDATE ON `cliente` FOR EACH ROW BEGIN
    IF NEW.password <> OLD.password THEN
        SET NEW.password = SHA2(NEW.password, 256); -- Encriptar la contraseña si se actualiza
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ciudad` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `Precio` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `destino_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (1,1,'Kuélap','https://i.ibb.co/Cn9p0NK/AM1.jpg','Una impresionante fortaleza preincaica con enormes muros de piedra.',100.00),(2,1,'Catarata Gocta','https://i.ibb.co/hRTNYHv/AM2.jpg','Una de las cascadas más altas del mundo, rodeada de una exuberante selva.',100.00),(3,1,'Sarcófagos de Karajía','https://i.ibb.co/JCcJsq3/AM3.jpg','Misteriosas tumbas funerarias talladas en acantilados.',100.00),(4,1,'Marañón Canyon','https://i.ibb.co/8d3t5wh/AM4.jpg','Un cañón espectacular con paisajes desérticos y vistas panorámicas.',100.00),(5,1,'Cavernas de Quiocta','https://i.ibb.co/M6QMnG6/AM5.jpg','Sistema de cuevas con estalactitas y estalagmitas impresionantes.',100.00),(6,1,'Laguna de los Cóndores','https://i.ibb.co/cNNqhQm/AM6.jpg','Lugar remoto con petroglifos y ruinas arqueológicas.',100.00),(7,1,'Valle de las Lágrimas','https://i.ibb.co/TgsX0BF/AM7.jpg','Un valle verde rodeado de montañas y mitología local.',100.00),(8,1,'Reserva Nacional de Chachapoyas','https://i.ibb.co/dbpWywx/AM8.jpg','Hogar de flora y fauna únicas.',100.00),(9,1,'Petroglifos de La Pitaya','https://i.ibb.co/7KFDT9B/AM9.jpg','Rocas talladas con antiguos grabados enigmáticos.',100.00),(10,2,'Cordillera Blanca','https://i.ibb.co/88gpFYt/AN1.jpg','Un paraíso para los amantes del senderismo y el montañismo.',100.00),(11,2,'Laguna Llanganuco','https://i.ibb.co/Hnxh8jR/AN2.jpg','Dos hermosas lagunas en medio de un paisaje montañoso.',100.00),(12,2,'Parque Nacional Huascaran','https://i.ibb.co/Br7tp7H/AN3.jpg','Hogar del pico más alto de Perú, el Huascarán.',100.00),(13,2,'Chavín de Huántar','https://i.ibb.co/CW31dLk/AN4.jpg','Sitio arqueológico con impresionantes esculturas y túneles subterráneos.',100.00),(14,2,'Playa Tortugas','https://i.ibb.co/wY4g0Wp/AN5.jpg','Playa de arena blanca ideal para relajarse y disfrutar del sol.',100.00),(15,2,'Laguna Parón','https://i.ibb.co/wg4sv3Q/AN6.jpg','Una laguna turquesa rodeada de glaciares y montañas.',100.00),(16,2,'Nevado Pastoruri','https://i.ibb.co/Rv7J7bB/AN7.jpg','Un glaciar que se puede visitar a pie.',100.00),(17,2,'Casma','https://i.ibb.co/yf4pFGv/AN8.jpg','Pintoresca ciudad con arquitectura colonial y mercado colorido.',100.00),(18,2,'Tunel de Kahuish','https://i.ibb.co/2vm5BGy/AN9.jpg','Túnel ferroviario en un entorno montañoso espectacular.',100.00),(19,3,'Nevado Ampay','https://i.ibb.co/Q8VYqKq/AP1.jpg','Montaña y santuario de la naturaleza con rutas de senderismo.',100.00),(20,3,'Vilcabamba','https://i.ibb.co/yV4pLXV/AP2.jpg','Sitio arqueológico vinculado a los últimos días de los incas.',100.00),(21,3,'Cañón de Apurímac','https://i.ibb.co/J3qvBy9/AP3.jpg','Uno de los cañones más profundos del mundo.',100.00),(22,3,'Santuario Nacional de Ampay','https://i.ibb.co/f8MLDdJ/AP4.jpg','Hogar de una gran variedad de flora y fauna.',100.00),(23,3,'Baños Termales de Cconoc','https://i.ibb.co/VHmfm9R/AP5.jpg','Aguas termales en medio de la naturaleza.',100.00),(24,3,'Laguna Pacucha','https://i.ibb.co/ThmXrxY/AP6.jpg','Laguna de agua dulce con hermosos paisajes circundantes.',100.00),(25,3,'Mercado de Abancay','https://i.ibb.co/wRwdPgW/AP7.jpg','Lugar para probar la gastronomía local.',100.00),(26,3,'Cascadas de Haquira','https://i.ibb.co/3mq4StW/AP8.jpg','Una serie de cascadas en las montañas.',100.00),(27,3,'Complejo Arqueológico de Sayhuite','https://i.ibb.co/v4MJPJv/AP9.jpg','Una misteriosa roca tallada.',100.00),(28,4,'Monasterio de Santa Catalina','https://i.ibb.co/cwpR5G4/AR1.jpg','Un impresionante convento colonial que es una ciudad dentro de la ciudad.',100.00),(29,4,'Cañón del Colca','https://i.ibb.co/VHGkGjj/AR2.jpg','Uno de los cañones más profundos del mundo y un lugar excelente para observar cóndores.',100.00),(30,4,'Plaza de Armas de Arequipa','https://i.ibb.co/HzSqVjX/AR3.jpg','El corazón de la ciudad, rodeada de edificios coloniales de sillar.',100.00),(31,4,'Volcán Misti','https://i.ibb.co/h9Czm57/AR4.jpg','Una montaña icónica para el senderismo y el alpinismo.',100.00),(32,4,'Plaza Yanahuara','https://i.ibb.co/FBhJgg7/AR5.jpg','Ofrece vistas panorámicas de la ciudad y una iglesia con arquitectura singular.',100.00),(33,4,'Museo Santuarios Andinos','https://i.ibb.co/PC2snt4/AR6.jpg','Donde se exhibe la momia de Juanita, una niña inca sacrificada.',100.00),(34,4,'Mercado San Camilo','https://i.ibb.co/HTVtQv3/AR7.jpg','Un mercado tradicional donde puedes probar la gastronomía local.',100.00),(35,4,'Molino de Sabandía','https://i.ibb.co/yRdFPN7/AR8.jpg','Un molino de agua histórico rodeado de jardines.',100.00),(36,4,'Petroglifos de Toro Muerto','https://i.ibb.co/r72mDS1/AR9.jpg','Un sitio arqueológico con grabados preincaicos en roca.',100.00),(37,5,'Plaza Mayor de Ayacucho','https://i.ibb.co/LZLc67q/AY1.jpg','El corazón histórico de la ciudad, rodeado de edificios coloniales.',100.00),(38,5,'Wari','https://i.ibb.co/mt583zk/AY2.jpg','Ruinas de la cultura Wari con estructuras y terrazas impresionantes.',100.00),(39,5,'Museo de la Memoria','https://i.ibb.co/mbG4qBD/AY3.jpg','Exhibe arte y documentos relacionados con la historia peruana.',100.00),(40,5,'Mirador de Acuchimay','https://i.ibb.co/nsFyqBs/AY4.jpg','Ofrece vistas panorámicas de la ciudad y los alrededores.',100.00),(41,5,'Carnaval Ayacuchano','https://i.ibb.co/GdmKvhx/AY5.jpg','Celebración colorida y alegre con danzas tradicionales.',100.00),(42,5,'Templo de Santo Domingo','https://i.ibb.co/Y4gFvJ8/AY6.jpg','Iglesia barroca con impresionantes retablos.',100.00),(43,5,'Quinua','https://i.ibb.co/J2zhH9C/AY7.jpg','Pintoresco pueblo conocido por su feria artesanal.',100.00),(44,5,'Laguna de Parinacochas','https://i.ibb.co/NtrCFRM/AY8.jpg','Hermosa laguna rodeada de montañas y avifauna.',100.00),(45,5,'Sitio Arqueológico de Vilcashuamán','https://i.ibb.co/px1V1hJ/AY9.jpg','Ruinas incas con terrazas y edificaciones.',100.00),(46,6,'Baños del Inca','https://i.ibb.co/tQQfjkq/CA1.jpg','Aguas termales donde se encontró al Inca Atahualpa.',100.00),(47,6,'Cuarto del Rescate','https://i.ibb.co/zHWStQL/CA2.jpg','Sitio histórico relacionado con la conquista española.',100.00),(48,6,'Ventanillas de Otuzco','https://i.ibb.co/qk6wPm0/CA3.jpg','Necrópolis preincaica con tumbas talladas en la roca.',100.00),(49,6,'Complejo Belén','https://i.ibb.co/2PWz1DH/CA4.jpg','Iglesia y museo que alberga arte religioso colonial.',100.00),(50,6,'Granja Porcón','https://i.ibb.co/JsLzgQH/CA5.jpg','Comunidad agrícola sostenible con actividades turísticas.',100.00),(51,6,'Laguna de San Nicolás','https://i.ibb.co/TbJfBC4/CA6.jpg','Hermosa laguna en medio de paisajes verdes.',100.00),(52,6,'Cumbemayo','https://i.ibb.co/ZKJJHCP/CA7.jpg','Canal preincaico tallado en la roca con petroglifos.',100.00),(53,6,'Iglesia de Santa Apolonia','https://i.ibb.co/WDGP62t/CA8.jpg','Antigua iglesia con un retablo impresionante.',100.00),(54,6,'Festival del Carnaval de Cajamarca','https://i.ibb.co/1QssqNg/CA9.jpg','Celebración animada con desfiles y música.',100.00),(55,7,'Machu Picchu','https://i.ibb.co/3NVcYPK/CU1.jpg','La antigua ciudad inca, una de las maravillas del mundo.',100.00),(56,7,'Valle Sagrado de los Incas','https://i.ibb.co/n0605gB/CU2.jpg','Paisajes espectaculares, mercados y sitios arqueológicos.',100.00),(57,7,'Sacsayhuamán','https://i.ibb.co/fptnt31/CU3.jpg','Complejo de fortalezas incas con enormes bloques de piedra.',100.00),(58,7,'Plaza de Armas de Cusco','https://i.ibb.co/QHntYyK/CU4.jpg','Centro histórico con iglesias y arquitectura colonial.',100.00),(59,7,'Moray','https://i.ibb.co/34Rt8W8/CU5.jpg','Anfiteatro agrícola circular incaico.',100.00),(60,7,'Ollantaytambo','https://i.ibb.co/m91md61/CU6.jpg','Pueblo incaico con impresionantes terrazas y ruinas.',100.00),(61,7,'Mercado de Pisac','https://i.ibb.co/pvQrSKZ/CU7.jpg','Colorido mercado indígena con artesanías y productos locales.',100.00),(62,7,'Qorikancha','https://i.ibb.co/qJypzMj/CU8.jpg','Templo inca convertido en la iglesia de Santo Domingo.',100.00),(63,7,'Montaña de Colores','https://i.ibb.co/HNpw6Ww/CU9.jpg','Montaña con colores vibrantes en la cordillera de los Andes.',100.00),(64,8,'Parque Nacional Tingo María','https://i.ibb.co/3S7LQpH/HU1.jpg','Bosques, cavernas y una montaña en forma de mujer acostada.',100.00),(65,8,'Laguna de los Milagros','https://i.ibb.co/FVFWPwh/HU2.jpg','Hermosa laguna enclavada en la montaña.',100.00),(66,8,'Túnel de Carpish','https://i.ibb.co/RbM9xbv/HU3.jpg','Atracción natural con una carretera que atraviesa una montaña.',100.00),(67,8,'Plaza de Armas de Huánuco','https://i.ibb.co/DWMrYpM/HU4.jpg','Centro histórico con arquitectura colonial.',100.00),(68,8,'Reserva Nacional de Junín','https://i.ibb.co/d770MTf/HU5.jpg','Hogar de la rara vicuña y hermosos paisajes de páramo.',100.00),(69,8,'Museo de Leandro y Alcira Vargas','https://i.ibb.co/7pxvt2W/HU6.jpg','Arte y objetos históricos de la región.',100.00),(70,8,'Iglesia de San Sebastián','https://i.ibb.co/gw35Jpy/HU7.jpg','Iglesia colonial con una fachada barroca.',100.00),(71,8,'Cascada El Velo de la Novia','https://i.ibb.co/tJJ6JH0/HU8.jpg','Impresionante cascada en la selva.',100.00),(72,8,'El Mirador de Chiprac','https://i.ibb.co/hDGb3YL/HU9.jpg','Ofrece vistas panorámicas de Huánuco.',100.00),(73,9,'Plaza de Armas de Huancavelica','https://i.ibb.co/QD1Pgxm/HV1.jpg','Centro histórico con arquitectura colonial.',100.00),(74,9,'Laguna de Ñahuinpuquio','https://i.ibb.co/6nZx6mr/HV2.jpg','Laguna de aguas cristalinas rodeada de montañas.',100.00),(75,9,'Minas de Huancavelica','https://i.ibb.co/k3NtT2S/HV3.jpg','Minas históricas que producían mercurio en la época colonial.',100.00),(76,9,'Baños Termales de Acobambilla','https://i.ibb.co/pXmQjGg/HV4.jpg','Aguas termales para relajarse y disfrutar.',100.00),(77,9,'Complejo Arqueológico de Incahuasi','https://i.ibb.co/s38YNBp/HV5.jpg','Ruinas incas con terrazas agrícolas.',100.00),(78,9,'Cascada de Tiquimba','https://i.ibb.co/wh85TLL/HV6.jpg','Hermosa cascada en medio de la naturaleza.',100.00),(79,9,'Iglesia de Santa Ana','https://i.ibb.co/7YZ9zgC/HV7.jpg','Iglesia colonial con una fachada impresionante.',100.00),(80,9,'Laguna Parihuanta','https://i.ibb.co/34TQtdL/HV8.jpg','Otro hermoso lago en la región.',100.00),(81,9,'Museo Municipal de Huancavelica','https://i.ibb.co/cXhTx4C/HV9.jpg','Exhibe arte y objetos históricos.',100.00),(82,10,'Huacachina','https://i.ibb.co/kqcysNf/IC1.jpg','Oasis rodeado de dunas para practicar sandboard y paseos en buggy.',100.00),(83,10,'Bodega de Pisco','https://i.ibb.co/9VHynNY/IC2.jpg','Degustaciones de pisco, el licor nacional peruano.',100.00),(84,10,'Líneas de Nazca','https://i.ibb.co/tMf2KZT/IC3.jpg','Enigmáticas geoglifos en el desierto que representan figuras y líneas.',100.00),(85,10,'Paracas National Reserve','https://i.ibb.co/31bGSFL/IC4.jpg','Hogar de una gran variedad de aves marinas y vida silvestre.',100.00),(86,10,'Museo Regional de Ica','https://i.ibb.co/CJbyQts/IC5.jpg','Artefactos arqueológicos y momias.',100.00),(87,10,'Catedral de Ica','https://i.ibb.co/qsyPSS3/IC6.jpg','Iglesia colonial con una impresionante fachada de piedra.',100.00),(88,10,'Islas Ballestas','https://i.ibb.co/sPSgFLy/IC7.jpg','Islas llenas de vida marina, como pingüinos y lobos marinos.',100.00),(89,10,'Dunas de Sarapampa','https://i.ibb.co/X7MGvZf/IC8.jpg','Dunas de arena para practicar sandboarding.',100.00),(90,10,'Vino y Cata de Uva','https://i.ibb.co/HHgYTZ1/IC9.jpg','Tour en viñedos para degustar vinos y piscos.',100.00),(91,11,'Lago Junín','https://i.ibb.co/sjnFVJ6/JU1.jpg','El segundo lago más grande de Perú, ideal para la observación de aves y paseos en bote.',100.00),(92,11,'Reserva Nacional de Junín','https://i.ibb.co/yyz6wb6/JU2.jpg','Hogar de la rara vicuña y otras especies de fauna silvestre en paisajes de páramo.',100.00),(93,11,'Tarma','https://i.ibb.co/0fZKf9p/JU3.jpg','Conocida como \"La Perla de los Andes\", es una ciudad con un clima agradable y hermosas flores.',100.00),(94,11,'Laguna de Paca','https://i.ibb.co/BcMfKtV/JU4.jpg','Lago rodeado de montañas donde puedes pescar y disfrutar de la naturaleza.',100.00),(95,11,'Cerro de Pasco','https://i.ibb.co/LdLTdNd/JU5.jpg','Ciudad minera en las alturas con una interesante historia y una iglesia de estilo gótico.',100.00),(96,11,'Complejo Arqueológico de Incahuasi','https://i.ibb.co/bKK2s2J/JU6.jpg','Ruinas incas con terrazas agrícolas y una hermosa vista panorámica.',100.00),(97,11,'Cascada El Velo de la Novia','https://i.ibb.co/LYDJyy6/JU7.jpg','Una impresionante cascada en medio de la naturaleza.',100.00),(98,11,'Bosque de Piedras de Huayllay','https://i.ibb.co/30cbHP9/JU8.jpg','Formaciones rocosas sorprendentes que parecen esculpidas por la naturaleza.',100.00),(99,11,'Museo de Minería de la Oroya','https://i.ibb.co/tM1SxCj/JU9.jpg','Museo que cuenta la historia de la industria minera de la región.',100.00),(100,12,'Complejo Arqueológico de Túcume','https://i.ibb.co/qkqK5MY/LA1.jpg','Es un lugar fascinante para explorar la historia antigua de la región.',100.00),(101,12,'Museo Tumbas Reales de Sipán','https://i.ibb.co/6ghmrdP/LA2.jpg','Este museo es famoso por exhibir los tesoros y las tumbas del Señor de Sipán, un gobernante mochica.',100.00),(102,12,'Ciudad de Lambayeque','https://i.ibb.co/yWWxB6j/LA3.jpg','La ciudad de Lambayeque es la capital de la región y cuenta con una arquitectura colonial hermosa y una rica historia.',100.00),(103,12,'Reserva Nacional de Chaparri','https://i.ibb.co/wLF8BF1/LA4.jpg','Un área de conservación importante, Chaparri es hogar de diversas especies de flora y fauna, incluidos los osos de anteojos.',100.00),(104,12,'Museo Nacional Sicán','https://i.ibb.co/pQQwxNT/LA5.jpg','Este museo se enfoca en la cultura Sican y alberga una impresionante colección de artefactos y tesoros de esta antigua civilización.',100.00),(105,12,'Bosque de Pómac','https://i.ibb.co/Stqw992/LA6.jpg','Es el bosque de algarrobos más grande del mundo y ofrece oportunidades para hacer senderismo .',100.00),(106,12,'Playas de Pimentel y Santa Rosa','https://i.ibb.co/vHJtWWq/LA7.jpg','Estas playas son populares destinos de veraneo.',100.00),(107,12,'Complejo Arqueológico de Chotuna-Chornancap','https://i.ibb.co/Dg72xDy/LA8.jpg','Este sitio arqueológico incluye antiguas tumbas y templos, y es un importante vestigio de la cultura Lambayeque.',100.00),(108,12,'Pueblo de Zaña','https://i.ibb.co/zSGDWgB/LA9.jpg','Pueblo histórico conserva su encanto colonial y es conocido por su arquitectura bien preservada.',100.00),(109,13,'Huaca del Sol y la Luna','https://i.ibb.co/09ypyC9/LL1.jpg','Complejo arqueológico que alberga pirámides preincaicas con impresionantes murales y relieves.',100.00),(110,13,'Chan Chan','https://i.ibb.co/tPGjXDN/LL2.jpg','Ciudadela de barro más grande de América, construida por la cultura Chimú.',100.00),(111,13,'Playa de Huanchaco','https://i.ibb.co/JkZjSQz/LL3.jpg','Famosa por sus caballitos de totora y excelente para el surf.',100.00),(112,13,'Balneario de Salaverry','https://i.ibb.co/99948N0/LL4.jpg','Pueblo costero con playas tranquilas y un puerto histórico.',100.00),(113,13,'Cascas','https://i.ibb.co/k137f2r/LL5.jpg','Pueblo conocido por su iglesia colonial y la Feria de la Candelaria.',100.00),(114,13,'Hacienda San José','https://i.ibb.co/vZ5M0Vw/LL6.jpg','Mansión colonial convertida en un hotel de lujo con historia.',100.00),(115,13,'El Brujo','https://i.ibb.co/pZFPD6Q/LL7.jpg','Sitio arqueológico donde se encontró la momia de la Dama de Cao.',100.00),(116,13,'Laguna de Conache','https://i.ibb.co/XLWcGng/LL8.jpg','Hermosa laguna rodeada de paisajes naturales.',100.00),(117,13,'Festival Internacional de la Primavera','https://i.ibb.co/4YCVLqB/LL9.jpg','Celebración anual con desfiles y música en la ciudad de Trujillo.',100.00),(118,14,'Plaza de Armas','https://i.ibb.co/2q79Gn9/LI1.jpg','Corazón histórico de Lima, rodeada de arquitectura colonial y un ambiente vibrante.',100.00),(119,14,'Circuito Magico del Agua','https://i.ibb.co/P9QWrZ4/LI2.webp','Espectáculo nocturno de fuentes de agua iluminadas, perfecto para disfrutar en familia.',100.00),(120,14,'Malecon Costa Verde','https://i.ibb.co/1LzQ6F4/LI3.jpg','Hermosa costa con vistas al océano Pacífico, ideal para paseos relajantes y deportes.',100.00),(121,14,'Fortaleza Real Felipe','https://i.ibb.co/3dNvnXk/LI4.jpg','Antigua fortificación española con historia militar y vistas panorámicas al puerto de Callao.',100.00),(122,14,'Puente de los Suspiros','https://i.ibb.co/qry8zq0/LI5.jpg','Puente icónico de Barranco, lleno de leyendas románticas y un ambiente bohemio.',100.00),(123,14,'Islas Palomino','https://i.ibb.co/RPBx5v6/LI6.webp','Paraíso natural cerca de Lima, hogar de lobos marinos y aves marinas en su entorno marino.',100.00),(124,14,'Museo Larco','https://i.ibb.co/k1Dd3Qm/LI7.jpg','Colección impresionante de arte precolombino en un entorno encantador con jardines exuberantes.',100.00),(125,14,'Punta Negra','https://i.ibb.co/k6GMLxK/LI8.jpg','Playa favorita de surfistas con olas impresionantes y ambiente relajado.',100.00),(126,14,'Caral','https://i.ibb.co/HzzBcts/LI9.jpg','Sitio arqueológico antiguo que representa una de las civilizaciones más antiguas de América.',100.00),(127,15,'Plaza de Armas de Iquitos','https://i.ibb.co/CHn6VMP/LO1.jpg','Centro histórico en Iquitos, vibrante y colorido, con arquitectura única y cultura amazónica.',100.00),(128,15,'Malecon Tarapaca','https://i.ibb.co/ZcD8nPn/LO2.jpg','Paseo ribereño a lo largo del río Amazonas, lleno de actividades y hermosas vistas naturales.',100.00),(129,15,'Canopy Walkway','https://i.ibb.co/fHYXLP9/LO3.jpg','Aventura en las alturas, caminata por puentes colgantes en la selva amazónica, con vistas impresionantes.',100.00),(130,15,'Mirador de Nauta','https://i.ibb.co/KxcQs9S/LO4.webp','Observatorio natural para admirar la exuberante vegetación amazónica y la vida silvestre.',100.00),(131,15,'Fundo Pedrito','https://i.ibb.co/QNxktjX/LO5.jpg','Refugio ecológico en la selva, con oportunidades para avistar aves y explorar la flora local.',100.00),(132,15,'Mirador de Llactapata','https://i.ibb.co/0fKk1JF/LO6.jpg','Vista panorámica de la selva desde una colina, revelando la belleza de Loreto.',100.00),(133,15,'Petroglifo de Cumpanama','https://i.ibb.co/VQBYBcB/LO7.jpg','Antiguas inscripciones en roca que cuentan historias de culturas indígenas precolombinas.',100.00),(134,15,'Complejo Turístico Quistococha','https://i.ibb.co/m86JPNM/LO8.jpg','Lugar perfecto para experimentar la naturaleza amazónica y la cultura local.',100.00),(135,15,'Reserva Nacional de Pacaya Samiria','https://i.ibb.co/bXdRQZC/LO9.jpg','Santuario natural, hogar de una variada vida silvestre en medio de los humedales y ríos de la selva.',100.00),(136,16,'Plaza de Armas de Puerto Maldonado','https://i.ibb.co/2txVDqj/MD1.jpg','Corazón histórico de la ciudad, rodeado de cultura y naturaleza amazónica.',100.00),(137,16,'Parque Nacional del Manu','https://i.ibb.co/DtMr75w/MD2.jpg','Santuario de biodiversidad, con selvas vírgenes y vida silvestre única en la región.',100.00),(138,16,'Puerto Maldonado','https://i.ibb.co/QkYXpMq/MD3.png','Puerta de entrada a la Amazonía, con encanto selvático y base para exploraciones.',100.00),(139,16,'Reserva Nacional de Tambopata','https://i.ibb.co/z8fskx3/MD4.jpg','Hogar de especies raras y paisajes impresionantes en el corazón de la selva.',100.00),(140,16,'Tahuamanu','https://i.ibb.co/2kvH9cf/MD5.jpg','Río serpenteante que ofrece oportunidades para la pesca y la observación de la fauna.',100.00),(141,16,'Cascada de Baltimore','https://i.ibb.co/FYCB2dW/MD6.webp','Belleza natural escondida, una joya oculta en la selva tropical de Madre de Dios.',100.00),(142,16,'Lago Sandoval','https://i.ibb.co/3kHF3wB/MD7.jpg','Refugio de vida silvestre, con paseos en bote y observación de caimanes y aves.',100.00),(143,16,'Lago de Tres Chimbadas','https://i.ibb.co/1GqhfL6/MD8.jpg','Exploración de lagunas tranquilas en busca de caimanes y vida silvestre amazónica.',100.00),(144,16,'Parque Nacional Bahuaja-Sonene','https://i.ibb.co/0jPZg1D/MD9.jpg','Conserva la biodiversidad única de la Amazonía, ideal para la aventura y la naturaleza.',100.00),(145,17,'Museo Contisuyo','https://i.ibb.co/fMCPCvY/MO1.jpg','Explora la rica historia y cultura de Moquegua a través de sus fascinantes exhibiciones.',100.00),(146,17,'Mina Cuajone','https://i.ibb.co/qNnQLJs/MO2.jpg','Adéntrate en una mina de cobre y descubre el mundo subterráneo de la minería.',100.00),(147,17,'Iglesia de Santo Domingo','https://i.ibb.co/WpX5nYw/MO3.jpg','Un tesoro arquitectónico que representa la herencia religiosa y cultural de Moquegua.',100.00),(148,17,'Mirador de Santo Domingo','https://i.ibb.co/G7XgYgh/MO4.jpg','Disfruta de impresionantes vistas panorámicas de la ciudad y su entorno natural.',100.00),(149,17,'Punta Coles','https://i.ibb.co/Wkbd7Hj/MO5.png','Relájate en hermosas playas y disfruta del encanto costero de esta pintoresca localidad.',100.00),(150,17,'Museo Chiribaya','https://i.ibb.co/8DRWTbH/MO6.png','Sumérgete en la cultura preincaica a través de artefactos y exhibiciones arqueológicas.',100.00),(151,17,'Aguas Termales de Cuchumbaya','https://i.ibb.co/c15H2Nm/MO7.jpg','Relaja cuerpo y mente en aguas termales naturales rodeadas de paisajes impresionantes.',100.00),(152,17,'Valle Omate','https://i.ibb.co/7C1vPmV/MO8.jpg','Descubre un valle pintoresco con terrazas agrícolas y un ambiente tranquilo y apacible.',100.00),(153,17,'Geoglifos de Chen Chen','https://i.ibb.co/Fg9qPP8/MO9.jpg','Maravíllate con las enigmáticas figuras grabadas en la tierra, testimonio de la antigua cultura moqueguana.',100.00),(154,18,'Oxapampa','https://i.ibb.co/ZYdTvRx/PA1.jpg','Encantador pueblo con influencia austro-germana, rodeado de naturaleza exuberante y cultura diversa.',100.00),(155,18,'Parque Nacional Yanachaga Chemillén','https://i.ibb.co/S7z9GgR/PA2.jpg','Reserva natural en Pasco, hogar de biodiversidad única y hermosos paisajes.',100.00),(156,18,'Pozuzo','https://i.ibb.co/X2cndgv/PA3.jpg','Pintoresco pueblo fundado por colonos alemanes, famoso por su arquitectura, gastronomía y tradiciones.',100.00),(157,18,'Villa Rica','https://i.ibb.co/kQLQ9pb/PA4.jpg','Destino cafetero en Pasco, donde puedes disfrutar de café fresco y hermosos paisajes montañosos.',100.00),(158,18,'Parque Nacional Pasco','https://i.ibb.co/RYbMT9z/PA5.jpg','Área protegida con flora y fauna autóctona, ideal para aventuras al aire libre.',100.00),(159,18,'Huayllay','https://i.ibb.co/FKNhgmX/PA6.jpg','Bosque de piedras con formaciones rocosas sorprendentes, perfecto para el senderismo y la exploración.',100.00),(160,18,'Parque Nacional Tingo María','https://i.ibb.co/PxM9sbJ/PA7.jpg','Selva virgen con cuevas, cascadas y diversidad de vida silvestre en Tingo María.',100.00),(161,18,'Colonia Austria','https://i.ibb.co/pRd6GND/PA8.webp','Comunidad que conserva la cultura austro-germana en Pasco, con arquitectura y tradiciones únicas.',100.00),(162,18,'Cascada Velo de la Novia','https://i.ibb.co/M6s8kw2/PA9.jpg','Impresionante caída de agua rodeada de naturaleza, un lugar romántico y pintoresco.',100.00),(163,19,'Máncora','https://i.ibb.co/D7CvP66/PI1.jpg','Playa famosa por sus olas perfectas y ambiente relajado, ideal para surfear y descansar.',100.00),(164,19,'Las Pocitas','https://i.ibb.co/rQQ1c33/PI2.jpg','Playa tranquila con piscinas naturales, un rincón de serenidad en la costa de Piura.',100.00),(165,19,'Zorritos','https://i.ibb.co/Gsqj3wd/PI3.webp','Balneario de aguas termales y playas doradas, perfecto para relajarse y disfrutar del sol.',100.00),(166,19,'Catacaos','https://i.ibb.co/WkS86Xh/PI4.jpg','Pueblo artesanal con joyería de filigrana y cerámica, una muestra de la cultura piurana.',100.00),(167,19,'Reserva de Biósfera de Amotape','https://i.ibb.co/PCdJXmT/PI5.jpg','Santuario natural con vida silvestre y paisajes cautivadores, ideal para la observación.',100.00),(168,19,'Playa Vichayito','https://i.ibb.co/7pVSbKR/PI6.webp','Hermosa playa con aguas cristalinas y tranquilidad, perfecta para nadar y desconectar.',100.00),(169,19,'Chulucanas','https://i.ibb.co/ypCrSQy/PI7.jpg','Centro cerámico de renombre con alfarería exquisita y tradiciones culturales únicas.',100.00),(170,19,'Museo Vicús','https://i.ibb.co/VMbHDsm/PI8.png','Tesoros arqueológicos y culturales que cuentan la historia ancestral de Piura.',100.00),(171,19,'Playa Los Órganos','https://i.ibb.co/rHkS33F/PI9.jpg','Paraíso para el surf y avistamiento de ballenas, con espectaculares atardeceres en la costa piurana.',100.00),(172,20,'Lago Titicaca','https://i.ibb.co/nLwYs4T/PU1.jpg','El lago navegable más alto del mundo, hogar de islas flotantes y culturas ancestrales.',100.00),(173,20,'Sillustani','https://i.ibb.co/dGHwFhR/PU2.jpg','Sitio arqueológico con impresionantes tumbas y vistas panorámicas sobre la meseta de Puno.',100.00),(174,20,'Isla Amantani','https://i.ibb.co/mFMtktM/PU3.jpg','Comunidad auténtica en el lago, donde los visitantes pueden experimentar la cultura local.',100.00),(175,20,'Chucuito','https://i.ibb.co/zf2jJDb/PU4.jpg','Pueblo colonial con una iglesia única y el famoso \"Templo de la Fertilidad.\"',100.00),(176,20,'Isla Suasi','https://i.ibb.co/xMbQ5C1/PU5.jpg','Isla privada en el Titicaca, un refugio natural con senderos y vistas espectaculares.',100.00),(177,20,'Yavari','https://i.ibb.co/gDbT01m/PU6.jpg','Barco de hierro restaurado, una joya histórica que flota en el lago Titicaca.',100.00),(178,20,'Pomata','https://i.ibb.co/jr003hp/PU7.jpg','Pueblo con iglesia de estilo barroco andino y espléndidas vistas al lago y montañas.',100.00),(179,20,'Mirador de Kuntur Wasi','https://i.ibb.co/TbQvwg3/PU8.jpg','Ofrece vistas panorámicas excepcionales del Titicaca y los alrededores.',100.00),(180,20,'Tiwanaku','https://i.ibb.co/7kfyMHh/PU9.jpg','Sitio arqueológico preincaico en Bolivia, cerca de Puno, con monumentos y arte antiguo.',100.00),(181,21,'Tarapoto','https://i.ibb.co/10NkYNb/SM1.jpg','Puerta de entrada a la selva peruana, con exuberante vegetación y experiencias naturales fascinantes.',100.00),(182,21,'Lamas','https://i.ibb.co/0mfSkhd/SM2.jpg','Encantador pueblo con influencias indígenas, conocido por su cultura, artesanías y tradiciones únicas.',100.00),(183,21,'Laguna Azul','https://i.ibb.co/DG1Fjps/SM3.jpg','Espejo de agua rodeado de vegetación exuberante, un paraíso natural para nadar y explorar.',100.00),(184,21,'Cueva de las Lechuzas','https://i.ibb.co/zJ9kYZ3/SM4.jpg','Formación natural impresionante, hogar de murciélagos y aves nocturnas en la selva.',100.00),(185,21,'Reserva Nacional Cordillera Escalera','https://i.ibb.co/gRWF73t/SM5.jpg','Diversidad biológica en su máxima expresión, con rutas de senderismo y observación de aves.',100.00),(186,21,'Shapaja','https://i.ibb.co/LzDs0q9/SM6.jpg','Pueblo pintoresco en medio de la selva, donde la naturaleza y la cultura se fusionan.',100.00),(187,21,'Lago Venado','https://i.ibb.co/L5QNFNQ/SM7.jpg','Belleza serena en un lago rodeado de bosques, perfecto para la pesca y la tranquilidad.',100.00),(188,21,'Camino a Yurimaguas','https://i.ibb.co/ctVnbF3/SM8.jpg','Ruta escénica que te lleva a la ciudad amazónica de Yurimaguas, repleta de tesoros naturales.',100.00),(189,21,'Alto Shambillo','https://i.ibb.co/VxBR6zk/SM9.jpg','Punto de partida para aventuras en la selva, donde la biodiversidad y la aventura te esperan.',100.00),(190,22,'Catedral de Tacna','https://i.ibb.co/YNFTVZV/TA1.jpg','Monumental iglesia con arquitectura neoclásica, un símbolo histórico y espiritual en la ciudad.',100.00),(191,22,'Parque de los Dinosaurios','https://i.ibb.co/bg7dpKb/TA2.jpg','Un viaje al pasado con réplicas de dinosaurios y actividades educativas para toda la familia.',100.00),(192,22,'Humedales de Ite','https://i.ibb.co/3WVCcMJ/TA3.jpg','Santuario de aves migratorias y naturaleza exuberante, ideal para la observación de aves.',100.00),(193,22,'Paseo Cívico','https://i.ibb.co/9W6FmKC/TA4.jpg','Espacio urbano lleno de historia y cultura, con esculturas y áreas de recreación en Tacna.',100.00),(194,22,'Arco Parabólico','https://i.ibb.co/4ZQ1G0N/TA5.jpg','Monumento icónico que representa la libertad y la historia en la Plaza de Armas de Tacna.',100.00),(195,22,'Andenes de Tarata','https://i.ibb.co/MgM9rjB/TA6.png','Terrazas agrícolas preincaicas en un entorno impresionante, testimonio de antiguas técnicas agrícolas.',100.00),(196,22,'Petroglifo de Miculla','https://i.ibb.co/njSPC0N/TA7.jpg','Arte rupestre en las rocas que narra la historia ancestral de la región de Tacna.',100.00),(197,22,'Casa Zela','https://i.ibb.co/cx2b5r5/TA8.jpg','Residencia histórica que alberga museo y exhibe la influencia de la familia Zela en la independencia.',100.00),(198,22,'Museo de Sitio Las Peañas','https://i.ibb.co/1mtVB2j/TA9.jpg','Espacio cultural que presenta la historia de Tacna y su lucha por la independencia.',100.00),(199,23,'Plaza de Armas','https://i.ibb.co/Z6pfh8D/TU1.jpg','Corazón de Tumbes, con un ambiente encantador y edificios históricos en su entorno.',100.00),(200,23,'Cabeza de Vaca','https://i.ibb.co/gr9757n/TU2.jpg','Playa tranquila y hermosa en Tumbes, perfecta para relajarse y disfrutar del sol.',100.00),(201,23,'Paseo Jerusalén','https://i.ibb.co/NyfC7j6/TU3.jpg','Área escénica junto al río Tumbes, ideal para paseos serenos y momentos de paz.',100.00),(202,23,'Paseo El Beso','https://i.ibb.co/VLJDkyC/TU4.jpg','Rincón romántico en Tumbes, un lugar emblemático para las parejas y el amor.',100.00),(203,23,'Santuario Nacional Manglares','https://i.ibb.co/f1dJDfW/TU5.jpg','Hogar de manglares y vida silvestre, un paraíso natural para la observación de aves.',100.00),(204,23,'Reserva Nacional de Tumbes','https://i.ibb.co/3Yk6jFJ/TU6.jpg','Área protegida con una variedad de ecosistemas y una rica biodiversidad.',100.00),(205,23,'Plaza Hermosa','https://i.ibb.co/CBcx0vB/TU7.jpg','Espacio público con encanto en Tumbes, rodeado de belleza arquitectónica y ambiente local.',100.00),(206,23,'Isla Hueso de Ballena','https://i.ibb.co/xq744N2/TU8.jpg','Lugar remoto y fascinante en Tumbes, con playas desiertas y paisajes impresionantes.',100.00),(207,23,'Punta Sal','https://i.ibb.co/vQDbHHb/TU9.jpg','Destino de playa de renombre en Tumbes, con arenas doradas y aguas cálidas, ideal para el relax.',100.00),(208,24,'Plaza de Armas','https://i.ibb.co/cyh82Gb/UC1.jpg','Centro histórico y cultural de Pucallpa, con un ambiente vibrante y encanto local.',100.00),(209,24,'El Velo de la Novia','https://i.ibb.co/KNrKdGW/UC2.jpg','Cascada de belleza natural, rodeada de exuberante vegetación y paisajes asombrosos.',100.00),(210,24,'Laguna Cashibococha','https://i.ibb.co/jGRSrt9/UC3.jpg','Un paraíso acuático en Ucayali, ideal para la pesca y la observación de aves.',100.00),(211,24,'Río Urubamba','https://i.ibb.co/xSGKntD/UC4.jpg','Importante vía fluvial que serpentea a través de la región, ofreciendo oportunidades para la aventura.',100.00),(212,24,'Catedral de Pucallpa','https://i.ibb.co/tqjxD7g/UC5.jpg','Impresionante estructura religiosa que refleja la fe y la historia de la ciudad.',100.00),(213,24,'Boquerón del Padre Abad','https://i.ibb.co/grCWWdF/UC6.jpg','Cañón escénico que revela la majestuosidad de la naturaleza en Ucayali.',100.00),(214,24,'Jardín Botánico Bio-Kuka','https://i.ibb.co/XCCQZTh/UC7.jpg','Espacio de conservación de la flora amazónica, perfecto para la educación ambiental.',100.00),(215,24,'Parque Natural de Pucallpa','https://i.ibb.co/zGVRBRs/UC8.jpg','Área protegida con bosques y fauna, un refugio para la biodiversidad en Ucayali.',100.00),(216,24,'Shanay Timpishka','https://i.ibb.co/wKFLJVL/UC9.jpg','Conocido como el \"Río Hervidor,\" este río ofrece aguas termales naturales y experiencias únicas.',100.00);
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificar_ciudad_destino` BEFORE INSERT ON `destino` FOR EACH ROW BEGIN
    DECLARE ciudad_existe INT;
    
    -- Verificar si la ciudad referenciada en el nuevo destino existe en la tabla `ciudad`
    SELECT COUNT(*) INTO ciudad_existe FROM ciudad WHERE id = NEW.id_ciudad;
    
    -- Si la ciudad no existe, cancelar la inserción del destino
    IF ciudad_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ciudad asociada al destino no existe';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recomendacion`
--

DROP TABLE IF EXISTS `recomendacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendacion` (
  `id` int NOT NULL,
  `id_destino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendacion`
--

LOCK TABLES `recomendacion` WRITE;
/*!40000 ALTER TABLE `recomendacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `recomendacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificar_destino_recomendacion` BEFORE INSERT ON `recomendacion` FOR EACH ROW BEGIN
    DECLARE destino_existe INT;
    
    -- Verificar si el destino asociado en la nueva recomendación existe en la tabla `destino`
    SELECT COUNT(*) INTO destino_existe FROM destino WHERE id = NEW.id_destino;
    
    -- Si el destino no existe, cancelar la inserción de la recomendación
    IF destino_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El destino asociado a la recomendación no existe';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL,
  `nombre_ciudad` varchar(100) DEFAULT NULL,
  `nombre_destino` varchar(100) DEFAULT NULL,
  `tipo_servicio` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nombre_guia` varchar(100) DEFAULT NULL,
  `monto` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_reserva` BEFORE INSERT ON `reserva` FOR EACH ROW BEGIN
    SET NEW.nombre_ciudad = UPPER(NEW.nombre_ciudad); -- Convertir el nombre de la ciudad a mayúsculas antes de la inserción
    SET NEW.fecha = CURDATE(); -- Establecer la fecha actual al momento de la inserción
    SET NEW.nombre_guia = COALESCE(NEW.nombre_guia, 'Guía no asignado'); -- Asignar un valor por defecto si el nombre del guía está vacío
    -- Puedes agregar aquí las columnas para UsuCrea y FecCrea si lo deseas
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_reserva` BEFORE UPDATE ON `reserva` FOR EACH ROW BEGIN
    SET NEW.fecha = CURDATE(); -- Actualizar la fecha al momento de la actualización
    -- Puedes agregar aquí la actualización de UsuModif y FecModif si lo deseas
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11  0:49:41
