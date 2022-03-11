-- 0311 PRODUCT 테이블 PRO_CONTENT (제품 설명) 수정 

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
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] 스티커세트_라이언/춘식이', '8000원', '짭조름한 새우깡 라이언 VS 달콤한 꿀꽈배기 춘식이! <p> 단짠 대결을 펼치는라이언, 춘식이의 모습을 담은 스티커예요. <p> 누구나 좋아하는 국민 과자와 만난 프렌즈를 스티커로 소장해보세요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] 에어팟프로케이스', '18000원', '귀여운 미니 사이즈 꿀꽈배기를 그대로 반영한 <p> 춘식이 에어팟 케이스예요.', '제한없음' ,'/resources/images/product/product', 1, 1);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[농심 X 카카오프렌즈] 스낵볼과 집게', '20000원', '집콕엔 빠질 수 없는 스낵 타임! <p> 스낵볼과 집게로 앙증맞은 플레이팅을 완성해보세요. <p> 새우로 변신한 라이언 스낵볼과 꿀벌로 변신한 춘식이 스낵볼에 과자를 담아서, <p> 아기 새우 집게와 아기 꿀벌 집게로 먹으면 맛과 재미가 두 배!', '제한없음' ,'/resources/images/product/product', 1, 1);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] 천하장사 오리지날 차렵이불 SS', '79000원', '보기만 해도 힘이 쏟는 귀여운 천하장사가 입체감있게 쏙- <p> 기분좋은 감촉과 기운찬 에너지가 가득한 천하장사 차렵이불 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] 천하장사 베개커버 50×70', '18000원', '아기자기 귀여운 소시지가 가득! <p> 기분좋은 감촉과 통통튀는 컬러감이 유니크한 베개 입니다.', '제한없음' ,'/resources/images/product/product', 1, 2);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[대구1988 × 천하장사] 천하장사 바디필로우 80×20', '39000원', '성인과 아이 모두 사용하기 편한 길이감으로 온가족이 함께 사용할 수 있어요.', '제한없음' ,'/resources/images/product/product', 1, 2);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[도프제이슨 X 렉슨] MINA 머쉬룸 램프 블랙 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, <p> 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[도프제이슨 X 렉슨] MINA 머쉬룸 램프 화이트 S', '80000원', '미나의 조명이 광택감 있는 카우하이드 레더에 반사되어, <p> 새로운 무드의 조명을 느낄 수 있는 제품입니다.', '제한없음' ,'/resources/images/product/product', 1, 3);

-- 문화 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] 피자헛 카트', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] 피자헛 코스튬', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[카트라이더 X 피자헛] 피자헛 풍선', '0원', '피자헛 고유 브랜드 컬러 ‘레드’를 활용해 제작된 콜라보 아이템', '제한없음' ,'/resources/images/product/product', 2, 4);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] 버섯집무드등', '99000원', '메이플스토리 친구들이 내 일상으로 찾아왔어요! <p> 귀여움으로 무장한 몬스터들의 심장폭격!! <p> 내 방을 환하게 밝혀줄 버섯집 무드등과 <p> 찰랑찰랑 주스 워터볼 키링을 만나보세요!', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] 메테오백', '59500원', '친환경 원단계의 인싸 타이벡과 메이플스토리의 귀여운 캐릭터가 만났다! <p> 포스트 코로나를 대비하여 최고급 캠핑 용품 하나씩 장만하시는 건 어때요?', '제한없음' ,'/resources/images/product/product', 2, 5);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[와디즈 X 메이플스토리] 댕블러', '29900원', '세상에서 가장 귀여운 댕블러가 메이플스토리와 함께 돌아왔습니다! <p> 물, 간식, 배변봉투를 한 손에! 반려견 산책 전용 올인원 텀블러', '제한없음' ,'/resources/images/product/product', 2, 5);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[노루페인트 X 테레사 프레이타스] 사진전 대인', '15000원', '어느 봄날, 테레사 프레이타스 사진전 대인(만 19세 이상)', '제한없음' ,'/resources/images/product/product', 2, 6);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[노루페인트 X 테레사 프레이타스] 사진전 소인', '13000원', '어느 봄날, 테레사 프레이타스 사진전 소인(48개월~만18세)', '제한없음' ,'/resources/images/product/product', 2, 6);

-- 식품 -- 
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] 몽쉘 생크림 설향딸기', '4750원', '부드러운 생크림 속에 딸기잼이 들어있는 제품으로, <p> 달콤한 초콜릿과 폭신한 케이크의 식감을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] 빼빼로 스트로베리', '1200원', '딸기 쿠키를 토핑했으며 막대 과자를 쌉싸름한 까망 비스킷으로 바꿔 <p> 딸기의 상큼한 맛을 더욱 돋워준다.', '제한없음' ,'/resources/images/product/product', 3, 7);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[롯데제과 X 에스더버니] 빈츠 딸기프로마쥬', '1890원', '바삭한 치즈 비스킷을 사용하여 상큼한 딸기초콜릿과 어우러져 <p> 이색적이면서도 조화로운 맛을 느낄 수 있다.', '제한없음' ,'/resources/images/product/product', 3, 7);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니] 초코 프렌치쿠키(소)', '14450원', '버터 풍미 가득한 시즌 한정 3가지 초코 프렌치 쿠키', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니]  미키미니 뚱카롱(4개입)', '10200원', '로즈라즈베리와 솔티드카라멜 두 가지 맛 위에 <p> 귀여운 미키미니 로고가 그려진 뚱카롱', '제한없음' ,'/resources/images/product/product', 3, 8);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[뚜레쥬르 X 디즈니]  미키미니 달콤 초코 만큼 사랑해', '17850원', '촉촉한 초코 시트 위에 봄브 딸기 크림과 <p> 새콤달콤한 딸기잼이 더해져 더욱 맛있는 미니 케이크', '제한없음' ,'/resources/images/product/product', 3, 8);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[설빙 X 켈로그] 첵스초코딸기설빙', '12900원', '첵스초코 특유의 고소하면서 진한 초코맛이 우유 얼음과 바닐라 아이스크림, 생딸기, <p> 초코 크런치, 생크림, 딸기 시럽, 시리얼 등과 어우러지며 맛의 시너지를 극대화했다.', '제한없음' ,'/resources/images/product/product', 3, 9);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[설빙 X 켈로그] 첵스초코스노우라떼', '4500원', '첵스초코스노우라떼는 초코우유와 우유 얼음, <p> 그 위에 첵스초코 시리얼을 풍성하게 토핑해 <p> 바삭한 식감이 재미있는 설빙 만의 아이스음료다.', '제한없음' ,'/resources/images/product/product', 3, 9);

