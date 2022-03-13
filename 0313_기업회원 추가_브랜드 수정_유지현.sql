-- MEMBER 테이블에 기업 회원 데이터 30명 삽입 쿼리 , BRAND 테이블 생성, 데이터 삽입 수정함.
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
    '콜라버스관리자', NULL, NULL, '(주)COLLAVERSE',
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
    '개인회원01', NULL, NULL, NULL,
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
    '개인회원02', NULL, NULL, NULL,
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
    '개인회원03', NULL, NULL, NULL,
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
    'BIRTHDAYSUIT', NULL, '11111111', 'BIRTHDAYSUIT(벌스데이수트)',
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
    'CAPITALRADIOTUNES', NULL, '22222222', 'CAPITAL RADIO TUNES(캐피탈라디오튠즈)',
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
    'CASETIFY', NULL, '33333333', 'CASETIFY(케이스티파이)',
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
    'CHEONHAJANGSA', NULL, '44444444', 'CHEONHAJANGSA(천하장사)',
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
    'CRAYONSHINCHAN', NULL, '55555555', 'CRAYON SHIN CHAN(짱구)',
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
    'DAEGU1988', NULL, '66666666', 'DAEGU 1988(대구 1988)',
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
    'DISNEY', NULL, '77777777', 'DISNEY(디즈니)',
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
    'DOFFJASON', NULL, '88888888', 'DOFFJASON(도프제이슨)',
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
    'ESTHERBUNNY', NULL, '99999999', 'ESTHER BUNNY(에스더버니)',
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
    'KAKAOFRIENDS', NULL, '10101010', 'KAKAO FRIENDS(카카오프렌즈)',
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
    'KARTRIDER', NULL, '1111111111', 'KARTRIDER(카트라이더)',
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
    'KELLOGG', NULL, '12121212', 'KELLOGG(켈로그)',
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
    'LEXON', NULL, '13131313', 'LEXON(렉슨)',
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
    'LLOYD', NULL, '13131313', 'LLOYD(로이드)',
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
    'LOCHCARRON', NULL, '15151515', 'LOCHCARRON(로캐론)',
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
    'LOTTECONF', NULL, '16161616', 'LOTTE CONF(롯데제과)',
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
    'MAISONKITSUNE', NULL, '17171717', 'MAISON KITSUNE(메종키츠네)',
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
    'MAPLESTORY', NULL, '18181818', 'MAPLE STORY(메이플스토리)',
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
    'NONGSHIM', NULL, '19191919', 'NONGSHIM(농심)',
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
    'NOROOPAINT', NULL, '20202020', 'NOROOPAINT(노루페인트)',
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
    'PEANUTS', NULL, '21212121', 'PEANUTS(피너츠)',
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
    'PIZZAHUTS', NULL, '22222222', 'PIZZA HUTS(피자헛)',
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
    'SAMSUNG', NULL, '23232323', 'SAMSUNG(삼성)',
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
    'SONY', NULL, '24242424', 'SONY(소니)',
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
    'SPAO', NULL, '25252525', 'SPAO(스파오)',
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
    'SULBING', NULL, '26262626', 'SULBING(설빙)',
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
    'TERESAFREITAS', NULL, '24242424', 'TERESA FREITAS(테레사 프레이타스)',
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
    'TOUSLESJOURS', NULL, '28282828', 'TOUSLESJOURS(뚜레쥬르)',
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
    'WADIZ', NULL, '29292929', 'WADIZ(와디즈)',
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
    'YALE', NULL, '30303030', 'YALE(예일)',
    DEFAULT, DEFAULT,
    DEFAULT, '0', 'woman'
);

COMMIT;

--04. MEMBER 의 ID 로 회원정보를 조회하는 쿼리
--SELECT * FROM MEMBER WHERE ID='admin' AND MEMBER_STATUS='Y';


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

