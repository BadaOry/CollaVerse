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
    MEMBER_GENDER VARCHAR2(200) DEFAULT '여' CONSTRAINT MEM_MEMBER_GENDER_CH CHECK(MEMBER_GENDER IN('여', '남'))
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
-- * 시퀀스 명 수정했습니다. 
CREATE SEQUENCE SEQ_MEM_MEMBER_NO;

--04. 시퀀스 삭제 쿼리
--DROP SEQUENCE SEQ_MEM_MEMBER_NO;

COMMIT;


--------------------------------------------------------------
---------------------- MEMBER 관련 쿼리문 ----------------------
--------------------------------------------------------------
--01. 관리자 데이터 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, 
    MEMBER_ROLE, 
    ID, 
    PASSWORD,
    EMAIL, 
    PHONE, 
    NICKNAME, 
    PROFILE_IMG, 
    BUSINESS_NO, 
    BUSINESS_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE,
    MEMBER_STATUS,
    MEMBER_AGE,
    MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, 
    '관리자', 
    'admin', 
    '1111',
    'admin@collaverse.co.kr', 
    '010-4113-2023',
    '콜라버스관리자',
    NULL,
    NULL,
    '(주)COLLAVERSE',
    DEFAULT,
    DEFAULT,
    DEFAULT,
    '20',
    DEFAULT
);


--02. 개인 회원 데이터 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, 
    '개인', 'member1', '1111', 'member1@collaverse.co.kr', '010-1111-1111',
    '개인회원1', NULL, NULL, NULL,
    DEFAULT, DEFAULT,
    DEFAULT, '20', DEFAULT
);

--03. 기업 회원 데이터 삽입 쿼리
INSERT INTO MEMBER (
    MEMBER_NO, MEMBER_ROLE, ID, PASSWORD,EMAIL, PHONE, 
    NICKNAME, PROFILE_IMG, BUSINESS_NO, BUSINESS_NAME, 
    ENROLL_DATE, MODIFY_DATE,
    MEMBER_STATUS, MEMBER_AGE, MEMBER_GENDER
) VALUES(
    SEQ_MEM_MEMBER_NO.NEXTVAL, 
    '기업', 'brand1', '1111', 'brand1@collaverse.co.kr', '010-1111-1111',
    '기업회원1', NULL, '11111111', '브랜드데스',
    DEFAULT, DEFAULT,
    DEFAULT, '0', DEFAULT
);

COMMIT;


--04. MEMBER 의 ID 로 회원정보를 조회하는 쿼리
--SELECT * FROM MEMBER WHERE ID='admin' AND MEMBER_STATUS='Y';




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
    CLT_IMG_02_ONAME VARCHAR2(200),
    CLT_IMG_03_ONAME VARCHAR2(200),
    CLT_IMG_04_ONAME VARCHAR2(200),
    CLT_IMG_05_ONAME VARCHAR2(200),
    CLT_IMG_06_ONAME VARCHAR2(200),
    CLT_IMG_01_RNAME VARCHAR2(200) CONSTRAINT MPC_CLT_IMG_01_RNN NOT NULL,
    CLT_IMG_02_RNAME VARCHAR2(200),
    CLT_IMG_03_RNAME VARCHAR2(200),
    CLT_IMG_04_RNAME VARCHAR2(200),
    CLT_IMG_05_RNAME VARCHAR2(200),
    CLT_IMG_06_RNAME VARCHAR2(200),

    CONSTRAINT MPC_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_NO IS '컬렉션게시글번호';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_CONTENT IS '컬렉션내용';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_CREATE_DATE IS '작성일';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_MODIFY_DATE IS '수정일';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_STATUS IS '상태값(공개Y/비공개P/삭제N)';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_01_ONAME IS '컬렉션사진01_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_02_ONAME IS '컬렉션사진02_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_03_ONAME IS '컬렉션사진03_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_04_ONAME IS '컬렉션사진04_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_05_ONAME IS '컬렉션사진05_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_06_ONAME IS '컬렉션사진06_원본명';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_01_RNAME IS '컬렉션사진01_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_02_RNAME IS '컬렉션사진02_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_03_RNAME IS '컬렉션사진03_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_04_RNAME IS '컬렉션사진04_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_05_RNAME IS '컬렉션사진05_바꾼이름';
COMMENT ON COLUMN MYPAGE_P_COLLECTION.CLT_IMG_06_RNAME IS '컬렉션사진06_바꾼이름';

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


