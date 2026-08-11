-- 1. 문자함수
-- UPPER 대문자로 변환
-- LOWER 소문자로 변환

SELECT FIRST_NAME, EMAIL
        , UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;
  
--LENGTH 글자의 길이
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES
  WHERE LENGTH(FIRST_NAME)>=0;
  
-- SUBSTR: 시작위치부터 끝까지 추출 

SELECT JOB_ID
        , SUBSTR(JOB_ID, 1, 2)
        , SUBSTR(JOB_ID, 4)
  FROM EMPLOYEES;
  
SELECT HIRE_DATE
        , SUBSTR(HIRE_DATE,1,2) AS 연도
        , SUBSTR(HIRE_DATE,4,2) AS 월
        , SUBSTR(HIRE_DATE, 7) AS 일
  FROM EMPLOYEES;
  
--REPLACE 문자열 대체
SELECT HIRE_DATE
        , REPLACE(HIRE_DATE, '/', '-') AS 하이픈
        , REPLACE(HIRE_DATE, '/') AS 제거
  FROM EMPLOYEES;

-- CONCAT 문자열 합치기
SELECT CONCAT('입사일: ', HIRE_DATE)
  FROM EMPLOYEES;
  
SELECT '입사일은' || HIRE_DATE || '입니다.'
  FROM EMPLOYEES;
  
-- DUAL : 최고권한 관리자인 SYS 소유의 테이블로 더미 테이블

-- 2. 숫자함수
-- MOD : 나머지
SELECT MOD(15,6), MOD(14,2)
  FROM DUAL;

-- ROUND : 반올림
-- TRUNC : 버림
-- 0: 소수점 첫째자리
-- 1: 소수점 둘째자리
-- 3: 소수점 셋째자리
SELECT ROUND(15.65, 1), TRUNC(15.65, 1)
  FROM DUAL;

--3. 날짜 함수
-- 날짜 보이는 형식 바꾸는 방법
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식변경 (YYYY-MM-DD HH24:MI:SS)

SELECT SYSDATE
        ,SYSDATE + 1 AS "하루더함"
        ,SYSDATE + 1/24 AS "한시간더함"
        ,SYSDATE + 1/24/60 AS "일분더함"
        ,SYSDATE +1/24/60/60 AS "일초더함"
  FROM DUAL;

-- ADD_MONTHS : 몇개월 이후 날짜를 구하는 함수

SELECT SYSDATE
        , ADD_MONTHS(SYSDATE,1) AS 한달뒤
        , ADD_MONTHS(SYSDATE,-1) AS 한달전
  FROM EMPLOYEES;
  
-- 4. 형변환 함수
-- 문자로 변환 : TO_CHAR
SELECT TO_CHAR(SYSDATE, 'MM/DD')
  FROM DUAL;
  
-- 숫자로 변환 : TO_NUMBER
SELECT TO_NUMBER('1')+1
        ,('1')+1
  FROM DUAL;

-- 날짜로 변환 : TO_DATE
SELECT TO_DATE('20230503', 'YYYY/MM/DD')
  FROM DUAL;
  
-- 5. NULL 함수 
-- NULL에 산술 연산을 하면 NULL 반환
-- NULL에 비교 연산을 하면 FALSE 반환
-- NULL에 다른 값을 대체할 수 있는 함수
-- EX)  NULL인 값들을 전부 0으로 변환

-- NVL(NULL 검사, NULL 일떄)

SELECT FIRST_NAME
        ,NVL(FIRST_NAME, '없음')
  FROM EMPLOYEES
  WHERE FIRST_NAME IS NULL;

--NVL2 (NULL검사, NULL이 아닐때, NULL일떄)
SELECT FIRST_NAME
        ,NVL2(FIRST_NAME,'있음', '없음')
  FROM EMPLOYEES;
  
-- DECODE (검사대상, 비교1, 비교1일때마다 반환값, 비교2, 비교2일때 반환값
--              ......일치하지 않을 때 반환값

-- 부서가 100이면 급여 *2, 부서가 90이면 급여* 1.9, 그렇지않으면 보너스X 원래급여

SELECT DEPARTMENT_ID, SALARY
        , DECODE(DEPARTMENT_ID 
                , 100, SALARY*2
                , 90, SALARY*1.9
                , SALARY) AS 보너스
  FROM EMPLOYEES;


-- 실습 1. 직원 중 커미션비율(COMMISSION_PCT) 이 NULL 인 직원은 0으로 대체해서 반환
--       출력 컬럼 : 직원의 아이디, 커미션 비율, 조정된 커미션비율 (NVL)

SELECT EMPLOYEE_ID, COMMISSION_PCT
        , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES;
-- 실습 2. 직원 중, 매니저ID가 있는 직원은 '직원' / 없는 직원은 '관리자'로 출력 
--      출력 컬럼 :직원의 아이디, 매니저 아이디, 변경된 매니저ID 여부 (NVL2)

SELECT EMPLOYEE_ID, MANAGER_ID
        ,NVL2(MANAGER_ID, '관리자','직원')
  FROM EMPLOYEES;
  
-- 실습 3. 매니저 ID가 100이면 '관리자', 아니면 '직원' => DECODE 를 이용해서 출력 
SELECT EMPLOYEE_ID, MANAGER_ID
        ,DECODE(MANAGER_ID
        , 100, '관리자'
        , '직원')
  FROM EMPLOYEES;
-- 6. 그룹함수
-- 다수의 데이터 => 1개의 결과
-- 합계, 개수, 최대값, 최소값, 평균갑..ETC

SELECT SUM(SALARY) AS 합계
        ,COUNT(SALARY) AS 개수
        ,MAX(SALARY) AS 최댓값
        ,MIN(SALARY) AS 최소값
        ,ROUND(AVG(SALARY)) AS 평균
  FROM EMPLOYEES;





















  
  
  