-- 회원번호 외래키 설정하기 
COMMENT ON COLUMN BRAND.BR_MEMBER_NO IS '브랜드 번호'; -- MEMBER의 회원번호 참조
COMMENT ON COLUMN BRAND.BR_NAME IS '브랜드명';
COMMENT ON COLUMN BRAND.BR_CONTENT IS '브랜드 소개';
COMMENT ON COLUMN BRAND.BR_IMG_PATH IS '브랜드 이미지경로';
COMMENT ON COLUMN BRAND.BR_PMT_NO IS '프로모션 번호'; -- 브랜드별 진행중인 프로모션 가져오기 위함
-- 브랜드 데이터 추가 --

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    5, 'BIRTHDAYSUIT(벌스데이수트)', 
    '국왕 탄신일의 예복과 나체라는 이중적인 뜻을 지닌 단어에서 영감을 받아 <p> 어떠한 상징이 아닌 순수한 옷 자체와 살갗에 닿는 가장 좋은 느낌을 지향하는, <p> 촉감이 좋은 소재만을 엄선하여 만든 옷을 선보이는 브랜드입니다.', 
    '/resources/images/brand/brand', 14
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    6, 'CAPITAL RADIO TUNES(캐피탈라디오튠즈)', 
    '여유로운 도시의 라디오에서 흘러나오는 아날로그적 감성을 <P> 심플한 디자인의 의류에 고스란히 담은 브랜드입니다.', 
    '/resources/images/brand/brand', 11
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    7, 'CASETIFY(케이스티파이)', 
    '빠르게 변화하는 트렌드에 맞춰 퀄리티는 지키며 트렌디하고 유니크한 디자인을 더해 <p> 나만의 개성을 표현해주는 글로벌 테크액세서리 브랜드입니다.', 
    '/resources/images/brand/brand', 12
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    8, 'CHEONHAJANGSA(천하장사)', 
    '진주햄에서 1985년부터 생산 및 판매하는 혼합소시지 제품입니다.', 
    '/resources/images/brand/brand', 2
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    9, 'CRAYON SHIN CHAN(짱구)', 
    '1990년 8월에 나온 우스이 요시토의 연재 만화이다. <p> 이를 원작으로 한 애니메이션 짱구는 못말려는 <p> 한국에서도 1999년부터 방영되고 있는 장기 애니메이션 중 하나입니다.', 
    '/resources/images/brand/brand', 13
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    10, 'DAEGU 1988(대구 1988)', 
    '대구에서 1988년 시작한 침구 제조 업체에서 론칭한 침구 브랜드입니다.', 
    '/resources/images/brand/brand', 2
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    11, 'DISNEY(디즈니)', 
    '영화와 애니메이션, 픽사, 마블, 스타워즈, 내셔널 지오그래픽과 <p> 폭스의 영화, TV 프로그램 사업을 하고 있는 미디어, 엔터테인먼트 기업입니다.', 
    '/resources/images/brand/brand', 8
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    12, 'DOFFJASON(도프제이슨)', 
    '가죽이라는 소재에 대한 이해를 기반으로 레더 가먼츠를 중심으로 디자인하며 <p> 시대에 구애 받지 않는 스타일과 오래 입을수록 가치를 더하는 디자인을 추구하고, <p> 절제된 디테일과 뛰어난 퀄리티의 아이템을 합리적인 가격으로 선보이는 브랜드입니다.', 
    '/resources/images/brand/brand', 3
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    13, 'ESTHER BUNNY(에스더버니)', 
    '미국의 일러스트레이터 Esther kim에 의해 창작된 캐릭터 브랜드로 <p> LA와 도쿄, 서울을 오가면서 느낀 문화적 다양성에 영감을 받아 만들어졌으며, <p> 키치하고 스타일리시한 이미지로 전세계에서 사랑을 받고 있는 캐릭터입니다.', 
    '/resources/images/brand/brand', 7
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    14, 'KAKAO FRIENDS(카카오프렌즈)', 
    '카카오톡과 카카오스토리를 비롯한 카카오의 서비스에서 사용할 수 있는 <p> 이모티콘 캐릭터 그리고 카카오의 마스코트입니다.', 
    '/resources/images/brand/brand', 1
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    15, 'KARTRIDER(카트라이더)', 
    '로두마니 스튜디오가 개발하고 넥슨에서 서비스하는 레이싱 비디오 게임입니다.', 
    '/resources/images/brand/brand', 4
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    16, 'KELLOGG(켈로그)', 
    '미국의 다국적 기업으로, 시리얼, 과자, 쿠키, 크래커 등의 식품을 생산합니다.', 
    '/resources/images/brand/brand', 9
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    17, 'LEXON(렉슨)', 
    '프랑스 파리에 본사를 둔 렉슨은 1991년 설립된 디자인 생활용품 브랜드입니다. <p> 매 시즌 마다 세계 여러나라의 디자이너들과 협업으로 새롭고 독특한 디자인을 창조합니다.', 
    '/resources/images/brand/brand', 3
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    18, 'LLOYD(로이드)', 
    'British Modern 컨셉의 차별화된 디자인의 Jewelry와 <p> 클래식한 시계를 합리적인 가격으로 선보이며, <p> 국내 쥬얼리 기프트 선두 브랜드로 자리잡았습니다.', 
    '/resources/images/brand/brand', 15
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    19, 'LOCHCARRON(로캐론)', 
    '1892년 스코틀랜드 셀커크 지역에 설립 되었으며, <p> 700가지가 넘는 타탄 패턴을 보유하며 <p> 왕족의 행사에 다양한 패턴을 납품하는 전통적인 브랜드입니다.', 
    '/resources/images/brand/brand', 15
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    20, 'LOTTE CONF(롯데제과)', 
    '대한민국 롯데그룹 계열 과자류 생산업체이며 글로벌 식품 리빙 브랜드입니다.', 
    '/resources/images/brand/brand', 7
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    21, 'MAISON KITSUNE(메종키츠네)', 
    '길다 로엑(Gildas Loaec)과 마사야 쿠로키(Masaya Kuroki)에 의해 2002년 프랑스 파리에서 만들어진 브랜드로 <p> 매 시즌 파리와 도쿄에서 영감을 받아 현대적인 결과물들을 선보입니다.', 
    '/resources/images/brand/brand', 10
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    22, 'MAPLE STORY(메이플스토리)', 
    '위젯 스튜디오에서 제작하고 넥슨 코리아가 서비스하는 세계 최초의 2D 사이드 스크롤 방식 온라인 게임입니다.', 
    '/resources/images/brand/brand', 5
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    23, 'NONGSHIM(농심)', 
    '창립 이후 50여 년 동안 한국의 식문화를 이끌어온 식품 전문기업입니다.', 
    '/resources/images/brand/brand', 1
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    24, 'NOROOPAINT(노루페인트)', 
    '사람과 자연을 향하는 컬러서비스 전문기업입니다.', 
    '/resources/images/brand/brand', 6
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    25, 'PEANUTS(피너츠)', 
    '찰스 먼로 슐츠가 그린 미국의 만화 및 만화를 원작으로 하는 애니메이션으로 <p> 찰리 브라운과 반려견 스누피를 중심으로 한 캐릭터들이 <p> 귀여운 겉모습과 어울리지 않는 초현실적인 인생관을 전개하는 개그 만화입니다.', 
    '/resources/images/brand/brand', 12
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    26, 'PIZZA HUTS(피자헛)', 
    '미국의 피자 프랜차이즈로 피자헛의 헛(Hut)은 오두막(Hut)이라는 뜻으로 피자 오두막 이라는 뜻이기도 합니다.', 
    '/resources/images/brand/brand', 4
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    27, 'SAMSUNG(삼성)', 
    '삼성전자는 반도체와 전자 제품, 통신 장비 등을 제조하는 세계 브랜드 가치 6위의 대한민국 기업이다.', 
    '/resources/images/brand/brand', 10
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    28, 'SONY(소니)', 
    '소니그룹의 전자제품 자회사이자 중간지주회사이며 <p> 소니의 전자제품 분야, 더 자세하게는 이미징 제품, 가전 및 오디오, 모바일 제품 등의 개발, 생산, 판매를 담당합니다.', 
    '/resources/images/brand/brand', 11
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    29, 'SPAO(스파오)', 
    '좋은 소재와 기본에 충실하면서도 트렌디한 디자인으로 <p> 남녀노소 누구나 일상 속에서 편안하게 입을 수 있는 <p> 패션 라이프를 제안하는 국내 최초 글로벌 SPA 브랜드입니다.', 
    '/resources/images/brand/brand', 13
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    30, 'SULBING(설빙)', 
    '대한민국의 프랜차이즈 기업으로 디저트 카페 가맹업을 운영하고 있으며, <p> 판매하는 주요 상품은 빙수류, 차, 토스트 등이다.', 
    '/resources/images/brand/brand', 9
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    31, 'TERESA FREITAS(테레사 프레이타스)', 
    '풍경, 정물을 매체로 사진, 영상, 스톱 모션 등으로 표현하는 <p> 예술적이고 창의적인 접근 방식을 가진 사진 작가로 <p> 꿈 속 세계같은 파스텔톤 사진들로 많은 사랑을 받고 있습니다. <p> 다양한 브랜드와의 협업도 꾸준히 진행하고 있습니다.', 
    '/resources/images/brand/brand', 6
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    32, 'TOUSLESJOURS(뚜레쥬르)', 
    '대한민국 CJ푸드빌에서 운영하고 있는 베이커리 프랜차이즈 브랜드이며 <p> 매장에서 빵, 케이크, 음료, 잼 등을 판매합니다.', 
    '/resources/images/brand/brand', 8
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    33, 'WADIZ(와디즈)', 
    '대한민국의 크라우드펀딩 플랫폼 기업입니다. <p> 와디즈는 증권형 크라우드펀딩 과 보상형 크라우드펀딩 을 운영하고 있으며, <p> 스타트업과 문화 콘텐츠를 시작으로 식품, 여행 등 펀딩 카테고리를 확장하고 있습니다.', 
    '/resources/images/brand/brand', 5
);

INSERT INTO BRAND (
    BR_MEMBER_NO, BR_NAME, 
    BR_CONTENT, BR_IMG_PATH, BR_PMT_NO
) VALUES(
    34, 'YALE(예일)', 
    '미국 명문 사립대학 예일대학교(Yale University)의 시그니처 패션을 선보이는 브랜드입니다. <p> 예일대학교의 시그니처 로고는 아이비리그 룩과 프레피 룩을 논할 때 빼놓을 수 없는 아이콘으로 <p> 빈티지 웨어에 중요한 부분을 차지하고 있습니다.', 
    '/resources/images/brand/brand', 14
);

COMMIT;

--03. BRAND 테이블 삭제 쿼리
-- DROP TABLE BRAND;