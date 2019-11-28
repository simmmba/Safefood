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

CREATE TABLE `expectintakedb` (
  ino int(11) NOT NULL auto_increment,
  `id` varchar(45) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`ino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO expectintakedb VALUES (null,'ssafy',1);
INSERT INTO expectintakedb VALUES (null,'ssafy',2);
INSERT INTO expectintakedb VALUES (null,'ssafy',3);
INSERT INTO expectintakedb VALUES (null,'ssafy',4);	

select * from expectintakedb;
select * from intakedb;
select ino from intakedb where code = 1 order by idate desc limit 1;


select idate, it.code, name, supportpereat, round(sum(calory),2) calory, carbo, protein, fat, sugar, natrium, chole, fattyacid, transfat,maker, img, allergy, count(*) count 
from intakedb it join fooddb fd on (it.code = fd.code)
group by code
order by count desc;

		select  round(sum(calory),2) calory, carbo, protein, fat, sugar, natrium, chole, fattyacid, transfat,maker, img, allergy, count(*) count 
		from intakedb it join fooddb fd on (it.code = fd.code)
		group by maker
		order by count desc ;
        
		select idate,id, it.code, name, supportpereat, round(sum(calory),2) calory, carbo, protein, fat, sugar, natrium, chole, fattyacid, transfat,maker, img, allergy, count(*) count 
		from intakedb it join fooddb fd on (it.code = fd.code)
		group by it.code
		order by calory desc;
        
select * , 1 as count from fooddb;