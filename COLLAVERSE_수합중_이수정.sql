--------------------------------------------------------------
------------------------ MEMBER 테이블 ------------------------
--------------------------------------------------------------
--01. MEMBER 테이블 생성 + 컬럼 주석 
CREATE TABLE MEMBER (
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ROLE VARCHAR2(200) DEFAULT '개인' CONSTRAINT MEM_MEMBER_ROLE_CH CHECK(MEMBER_ROLE IN('개인', '기업', '관리자')),
    ID VARCHAR2(200) NOT NULL,
    PASSWORD VARCHAR2(200) NOT NULL,
    EMAIL VARCHAR2(200) NOT NULL,
    PHONE VARCHAR2(200) NOT NULL,
    NICKNAME VARCHAR2(200) NOT NULL,
    PROFILE_IMG VARCHAR2(200) NULL,
    BUSINESS_NO VARCHAR2(200) NULL,
    BUSINESS_NAME VARCHAR2(200) NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    MEMBER_STATUS VARCHAR2(200) DEFAULT 'Y' CONSTRAINT MEM_MEMBER_STATUS_CH CHECK(MEMBER_STATUS IN('Y', 'N')),
    MEMBER_AGE NUMBER(10) NOT NULL,
    MEMBER_GENDER VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEMBER_ROLE IS '회원타입';
COMMENT ON COLUMN MEMBER.ID IS '아이디';
COMMENT ON COLUMN MEMBER.PASSWORD IS '비밀번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '휴대폰번호';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.PROFILE_IMG IS '프로필사진';
COMMENT ON COLUMN MEMBER.BUSINESS_NO IS '사업자번호';
COMMENT ON COLUMN MEMBER.BUSINESS_NAME IS '회사명';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '수정일';
COMMENT ON COLUMN MEMBER.MEMBER_STATUS IS '회원상태값';
COMMENT ON COLUMN MEMBER.MEMBER_AGE IS '나이';
COMMENT ON COLUMN MEMBER.MEMBER_GENDER IS '성별';

--02. 테이블 삭제
--DROP TABLE MEMBER;


--03. 시퀀스 생성 쿼리
CREATE SEQUENCE SEQ_MEM_MEMBER_NO;


--04. 시퀀스 삭제 쿼리
--DROP SEQUENCE SEQ_MEM_MEMBER_NO;

COMMIT;


--------------------------------------------------------------
---------------------- MEMBER 관련 쿼리문 ----------------------
--------------------------------------------------------------
--01. 관리자 데이터 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, 
    ID, PASSWORD, EMAIL,  PHONE, 
    NICKNAME,  PROFILE_IMG,  BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '관리자', 
    'admin', '1111','admin@collaverse.co.kr', '01041132023',
    '콜라버스관리자', 'ADMIN.png', NULL, '(주)COLLAVERSE',
    DEFAULT, DEFAULT,
    DEFAULT, '20', 'woman'
);


--02. 개인 회원 3명 데이터 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '개인', 
    'member01', '1111', 'member01@collaverse.co.kr', '01011111111',
    '개인회원01', 'MEMBER01.jpg', NULL, NULL,
    DEFAULT, DEFAULT,
    DEFAULT, '10', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '개인', 
    'member02', '1111', 'member02@collaverse.co.kr', '01022222222',
    '개인회원02', 'MEMBER02.jpg', NULL, NULL,
    DEFAULT, DEFAULT,
    DEFAULT, '20', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '개인', 
    'member03', '1111', 'member03@collaverse.co.kr', '01033333333',
    '개인회원03', 'MEMBER03.jpg', NULL, NULL,
    DEFAULT, DEFAULT,
    DEFAULT, '30', 'man'
);

--03. 기업 회원 데이터 30명 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'BIRTHDAYSUIT', '1111', 'BIRTHDAYSUIT@collaverse.co.kr', '11111111111',
    'BIRTHDAYSUIT', 'BIRTHDAYSUIT.png', '11111111', 'BIRTHDAYSUIT(벌스데이수트)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'CAPITALRADIOTUNES', '1111', 'CAPITALRADIOTUNES@collaverse.co.kr', '22222222222',
    'CAPITALRADIOTUNES', 'CAPITALRADIOTUNES.jpg', '22222222', 'CAPITAL RADIO TUNES(캐피탈라디오튠즈)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'CASETIFY', '1111', 'CASETIFY@collaverse.co.kr', '33333333333',
    'CASETIFY', 'CASETIFY.png', '33333333', 'CASETIFY(케이스티파이)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'CHEONHAJANGSA', '1111', 'CHEONHAJANGSA@collaverse.co.kr', '44444444444',
    'CHEONHAJANGSA', 'CHEONHAJANGSA.png', '44444444', 'CHEONHAJANGSA(천하장사)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'CRAYONSHINCHAN', '1111', 'CRAYONSHINCHAN@collaverse.co.kr', '55555555555',
    'CRAYONSHINCHAN', 'CRAYONSHINCHAN.png', '55555555', 'CRAYON SHIN CHAN(짱구)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'DAEGU1988', '1111', 'DAEGU1988@collaverse.co.kr', '66666666666',
    'DAEGU1988', 'DAEGU1988.png', '66666666', 'DAEGU 1988(대구 1988)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'DISNEY', '1111', 'DISNEY@collaverse.co.kr', '77777777777',
    'DISNEY', 'DISNEY.jpg', '77777777', 'DISNEY(디즈니)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'DOFFJASON', '1111', 'DOFFJASON@collaverse.co.kr', '88888888888',
    'DOFFJASON', 'DOFFJASON.png', '88888888', 'DOFFJASON(도프제이슨)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'ESTHERBUNNY', '1111', 'ESTHERBUNNY@collaverse.co.kr', '99999999999',
    'ESTHERBUNNY', 'ESTHERBUNNY.jpg', '99999999', 'ESTHER BUNNY(에스더버니)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'KAKAOFRIENDS', '1111', 'KAKAOFRIENDS@collaverse.co.kr', '10101010101',
    'KAKAOFRIENDS', 'KAKAOFRIENDS.png', '10101010', 'KAKAO FRIENDS(카카오프렌즈)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

-- 전화번호,사업자번호 10자리 NO.1이랑 겹치는것 방지 
INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'KARTRIDER', '1111', 'KARTRIDER@collaverse.co.kr', '1111111111',
    'KARTRIDER', 'KARTRIDER.jpg', '1111111111', 'KARTRIDER(카트라이더)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'KELLOGG', '1111', 'KELLOGG@collaverse.co.kr', '12121212121',
    'KELLOGG', 'KELLOGG.png', '12121212', 'KELLOGG(켈로그)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'LEXON', '1111', 'LEXON@collaverse.co.kr', '13131313131',
    'LEXON', 'LEXON.png', '13131313', 'LEXON(렉슨)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'LLOYD', '1111', 'LLOYD@collaverse.co.kr', '14141414141',
    'LLOYD', 'LLOYD.png', '13131313', 'LLOYD(로이드)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'LOCHCARRON', '1111', 'LOCHCARRON@collaverse.co.kr', '15151515151',
    'LOCHCARRON', 'LOCHCARRON.png', '15151515', 'LOCHCARRON(로캐론)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'LOTTECONF', '1111', 'LOTTECONF@collaverse.co.kr', '16161616161',
    'LOTTECONF', 'LOTTECONF.png', '16161616', 'LOTTE CONF(롯데제과)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'MAISONKITSUNE', '1111', 'MAISONKITSUNE@collaverse.co.kr', '17171717171',
    'MAISONKITSUNE', 'MAISONKITSUNE.png', '17171717', 'MAISON KITSUNE(메종키츠네)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'MAPLESTORY', '1111', 'MAPLESTORY@collaverse.co.kr', '18181818181',
    'MAPLESTORY','MAPLESTORY.png', '18181818', 'MAPLE STORY(메이플스토리)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'NONGSHIM', '1111', 'NONGSHIM@collaverse.co.kr', '19191919191',
    'NONGSHIM', 'NONGSHIM.png', '19191919', 'NONGSHIM(농심)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'NOROOPAINT', '1111', 'NOROOPAINT@collaverse.co.kr', '20202020202',
    'NOROOPAINT', 'NOROOPAINT.jpg', '20202020', 'NOROOPAINT(노루페인트)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'PEANUTS', '1111', 'PEANUTS@collaverse.co.kr', '21212121212',
    'PEANUTS', 'PEANUTS.jpg', '21212121', 'PEANUTS(피너츠)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'PIZZAHUTS', '1111', 'PIZZAHUTS@collaverse.co.kr', '22222222222',
    'PIZZAHUTS', 'PIZZAHUTS.png', '22222222', 'PIZZA HUTS(피자헛)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'SAMSUNG', '1111', 'SAMSUNG@collaverse.co.kr', '23232323232',
    'SAMSUNG', 'SAMSUNG.jpg', '23232323', 'SAMSUNG(삼성)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'SONY', '1111', 'SONY@collaverse.co.kr', '24242424242',
    'SONY', 'SONY.jpg', '24242424', 'SONY(소니)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'SPAO', '1111', 'SPAO@collaverse.co.kr', '25252525252',
    'SPAO', 'SPAO.jpg', '25252525', 'SPAO(스파오)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'SULBING', '1111', 'SULBING@collaverse.co.kr', '26262626262',
    'SULBING', 'SULBING.png', '26262626', 'SULBING(설빙)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'TERESAFREITAS', '1111', 'TERESAFREITAS@collaverse.co.kr', '27272727272',
    'TERESAFREITAS', 'TERESAFREITAS.jpg', '24242424', 'TERESA FREITAS(테레사 프레이타스)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'TOUSLESJOURS', '1111', 'TOUSLESJOURS@collaverse.co.kr', '28282828282',
    'TOUSLESJOURS', 'TOUSLESJOURS.png', '28282828', 'TOUSLESJOURS(뚜레쥬르)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'WADIZ', '1111', 'WADIZ@collaverse.co.kr', '29292929292',
    'WADIZ', 'WADIZ.png', '29292929', 'WADIZ(와디즈)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

