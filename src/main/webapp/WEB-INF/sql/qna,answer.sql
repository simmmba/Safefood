CREATE TABLE `question` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `PASS` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `WDATE` date NOT NULL,
  `TITLE` varchar(40) NOT NULL,
  `CONTENT` varchar(100) NOT NULL,
  `COUNT` int(11) NOT NULL DEFAULT '0',
  `replycount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NUM`)
);

INSERT INTO `question` VALUES (1,'guest','Mel Gibson','2019-09-25','lala','lala2',0,0);
INSERT INTO `question` VALUES (2,'pw','engg','2019-09-25','게시판 연습22','게시판연습입니다.',11,0);
INSERT INTO `question` VALUES (3,'ssafy','ssafy','2019-10-16','룰룰','랄랄랄라',0,0);
INSERT INTO `question` VALUES (4,'ssafy','ssafy','2019-10-16','안녕하세요','안녕',0,0);
INSERT INTO `question`  VALUES (5,'abc','abc','2019-10-23','안녕','게시판',0,0);
INSERT INTO `question`  VALUES (6,'abc','abc','2019-10-23','제목음슴','오잉',0,0);

select * from members;
alter table members change allegy allergy varchar(1000);