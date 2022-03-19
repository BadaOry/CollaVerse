-- PROMOTION 테이블과 PRODUCT 테이블, BRAND 테이블 '데이터' 삭제 후 다시 INSERT

--------------------------------------------------------------
---------------------- PROMOTION 테이블 -----------------------
--------------------------------------------------------------

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