INSERT INTO MEMBER (
    MEMBER_NO,  MEMBER_ROLE, 
    ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, '기업', 
    'YALE', '1111', 'YALE@collaverse.co.kr', '30303030303',
    'YALE', 'YALE.png', '30303030', 'YALE(예일)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

COMMIT;


--04. MEMBER 의 ID 로 회원정보를 조회하는 쿼리
--SELECT * FROM MEMBER WHERE ID='admin' AND MEMBER_STATUS='Y';

--05. 프로필 사진을 기본 이미지로 변경하는 쿼리
--UPDATE MEMBER 
--SET PROFILE_IMG = 'profile_basic.png';  


--------------------------------------------------------------
-------------- MYPAGE_P_COLLECTION 테이블 ---------------------
--------------------------------------------------------------
-- 01. MYPAGE_P_COLLECTION 테이블 생성 + 주석 
CREATE TABLE MYPAGE_P_COLLECTION (
	CLT_NO NUMBER CONSTRAINT MPC_CLT_NO_PK PRIMARY KEY,
	MEMBER_NO NUMBER CONSTRAINT MPC_MEMBER_NO_NN NOT NULL,
	CLT_CONTENT VARCHAR2(3000),
	CLT_CREATE_DATE DATE DEFAULT SYSDATE,
	CLT_MODIFY_DATE DATE DEFAULT SYSDATE,
    CLT_STATUS VARCHAR2(2) DEFAULT 'Y' CONSTRAINT MPC_CLT_STATUS_CH CHECK(CLT_STATUS IN('Y', 'P', 'N')), 
	CLT_IMG_01_ONAME VARCHAR2(200) CONSTRAINT MPC_CLT_IMG_01_ONN NOT NULL,
    CLT_IMG_01_RNAME VARCHAR2(200) CONSTRAINT MPC_CLT_IMG_01_RNN NOT NULL,
    CLT_WRITER_ID VARCHAR2(200) CONSTRAINT MPC_WRITER_ID_NN NOT NULL,
    
    CONSTRAINT MPC_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_NO IS '컬렉션게시글번호';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_CONTENT IS '컬렉션내용';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_CREATE_DATE IS '작성일';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_MODIFY_DATE IS '수정일';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_STATUS IS '상태값(공개Y/비공개P/삭제N)';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_01_ONAME IS '컬렉션사진01_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_01_RNAME IS '컬렉션사진01_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_WRITER_ID IS '컬렉션작성자아이디';


COMMIT;


-- 02. MYPAGE_P_COLLECTION 의 CLT_NO 번호 시퀀스 생성
CREATE SEQUENCE SEQ_MPC_CLT_NO;

COMMIT;


-- 03. MYPAGE_P_COLLECTION 테이블 삭제
--DROP TABLE MYPAGE_P_COLLECTION;


-- 04. MYPAGE_P_COLLECTION 의 CLT_NO 번호 시퀀스 삭제
--DROP SEQUENCE SEQ_MPC_CLT_NO;

--------------------------------------------------------------
---------------- MYPAGE_P_COLLECTION 관련 쿼리문 ----------------
--------------------------------------------------------------
-- 01. 공개한 컬렉션 갯수
--SELECT COUNT(*) FROM MYPAGE_P_COLLECTION WHERE CLT_STATUS='Y';



-- 02. 공개+비공개한 컬렉션 갯수
--SELECT COUNT(*) FROM MYPAGE_P_COLLECTION WHERE CLT_STATUS IN ('Y', 'P');


-- 03.  컬렉션 작성 쿼리
--INSERT INTO MYPAGE_P_COLLECTION (
--    CLT_NO, MEMBER_NO,
--    CLT_CONTENT, CLT_CREATE_DATE, CLT_MODIFY_DATE,
--    CLT_STATUS,
--    CLT_IMG_01_ONAME, CLT_IMG_01_RNAME, CLT_WRITER_ID
--) VALUES (
--    SEQ_MPC_CLT_NO.NEXTVAL, '1', 
--    '컬렉션 작성 쿼리 실행', DEFAULT, DEFAULT,
--    DEFAULT,
--    'O1', 'R1', 'admin');
    

-- 04. 컬렉션 내용 수정 쿼리
--UPDATE MYPAGE_P_COLLECTION 
--SET CLT_CONTENT = '컬렉션 수정 쿼리 실행', 
--    CLT_MODIFY_DATE = SYSDATE
--WHERE CLT_NO = 1;


-- 05. 컬렉션 삭제 쿼리
--UPDATE MYPAGE_P_COLLECTION SET CLT_STATUS='N'
--                           WHERE CLT_NO='3';
--                           
--COMMIT;


-- 06. 컬렉션 상세 조회 쿼리
--SELECT CLT_NO, MPC.MEMBER_NO, CLT_CONTENT, CLT_CREATE_DATE, CLT_MODIFY_DATE,
--       CLT_IMG_01_RNAME, CLT_IMG_02_RNAME, CLT_IMG_03_RNAME, CLT_IMG_04_RNAME,
--       CLT_STATUS
--FROM MYPAGE_P_COLLECTION MPC
--JOIN MEMBER M ON (MPC.MEMBER_NO = M.MEMBER_NO)
--WHERE CLT_STATUS IN ('Y', 'P') AND CLT_NO='1';


-- 07. 회원 id 로 컬렉션 찾기
--SELECT M.ID, MPC.CLT_NO, MPC.CLT_STATUS
--FROM MYPAGE_P_COLLECTION MPC
--JOIN MEMBER M ON (MPC.MEMBER_NO = M.MEMBER_NO)	
--WHERE M.ID = 'admin';



--------------------------------------------------------------
----------------------- CATEGORY 테이블 -----------------------
--------------------------------------------------------------
--01. CATEGORY 테이블 생성 + 주석
CREATE TABLE CATEGORY (
    NO NUMBER(20) PRIMARY KEY,
    C_NAME VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN CATEGORY.NO IS '카테고리번호';
COMMENT ON COLUMN CATEGORY.C_NAME IS '카테고리명';

--02. CATEGORY 시퀀스 생성
CREATE SEQUENCE SEQ_CATEGORY_NO;

--03. CATEGORY 입력
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '리빙');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '문화');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '식품');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '테크');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '패션');


--04. CATEGORY 테이블 삭제 쿼리
--DROP TABLE CATEGORY;


--05. CATEGORY 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_CATEGORY_NO;


