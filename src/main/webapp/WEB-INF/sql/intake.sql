drop table intakedb;
CREATE TABLE `intakedb` (
  ino int(11) NOT NULL auto_increment,
  `idate` date NOT NULL,
  `id` varchar(45) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`ino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO intakedb VALUES (null,curdate(),'ssafy',1);
INSERT INTO intakedb VALUES (null,curdate(),'ssafy',2);
INSERT INTO intakedb VALUES (null,curdate(),'ssafy',3);
INSERT INTO intakedb VALUES (null,curdate(),'ssafy',4);