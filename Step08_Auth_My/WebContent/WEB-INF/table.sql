create table member
(
	num number primary key,
	name varchar2(10),
	addr varchar2(20)
);

create table users
(
id varchar2(100) primary key,
pwd varchar2(100) not null,
email varchar2(100),
regdate date
);