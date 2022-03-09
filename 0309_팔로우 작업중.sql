--DROP TABLE FOLLOWING;
--DROP TABLE FOLLOWER;


-- 01. FOLLOWING 테이블 생성 + 주석
CREATE TABLE FOLLOWING (
    FOLLOWING_NO NUMBER CONSTRAINT FLG_FOLLOWING_NO_PK PRIMARY KEY,
    FROM_MEM_NO NUMBER CONSTRAINT FLG_FROM_MEM_NO_NN NOT NULL,
    TO_MEM_NO NUMBER CONSTRAINT FLG_TO_MEM_NO_NN NOT NULL,
    FOLLOWING_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FLG_CREATE_DATE_NN NOT NULL,
    
    CONSTRAINT FLG_FROM_MEM_NO_FK FOREIGN KEY(FROM_MEM_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT FLG_TO_MEM_NO_FK FOREIGN KEY(TO_MEM_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN FOLLOWING.FOLLOWING_NO IS '팔로잉(능동)번호';
COMMENT ON COLUMN FOLLOWING.FROM_MEM_NO IS '팔로잉(능동)하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWING.TO_MEM_NO IS '팔로우(수동)당하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWING.FOLLOWING_CREATE_DATE IS '팔로잉/팔로우 된 시간';

COMMIT;


-- 02. FOLLOWER 테이블 생성 + 주석
CREATE TABLE FOLLOWER (
    FOLLOWER_NO NUMBER CONSTRAINT FLR_FOLLOWER_NO_PK PRIMARY KEY,
    TO_MEM_NO NUMBER CONSTRAINT FLR_TO_MEM_NO_NN NOT NULL,
    FROM_MEM_NO NUMBER CONSTRAINT FLR_FROM_MEM_NO_NN NOT NULL,
    FOLLOWER_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FLR_CREATE_DATE_NN NOT NULL,
    
    CONSTRAINT FLR_FROM_MEM_NO_FK FOREIGN KEY(FROM_MEM_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT FLR_TO_MEM_NO_FK FOREIGN KEY(TO_MEM_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN FOLLOWER.FOLLOWER_NO IS '팔로우(수동)번호';
COMMENT ON COLUMN FOLLOWER.TO_MEM_NO IS '팔로우(수동)당하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWER.FROM_MEM_NO IS '팔로잉(능동)하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWER.FOLLOWER_CREATE_DATE IS '팔로잉/팔로우 된 시간';

COMMIT;


-- 02. 시퀀스 생성
CREATE SEQUENCE FOLLOWING_NO_SEQ;
CREATE SEQUENCE FOLLOWER_NO_SEQ;

COMMIT;
 
--------------------- 쿼리문---------------------
-- 01. 1번 회원이 3번 회원을 팔로우
--    ▷ 1번 회원의 팔로잉 목록에는 3번 회원을 추가하고
--    ▷ 3번 회원의 팔로워 목록에는 1번 회원을 추가함
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 1, 3, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 3, 1, DEFAULT);

COMMIT;

-- 02. 2번 회원이 3번 회원을 팔로우
--    ▷ 2번 회원의 팔로잉 목록에는 3번 회원을 추가하고
--    ▷ 3번 회원의 팔로워 목록에는 2번 회원을 추가함
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 2, 3, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 3, 2, DEFAULT);

COMMIT;

-- 여기까지 상황 : 3번 회원은 팔로워가 2명 (= 1, 2) 이고
--              1, 2번 회원은 각각 3번 회원을 팔로잉

-- 03. 1번 회원이 3번 회원 팔로우를 취소
--    ▷ 1번 회원의 팔로잉 목록에는 3번 회원을 삭제하고
--    ▷ 3번 회원의 팔로워 목록에는 1번 회원을 삭제함
DELETE FROM FOLLOWING
    WHERE FROM_MEM_NO = '1'
          AND TO_MEM_NO = '3';
          
DELETE FROM FOLLOWER
    WHERE FROM_MEM_NO = '1'
          AND TO_MEM_NO = '3';

COMMIT;

-- 여기까지 상황 : 3번 회원은 팔로워가 1명 (= 2) 이고
--              2번 회원은 3번 회원을 팔로잉

-- 04. 3번 회원의 팔로워 NO & NICKNAME 리스트 조회
SELECT F.FROM_MEM_NO, M.NICKNAME
FROM FOLLOWER F
JOIN MEMBER M ON(M.MEMBER_NO = F.FROM_MEM_NO)
WHERE TO_MEM_NO = 3;

-- 05. 3번 회원의 팔로워 수 조회
SELECT COUNT(*)
FROM FOLLOWER
WHERE TO_MEM_NO = 3;

-- 04. 2번 회원의 팔로잉 리스트 조회
SELECT TO_MEM_NO
FROM FOLLOWING
WHERE FROM_MEM_NO = 2;

-- 05. 2번 회원의 팔로잉 수 조회
SELECT COUNT(*)
FROM FOLLOWING
WHERE FROM_MEM_NO = 2;


------------------- 테스트 내용------------------- 

-- 01. 1번 회원이 21번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 1, 21, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 21, 1, DEFAULT);

-- 02. 2번 회원이 21번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 2, 21, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 21, 2, DEFAULT);

-- 04. 3번 회원이 21번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 3, 21, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 21, 3, DEFAULT);

-- 04. 21번 회원이 41번 두두링 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 21, 41, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 41, 21, DEFAULT);

