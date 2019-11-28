drop table members;
create table members( 
 id varchar(20) primary key, 
 pass varchar(20) not null,
 name varchar(20) not null,
 address varchar(30),
 callnum varchar(30),
 allegy varchar(30),
 authority varchar(10)
);

commit;
select * from members;