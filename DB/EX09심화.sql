/*************************서브쿼리*************************/

-- 그동안 적었던 SELECT 문장 : 메인쿼리
-- 서브쿼리 : SQL 내부세어 사용되는 SELECT  문장

-- 이름이 SHELLI인 직원보다 급여가 낮은 직원 출력
SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelli';
 
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 2900;
 
 -- 2900 대신 위에 식 넣기
 
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY 
                   FROM EMPLOYEES 
                  WHERE FIRST_NAME = 'Shelli');
                  
-- 부서별 최고급여를 받는 직원과 같은 급여를 받는 직원들 출력
 
-- 1
SELECT MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- 2
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID);
 
-- 부서별 최고 급여를 받는 직원을 출력
--부서, 급여의 조합을 비교
-- 다중열 서브쿼리 

SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- 서브쿼리 + 

SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES
                                    GROUP BY DEPARTMENT_ID);
 
/**************************JOINF********************************/
-- JOIN : 여러개의 테이블을 연결해서 사용하는것
 
-- 1. 
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;

--2.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 90;

-- JOIN 사용

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
   AND E.EMPLOYEE_ID = 100;
 
-- join 문법은 여러 테이블의 컬럼을 한번에 가져올 수 있다 
-- ** FROM절에 테이블을 여러개 사용 가능 + 별칭 생성 가능 
--    테이블을 여러개 사용하면 꼭 어느 테이블의 컬럼인지 명확히 기재해줘야함


-- 한 테이블에만 있는 컬럼이면 별칭 없이도 사용 가능 
-- 둘 다 있는 컬럼이면 반드시 앞에 별칭을 붙여줘야함 

-- INNER JOIN : 테이블간의 교집합,, JOIN 중 가장 일반적

-- 1. 오라클 문법
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D 
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 ORDER BY 1;

-- 2. ANSI 문법
-- SELECT....
--   FROM A 테이블 A INNER JOIN B테이블 B
--     ON 조건;

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
   AND E.EMPLOYEE_ID = 100;
 
-- 직원 아이디가 114번인 사람의 직원 아이디, 이름, 부서ID, 부서이름을 출력

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND E.EMPLOYEE_ID = 114;
    
-- INNER JOIN 은 두테이블에 모두 데이터가 있어야만 결과가 나옴
-- 직원 테이블에는 직워니 207번까지 있음
-- INNER JOIN 문법에서 207번 없음

-- WHY? E.DEPARTMENT_ID = D.DEPARTMENT_ID 인데 NULL은 비교연산이 진행이 안되
-- NULL 값도 출력하고싶다면 OUTERJOIN!

-- LEFT OUTER JOIN : 왼쪽 테이블 기준 OUTER JOIN
-- RIGHT OUTER JOIN : 오른쪽 테이블 기준 OUTER JOIN
-- FULL OUTER JOIN : 두 테이블 모두 OUTER JOIN
 
-- 전직원의 직원ID, 부서ID, 부서이름 출력
-- 단, 부서가 없는 직원들도 출력

SELECT EMPLOYEE_ID, D.DEPARTMENT_ID,DEPARTMENT_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 ORDER BY 1;
 
-- 직원이 없는 부서들 출력

SELECT EMPLOYEE_ID, D.DEPARTMENT_ID,DEPARTMENT_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 ORDER BY 1;
    
-- 부서 없는 직원 / 직원 없는 부서 모두 출력
SELECT EMPLOYEE_ID, D.DEPARTMENT_ID,DEPARTMENT_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 ORDER BY 1;
 
 /******************************객체***************************/
 
-- view : 가상의 테이블

CREATE VIEW 직원정보 AS 
SELECT 성, 이름, 직업ID
  FROM 직원;
  
SELECT * 
  FROM 직원정보;
  
-- 부서별로 가장 높은 연봉을 가진 직원을 출력

CREATE VIEW 부서별최고급여 AS
SELECT DEPARTMENT_ID, MAX(SALARY) AS 최고급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID;
 
SELECT * 
  FROM 부서별최고급여;
  
SELECT FIRST_NAME, SALARY, 최고급여
  FROM EMPLOYEES E, 부서별최고급여 DMAX
 WHERE E.DEPARTMENT_ID = DMAX.DEPARTMENT_ID
   AND E.SALARY = DMAX.최고급여;
 
 
--시퀀스 : 특정 규칙에 맞는 연속 숫자를 생성하는 객체, 대기순번표 기계

CREATE SEQUENCE NUM1;

CREATE TABLE 농협은행(
    번호표 NUMBER
    
);
  
INSERT INTO 농협은행 VALUES (NUM1.NEXTVAL);
 
SELECT * 
  FROM 농협은행;
 
-- ROWNUM 임시행번호

SELECT EMPLOYEE_ID, FIRST_NAME, ROWNUM
  FROM EMPLOYEES
 WHERE ROWNUM <= 5;
 
-- 급여가 높은 직원 상위 5명만 출력

SELECT FIRST_NAME, SALARY, ROWNUM
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL AND ROWNUM <= 5
 ORDER BY SALARY DESC;
 
-- 순서!! 정렬이 되기 전에 WHERE 절에서 이미 5개를 뽑아놓고
-- 그 다섯개만 가지고 정렬했기 때문

SELECT * 
  FROM(SELECT FIRST_NAME, SALARY, ROWNUM
         FROM EMPLOYEES
        WHERE SALARY IS NOT NULL
        ORDER BY SALARY DESC)
 WHERE ROWNUM <= 5;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 