--------------------------------------------------------------
---------------------- PROMOTION 테이블 -----------------------
--------------------------------------------------------------
--01. PROMOTION 테이블 생성 + 주석
CREATE TABLE PROMOTION (   
    PMT_NO NUMBER(10) PRIMARY KEY,
    PMT_TITLE VARCHAR2(100),
    PMT_IMG_PATH VARCHAR2(100),
    PMT_CONTENT VARCHAR2(2000),
    PMT_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(PMT_STATUS IN('Y', 'N')),
    START_DATE DATE,
    END_DATE DATE,
    READCOUNT NUMBER,
    C_NO NUMBER(20),
    HEART_HIT NUMBER,
    
    FOREIGN KEY (C_NO) REFERENCES CATEGORY (NO) 
);

COMMENT ON COLUMN PROMOTION.PMT_NO IS '프로모션 번호';
COMMENT ON COLUMN PROMOTION.PMT_TITLE IS '프로모션 제목';
COMMENT ON COLUMN PROMOTION.PMT_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN PROMOTION.PMT_CONTENT IS '프로모션 설명';
COMMENT ON COLUMN PROMOTION.PMT_STATUS IS '프로모션 상태';
COMMENT ON COLUMN PROMOTION.START_DATE IS '시작일';
COMMENT ON COLUMN PROMOTION.END_DATE IS '종료일';
COMMENT ON COLUMN PROMOTION.READCOUNT IS '조회수';
COMMENT ON COLUMN PROMOTION.C_NO IS '카테고리번호';
COMMENT ON COLUMN PROMOTION.HEART_HIT IS '좋아요수';


--02. PROMOTION 시퀀스 생성
CREATE SEQUENCE SEQ_PROMOTION_NO;


--03. PROMOTION 테이블 삭제 쿼리
--DROP TABLE PROMOTION;


--04. PROMOTION 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_PROMOTION_NO;


--05. 프로모션 데이터 추가 쿼리
-- 리빙 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '농심 X 카카오프렌즈', '/resources/images/promotion/promotion', '자꾸만 손이 가는 단짠 콜라보! 국민 대표 스낵 <p> 새우깡으로 변신한 라이언과 꿀꽈배기로 변신한 춘식이를 만나보세요.', DEFAULT, to_date('22/01/20','RR/MM/DD'), NULL, NULL, 1, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '대구1988 × 천하장사', '/resources/images/promotion/promotion', '30년 이상의 전통을 가진 천하장사와 대구 1988이 만났습니다. <p> 건강하고 즐거운 잠을 위한 소시지 침구를 만나보세요.', DEFAULT, to_date('22/02/21','RR/MM/DD'),to_date('22/03/07','RR/MM/DD'), NULL, 1, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '도프제이슨 X 렉슨', '/resources/images/promotion/promotion', '서로 다른 분야에서 인정받아온 도프제이슨과 렉슨의 만남을 통해 <p> 공간의 분위기를 색다르게 뒤바꿔줄 미나 머쉬룸 램프를 만나보세요', DEFAULT, to_date('22/01/27','RR/MM/DD'), NULL, NULL, 1, 0);

-- 문화 -- 
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '카트라이더 X 피자헛', '/resources/images/promotion/promotion', '한국피자헛과 넥슨 모바일 레이싱 게임 <p> 카트라이더 러쉬플러스의 만남! 한정판 아이템이 담긴 <p> ‘카러플팩’을 통해 색다른 재미를 느껴보세요.', DEFAULT, to_date('22/01/25','RR/MM/DD'), to_date('22/02/27','RR/MM/DD'), NULL, 2, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '와디즈 X 메이플스토리', '/resources/images/promotion/promotion', '넥슨과 크라우드펀딩 플랫폼 와디즈의 팬즈메이커 프로젝트. <p> 주요 캐릭터를 활용한 일상 제품부터 <p> 특별한 용도를 지닌 제품까지 모두 만나보세요.', DEFAULT, to_date('22/02/21','RR/MM/DD'), to_date('22/03/07','RR/MM/DD'), NULL, 2, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '노루 X 테레사 프레이타스', '/resources/images/promotion/promotion', '노루페인트가 세계 최초 테레사 프레이타스 사진전에 <p> 스며들었습니다. 노루페인트가 활용한 파스텔 톤의 <p> 페인트들을 통해 봄날의 감성을 느껴보세요.', DEFAULT, to_date('22/01/29','RR/MM/DD'), to_date('22/04/24','RR/MM/DD'), NULL, 2, 0);

-- 식품 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '롯데제과 X 에스더버니', '/resources/images/promotion/promotion', '﻿﻿롯데제과와 에스더버니 캐릭터의 만남! <p> 딸기를 주원료로한 분홍색 패키지의 사랑스러운 <p> 봄 시즌 제품을 만나보세요.', DEFAULT, to_date('22/02/14','RR/MM/DD'), NULL, NULL, 3, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '뚜레쥬르 X 디즈니', '/resources/images/promotion/promotion', '미키, 미니 캐릭터의 경쾌한 색감과 생동감 넘치는 표정으로 <p> 완성한 사랑스러운 비주얼이 돋보이는 뚜레쥬르의 <p> 밸런타인 시즌 제품을 만나보세요.', DEFAULT, to_date('22/02/07','RR/MM/DD'), NULL, NULL, 3, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '설빙 X 켈로그', '/resources/images/promotion/promotion', '코리안 디저트 카페 설빙과 글로벌 시리얼 브랜드 <p>  켈로그와의 두 번째 협업! <p> 한층 더 업그레이드된 콜라보 신메뉴를 만나보세요.', DEFAULT, to_date('22/02/23','RR/MM/DD'), NULL, NULL, 3, 0);

-- 테크 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '삼성 X 메종키츠네', '/resources/images/promotion/promotion', '메종 키츠네의 신비로운 상징, 여우가 <p> 자연스럽게 갤럭시 안으로 스며들었습니다. <p> 미래지향적인 미학을 담고있는 갤럭시 워치4와 <p> 버즈2 메종 키츠네 에디션을 만나보세요.', DEFAULT, to_date('21/11/10','RR/MM/DD'), NULL, NULL, 4, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '소니 X 캐피탈 라디오 튠즈', '/resources/images/promotion/promotion', '21 F/W 시즌 키 아이템 헤드폰과 후드, 비니와 <p> 함께 매치하는 스타일 트렌드를 반영해 음악이라는 <p> 테마 아래 소니 x CRT 협업 한정판 어패럴을 만나보세요.', DEFAULT, to_date('21/10/13','RR/MM/DD'), NULL, NULL, 4, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '케이스티파이 X 피너츠', '/resources/images/promotion/promotion', '﻿﻿Peanuts x CASETiFY 레트로 캔디샵으로 <p> 여러분을 초대합니다! 일상을 더욱 달콤하게 만들어 줄 <p> 피너츠 캐릭터들의 다채로운 디자인 컬렉션을 만나보세요.', DEFAULT, to_date('21/01/28','RR/MM/DD'), NULL, NULL, 4, 0);

-- 패션 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '스파오 X 짱구', '/resources/images/promotion/promotion', '스파오와 짱구의 22SS 봄 신상 꿀잠 파자마를 만나보세요.', DEFAULT, to_date('22/02/21','RR/MM/DD'), NULL, NULL, 5, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '예일 × 벌스데이수트', '/resources/images/promotion/promotion', '과거 예일의 신입생 복장 규정을 현대적으로 재해석하여 위트있게 <p> 표현한 예일 × 벌스데이수트 22 S/S 협업 컬렉션을 만나보세요.', DEFAULT, to_date('22/02/18','RR/MM/DD'), to_date('22/02/25','RR/MM/DD'), NULL, 5, 0);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '로이드 × 로캐론', '/resources/images/promotion/promotion', '패턴로캐론의 타탄 패턴이 로이드만의 감각적인 감성으로 담겼습니다. <p> 시그니처 시계와 스트랩을 로캐론 패턴의 콜라보로 만나보세요.', DEFAULT, to_date('22/02/23','RR/MM/DD'), to_date('22/03/08','RR/MM/DD'), NULL, 5, 0);

COMMIT;



