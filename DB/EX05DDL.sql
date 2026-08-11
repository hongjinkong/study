-- DDL : DATA DEFINITION LANGUAGES 데이터 정의어
-- CREATE : 새로운 객체를 생성할때 사용하는 명령어

-- 기존의 EMPLOYEES 테이블을 한글버전으로 생성
-- 테이블 정보 조회 : 원하는 테이블 명 드래그 -> SHIFT+F4

CREATE TABLE 직원(
        -- 컬러명 자료형(크기) [기본값] [NULL 여부]
        직원ID NUMBER(6,0) NOT NULL,
        이름 VARCHAR2(20),
        성 VARCHAR2(25) NOT NULL,
        이메일 VARCHAR(25) NOT NULL,
        핸드폰 VARCHAR(20),
        입사일 DATE NOT NULL,
        직업ID VARCHAR(10) NOT NULL,
        급여 NUMBER(8,2),
        커미션비율 NUMBER(2,2),
        매니저ID NUMBER(6,0),
        부서ID NUMBER(4)
);

-- DEPARTMENTS 테이블을 한글 버젼으로 바꾸기
CREATE TABLE 부서(
        부서ID NUMBER(4,0) NOT NULL,
        부서이름 VARCHAR2(30) NOT NULL,
        매니저ID NUMBER(6,0),
        위치ID NUMBER(4,0)
);

-- 제약조건
-- PROMARY KEY(PK) : NOT NULL + 중복불가 -> 식별자를 물리적 모델링
-- UNIQUE (UK) : NULL은 가능, 중복 불가능 -> EX) 본인인증
-- CHECK : 지정된 데이터만 입력 가능 
-- FOREIGN KEY(FK) : 외래키, 두 테이블을 연결하는 키
   -- 다른 테이블의 기본키를 참조
   
-- 제약조건 추가 문법
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건 (컬럼)

-- PK 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_직원ID_PK PRIMARY KEY(직원ID);

-- UK 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_이메일_UK UNIQUE(이메일);

-- CHECK 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_급여_CK CHECK(급여>0);

--제약조건 삭제
ALTER TABLE 직원 DROP CONSTRAINT 직원_급여_CK;

-- 제약조건 철회
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = '직원';
 
 -- FK 추가
 -- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 FOREIGN KEY(컬럼) REFERENCES 참조할 테이블
 -- FK는 UK이거나 PK일때만 참조 가능
 -- 부서테이블의 부서ID를 PK로 먼저 설정해주고, 직원테이블에서 부서ID를 참조
 
ALTER TABLE 부서 ADD CONSTRAINT 부서_부서ID_PK PRIMARY KEY(부서ID);

ALTER TABLE 직원 ADD CONSTRAINT 직원_직원ID_FK FOREIGN KEY(부서ID) REFERENCES 부서(부서ID);

-- 제약조건을 따로 추가하지 않고, 테이블 만들때부터 함께 만드는 방법

CREATE TABLE 제약조건테스트(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NN테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(CK테스트 > 0)
);
























