drop table reply;

CREATE TABLE `reply` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `boardNum` int(11) ,
  `NAME` varchar(20) NOT NULL,
  `WDATE` datetime NOT NULL,
  `CONTENT` varchar(100) NOT NULL,
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