--------------------------------------------------------------
----------------------- PRODUCT 테이블 ------------------------
--------------------------------------------------------------
--01. PRODUCT 테이블 생성 + 주석
CREATE TABLE PRODUCT (   
    PRO_NO NUMBER(10) PRIMARY KEY,
    PRO_NAME VARCHAR2(100),
    PRO_PRICE VARCHAR2(100),
    PRO_CONTENT VARCHAR2(2000),
    PRO_QTY VARCHAR2(20), 
    PRO_IMG_PATH VARCHAR2(100),
    
    C_NO NUMBER(20),
    PMT_NO NUMBER(10),
    FOREIGN KEY (C_NO) REFERENCES CATEGORY (NO),
    FOREIGN KEY (PMT_NO) REFERENCES PROMOTION (PMT_NO) 
);

COMMENT ON COLUMN PRODUCT.PRO_NO IS '제품 번호';
COMMENT ON COLUMN PRODUCT.PRO_NAME IS '제품명';
COMMENT ON COLUMN PRODUCT.PRO_PRICE IS '가격';
COMMENT ON COLUMN PRODUCT.PRO_CONTENT IS '제품 설명';
COMMENT ON COLUMN PRODUCT.PRO_QTY IS '구매가능 수량';
COMMENT ON COLUMN PRODUCT.PRO_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN PRODUCT.C_NO IS '카테고리번호';
COMMENT ON COLUMN PRODUCT.PMT_NO IS '프로모션 번호';


--02. PRODUCT 시퀀스 생성
CREATE SEQUENCE SEQ_PRODUCT_NO;

COMMIT;


--03. PRODUCT 테이블 삭제 쿼리
-- DROP TABLE PRODUCT;


--04. PRODUCT 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_PRODUCT_NO;


--05. PRODUCT 데이터 추가 
-- 리빙 -- 
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] <p> 스티커세트_라이언/춘식이', '8000원', '짭조름한 새우깡 라이언 VS 달콤한 꿀꽈배기 춘식이! <p> 단짠 대결을 펼치는라이언, 춘식이의 모습을 담은 스티커예요. <p> 누구나 좋아하는 국민 과자와 만난 프렌즈를 스티커로 소장해보세요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] <p> 에어팟프로케이스', '18000원', '귀여운 미니 사이즈 꿀꽈배기를 그대로 반영한 <p> 춘식이 에어팟 케이스예요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] <p> 스낵볼과 집게', '20000원', '집콕엔 빠질 수 없는 스낵 타임! <p> 스낵볼과 집게로 앙증맞은 플레이팅을 완성해보세요. <p> 새우로 변신한 라이언 스낵볼과 꿀벌로 변신한 춘식이 스낵볼에 과자를 담아서, <p> 아기 새우 집게와 아기 꿀벌 집게로 먹으면 맛과 재미가 두 배!', '제한없음' ,'/resources/images/product/product', 1, 1);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] <p> 천하장사 오리지날 차렵이불 SS', '79000원', '보기만 해도 힘이 쏟는 귀여운 천하장사가 입체감있게 쏙- <p> 기분좋은 감촉과 기운찬 에너지가 가득한 천하장사 차렵이불 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] <p> 천하장사 베개커버 50×70', '18000원', '아기자기 귀여운 소시지가 가득! <p> 기분좋은 감촉과 통통튀는 컬러감이 유니크한 베개 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] <p> 천하장사 바디필로우 80×20', '39000원', '성인과 아이 모두 사용하기 편한 길이감으로 온가족이 함께 사용할 수 있어요.', '제한없음' ,'/resources/images/product/product', 1, 2);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[도프제이슨 X 렉슨] <p> MINA 머쉬룸 램프 블랙 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, <p> 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[도프제이슨 X 렉슨] <p> MINA 머쉬룸 램프 화이트 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, <p> 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);

-- 문화 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] <p> 피자헛 카트', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] <p> 피자헛 코스튬', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] <p> 피자헛 풍선', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] <p> 버섯집무드등', '99000원', '메이플스토리 친구들이 내 일상으로 찾아왔어요! <p> 귀여움으로 무장한 몬스터들의 심장폭격!! <p> 내 방을 환하게 밝혀줄 버섯집 무드등과 <p> 찰랑찰랑 주스 워터볼 키링을 만나보세요!', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] <p> 메테오백', '59500원', '친환경 원단계의 인싸 타이벡과 메이플스토리의 귀여운 캐릭터가 만났다! <p> 포스트 코로나를 대비하여 최고급 캠핑 용품 하나씩 장만하시는 건 어때요?', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] <p> 댕블러', '29900원', '세상에서 가장 귀여운 댕블러가 메이플스토리와 함께 돌아왔습니다! <p> 물, 간식, 배변봉투를 한 손에! 반려견 산책 전용 올인원 텀블러', '제한없음' ,'/resources/images/product/product', 2, 5);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[노루페인트 X 테레사 프레이타스] <p> 사진전 대인', '15000원', '어느 봄날, 테레사 프레이타스 사진전 대인(만 19세 이상)', '제한없음' ,'/resources/images/product/product', 2, 6);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[노루페인트 X 테레사 프레이타스] <p> 사진전 소인', '13000원', '어느 봄날, 테레사 프레이타스 사진전 소인(48개월~만18세)', '제한없음' ,'/resources/images/product/product', 2, 6);

-- 식품 -- 
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] <p> 몽쉘 생크림 설향딸기', '4750원', '부드러운 생크림 속에 딸기잼이 들어있는 제품으로, <p> 달콤한 초콜릿과 폭신한 케이크의 식감을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] <p> 빼빼로 스트로베리', '1200원', '딸기 쿠키를 토핑했으며 막대 과자를 쌉싸름한 까망 비스킷으로 바꿔 <p> 딸기의 상큼한 맛을 더욱 돋워준다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] <p> 빈츠 딸기프로마쥬', '1890원', '바삭한 치즈 비스킷을 사용하여 상큼한 딸기초콜릿과 어우러져 <p> 이색적이면서도 조화로운 맛을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니] <p> 초코 프렌치쿠키(소)', '14450원', '버터 풍미 가득한 시즌 한정 3가지 초코 프렌치 쿠키', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니] <p> 미키미니 뚱카롱(4개입)', '10200원', '로즈라즈베리와 솔티드카라멜 두 가지 맛 위에 <p> 귀여운 미키미니 로고가 그려진 뚱카롱', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니] <p> 미키미니 달콤 초코 만큼 사랑해', '17850원', '촉촉한 초코 시트 위에 봄브 딸기 크림과 <p> 새콤달콤한 딸기잼이 더해져 더욱 맛있는 미니 케이크', '제한없음' ,'/resources/images/product/product', 3, 8);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[설빙 X 켈로그] <p> 첵스초코딸기설빙', '12900원', '첵스초코 특유의 고소하면서 진한 초코맛이 우유 얼음과 바닐라 아이스크림, 생딸기, <p> 초코 크런치, 생크림, 딸기 시럽, 시리얼 등과 어우러지며 맛의 시너지를 극대화했다.', '제한없음' ,'/resources/images/product/product', 3, 9);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[설빙 X 켈로그] <p> 첵스초코스노우라떼', '4500원', '첵스초코스노우라떼는 초코우유와 우유 얼음, <p> 그 위에 첵스초코 시리얼을 풍성하게 토핑해 <p> 바삭한 식감이 재미있는 설빙 만의 아이스음료다.', '제한없음' ,'/resources/images/product/product', 3, 9);

