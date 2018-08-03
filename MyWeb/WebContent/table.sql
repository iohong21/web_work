/*
 * USER Table
 */ 
CREATE TABLE T_USERS(
	id VARCHAR2(50) PRIMARY KEY,
	pwd VARCHAR2(30) NOT NULL,
	name VARCHAR2(30),
	phone VARCHAR2(30),
	email VARCHAR2(30),
	gender CHAR(1) DEFAULT 'M' CONSTRAINT TUsers_gender_ck CHECK (gender IN('M', 'F')),
	nickname VARCHAR2(50),
	roll VARCHAR(10) DEFAULT 'USER' CONSTRAINT TUsers_roll_ck CHECK (roll in ('USER', 'MANAGER', 'ADMIN')),
	logindate DATE DEFAULT SYSDATE,
	regdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE TFriend_seq;
CREATE TABLE T_FRIEND(
	num NUMBER PRIMARY KEY,
	name VARCHAR2(30),
	phone VARCHAR2(30),
	kind CHAR(1) DEFAULT 'X' CONSTRAINT kind_ck CHECK (kind IN('E', 'M', 'H', 'C', 'O', 'X')),
	/* E:초등학교, M:중학교, H:고등학교, C:대학교, O:회사, X:기타 */
	id VARCHAR2(50),
	CONSTRAINT TFriend_id_fk FOREIGN KEY(id) REFERENCES T_USERS(id) ON DELETE CASCADE
);

CREATE SEQUENCE TCafe_seq;
CREATE TABLE T_CAFE(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(50),
	CONSTRAINT TCafe_writer_fk FOREIGN KEY(writer) REFERENCES T_USERS(id) ON DELETE CASCADE,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	regdate DATE DEFAULT SYSDATE
);

CREATE TABLE T_CAFE_COMMENT(
	num NUMBER PRIMARY KEY,					-- TCafe_seq.NEXTVAL 을 같이 사용
	writer VARCHAR2(50),
	CONSTRAINT TCafeComment_writer_fk FOREIGN KEY(writer) REFERENCES T_USERS(id) ON DELETE CASCADE,
	content VARCHAR2(500),
	viewcount NUMBER DEFAULT 0,
	likecount NUMBER DEFAULT 0,
	hatecount NUMBER DEFAULT 0,
	deleted CHAR(1) DEFAULT 'N',
	CONSTRAINT TCafeComment_deleted_ck CHECK (deleted IN('Y', 'N'))
);

CREATE TABLE T_CONFIG(
  code CHAR(1) PRIMARY KEY,
  pagerowcount NUMBER DEFAULT 5,
  pagedisplaycount NUMBER DEFAULT 5
);
insert into T_CONFIG(code, pagerowcount, pagedisplaycount) values ('1',5,5);






