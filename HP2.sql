-- HP2 ���� ����
    -- C## ���λ� ���̵� ���� ����
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    -- ���� ����
    CREATE USER HP2 IDENTIFIED BY 123456;
    -- ���̺� �����̽� ����
    ALTER USER HP2 DEFAULT TABLESPACE users;
    -- �뷮 ����
    ALTER USER HP2 QUOTA UNLIMITED ON users;
    -- ���� �ο�
    GRANT DBA TO HP2;


-- ���� ������    
INSERT INTO Admin (admin_id, admin_pw, admin_name, admin_age, emp_date)
VALUES ('admin', '123456', '�̺���', 27, '2024-01-31');

commit;

-- ���̺� ����

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
	c_upd_date	DATE		DEFAULT sysdate NOT NULL,
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

-- �ڵ��α��� ���̺�
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


commit;

-- ������ ����
--�۹�ȣ
CREATE SEQUENCE SEQ_BOARD_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
--������?
CREATE SEQUENCE SEQ_RES_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
--��۹��?
CREATE SEQUENCE SEQ_CMNT_NO INCREMENT BY 1 START WITH 1 MINVALUE 1;
-- ������
CREATE SEQUENCE SEQ_PER_LOGIN INCREMENT BY 1 MAXVALUE 1000000 MINVALUE 1;




-- ���� ������
--���� ����
INSERT INTO USERS (USER_ID, USER_PW, USER_NAME, USER_AGE,USER_PNO, USER_ADDRESS)
VALUES('joeun', '123', '������', '990909','010-0000-0000', '�Ѱ�����');

--�Խñ� ����
INSERT INTO BOARD(NO, TITLE, user_id, CONTENT)
VALUES(SEQ_BOARD_NO.NEXTVAL, '�����? ����', 'joeun', '�� ������...');

-- ���� ����
INSERT INTO RESERVATION( R_NO, USER_ID, R_CATEGORY, R_DATE, R_TIME)
VALUES(SEQ_RES_NO.NEXTVAL, 'joeun', '�Ǻΰ�', '2024/12/25', '9:00');

--���� ����
INSERT INTO Admin (admin_id, admin_pw, admin_name, admin_age, emp_date)
VALUES ('admin', '123456', '�̺���', 27, '2024-01-31');

-- ���? ����
insert into comments (c_no, user_id, c_content, b_no)
VALUES(SEQ_CMNT_NO.NEXTVAL, 'joeun', '�� �ϴ��ε�, �����ش�.', 22);


-- ���̺� ����
drop table USERS cascade constraints PURGE;
DROP TABLE Board cascade constraints PURGE;
DROP TABLE comments cascade constraints PURGE;
DROP TABLE Reservation cascade constraints PURGE;
DROP TABLE Admin cascade constraints PURGE;
drop table persistent_logins;

commit;