-- 테크 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] <p> 갤럭시 버즈2 메종키츠네 에디션', '290000원', '우주를 담은 패키지를 풀며 새로운 모험을 시작해보세요. <p> 단순하면서도 대담한 디자인의 커스텀 가죽 케이스와 충전 케이블, <p> 그 속의 여우를 만날 수 있을 거예요.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] <p> 갤럭시 워치4 메종키츠네 에디션', '460000원', '두 개의 맞춤형 스트랩과 무선 충전기로 완벽한 워치 경험을 선사합니다. <p> 첫 번째 스트랩은 천체 패턴과 여우 모양의 펀칭 디테일이 돋보이는 <p> 문락 베이지 색상의 고무 밴드입니다. <p> 두 번째 스트랩은 스타더스트 그레이 색상의 가죽에 <p> 메종 키츠네 핸드라이팅 로고가 새겨져 있습니다.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] <p> 스포츠 스트랩', '53400원', '트와일라잇 바이올렛 컬러에 작은 여우 모양의 펀칭 디테일이 눈길을 사로잡죠. <p> 내구성이 뛰어난 불소고무 재질로 외부 활동이 많은 당신에게 딱입니다.', '제한없음' ,'/resources/images/product/product', 4, 10);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] <p> WH-1000XM4 X CRT(후드티)', '449000원', '소니와 CRT의 협업 로고로 희소성을 더한 <p> 후드 티셔츠와 함께 매치할 수 있는 패키지. <p> 오버사이즈 핏 후드 티셔츠에 헤드폰을 더해 센스있는 룩을 완성해보자.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] <p> WH-1000XM4 X CRT(티셔츠,비니)', '439000원', '헤드폰부터 비니, 반팔 티셔츠까지 데일리 룩을 단번에 완성할 수 있는 패키지. <p> 취향에 맞는 비니 컬러를 선택해 코디 포인트를 줄 수 있다.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] <p> PS-LX310BT X CRT(슬리브)', '279000원', '클래식한 실루엣의 블루투스 턴테이블과 <p> LP 음반을 보호해주는 슬립매트로 구성한 패키지. <p> 협업 디자인이 더해져 특별함을 자아낸다.', '제한없음' ,'/resources/images/product/product', 4, 11);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] <p> Snoopy Plush Case', '75000원', '마치 낮잠을 좋아하는 스누피를 위한 편안한 베개처럼! <p> 울트라 소프트 Plush 소재로 제작된 케이스를 만나보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] <p> Peanuts Candy Airpods Pro', '35000원', '울트라 에코 케이스 및 크러쉬 케이스는 <p> 재활용 소재로 제작됨은 물론 100% 생분해 가능하답니다!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] <p> Charlie Brown Good Grief Taffy Case', '65000원', '취향에 따라 고르는 컬러 및 캐릭터 디자인으로 나만의 개성을 표현해 보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);

-- 패션 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] <p> 잘자요 짱구 잠옷 PINK', '39900원', '잘자요 짱구 잠옷 PINK', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] <p> 잘자요 짱구 잠옷 MINT', '39900원', '잘자요 짱구 잠옷 MINT', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] <p> 잘자요 짱구 잠옷 MIX', '39900원', '잘자요 짱구 잠옷 MIX', '제한없음' ,'/resources/images/product/product', 5, 13);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] <p> EMBLEM COLOR MIX CREWNECK NAVY', '89000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] <p> MADRAS PATCH WORK SHIRTS NAVY', '139000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] <p> EMBLEM KNIT VEST NAVY', '89000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 <p> 라벤더핑크 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 <p> 베이지 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 <p> 블루 남성 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);

COMMIT;