-- 03. ★ 컬렉션 작성 쿼리 : 컬렉션 10개 삽입
BEGIN 
    FOR N IN 1..10
    LOOP
        INSERT INTO MYPAGE_P_COLLECTION VALUES (
    SEQ_MPC_CLT_NO.NEXTVAL, '1', 
    '컬렉션 작성 쿼리 - 내용', DEFAULT, DEFAULT,
    DEFAULT,
    'O1', 'O2', 'O3', 'O4', 'O5', 'O6',
    'R1', 'R2', 'R3', 'R4', 'R5', 'R6');
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;


-- 04. 컬렉션 내용 & 이미지 & 공개여부 수정 쿼리
UPDATE MYPAGE_P_COLLECTION SET CLT_CONTENT='컬렉션 수정 쿼리 - 수정 내용', 
                                CLT_MODIFY_DATE=SYSDATE,
                                CLT_IMG_01_ONAME='O1-수정', 
                                CLT_IMG_02_ONAME='O2-수정', 
                                CLT_IMG_03_ONAME='O3-수정', 
                                CLT_IMG_04_ONAME='O4-수정', 
                                CLT_IMG_05_ONAME='O5-수정', 
                                CLT_IMG_06_ONAME='O6-수정', 
                                CLT_IMG_01_RNAME='R1-수정', 
                                CLT_IMG_02_RNAME='R2-수정', 
                                CLT_IMG_03_RNAME='R3-수정', 
                                CLT_IMG_04_RNAME='R4-수정',
                                CLT_IMG_05_RNAME='R5-수정',
                                CLT_IMG_06_RNAME='R6-수정'
                                ,CLT_STATUS='P'
                            WHERE CLT_NO IN ('2','4','5','6');


-- 05. 컬렉션 삭제 쿼리
UPDATE MYPAGE_P_COLLECTION SET CLT_STATUS='N'
                           WHERE CLT_NO='3';
                           
COMMIT;


-- 06. 컬렉션 상세 조회 쿼리
--SELECT CLT_NO, MPC.MEMBER_NO, CLT_CONTENT, CLT_CREATE_DATE, CLT_MODIFY_DATE,
--       CLT_IMG_01_RNAME, CLT_IMG_02_RNAME, CLT_IMG_03_RNAME, CLT_IMG_04_RNAME,
--       CLT_STATUS
--FROM MYPAGE_P_COLLECTION MPC
--JOIN MEMBER M ON (MPC.MEMBER_NO = M.MEMBER_NO)
--WHERE CLT_STATUS IN ('Y', 'P') AND CLT_NO='1';


-- 07. 회원 id 로 컬렉션 찾기
SELECT M.ID, MPC.CLT_NO, MPC.CLT_STATUS
FROM MYPAGE_P_COLLECTION MPC
JOIN MEMBER M ON (MPC.MEMBER_NO = M.MEMBER_NO)	
WHERE M.ID = 'admin';



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


--02. PROMOTION 시퀀스 생성
CREATE SEQUENCE SEQ_PROMOTION_NO;


--03. PROMOTION 테이블 삭제 쿼리
--DROP TABLE PROMOTION;


--04. PROMOTION 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_PROMOTION_NO;


--05. 프로모션 데이터 추가 쿼리
-- 리빙 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '농심 X 카카오프렌즈', '/resources/images/promotion/promotion', '자꾸만 손이 가는 단짠 콜라보 새우깡으로 변신한 라이언과 꿀꽈배기로 변신한 춘식이! 달콤하고 짭조름한 스낵에 푹 빠진 카카오프렌즈! 국민 대표 스낵 새우깡으로 변신한 라이언과 스낵 꿀꽈배기로 변신한 춘식이를 만나보세요.', DEFAULT, to_date('22/01/20','RR/MM/DD'), NULL, NULL, 1);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '대구1988 × 천하장사', '/resources/images/promotion/promotion', '30년 이상의 전통을 가진 천하장사와 대구 1988이 만났습니다. 건강하고 즐거운 잠을 위한 소시지 침구를 만나보세요', DEFAULT, to_date('22/02/21','RR/MM/DD'),to_date('22/03/07','RR/MM/DD'), NULL, 1);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '도프제이슨 X 렉슨', '/resources/images/promotion/promotion', '렉슨의 시그니처 아이템 중 하나인 미나 머쉬룸 램프를 도프제이슨만의 시크한 감각으로 재해석해 선보인다.', DEFAULT, to_date('22/01/27','RR/MM/DD'), NULL, NULL, 1);

