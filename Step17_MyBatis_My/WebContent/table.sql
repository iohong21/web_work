CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER DEFAULT 0,
regdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE board_cafe_seq;

-- 댓글 정보를 저장할 테이블
CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY,				-- 댓글의 글번호 (SEQUENCE 는 board_cafe_seq 를 같이 사용)
	writer VARCHAR2(100),					-- 댓글 작성자
	content VARCHAR2(500),				-- 댓글 내용
	target_id VARCHAR2(100),			-- 댓글의 대상이 되는 아이디(글작성자)
	ref_group NUMBER,							-- 댓글 그룹번호 ( 원글의 번호)
	                              --  FOREIGN KEY board_cafe_comment(reg_group) REFERENCES board_cafe(num)
	comment_group NUMBER,				  -- 원글에 달린 댓글 내에서의 그룹 번호
	regdate DATE DEFAULT SYSDATE	-- 댓글 등록일
);