--------------------------------------------------------------
------------------------ BRAND 테이블 -------------------------
--------------------------------------------------------------
--01. BRAND 테이블 생성 + 주석
CREATE TABLE BRAND (
    BR_MEMBER_NO NUMBER(10),
    BR_NAME VARCHAR2(50),
    BR_CONTENT VARCHAR2(2000),
    BR_IMG_PATH VARCHAR2(100),
    BR_PMT_NO NUMBER(10),   
    
    FOREIGN KEY (BR_MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (BR_PMT_NO) REFERENCES PROMOTION(PMT_NO)   
);
 
COMMENT ON COLUMN BRAND.BR_MEMBER_NO IS '브랜드 번호'; -- MEMBER의 회원번호 참조
COMMENT ON COLUMN BRAND.BR_NAME IS '브랜드명';
COMMENT ON COLUMN BRAND.BR_CONTENT IS '브랜드 소개';
COMMENT ON COLUMN BRAND.BR_IMG_PATH IS '브랜드 이미지경로';
COMMENT ON COLUMN BRAND.BR_PMT_NO IS '프로모션 번호'; -- 브랜드별 진행중인 프로모션 가져오기 위함


-- 02. 브랜드 데이터 추가 
INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    5, 'BIRTHDAYSUIT <p> (벌스데이수트)', 
    '국왕 탄신일의 예복과 나체라는 이중적인 뜻을 지닌 <p> 단어에서 영감을 받아 어떠한 상징이 아닌 순수한 옷 자체와 <p> 살갗에 닿는가장 좋은 느낌을 지향하는, 촉감이 좋은 <p> 소재만을 엄선하여 만든 옷을 선보이는 브랜드입니다.', 
    '/resources/images/brand/brand', 14
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    6, 'CAPITAL RADIO TUNES <p> (캐피탈라디오튠즈)', 
    '여유로운 도시의 라디오에서  <p>  흘러나오는 아날로그적 감성을 <P> 심플한 디자인의 의류에  <p> 고스란히 담은 브랜드입니다.', 
    '/resources/images/brand/brand', 11
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    7, 'CASETIFY <p> (케이스티파이)', 
    '빠르게 변화하는 트렌드에 맞춰 <p> 퀄리티는 지키며 트렌디하고 <p> 유니크한 디자인을 더해 <p> 나만의 개성을 표현해주는 <p> 글로벌 테크액세서리 브랜드입니다.', 
    '/resources/images/brand/brand', 12
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    8, 'CHEONHAJANGSA <p> (천하장사)', 
    '진주햄에서 1985년부터 생산 및 <p> 판매하는 혼합소시지 제품입니다.', 
    '/resources/images/brand/brand', 2
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    9, 'CRAYON SHIN CHAN(짱구)', 
    '1990년 8월에 나온 <p> 우스이 요시토의 연재 만화. <p> 이를 원작으로 한 애니메이션 <p> 짱구는 못말려는 한국에서도 <p> 1999년부터 방영되고 있는 <p> 장기 애니메이션 중 하나입니다.', 
    '/resources/images/brand/brand', 13
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    10, 'DAEGU 1988 <p> (대구 1988)', 
    '대구에서 1988년 시작한 침구 제조 업체에서 <p> 론칭한 침구 브랜드입니다.', 
    '/resources/images/brand/brand', 2
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    11, 'DISNEY <p> (디즈니)', 
    '영화와 애니메이션, 픽사, 마블, 스타워즈, <p> 내셔널 지오그래픽과 폭스의 영화, TV 프로그램 사업을 <p> 하고 있는 미디어, 엔터테인먼트 기업입니다.', 
    '/resources/images/brand/brand', 8
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    12, 'DOFFJASON <p> (도프제이슨)', 
    '가죽이라는 소재에 대한 이해를 기반으로 레더 가먼츠를  <p> 중심으로 디자인하며 시대에 구애 받지 않는  <p> 스타일과 오래 입을수록 가치를 더하는 디자인을  <p> 추구하고, 절제된 디테일과 뛰어난 퀄리티의 아이템을 <p> 합리적인 가격으로 선보이는 브랜드입니다.', 
    '/resources/images/brand/brand', 3
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    13, 'ESTHER BUNNY <p> (에스더버니)', 
    '미국의 일러스트레이터 Esther kim에 의해 창작된 캐릭터 브랜드로 <p> LA와 도쿄, 서울을 오가면서 느낀 문화적 다양성에 영감을 받아 만들어졌으며, <p> 키치하고 스타일리시한 이미지로 전세계에서 사랑을 받고 있는 캐릭터입니다.', 
    '/resources/images/brand/brand', 7
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    14, 'KAKAO FRIENDS <p> (카카오프렌즈)', 
    '카카오톡과 카카오스토리를 비롯한 <p> 카카오의 서비스에서 사용할 수 있는 <p> 카카오의 마스코트입니다.', 
    '/resources/images/brand/brand', 1
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    15, 'KARTRIDER <p> (카트라이더)', 
    '로두마니 스튜디오가 개발하고 <p> 넥슨에서 서비스하는 <p> 레이싱 비디오 게임입니다.', 
    '/resources/images/brand/brand', 4
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    16, 'KELLOGG <p> (켈로그)', 
    '미국의 다국적 기업으로, <p> 시리얼, 과자, 쿠키, 크래커 등의 <p> 식품을 생산합니다.', 
    '/resources/images/brand/brand', 9
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    17, 'LEXON <p> (렉슨)', 
    '1991년 설립된 디자인 생활용품 브랜드입니다. <p> 매 시즌 마다 세계 여러나라의 디자이너들과 <p> 협업으로 새롭고 독특한 디자인을 창조합니다.', 
    '/resources/images/brand/brand', 3
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    18, 'LLOYD <p> (로이드)', 
    'British Modern 컨셉의 차별화된 디자인의 Jewelry와 <p> 클래식한 시계를 합리적인 가격으로 선보이며, <p> 국내 쥬얼리 기프트 선두 브랜드로 자리잡았습니다.', 
    '/resources/images/brand/brand', 15
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    19, 'LOCHCARRON <p> (로캐론)', 
    '1892년 스코틀랜드 셀커크 지역에 설립 되었으며, <p> 700가지가 넘는 타탄 패턴을 보유하며 <p> 왕족의 행사에 다양한 패턴을 납품하는 전통적인 브랜드입니다.', 
    '/resources/images/brand/brand', 15
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    20, 'LOTTE CONF <p> (롯데제과)', 
    '대한민국 롯데그룹 계열 과자류 생산업체이며 <p> 글로벌 식품 리빙 브랜드입니다.', 
    '/resources/images/brand/brand', 7
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    21, 'MAISON KITSUNE <p> (메종키츠네)', 
    '2002년 프랑스 파리에서 만들어진 브랜드로 <p> 매 시즌 파리와 도쿄에서 영감을 받아 <p> 현대적인 결과물들을 선보입니다.', 
    '/resources/images/brand/brand', 10
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    22, 'MAPLE STORY <p> (메이플스토리)', 
    '위젯 스튜디오에서 제작하고 <p> 넥슨 코리아가 서비스하는 세계 최초의 <p> 2D 사이드 스크롤 방식 온라인 게임입니다.', 
    '/resources/images/brand/brand', 5
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    23, 'NONGSHIM <p> (농심)', 
    '창립 이후 50여 년 동안 한국의 <p> 식문화를 이끌어온 식품 전문기업입니다.', 
    '/resources/images/brand/brand', 1
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    24, 'NOROOPAINT <p> (노루페인트)', 
    '사람과 자연을 향하는 <p> 컬러서비스 전문 기업입니다.', 
    '/resources/images/brand/brand', 6
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    25, 'PEANUTS <p> (피너츠)', 
    '찰스 먼로 슐츠가 그린 미국의 만화 및 만화를 원작으로 하는 애니메이션으로 <p> 찰리 브라운과 반려견 스누피를 중심으로 한 캐릭터들이 <p> 귀여운 겉모습과 어울리지 않는 초현실적인 인생관을 전개하는 개그 만화입니다.', 
    '/resources/images/brand/brand', 12
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    26, 'PIZZA HUTS <p> (피자헛)', 
    '미국의 피자 프랜차이즈로 피자헛의 헛(Hut)은 오두막(Hut)이라는 뜻으로 <p> 피자 오두막 이라는 뜻이기도 합니다.', 
    '/resources/images/brand/brand', 4
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    27, 'SAMSUNG <p> (삼성)', 
    '반도체와 전자 제품, 통신 장비 등을 제조하는 <p> 세계 브랜드 가치 6위의 대한민국 기업이다.', 
    '/resources/images/brand/brand', 10
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    28, 'SONY <p> (소니)', 
    '소니그룹의 전자제품 자회사이자 중간지주회사이며 <p> 소니의 전자제품 분야, 더 자세하게는 이미징 제품, <p> 가전 및 오디오, 모바일 제품 등의 <p> 개발, 생산, 판매를 담당합니다.', 
    '/resources/images/brand/brand', 11
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    29, 'SPAO <p> (스파오)', 
    '좋은 소재와 기본에 충실하면서도 트렌디한 <p> 디자인으로 누구나 일상 속에서 편안하게 <p> 입을 수 있는 패션 라이프를 제안하는 <p> 국내 최초 글로벌 SPA 브랜드입니다.', 
    '/resources/images/brand/brand', 13
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    30, 'SULBING <p> (설빙)', 
    '대한민국의 프랜차이즈 기업으로 <p> 디저트 카페 가맹업을 운영하고 있으며, <p> 판매하는 주요 상품은 빙수류, 차, 토스트 등이다.', 
    '/resources/images/brand/brand', 9
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    31, 'TERESA FREITAS <p> (테레사 프레이타스)', 
    '풍경, 정물을 매체로 사진, 영상, 스톱 모션 등으로 표현하는 <p> 예술적이고 창의적인 접근 방식을 가진 사진 작가로 <p> 꿈 속 세계같은 파스텔톤 사진들로 많은 사랑을 받고 있습니다. <p> 다양한 브랜드와의 협업도 꾸준히 진행하고 있습니다.', 
    '/resources/images/brand/brand', 6
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    32, 'TOUSLESJOURS <p> (뚜레쥬르)', 
    '대한민국 CJ푸드빌에서 운영하고 있는 베이커리 프랜차이즈 <p> 브랜드이며 매장에서 빵, 케이크, 음료 등을 판매합니다.', 
    '/resources/images/brand/brand', 8
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    33, 'WADIZ <p> (와디즈)', 
    '대한민국의 크라우드펀딩 플랫폼 기업입니다. <p> 증권형 크라우드펀딩과 보상형 크라우드펀딩을  <p>  운영하고 있으며, 스타트업과 문화 콘텐츠를 시작으로  <p> 식품, 여행 등 펀딩 카테고리를 확장하고 있습니다.', 
    '/resources/images/brand/brand', 5
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    34, 'YALE <p> (예일)', 
    '미국 명문 사립대학 예일대학교(Yale University)의 <p> 시그니처 패션을 선보이는 브랜드입니다. <p> 예일대학교의 시그니처 로고는 아이비리그 룩과  <p> 프레피 룩을 논할 때 빼놓을 수 없는 아이콘으로 <p> 빈티지 웨어에 중요한 부분을 차지하고 있습니다.', 
    '/resources/images/brand/brand', 14
);

COMMIT;

--03. BRAND 테이블 삭제 쿼리
-- DROP TABLE BRAND;



--------------------------------------------------------------
------------------------ HEART 테이블 -------------------------
--------------------------------------------------------------
--01. HEART 테이블 생성 + 주석
CREATE TABLE HEART (
HEART_NO NUMBER CONSTRAINT H_HEAR_NO_PK PRIMARY KEY,
HEART_PMT_NO NUMBER CONSTRAINT H_PMT_NO_NN NOT NULL,
HEART_MEM_NO NUMBER CONSTRAINT H_HEART_MEM_NO_NN NOT NULL,
HEARTCHECK NUMBER DEFAULT 0 CONSTRAINT H_MEMBER_NO_CH CHECK (HEARTCHECK IN(0, 1)),

FOREIGN KEY (HEART_PMT_NO) REFERENCES PROMOTION(PMT_NO) ON DELETE CASCADE,
FOREIGN KEY (HEART_MEM_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN HEART.HEART_NO IS '좋아요번호';
COMMENT ON COLUMN HEART.HEART_PMT_NO IS '좋아요_한_프로모션번호';
COMMENT ON COLUMN HEART.HEART_MEM_NO IS '좋아요_한_회원번호';
COMMENT ON COLUMN HEART.HEARTCHECK IS '중복체크_방지용';


--02. HEART 시퀀스 생성
CREATE SEQUENCE SEQ_H_HEART_NO;


--03. HEART 테이블 삭제 쿼리
-- DROP TABLE HEART;


--04. HEART 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_H_HEART_NO;


COMMIT;



--------------------------------------------------------------
---------------------- HEART 관련 쿼리문 -----------------------
--------------------------------------------------------------
-- 01. 게시글 추천수 올리는 쿼리문
--updateHeart
--UPDATE PROMOTION
--SET HEARTHIT = HEARTHIT + 1
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }


-- 02. 게시글 추천수 취소 쿼리문
--updateHeartCancel
--UPDATE PROMOTION
--SET HEARTHIT = HEARTHIT - 1
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }


-- 03. 하트 클릭 시 HEART 테이블에 만드는 쿼리문
-- 시퀀스 생성 대신에 저렇게 처리함
-- insertHeart
--INSERT INTO HEART(HEART_NO, HEART_PMT_NO, HEART_MEM_NO)
--VALUES ((SELECT NVL(MAX(HEART_NO), 0) + 1 FROM HEART), #{ HEART_PMT_NO }, #{ HEART_MEM_NO })


-- 04. 하트 취소 시 HEART 테이블에서 빼는 쿼리문
-- deleteHeart
--DELETE FROM HEART 
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }
--    AND HEART_MEM_NO = #{ HEART_MEM_NO } 


-- 05. 하트 클릭 시 CHECK 를 1로 만들어 중복 방지
-- updateHeartCheck
--UPDATE HEART
--SET HEARTCHECK = 1
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }
--    AND HEART_MEM_NO = #{ HEART_MEM_NO }


-- 06. 하트 취소 시 CHECK 를 다시 0 으로 만듦
-- updateHeartCheckCancel
--UPDATE HEART
--SET HEARTCHECK = 0
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }
--    AND HEART_MEM_NO = #{ HEART_MEM_NO }


-- 07. 0506 을 뺴고 컨트롤러에서 제어하는 하트 중복방지문
-- heartCheck
--SELECT COUNT(*)
--FROM HEART
--WHERE HEART_PMT_NO = #{ HEART_PMT_NO }
--    AND HEART_MEM_NO = #{ HEART_MEM_NO } 


-- 08. HEARTCHECK 가 0 인지 1인지 확인해주는 쿼리문
--SELECT  HEART_PMT_NO,HEART_MEM_NO, HEARTCHECK 
--FROM HEART
--WHERE HEART_PMT_NO = 1
--    AND HEART_MEM_NO=21;



--------------------------------------------------------------
----------------------- FOLLOW 관련 테이블 ----------------------
--------------------------------------------------------------
-- 01. FOLLOWING 테이블 생성 + 주석
CREATE TABLE FOLLOWING (
    FOLLOWING_NO NUMBER CONSTRAINT FLG_FOLLOWING_NO_PK PRIMARY KEY,
    FROM_MEM_NO NUMBER CONSTRAINT FLG_FROM_MEM_NO_NN NOT NULL,
    TO_MEM_NO NUMBER CONSTRAINT FLG_TO_MEM_NO_NN NOT NULL,
    FOLLOWING_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FLG_CREATE_DATE_NN NOT NULL,
    FOLLOWINGCHECK NUMBER DEFAULT 0 CONSTRAINT FLG_FCHECK_CK CHECK (FOLLOWINGCHECK IN(0, 1)),
    
    CONSTRAINT FLG_FROM_MEM_NO_FK FOREIGN KEY(FROM_MEM_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT FLG_TO_MEM_NO_FK FOREIGN KEY(TO_MEM_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN FOLLOWING.FOLLOWING_NO IS '팔로잉(능동)번호';
COMMENT ON COLUMN FOLLOWING.FROM_MEM_NO IS '팔로잉(능동)하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWING.TO_MEM_NO IS '팔로우(수동)당하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWING.FOLLOWING_CREATE_DATE IS '팔로잉/팔로우 된 시간';
COMMENT ON COLUMN FOLLOWING.FOLLOWINGCHECK IS '중복체크 방지용';

COMMIT;


-- 02. FOLLOWER 테이블 생성 + 주석
CREATE TABLE FOLLOWER (
    FOLLOWER_NO NUMBER CONSTRAINT FLR_FOLLOWER_NO_PK PRIMARY KEY,
    TO_MEM_NO NUMBER CONSTRAINT FLR_TO_MEM_NO_NN NOT NULL,
    FROM_MEM_NO NUMBER CONSTRAINT FLR_FROM_MEM_NO_NN NOT NULL,
    FOLLOWER_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FLR_CREATE_DATE_NN NOT NULL,
    FOLLOWERCHECK NUMBER DEFAULT 0 CONSTRAINT FLR_FCHECK_CK CHECK (FOLLOWERCHECK IN(0, 1)),
    
    CONSTRAINT FLR_FROM_MEM_NO_FK FOREIGN KEY(FROM_MEM_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT FLR_TO_MEM_NO_FK FOREIGN KEY(TO_MEM_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN FOLLOWER.FOLLOWER_NO IS '팔로우(수동)번호';
COMMENT ON COLUMN FOLLOWER.TO_MEM_NO IS '팔로우(수동)당하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWER.FROM_MEM_NO IS '팔로잉(능동)하는사람의 회원 번호';
COMMENT ON COLUMN FOLLOWER.FOLLOWER_CREATE_DATE IS '팔로잉/팔로우 된 시간';
COMMENT ON COLUMN FOLLOWER.FOLLOWERCHECK IS '중복체크 방지용';

COMMIT;


-- 02. 시퀀스 생성
CREATE SEQUENCE SEQ_FOLLOWING_NO;
CREATE SEQUENCE SEQ_FOLLOWER_NO;

COMMIT;

-- 03. 테이블 삭제 쿼리
--DROP TABLE FOLLOWING;
--DROP TABLE FOLLOWER;

-- 04. 시퀀스 삭제 쿼리
--DROP SEQUENCE SEQ_FOLLOWING_NO;
--DROP SEQUENCE SEQ_FOLLOWER_NO;




--------------------------------------------------------------
----------------------- FOLLOW 관련 쿼리문 ----------------------
--------------------------------------------------------------
-- 개인 : 2, 3, 4
-- 기업 : 5, 6
-- 01. 2번 회원이 5번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE, FOLLOWINGCHECK)
VALUES(SEQ_FOLLOWING_NO.NEXTVAL, 2, 5, DEFAULT, 1);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE, FOLLOWERCHECK)
VALUES(SEQ_FOLLOWER_NO.NEXTVAL, 5, 2, DEFAULT, 1);

-- 02. 3번 회원이 5번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE, FOLLOWINGCHECK)
VALUES(SEQ_FOLLOWING_NO.NEXTVAL, 3, 5, DEFAULT, 1);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE, FOLLOWERCHECK)
VALUES(SEQ_FOLLOWER_NO.NEXTVAL, 5, 3, DEFAULT, 1);

-- 03. 4번 회원이 5번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE, FOLLOWINGCHECK)
VALUES(SEQ_FOLLOWING_NO.NEXTVAL, 4, 5, DEFAULT, 1);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE, FOLLOWERCHECK)
VALUES(SEQ_FOLLOWER_NO.NEXTVAL, 5, 4, DEFAULT, 1);

-- 04. 2번 회원이 6번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE, FOLLOWINGCHECK)
VALUES(SEQ_FOLLOWING_NO.NEXTVAL, 2, 6, DEFAULT, 1);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE, FOLLOWERCHECK)
VALUES(SEQ_FOLLOWER_NO.NEXTVAL, 6, 2, DEFAULT, 1);

-- 04. 3번 회원이 2번 회원을 팔로우
INSERT INTO FOLLOWING(FOLLOWING_NO, FROM_MEM_NO, TO_MEM_NO, FOLLOWING_CREATE_DATE, FOLLOWINGCHECK)
VALUES(SEQ_FOLLOWING_NO.NEXTVAL, 3, 2, DEFAULT, 1);

INSERT INTO FOLLOWER(FOLLOWER_NO, TO_MEM_NO, FROM_MEM_NO, FOLLOWER_CREATE_DATE, FOLLOWERCHECK)
VALUES(SEQ_FOLLOWER_NO.NEXTVAL, 2, 3, DEFAULT, 1);

COMMIT;

-- 현재 상황
-- 5 기업회원01 팔로워 : 3명 (2, 3, 4)
-- 6 기업회원02 팔로워 : 1명 (2)
-- 2 개인회원01 팔로우 : 2명 (5, 6)
-- 2 개인회원01 팔로워 : 1명 (3)
-- 3 개인회원02 팔로우 : 1명 (2, 5)


-- 06. 1번 회원이 5번 관리자 회원을 언팔로우
--DELETE FROM FOLLOWING 
--WHERE FROM_MEM_NO = 1
--    AND TO_MEM_NO = 5;
--    
--DELETE FROM FOLLOWER
--WHERE  TO_MEM_NO = 5
--    AND FROM_MEM_NO = 1;
    
    
COMMIT;