-- 문화 -- 
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '카트라이더 X 피자헛', '/resources/images/promotion/promotion', '한국피자헛이 넥슨 모바일 레이싱 게임 카트라이더 러쉬플러스와 콜라보를 통해 한정판 아이템을 담은 ‘카러플팩’을 선보였다. 이번 특별 콜라보는 피자헛의 주요 고객층 중 하나인 MZ 세대에게 색다른 재미를 제공하기 위해 마련됐다.', DEFAULT, to_date('22/01/25','RR/MM/DD'), to_date('22/02/27','RR/MM/DD'), NULL, 2);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '와디즈 X 메이플스토리', '/resources/images/promotion/promotion', '넥슨이 크라우드펀딩 플랫폼인 와디즈와 함께 진행하는 팬즈메이커(FANZ MAKER) 프로젝트로 메이플스토리 편의 제품 22종을 공개하고 펀딩을 시작한다. 주요 캐릭터인 ‘핑크빈’, ‘예티’, ‘돌의정령’, ‘주황버섯’, ‘슬라임’을 디자인에 활용한 일상 제품부터 특별한 용도를 지녀 소비자의 취향을 저격할 제품까지 라인업이 풍성하다.', DEFAULT, to_date('22/02/21','RR/MM/DD'), to_date('22/03/07','RR/MM/DD'), NULL, 2);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '노루페인트 X 테레사 프레이타스 사진전', '/resources/images/promotion/promotion', '노루페인트가 세계 최초 테레사 프레이타스 사진전에 친환경 페인트와 프리미엄 페인트를 지원한다. 노루페인트는 사진전 주제인 어느 봄날에 맞춰 봄 감성을 느낄 수 있는 파스텔 톤을 활용해 공간을 연출했다.', DEFAULT, to_date('22/01/29','RR/MM/DD'), to_date('22/04/24','RR/MM/DD'), NULL, 2);

-- 식품 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '롯데제과 X 에스더버니', '/resources/images/promotion/promotion', '﻿롯데제과가 봄 시즌을 앞두고 에스더버니 캐릭터를 활용한 시즌 기획 제품을 선보였다. 이번 제품은 봄철 대표 과일인 딸기를 주원료로 사용한 시즌 기획 한정판 제품으로 요즘 2030 여성층에게 인기가 높은 캐릭터 ‘에스더버니’와 컬래버를 통해 분홍색 패키지에 귀여운 캐릭터를 삽입해 제품에 대한 선호도를 높였다.', DEFAULT, to_date('22/02/14','RR/MM/DD'), NULL, NULL, 3);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '뚜레쥬르 X 디즈니', '/resources/images/promotion/promotion', '뚜레쥬르가 이번 밸런타인 시즌 동안 선보이는 제품은 남녀노소 누구나 사랑하는 ‘미키, 미니’ 캐릭터의 경쾌한 색감과 생동감 넘치는 표정으로 완성한 사랑스러운 비주얼이 돋보인다.', DEFAULT, to_date('22/02/07','RR/MM/DD'), NULL, NULL, 3);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '설빙 X 켈로그', '/resources/images/promotion/promotion', '코리안 디저트 카페 설빙과 글로벌 시리얼 브랜드 켈로그와의 두 번째 협업으로 한층 더 업그레이드된 콜라보 신메뉴를 선보인다. ', DEFAULT, to_date('22/02/23','RR/MM/DD'), NULL, NULL, 3);

-- 테크 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '삼성 X 메종키츠네', '/resources/images/promotion/promotion', '메종 키츠네의 신비로운 상징, 여우가 자연스럽게 갤럭시 안으로 스며들었습니다. 갤럭시 워치4와 버즈2 메종 키츠네 에디션은 깔끔하고도 미래지향적인 미학을 담고 있습니다.', DEFAULT, to_date('21/11/10','RR/MM/DD'), NULL, NULL, 4);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '소니 X 캐피탈 라디오 튠즈', '/resources/images/promotion/promotion', '21 F/W 시즌 키 아이템으로 떠오르고 있는 헤드폰. 후드, 비니와 함께 매치하는 스타일 트렌드를 반영해 음악이라는 테마 아래 소니 x CRT 협업 한정판 어패럴을 선보인다.', DEFAULT, to_date('21/10/13','RR/MM/DD'), NULL, NULL, 4);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '케이스티파이 X 피너츠', '/resources/images/promotion/promotion', '﻿Peanuts x CASETiFY 레트로 캔디샵으로 여러분을 초대합니다! 스누피를 비롯한 피너츠 패밀리의 아이코닉한 캐릭터들이 등장하는 다채로운 디자인을 선보이는 컬렉션으로 여러분의 일상을 더욱 달콤하게 만들어 줄 거랍니다!', DEFAULT, to_date('21/01/28','RR/MM/DD'), NULL, NULL, 4);

