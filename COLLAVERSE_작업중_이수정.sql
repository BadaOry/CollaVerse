-- 01. MEMBER 테이블 생성--

CREATE TABLE MEMBER (
	MEMBER_NO NUMBER PRIMARY KEY);
    
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원 번호';

CREATE SEQUENCE SEQ_MEMBER_NO;

COMMIT;


--DROP TABLE MEMBER;
--DROP SEQUENCE SEQ_MEMBER_NO;

-- 테스트용 더미
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL);

-------------------------------------------
----- 마이페이지_개인회원_컬렉션 테이블 생성 -----
-------------------------------------------


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
