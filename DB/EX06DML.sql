/**************************DML******************************/

CREATE TABLE 네이버회원 (
    회원ID VARCHAR(15), 
    이름 VARCHAR2(12) NOT NULL,
    비밀번호 VARCHAR2(16),
    생년월일 DATE,
    성별 VARCHAR(3),
    CONSTRAINT 네이버회원_회원ID_PK PRIMARY KEY(회원ID),
    CONSTRAINT 네이버회원_성별_CK CHECK(성별 IN ('남', '여'))
);

ALTER TABLE 네이버회원 ADD CONSTRAINT 네이버회원_회원ID_PK PRIMARY KEY(회원ID);

ALTER TABLE 네이버회원 ADD CONSTRAINT 네이버회원_성별_CK CHECK (성별 IN ('남', '여'));

ALTER TABLE 네이버회원 MODIFY 이름 VARCHAR(16) NOT NULL;

-- 제약조건 이름 수정
-- ALETER TABLE 테이블명 RENAME CONSTRAINT 기존제약조건명 TO 새로운제약조건명

-- 컬럼 이름 수정
-- ALTER TABLE 테이블명 RENAME COLUMN 기존컬렴명 TO 새로운컬럼명;

-- 컬럼 데이터 타입 수정
-- ALTER TABLE 테이블명 MODIFY (컬럼명 변경할 데이터 타입);

-- 데이터 추가하기!
INSERT INTO 네이버회원 VALUES ('ZETI', '선영표', '1234', SYSDATE, '여');

SELECT *
  FROM 네이버회원;
-- 컬럼 수는 5개 인데 값을 4개만 적어서 오류
INSERT INTO 네이버회원 VALUES ('ABC', '홍길동', '1234', SYSDATE);

-- 특정컬럼에만 값넣기
INSERT INTO 네이버회원 (회원ID, 이름,비밀번호,성별) VALUES ('DEF', '홍진성', '1234', '여');


-- ORA-01400: cannot insert NULL into ("HR"."네이버회원"."이름")
-- 따로 지정되지 않은 컬럼에는 기본 값으로 NULL이 들어가게 되어있음 
-- 이름에는 NOT NULL 이라는 제약조건이 들어가있기 때문에 NULL 값이 허용되지 않는 것!
INSERT INTO 네이버회원 (회원ID, 비밀번호) VALUES ('222', '1234');

-- 값은 꼭 작성한 컬럼 순선대로 입력                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
-- ORA-00001: unique constraint (HR.네이버회원_회원ID_PK) violated
-- PK가 중복이 불가하기때문에 오류가 나는 것! 
INSERT INTO 네이버회원 VALUES ('ABC', '홍길동', '1234', SYSDATE,'남');

SELECT *
  FROM 네이버회원;

-- 실습
-- 직원 테이블, 부서테이블
-- 1. 부서테이블에 값 넣기
INSERT INTO 부서 (부서ID, 부서이름, 매니저ID,위치ID) VALUES ('1', '연구개발팀',NULL,NULL); 
INSERT INTO 부서 (부서ID, 부서이름, 매니저ID,위치ID) VALUES ('2', '교육운영부',NULL,NULL); 
INSERT INTO 부서 (부서ID, 부서이름, 매니저ID,위치ID) VALUES ('3', '기획팀',NULL,NULL); 
INSERT INTO 부서 (부서ID, 부서이름, 매니저ID,위치ID) VALUES ('4', '홍보팀',NULL,NULL); 
INSERT INTO 부서 (부서ID, 부서이름, 매니저ID,위치ID) VALUES ('5', '외부강사',NULL,NULL); 



SELECT  *
  FROM 부서;
-- 2. 직원테이블에 값 넣기
-- 테이블에 정보를 확인하고 NULL이 허용되는 컬럼엔 NULL을 넣되, 
-- 부서ID는 NULL X 실제 내가 들어갈 부서 ID 입력
-- NULL이 허용되지 않은 컬럼에는 본인의 정보로 채우기
-- 입사일은 날짜함수를 이용해서 오늘 날짜로 넣기
-- 직업ID는 PROGRAMMER로 통일

SELECT * 
  FROM 직원;

INSERT INTO 직원 VALUES ('1', NULL, 'HONG', 'wlstjd37002@gmail.com',
                        NULL, SYSDATE, 'PROGRAMMER', NULL, NULL, NULL, '1');
    
SELECT * 
  FROM 직원
  JOIN 부서 ON 직원.부서ID = 부서.부서ID;

-- 데이터를 변경하고 싶을때? UPDATE
-- 데이트를 삭제하고 싶을때? DELETE

INSERT INTO 직원 VALUES (2, '은비', '이', 'EUNBEE@gmail.com', '010-0000-0000', sysdate, 'JAVA', 10000, NULL, NULL, 5);
INSERT INTO 직원 VALUES (3, '원호', '박', '1HO@gmail.com', '010-1111-1111', sysdate, 'JAVA', 10000, NULL, NULL, 2);
INSERT INTO 직원 VALUES (4, '수현', '박', 'SUE@gmail.com', '010-2222-2222', sysdate, 'DB', 10000, NULL, NULL, 1);


SELECT *
  FROM 직원;

COMMIT;

UPDATE 직원
   SET 직업ID = 'PROGRAMMER'
 WHERE 직원ID = 4;
 
DELETE FROM 직원
 WHERE 직원ID = 4;

SELECT * 
  FROM 직원;