-- 패션 --
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '스파오 X 짱구', '/resources/images/promotion/promotion', '22SS 봄 신상 꿀잠 파자마(짱구)', DEFAULT, to_date('22/02/21','RR/MM/DD'), NULL, NULL, 5);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '예일 × 벌스데이수트', '/resources/images/promotion/promotion', '과거 예일의 신입생 복장 규정이라는 YALE UNIVERSITY’S 20- ARTICLE DRESS CODE를 현대적으로 재해석하여 위트 있게 표현한 예일 × 벌스데이수트 22 S/S 협업 컬렉션 한정 발매되었다.', DEFAULT, to_date('22/02/18','RR/MM/DD'), to_date('22/02/25','RR/MM/DD'), NULL, 5);
INSERT INTO PROMOTION VALUES(SEQ_PROMOTION_NO.NEXTVAL, '로이드 × 로캐론', '/resources/images/promotion/promotion', '영국 앨리자베스 여왕이 사랑하는 패턴, 로캐론의 타탄 패턴을 로이드만의 감각적인 감성을 담아 제작했습니다. 시그니처 시계, 웨어러블 스트랩 과 로캐론 패턴의 콜라보를 만나보세요.', DEFAULT, to_date('22/02/23','RR/MM/DD'), to_date('22/03/08','RR/MM/DD'), NULL, 5);




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


--03. PRODUCT 테이블 삭제 쿼리
-- DROP TABLE PRODUCT;


--04. PRODUCT 시퀀스 삭제 쿼리
-- DROP SEQUENCE SEQ_PRODUCT_NO;

--05. PRODUCT 데이터 추가 --
-- 리빙 -- 
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '농심 X 카카오프렌즈 스티커세트_라이언/춘식이', '8000원', '짭조름한 새우깡 라이언 VS 달콤한 꿀꽈배기 춘식이! 단짠 대결을 펼치는라이언, 춘식이의 모습을 담은 스티커예요. 누구나 좋아하는 국민 과자와 만난 프렌즈를 스티커로 소장해보세요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '농심 X 카카오프렌즈 에어팟프로케이스', '18000원', '귀여운 미니 사이즈 꿀꽈배기를 그대로 반영한 춘식이 에어팟 케이스예요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '농심 X 카카오프렌즈 스낵볼과 집게', '20000원', '집콕엔 빠질 수 없는 스낵 타임! 스낵볼과 집게로 앙증맞은 플레이팅을 완성해보세요. 새우로 변신한 라이언 스낵볼과 꿀벌로 변신한 춘식이 스낵볼에 과자를 담아서, 아기 새우 집게와 아기 꿀벌 집게로 먹으면 맛과 재미가 두 배!', '제한없음' ,'/resources/images/product/product', 1, 1);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '대구1988 × 천하장사 천하장사 오리지날 차렵이불 SS', '79000원', '보기만 해도 힘이 쏟는 귀여운 천하장사가 입체감있게 쏙- 기분좋은 감촉과 기운찬 에너지가 가득한 천하장사 차렵이불 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '대구1988 × 천하장사 천하장사 베개커버 50×70', '18000원', '아기자기 귀여운 소시지가 가득! 기분좋은 감촉과 통통튀는 컬러감이 유니크한 베개 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '대구1988 × 천하장사 천하장사 바디필로우 80×20', '39000원', '성인과 아이 모두 사용하기 편한 길이감으로 온가족이 함께 사용할 수 있어요.', '제한없음' ,'/resources/images/product/product', 1, 2);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '도프제이슨 X 렉슨 MINA 머쉬룸 램프 블랙 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '도프제이슨 X 렉슨 MINA 머쉬룸 램프 화이트 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);