-- 현재 상황
-- 5 기업회원01 팔로워 : 2명 (3, 4)
-- 2 개인회원01 팔로우 : 2명 (3, 5)


-- 07. 1번 회원이 5번 회원을 팔로우하는지 확인
--     ▶ 팔로우 중이면 1, 아니면 0 출력
--SELECT COUNT(*)
--FROM FOLLOWING
--WHERE FROM_MEM_NO = 1
--    AND TO_MEM_NO = 5;




--------------------------------------------------------------
------------------------ QNA 관련 테이블 -----------------------
--------------------------------------------------------------
-- 01. QNA 테이블 생성 + 주석
CREATE TABLE QNA(
    BNO NUMBER,
    TITLE VARCHAR2(150) NOT NULL,
    CONTENT VARCHAR2(2000) NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    READCOUNT NUMBER DEFAULT 0,
    CONSTRAINT PK_QNA PRIMARY KEY(BNO)
);

COMMENT ON COLUMN QNA.BNO IS 'QNA 번호';
COMMENT ON COLUMN QNA.TITLE IS 'QNA 제목';
COMMENT ON COLUMN QNA.CONTENT IS 'QNA 내용';
COMMENT ON COLUMN QNA.WRITER IS 'QNA 작성자';
COMMENT ON COLUMN QNA.REG_DATE IS 'QNA 등록일';
COMMENT ON COLUMN QNA.MODIFY_DATE IS 'QNA 수정일';
COMMENT ON COLUMN QNA.READCOUNT IS 'QNA 조회수';

-- 02. 시퀀스 생성
CREATE SEQUENCE SEQ_QNA_NO;


COMMIT;



--------------------------------------------------------------
------------------------ QNA 관련 쿼리문 -----------------------
--------------------------------------------------------------
-- ★★★01. 테스트용

--BEGIN
--    FOR N IN 1..285
--    LOOP
--        INSERT INTO QNA VALUES(SEQ_QNA_NO.NEXTVAL, '질문 제목' || SEQ_QNA_NO.CURRVAL, '질문 내용 ' || SEQ_QNA_NO.CURRVAL , '작가' ||  SEQ_QNA_NO.CURRVAL, DEFAULT, DEFAULT, DEFAULT);
--    END LOOP;
--    
--    COMMIT;
--EXCEPTION
--    WHEN OTHERS THEN ROLLBACK;
--END;
--/
--
--COMMIT;

--DROP TABLE QNA;
--DROP SEQUENCE SEQ_QNA_NO;



--------------------------------------------------------------
-------------------- QNA - REPLY 관련 테이블 -------------------
--------------------------------------------------------------
-- 01. QNA 댓글 테이블 생성 + 주석
CREATE TABLE REPLY (
    RNO NUMBER NOT NULL PRIMARY KEY,
    BNO NUMBER NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE
);

ALTER TABLE REPLY ADD CONSTRAINT FK_QNA FOREIGN KEY(BNO) REFERENCES QNA(BNO);

COMMENT ON COLUMN REPLY.RNO IS '댓글 번호';
COMMENT ON COLUMN REPLY.BNO IS '게시글 번호';
COMMENT ON COLUMN REPLY.WRITER IS '내용';
COMMENT ON COLUMN REPLY.CONTENT IS '작성자';
COMMENT ON COLUMN REPLY.REG_DATE IS '작성일';
COMMENT ON COLUMN REPLY.MODIFY_DATE IS '수정일';


-- 02. 시퀀스 생성
CREATE SEQUENCE SEQ_REPLY_NO;


COMMIT;




--------------------------------------------------------------
---------------------- SCHEDULE 관련 테이블 ---------------------
--------------------------------------------------------------
-- 01. SCHEDULE 테이블 생성 + 주석 
CREATE TABLE SCHEDULE (
    NO NUMBER PRIMARY KEY,
    MEMBER_NO NUMBER,
    SUBJECT VARCHAR2(50) NOT NULL,
    START_DATE VARCHAR2(30) NOT NULL,
    END_DATE VARCHAR2(30) NOT NULL,
    MEMO VARCHAR2(1000) NOT NULL,
    COLOR VARCHAR2(20) NOT NULL
);

ALTER TABLE SCHEDULE ADD CONSTRAINT FK_MEMBER FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO);

COMMENT ON COLUMN SCHEDULE.NO IS '스케쥴 번호';
COMMENT ON COLUMN SCHEDULE.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN SCHEDULE.SUBJECT IS '제목';
COMMENT ON COLUMN SCHEDULE.START_DATE IS '시작하는 날';
COMMENT ON COLUMN SCHEDULE.END_DATE IS '끝나는 날';
COMMENT ON COLUMN SCHEDULE.MEMO IS '메모';
COMMENT ON COLUMN SCHEDULE.COLOR IS '타입 색';

-- 02. 시퀀스 생성
CREATE SEQUENCE SEQ_SCHEDULE_NO;

COMMIT;

----------------------------------------------------------------
-------------------------- NOTICE 관련 테이블 -----------------------
----------------------------------------------------------------
-- 01. NOTICE 테이블 생성 + 주석
CREATE TABLE NOTICE(
    BNO NUMBER,
    TITLE VARCHAR2(150) NOT NULL,
    CONTENT VARCHAR2(2000) NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    READCOUNT NUMBER DEFAULT 0,
    CONSTRAINT PK_NOTICE PRIMARY KEY(BNO)
);

COMMENT ON COLUMN NOTICE.BNO IS 'NOTICE 번호';
COMMENT ON COLUMN NOTICE.TITLE IS 'NOTICE 제목';
COMMENT ON COLUMN NOTICE.CONTENT IS 'NOTICE 내용';
COMMENT ON COLUMN NOTICE.WRITER IS 'NOTICE 작성자';
COMMENT ON COLUMN NOTICE.REG_DATE IS 'NOTICE 등록일';
COMMENT ON COLUMN NOTICE.MODIFY_DATE IS 'NOTICE 수정일';
COMMENT ON COLUMN NOTICE.READCOUNT IS 'NOTICE 조회수';

-- 02. 시퀀스 생성
CREATE SEQUENCE SEQ_NOTICE_NO;

COMMIT;


-- 03. 공지사항 추가 (6개)
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 01', '공지 내용 01' , '콜라버스관리자', '2022-03-10', DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 02', '공지 내용 02' , '콜라버스관리자', '2022-03-12', DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 03', '공지 내용 03' , '콜라버스관리자', '2022-03-13', DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 04', '공지 내용 04' , '콜라버스관리자', '2022-03-14', DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 05', '공지 내용 05' , '콜라버스관리자', '2022-03-16', DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, '공지사항 제목 06', '공지 내용 06' , '콜라버스관리자', '2022-03-19', DEFAULT, DEFAULT);

COMMIT;
--------------------------------------------------------------
------------------------- 삭제 쿼리 모음 ------------------------
--------------------------------------------------------------
---- 01. 테이블
--DROP TABLE FOLLOWER;
--DROP TABLE FOLLOWING;
--DROP TABLE HEART;
--DROP TABLE PRODUCT;
--DROP TABLE PROMOTION;
--DROP TABLE CATEGORY;
--DROP TABLE BRAND;
--DROP TABLE MYPAGE_P_COLLECTION;
--DROP TABLE QNA;
--DROP TABLE REPLY;
--DROP TABLE SCHEDULE;
--DROP TABLE NOTICE;
--DROP TABLE MEMBER;
--
--
---- 02. 시퀀스
--DROP SEQUENCE SEQ_FOLLOWER_NO;
--DROP SEQUENCE SEQ_FOLLOWING_NO;
--DROP SEQUENCE SEQ_CATEGORY_NO;
--DROP SEQUENCE SEQ_H_HEART_NO;
--DROP SEQUENCE SEQ_MPC_CLT_NO;
--DROP SEQUENCE SEQ_PRODUCT_NO;
--DROP SEQUENCE SEQ_PROMOTION_NO;
--DROP SEQUENCE SEQ_MEM_MEMBER_NO;
--DROP SEQUENCE SEQ_QNA_NO;
--DROP SEQUENCE SEQ_REPLY_NO;
--DROP SEQUENCE SEQ_SCHEDULE_NO;
--DROP SEQUENCE SEQ_NOTICE_NO;