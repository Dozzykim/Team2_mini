-- HP2 계정 생성
    -- C## 접두사 없이도 계정 생성
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    -- 계정 생성
    CREATE USER HP2 IDENTIFIED BY 123456;
    -- 테이블 스테이스 지정
    ALTER USER HP2 DEFAULT TABLESPACE users;
    -- 용량 설정
    ALTER USER HP2 QUOTA UNLIMITED ON users;
    -- 권한 부여
    GRANT DBA TO HP2;


-- 샘플 데이터    
INSERT INTO Admin (admin_id, admin_pw, admin_name, admin_age, emp_date)
VALUES ('admin', '123456', '이병원', 27, '2024-01-31');

commit;

-- 테이블 세팅

CREATE TABLE Users (
	user_id	VARCHAR2(40)		NOT NULL,
	user_pw	VARCHAR2(40)		NOT NULL,
	user_name	VARCHAR2(40)		NOT NULL,
	user_age	VARCHAR2(40)		NOT NULL,
	user_pno	VARCHAR2(40)		NOT NULL,
	user_address	VARCHAR2(100)		NOT NULL
);



CREATE TABLE Board (
	no	NUMBER		NOT NULL,
	user_id	VARCHAR2(40)		NOT NULL,
	category	VARCHAR2(40)		NULL,
	title	VARCHAR2(40)		NOT NULL,
	content	VARCHAR2(2000)		NOT NULL,
	reg_date	DATE		DEFAULT sysdate NOT NULL,
	upd_date	DATE		DEFAULT sysdate NOT NULL
);

CREATE TABLE comments (
	c_no	NUMBER		NOT NULL,
	user_id	VARCHAR2(40)		NOT NULL,
	c_Content	VARCHAR2(2000)		NOT NULL,
	c_reg_date	DATE		DEFAULT sysdate NOT NULL,
	c_upd_date	DATE		DEFAULT sysdate NOT NULL
    b_no   NUMBER      NOT NULL
);

CREATE TABLE Reservation (
	r_no	NUMBER		NOT NULL,
	user_id	VARCHAR2(40)		NOT NULL,
	r_category	VARCHAR2(40)		NULL,
	r_date	DATE		NOT NULL,
	r_time	VARCHAR2(40)		NOT NULL
);

CREATE TABLE Admin (
	admin_id	VARCHAR2(40)		NOT NULL,
	admin_pw	VARCHAR2(40)		NOT NULL,
	admin_name	VARCHAR2(40)		NOT NULL,
	admin_age	VARCHAR2(40)		NOT NULL,
	emp_date	DATE		NOT NULL
);

-- 자동로그인 테이블
CREATE TABLE persistent_logins (
  p_no NUMBER NOT NULL PRIMARY KEY,
  p_user_id varchar2(255) NOT NULL ,
  p_token varchar2(255) NOT NULL ,
  p_reg_date DATE DEFAULT SYSDATE NOT NULL,
  p_upd_date DATE DEFAULT SYSDATE NOT NULL
);


ALTER TABLE Users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_id
);

ALTER TABLE Board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	no
);

ALTER TABLE comments ADD CONSTRAINT PK_comments PRIMARY KEY (
	c_no
);

ALTER TABLE Reservation ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (
	r_no
);

ALTER TABLE Admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	admin_id
);

ALTER TABLE Board ADD CONSTRAINT FK_Users_TO_Board_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE comments ADD CONSTRAINT FK_Users_TO_comments_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE Reservation ADD CONSTRAINT FK_Users_TO_Reservation_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE Comments ADD CONSTRAINT FK_Board_TO_Comment_1 FOREIGN KEY (
   b_no
)
REFERENCES Board (
   no
);



--샘플 데이터 생성
--유저
INSERT INTO USERS (USER_ID, USER_PW, 


commit;

-- 시퀀스 생성
--글번호
CREATE SEQUENCE SEQ_BOARD_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
--예약번호
CREATE SEQUENCE SEQ_RES_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
--댓글번호
CREATE SEQUENCE SEQ_CMNT_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
-- 시퀀스
CREATE SEQUENCE SEQ_PER_LOGIN INCREMENT BY 1 MAXVALUE 1000000 MINVALUE 1;




-- 샘플 데이터
--유저 샘플
INSERT INTO USERS (USER_ID, USER_PW, USER_NAME, USER_AGE,USER_PNO, USER_ADDRESS)
VALUES('joeun', '123', '김조은', '990909','010-0000-0000', '한강자이');

--게시글 샘플
INSERT INTO BOARD(NO, TITLE, user_id, CONTENT)
VALUES(SEQ_BOARD_NO.NEXTVAL, '행운의 편지', 'joeun', '이 편지는...');

-- 예약 샘플
INSERT INTO RESERVATION( R_NO, USER_ID, R_CATEGORY, R_DATE, R_TIME)
VALUES(SEQ_RES_NO.NEXTVAL, 'joeun', '피부과', '2024/12/25', '9:00');

--어드민 샘플
INSERT INTO Admin (admin_id, admin_pw, admin_name, admin_age, emp_date)
VALUES ('admin', '123456', '이병원', 27, '2024-01-31');




-- 테이블 삭제
drop table USERS cascade constraints PURGE;
DROP TABLE Board cascade constraints PURGE;
DROP TABLE comments cascade constraints PURGE;
DROP TABLE Reservation cascade constraints PURGE;
DROP TABLE Admin cascade constraints PURGE;
drop table persistent_logins;

commit;