-- 테크 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] 갤럭시 버즈2 메종 키츠네 에디션', '290000원', '우주를 담은 패키지를 풀며 새로운 모험을 시작해보세요. <p> 단순하면서도 대담한 디자인의 커스텀 가죽 케이스와 충전 케이블, <p> 그 속의 여우를 만날 수 있을 거예요.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] 갤럭시 워치4 메종 키츠네 에디션', '460000원', '두 개의 맞춤형 스트랩과 무선 충전기로 완벽한 워치 경험을 선사합니다. <p> 첫 번째 스트랩은 천체 패턴과 여우 모양의 펀칭 디테일이 돋보이는 <p> 문락 베이지 색상의 고무 밴드입니다. <p> 두 번째 스트랩은 스타더스트 그레이 색상의 가죽에 <p> 메종 키츠네 핸드라이팅 로고가 새겨져 있습니다.', '제한없음' ,'/resources/images/product/product', 4, 10);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[삼성 X 메종키츠네] 스포츠 스트랩', '53400원', '트와일라잇 바이올렛 컬러에 작은 여우 모양의 펀칭 디테일이 눈길을 사로잡죠. <p> 내구성이 뛰어난 불소고무 재질로 외부 활동이 많은 당신에게 딱입니다.', '제한없음' ,'/resources/images/product/product', 4, 10);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] WH-1000XM4 X CRT (후드티 PKG)', '449000원', '소니와 CRT의 협업 로고로 희소성을 더한 <p> 후드 티셔츠와 함께 매치할 수 있는 패키지. <p> 오버사이즈 핏 후드 티셔츠에 헤드폰을 더해 센스있는 룩을 완성해보자.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] WH-1000XM4 X CRT(티셔츠,비니 PKG)', '439000원', '헤드폰부터 비니, 반팔 티셔츠까지 데일리 룩을 단번에 완성할 수 있는 패키지. <p> 취향에 맞는 비니 컬러를 선택해 코디 포인트를 줄 수 있다.', '제한없음' ,'/resources/images/product/product', 4, 11);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[소니 X 캐피탈 라디오 튠즈] PS-LX310BT X CRT(슬리브 PKG)', '279000원', '클래식한 실루엣의 블루투스 턴테이블과 <p> LP 음반을 보호해주는 슬립매트로 구성한 패키지. <p> 협업 디자인이 더해져 특별함을 자아낸다.', '제한없음' ,'/resources/images/product/product', 4, 11);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] Snoopy Plush Case', '75000원', '마치 낮잠을 좋아하는 스누피를 위한 편안한 베개처럼! <p> 울트라 소프트 Plush 소재로 제작된 케이스를 만나보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] Peanuts Candy Airpods Pro', '35000원', '울트라 에코 케이스 및 크러쉬 케이스는 <p> 재활용 소재로 제작됨은 물론 100% 생분해 가능하답니다!', '제한없음' ,'/resources/images/product/product', 4, 12);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[케이스티파이 X 피너츠] Charlie Brown Good Grief Taffy Case', '65000원', '취향에 따라 고르는 컬러 및 캐릭터 디자인으로 나만의 개성을 표현해 보세요!', '제한없음' ,'/resources/images/product/product', 4, 12);

-- 패션 --
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] 잘자요 짱구 잠옷 PINK', '39900원', '잘자요 짱구 잠옷 PINK', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] 잘자요 짱구 잠옷 MINT', '39900원', '잘자요 짱구 잠옷 MINT', '제한없음' ,'/resources/images/product/product', 5, 13);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[스파오 X 짱구] 잘자요 짱구 잠옷 MIX', '39900원', '잘자요 짱구 잠옷 MIX', '제한없음' ,'/resources/images/product/product', 5, 13);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] EMBLEM COLOR MIX CREWNECK NAVY', '89000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] MADRAS PATCH WORK SHIRTS NAVY', '139000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[예일 × 벌스데이수트] EMBLEM KNIT VEST NAVY', '89000원', '과거의 규제와 억압의 상징이었던 <p> 1960년대 예일 유니버시티 20개의 복장 규정, <p> 벌스데이수트의 국왕 탄신일의 예복이라는 <p> 의미에서 영감받아 탄생한 협업컬렉션', '제한없음' ,'/resources/images/product/product', 5, 14);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 라벤더핑크 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 베이지 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '[로이드 × 로캐론] 어썸 블루 남성 레더 시계', '99000원', '로이드와 로캐론이 만나 NEW 어썸 스퀘어로 제안합니다. <p> 각기 다른 패턴의 매력적인 디자인을 만나보세요.', '제한없음' ,'/resources/images/product/product', 5, 15);