-- 문화 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '카트라이더 X 피자헛 피자헛 카트', 'NULL', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '카트라이더 X 피자헛 피자헛 코스튬', 'NULL', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '카트라이더 X 피자헛 피자헛 풍선', 'NULL', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '와디즈 X 메이플스토리 버섯집무드등', '99000원', '메이플스토리 친구들이 내 일상으로 찾아왔어요! 귀여움으로 무장한 몬스터들의 심장폭격!! 내 방을 환하게 밝혀줄 버섯집 무드등과 찰랑찰랑 주스 워터볼 키링을 만나보세요!', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '와디즈 X 메이플스토리 메테오백', '59500원', '친환경 원단계의 인싸 타이벡과 메이플스토리의 귀여운 캐릭터가 만났다! 포스트 코로나를 대비하여 최고급 캠핑 용품 하나씩 장만하시는 건 어때요?', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '와디즈 X 메이플스토리 댕블러', '29900원', '세상에서 가장 귀여운 댕블러가 메이플스토리와 함께 돌아왔습니다! 물, 간식, 배변봉투를 한 손에! 반려견 산책 전용 올인원 텀블러', '제한없음' ,'/resources/images/product/product', 2, 5);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '노루페인트 X 테레사 프레이타스 사진전 대인', '15000원', '어느 봄날, 테레사 프레이타스 사진전 대인(만 19세 이상)', '제한없음' ,'/resources/images/product/product', 2, 6);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '노루페인트 X 테레사 프레이타스 사진전 소인', '13000원', '어느 봄날, 테레사 프레이타스 사진전 소인(48개월~만18세)', '제한없음' ,'/resources/images/product/product', 2, 6);

-- 식품 -- 
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데제과 X 에스더버니 몽쉘 생크림 설향딸기', '4750원', '부드러운 생크림 속에 딸기잼이 들어있는 제품으로, 달콤한 초콜릿과 폭신한 케이크의 식감을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데제과 X 에스더버니 빼빼로 스트로베리', '1200원', '딸기 쿠키를 토핑했으며 막대 과자를 쌉싸름한 까망 비스킷으로 바꿔 딸기의 상큼한 맛을 더욱 돋워준다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데제과 X 에스더버니 빈츠 딸기프로마쥬', '1890원', '바삭한 치즈 비스킷을 사용하여 상큼한 딸기초콜릿과 어우러져 이색적이면서도 조화로운 맛을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '뚜레쥬르 X 디즈니 초코 프렌치쿠키(소)', '14450원', '버터 풍미 가득한 시즌 한정 3가지 초코 프렌치 쿠키', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '뚜레쥬르 X 디즈니 미키미니 뚱카롱(4개입)', '10200원', '로즈라즈베리와 솔티드카라멜 두 가지 맛 위에 귀여운 미키미니 로고가 그려진 뚱카롱', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '뚜레쥬르 X 디즈니 미키미니 달콤 초코 만큼 사랑해', '17850원', '촉촉한 초코 시트 위에 봄브 딸기 크림과 새콤달콤한 딸기잼이 더해져 더욱 맛있는 미니 케이크', '제한없음' ,'/resources/images/product/product', 3, 8);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '설빙 X 켈로그 첵스초코딸기설빙', '12900원', '첵스초코 특유의 고소하면서 진한 초코맛이 우유 얼음과 바닐라 아이스크림, 생딸기, 초코 크런치, 생크림, 딸기 시럽, 시리얼 등과 어우러지며 맛의 시너지를 극대화했다.', '제한없음' ,'/resources/images/product/product', 3, 9);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '설빙 X 켈로그 첵스초코스노우라떼', '4500원', '첵스초코스노우라떼는 초코우유와 우유 얼음, 그 위에 첵스초코 시리얼을 풍성하게 토핑해 바삭한 식감이 재미있는 설빙 만의 아이스음료다.', '제한없음' ,'/resources/images/product/product', 3, 9);

