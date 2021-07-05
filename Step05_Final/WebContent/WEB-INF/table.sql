-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL,
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

CREATE SEQUENCE board_file_seq; 

-- 사용자(회원) 정보를 저장할 테이블
create table users(
id varchar2(100) primary key,
pwd varchar2(100) not null,
email varchar2(100),
profile varchar2(100), -- 프로필 이미지 경로 저장 칼럼
regdate date);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL,
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

CREATE SEQUENCE board_file_seq; 

CREATE TABLE board_cafe_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,        -- 게시글 번호
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE board_cafe_comment_seq;

CREATE TABLE board_gallery(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100),
   caption VARCHAR2(100),  -- 이미지에 대한 설명
   imagePath VARCHAR2(100),
   regdate DATE
);

CREATE SEQUENCE board_gallery_seq;