-- 05. 21번 회원이 1번 관리자 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE)
VALUES(FOLLOWING_NO_SEQ.NEXTVAL, 21, 1, DEFAULT);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE)
VALUES(FOLLOWER_NO_SEQ.NEXTVAL, 1, 21, DEFAULT);


commit;
-- 현재 상황
-- 21 왱왱 팔로워 : 3명 (1, 2, 3)
-- 21 왱왱 팔로우 : 2명 (1 관리자, 41 두두링)


------------ ▼ 블로그 발췌 내용 (https://m.blog.naver.com/codingspecialist/221464676242) ------------ 
CREATE TABLE users(
    no NUMBER(2) PRIMARY KEY, --ID는 시퀀스로 생성
    id VARCHAR2(20) UNIQUE NOT NULL,
    name VARCHAR2(20) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    website VARCHAR2(50),
    bio VARCHAR2(500),
    phone VARCHAR2(20),
    gender CHAR(3), --남, 여
    created_at DATE NOT NULL,
    updated_at DATE
);

-- 팔로잉(구독) - 능동
CREATE TABLE following(
    no NUMBER(2) PRIMARY KEY, --ID는 시퀀스로 생성
    from_user NUMBER(2), --ssar
    to_user NUMBER(2) --cos
);

--팔로워(구독당하기) - 수동
CREATE TABLE follower(
    no NUMBER(2) PRIMARY KEY, --ID는 시퀀스로 생성
    to_user NUMBER(2), --cos
    from_user NUMBER(2) --ssar
);

-- 시퀀스 만들기
CREATE SEQUENCE USERS_SEQ;

CREATE SEQUENCE FOLLOWING_SEQ;

CREATE SEQUENCE FOLLOWER_SEQ;
------
INSERT INTO users(no, id, name, password, website, bio, phone, gender,
created_at, updated_at)
VALUES(USERS_SEQ.NEXTVAL, 'ssar', '장동건', '1234', null, 
'안녕 난 동건이야', '01088883233','남', sysdate, null);

INSERT INTO users(no, id, name, password, website, bio, phone, gender,
created_at, updated_at)
VALUES(USERS_SEQ.NEXTVAL, 'cos', '고소영', '1234', null, 
'안녕 난 소영이야', '01022369745','여', sysdate, null);

INSERT INTO users(no, id, name, password, website, bio, phone, gender,
created_at, updated_at)
VALUES(USERS_SEQ.NEXTVAL, 'getinthere', '홍길동', '1234', null, 
'안녕 난 길동이야', '01054686666','남', sysdate, null);

INSERT INTO users(no, id, name, password, website, bio, phone, gender,
created_at, updated_at)
VALUES(USERS_SEQ.NEXTVAL, 'love', '한사랑', '1234', null, 
'안녕 난 사랑이야', '01077778456','남', sysdate, null);

COMMIT;
--------------
--팔로잉 서비스 (2가지 트랜잭션)
INSERT INTO FOLLOWING(no, from_user, to_user)
VALUES(FOLLOWING_SEQ.NEXTVAL, 1, 4);

INSERT INTO FOLLOWER(no, to_user, from_user)
VALUES(FOLLOWER_SEQ.NEXTVAL, 4, 1);

COMMIT;

INSERT INTO FOLLOWING(no, from_user, to_user)
VALUES(FOLLOWING_SEQ.NEXTVAL, 2, 4);

INSERT INTO FOLLOWER(no, to_user, from_user)
VALUES(FOLLOWER_SEQ.NEXTVAL, 4, 2);

COMMIT;

INSERT INTO FOLLOWING(no, from_user, to_user)
VALUES(FOLLOWING_SEQ.NEXTVAL, 3, 4);

INSERT INTO FOLLOWER(no, to_user, from_user)
VALUES(FOLLOWING_SEQ.NEXTVAL, 4, 3);

COMMIT;

-- 4.사랑의 팔로워는 총 3명 (=1, 2, 3)
SELECT *
FROM FOLLOWER
WHERE TO_USER = 4;

-- MEMBER_NO 가 4 인 팔로워 수 확인 쿼리
SELECT COUNT(*)
FROM FOLLOWER
WHERE TO_USER = 4;

-- MEMBER_NO 가 1 인 유저의 팔로잉은 총 1명 (= 4)
SELECT * 
FROM FOLLOWING
WHERE FROM_USER = 1;


-- MEMBER_NO 가 1 인 팔로워 수 확인 쿼리
SELECT COUNT(*)
FROM FOLLOWING
WHERE FROM_USER = 1;