-- 테크 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '삼성 X 메종키츠네 갤럭시 버즈2 메종 키츠네 에디션', '290000원', '우주를 담은 패키지를 풀며 새로운 모험을 시작해보세요. 단순하면서도 대담한 디자인의 커스텀 가죽 케이스와 충전 케이블, 그 속의 여우를 만날 수 있을 거예요.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '삼성 X 메종키츠네 갤럭시 워치4 메종 키츠네 에디션', '460000원', '두 개의 맞춤형 스트랩과 무선 충전기로 완벽한 워치 경험을 선사합니다. 첫 번째 스트랩은 천체 패턴과 여우 모양의 펀칭 디테일이 돋보이는 문락 베이지 색상의 고무 밴드입니다. 두 번째 스트랩은 스타더스트 그레이 색상의 가죽에 메종 키츠네 핸드라이팅 로고가 새겨져 있습니다.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '삼성 X 메종키츠네 스포츠 스트랩', '53400원', '트와일라잇 바이올렛 컬러에 작은 여우 모양의 펀칭 디테일이 눈길을 사로잡죠. 내구성이 뛰어난 불소고무 재질로 외부 활동이 많은 당신에게 딱입니다.', '제한없음' ,'/resources/images/product/product', 4, 10);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '소니 X 캐피탈 라디오 튠즈 WH-1000XM4 X CRT (후드티 PKG)', '449000원', '소니와 CRT의 협업 로고로 희소성을 더한 후드 티셔츠와 함께 매치할 수 있는 패키지. 오버사이즈 핏 후드 티셔츠에 헤드폰을 더해 센스있는 룩을 완성해보자.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '소니 X 캐피탈 라디오 튠즈 WH-1000XM4 X CRT(티셔츠,비니 PKG)', '439000원', '헤드폰부터 비니, 반팔 티셔츠까지 데일리 룩을 단번에 완성할 수 있는 패키지. 취향에 맞는 비니 컬러를 선택해 코디 포인트를 줄 수 있다.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '소니 X 캐피탈 라디오 튠즈 PS-LX310BT X CRT(슬리브 PKG)', '279000원', '클래식한 실루엣의 블루투스 턴테이블과 LP 음반을 보호해주는 슬립매트로 구성한 패키지. 협업 디자인이 더해져 특별함을 자아낸다.', '제한없음' ,'/resources/images/product/product', 4, 11);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '케이스티파이 X 피너츠 Snoopy Plush Case', '75000원', '마치 낮잠을 좋아하는 스누피를 위한 편안한 베개처럼! 울트라 소프트 Plush 소재로 제작된 케이스를 만나보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '케이스티파이 X 피너츠 Peanuts Candy Airpods Pro', '35000원', '울트라 에코 케이스 및 크러쉬 케이스는 재활용 소재로 제작됨은 물론 100% 생분해 가능하답니다!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '케이스티파이 X 피너츠 Charlie Brown Good Grief Taffy Case', '65000원', '취향에 따라 고르는 컬러 및 캐릭터 디자인으로 나만의 개성을 표현해 보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);

-- 패션 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '스파오 X 짱구 잘자요 짱구 잠옷 PINK', '39900원', '잘자요 짱구 잠옷 PINK', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '스파오 X 짱구 잘자요 짱구 잠옷 MINT', '39900원', '잘자요 짱구 잠옷 MINT', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '스파오 X 짱구 잘자요 짱구 잠옷 MIX', '39900원', '잘자요 짱구 잠옷 MIX', '제한없음' ,'/resources/images/product/product', 5, 13);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '예일 × 벌스데이수트 EMBLEM COLOR MIX CREWNECK NAVY', '89000원', '과거의 규제와 억압의 상징이었던 1960년대 예일 유니버시티 20개의 복장 규정, 벌스데이수트의 국왕 탄신일의 예복이라는 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '예일 × 벌스데이수트 MADRAS PATCH WORK SHIRTS NAVY', '139000원', '과거의 규제와 억압의 상징이었던 1960년대 예일 유니버시티 20개의 복장 규정, 벌스데이수트의 국왕 탄신일의 예복이라는 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '예일 × 벌스데이수트 EMBLEM KNIT VEST NAVY', '89000원', '과거의 규제와 억압의 상징이었던 1960년대 예일 유니버시티 20개의 복장 규정, 벌스데이수트의 국왕 탄신일의 예복이라는 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '로이드 × 로캐론 어썸 라벤더핑크 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. 각기 다른 패턴의 매력적인 디자인을 만나보세요. ', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '로이드 × 로캐론 어썸 베이지 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. 각기 다른 패턴의 매력적인 디자인을 만나보세요. ', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '로이드 × 로캐론 어썸 블루 남성 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. 각기 다른 패턴의 매력적인 디자인을 만나보세요. ', '제한없음' ,'/resources/images/product/product', 5, 15);


--------------------------------------------------------------
------------------------ BRAND 테이블 -------------------------
--------------------------------------------------------------
--01. BRAND 테이블 생성 + 주석
CREATE TABLE BRAND (
    BR_NAME VARCHAR2(50),
    BR_GROUP VARCHAR2 (20),
    MEMBER_NO NUMBER(10)
);

-- 회원번호 외래키 설정하기 

COMMENT ON COLUMN BRAND.BR_NAME IS '카테고리번호';
COMMENT ON COLUMN BRAND.BR_GROUP IS '카테고리명';
COMMENT ON COLUMN BRAND.MEMBER_NO IS '회원번호';

-- 브랜드 데이터 추가 --

COMMIT;
