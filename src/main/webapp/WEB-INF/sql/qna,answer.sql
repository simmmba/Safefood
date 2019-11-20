CREATE TABLE `question` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `PASS` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `WDATE` date NOT NULL,
  `TITLE` varchar(40) NOT NULL,
  `CONTENT` varchar(100) NOT NULL,
  `COUNT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NUM`)
);

CREATE TABLE `answer` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `QNUM` int(11) NOT NULL,
  `PASS` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `WDATE` date NOT NULL,
  `CONTENT` varchar(100) NOT NULL,
  PRIMARY KEY (`NUM`),
  FOREIGN KEY (`QNUM`) REFERENCES `question` (num)
);

select * from question;
select * from answer;

drop table question;
drop table answer;

INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (1,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (2,'guest','Mel Gibson','2019-09-25','게시판 연습2','게시판연습입니다.',3);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (3,'guest','Mel Gibson','2019-09-25','게시판 연습3','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (5,'guest','Mel Gibson','2019-09-25','게시판 연습5','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (6,'guest','Mel Gibson','2019-09-25','게시판 연습6','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (7,'guest','Mel Gibson','2019-09-25','게시판 연습7','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (9,'guest','Mel Gibson','2019-09-25','게시판 연습9','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (10,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (11,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (12,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (13,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (14,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (17,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (18,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (19,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (20,'guest','Mel Gibson','2019-09-25','게시판 연습20','게시판연습입니다.',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (21,'guest','Mel Gibson','2019-09-25','lala','lala2',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (22,'pw','engg','2019-09-25','게시판 연습22','게시판연습입니다.',11);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (28,'ssafy','ssafy','2019-10-16','룰룰','랄랄랄라',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (29,'ssafy','ssafy','2019-10-16','안녕하세요','안녕',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (36,'abc','abc','2019-10-23','안녕','게시판',0);
INSERT INTO `question` (`NUM`,`PASS`,`NAME`,`WDATE`,`TITLE`,`CONTENT`,`COUNT`) VALUES (37,'abc','abc','2019-10-23','제목음슴','오잉',0);
