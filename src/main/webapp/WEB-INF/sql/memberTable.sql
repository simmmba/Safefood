drop table members;
create table members( 
 id varchar(20) primary key, 
 pass varchar(20) not null,
 name varchar(20) not null,
 address varchar(30),
 callnum varchar(30),
 allegy varchar(30)
);
insert into members values('admin', 'admin', '황정호', 'seoul',
     '01083289424','땅콩');
insert into members values('ssafy', 'ssafy', '신채민', 'seoul',
     '01083289424','우유');
commit;
select * from members;