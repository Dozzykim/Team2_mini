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
	admin_id	VARCHAR2(40)		NOT NULL,
	category	VARCHAR2(40)		NULL,
	title	VARCHAR2(40)		NOT NULL,
	writer	VARCHAR2(40)		NOT NULL,
	content	VARCHAR2(2000)		NOT NULL,
	reg_date	DATE		NULL,
	upd_date	DATE		NULL
);

CREATE TABLE comments (
	c_no	NUMBER		NOT NULL,
	user_id	VARCHAR2(40)		NOT NULL,
	admin_id	VARCHAR2(40)		NOT NULL,
	c_Content	VARCHAR2(2000)		NOT NULL,
	c_reg_date	DATE		NULL,
	c_upd_date	DATE		NULL
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
	emp_date	DATE		NULL
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

ALTER TABLE Board ADD CONSTRAINT FK_Admin_TO_Board_1 FOREIGN KEY (
	admin_id
)
REFERENCES Admin (
	admin_id
);

ALTER TABLE comments ADD CONSTRAINT FK_Users_TO_comments_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE comments ADD CONSTRAINT FK_Admin_TO_comments_1 FOREIGN KEY (
	admin_id
)
REFERENCES Admin (
	admin_id
);

ALTER TABLE Reservation ADD CONSTRAINT FK_Users_TO_Reservation_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

commit;

-- 테이블 삭제
drop table USERS cascade constraints PURGE;
DROP TABLE Board cascade constraints PURGE;
DROP TABLE comments cascade constraints PURGE;
DROP TABLE Reservation cascade constraints PURGE;
DROP TABLE Admin cascade constraints PURGE;

commit;
