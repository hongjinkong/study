--- 1.WHERE 절

SELECT *
  FROM EMPLOYEES
  WHERE JOB_ID = 'IT_PROG';

SELECT * 
  FROM EMPLOYEES
  WHERE employee_id = 105;

-- 2. 비교연산자

--부서ID가 50인 직원의 직원ID와 부서ID를 출력
--직원테이블에서 급여가 5000 이하인 직원들의 FIRST_NAME과 급여를 출력
--직원테이블에서 연봉이50000 이상인 사람들의 FIRST_NAME과 연봉을 출력해라 
-- 이때 연봉은 'Annsal' 이라는 별칭을 사용

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES
  WHERE department_id = 50;
  
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY <= 5000;
  
SELECT FIRST_NAME, SALARY*12 AS Annsal
  FROM EMPLOYEES
  WHERE SALARY*12 >= 50000;
  
-- 3. 등가 비교 연산자
-- ~가 아니다 (!=, ^=, <>, NOT=)

SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID != 50;
  
SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID <> 50;

SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID ^= 50;

SELECT *
  FROM EMPLOYEES
  WHERE NOT DEPARTMENT_ID = 50;

-- 4. 논리연산자 (AND, OR) -> 조건식 여러개
-- 직원 테이블에서 부서ID가 90 이고, 급여가 5000이상인 직원의 ID와 이름을 출력

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
  WHERE SALARY >= 5000
  AND DEPARTMENT_ID = 90;
  
--JOBID가 IT_PROG와 FI_ACCOUNT가 아닌 직원의 이름과 JOBID출력
--부서ID가 100이거나 입사일이 16년 2월2일 이후에 입사한 직원의 이름과 입사일, 부서ID를 출력
--부서ID가 100이거나 50인 직원중에서 연봉이 10000이상인 직원의 ID, 이름 그리고 연봉을 출력하기 
--연봉컬럼명은 ANN

SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
  WHERE JOB_ID != 'IT_PROG' 
  AND JOB_ID != 'FI_ACCOUNT';
  
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 100 
  OR HIRE_DATE > '16/02/02';
  
SELECT FIRST_NAME,DEPARTMENT_ID, EMPLOYEE_ID, SALARY*12 AS Annsal 
  FROM EMPLOYEES
  WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 50)
  AND SALARY*12 >= 10000 ;
  
-- 연산자 우선순위 AND > OR
-- 만약 OR를 먼저 실행하고 싶으면 () 이용

-- 6. IS NULL, IS NOT NULL
-- NULL은 어떤 연산을 해도 NULL이 나오는데 이 연산만 제외

-- 핸드폰 번호가 NULL인 직원의 이름, 번호 출력

SELECT FIRST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
  WHERE PHONE_NUMBER IS NULL;
  
SELECT FIRST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
  WHERE PHONE_NUMBER IS NOT NULL;
  
-- SQLD/정보처리기사에서 나올 만한 문제 
-- 다음중 올바른 식은?
1. SELECT * FROM 직원 WHERE 나이 = NULL
2. SELECT * FROM 직원 WHERE 나이 != NULL
3. SELECT * FROM 직원 WHERE 나이 IS NOT NULL
4. SELECT * FROM 직원 WHERE 나이 <> NULL
5. SELECT * FROM 직원 WHERE 나이 ^= NULL

-- 7. IN연산자

-- 부서 ID가 30이거나, 50이거나 , 90 인 직원의 정보 출력

SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IN (30,50,90,NULL);
  
--NOT IN 연산자 : 입력한 조건값을 제외한 대상을 출력
--NOT은 부정의 의미, 부정은 모든 것을 반대로 만들어줌
-- 죽, =는 <>가 되고 OR은 AND로 변함
--그래서 NOT IN은 <> + AND 의 조합

SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID NOT IN (30,50,90,NULL);
--NULL 갑은 비교가 불가하기 때문에 FALSE가 출력되는데,
--AND 조건이라서 전부 FALSE가 되는덧

--실습
-- (IN, NOT IN)
--(1) 매니저 ID가 100이거나 120인 직원의 이름과 매니저ID를 출력
--(2) JOB_ID가 AD_VP이거나 ST_MAN인 사람의 이름과 JOB_ID 출력
--(3) 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID를 출력

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
  WHERE MANAGER_ID IN (100,200);
  
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
  WHERE JOB_ID IN ('AD_VP', 'ST_MAN');
  
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
  WHERE MANAGER_ID NOT IN (145,146,147,148,149);


-- 8. BEETWEEN 연산자

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY BETWEEN 10000 AND 19999;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
  WHERE HIRE_DATE BETWEEN '05/01/01' AND '06/01/01';

-- 9. LIKE : 특정 조건을 검색
-- %: 글자수 미지정
-- _: 글자수 지정

SELECT FIRST_NAME
  FROM EMPLOYEES
  WHERE FIRST_NAME LIKE 'S%';

SELECT FIRST_NAME
  FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '%s%';

SELECT EMPLOYEE_ID
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID LIKE '1__';

--실습
-- (1) 650으로 시작하는 핸드폰 번호를 가진 직원찾기(직원이름, 핸드폰 번호)
-- (2) 이름이 S(대문자로)로 시작하고 n(소문자)로 끝나는 직원찾기(직원이름)
-- (3) 이름 두번째 글자가 e(소문자)인 직원찾기
-- (4) 01월에 입사한 직원 찾기(직원 이름, 입사일)

SELECT FIRST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
  WHERE PHONE_NUMBER LIKE '650%';
  
SELECT FIRST_NAME
  FROM EMPLOYEES
  WHERE FIRST_NAME LIKE 'S%n';

SELECT FIRST_NAME
  FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '_e%';

SELECT  FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
  WHERE HIRE_DATE LIKE '___01%';



















 
 