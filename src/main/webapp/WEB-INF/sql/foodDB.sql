CREATE TABLE `fooddb` (
  `code` int(11) NOT NULL,
  `name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `supportpereat` double DEFAULT NULL,
  `calory` double DEFAULT NULL,
  `carbo` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `sugar` double DEFAULT NULL,
  `natrium` double DEFAULT NULL,
  `chole` double DEFAULT NULL,
  `fattyacid` double DEFAULT NULL,
  `transfat` double DEFAULT NULL,
  `maker` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `material` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `allergy` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin