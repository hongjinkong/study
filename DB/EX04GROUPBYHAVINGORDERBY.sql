/************************GROUP BY****************************/

-- 특정 컬럼으로 그룹화 할 때 사용
-- EX) 부서별 평균 급여를 구해보자

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
-- 그룹화를 하게 되면 실제로 출력되는 행이 감소
-- EX)부서별로 묶어볼게요 => 개개인 직원의 이름, 주소 이런 것들을 출력 X
-- 출력할 컬럼 제한

-- 부서별 급여의 개수, 합계, 최대 , 최소 , 평균

SELECT  DEPARTMENT_ID
        ,COUNT(SALARY)
        ,COUNT(*)
        ,SUM(SALARY)
        ,ROUND(AVG(SALARY))
        ,MIN(SALARY)
        ,MAX(SALARY) 
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID ;
  
-- 실습! 
-- 실습 전 테이블 가져오기 진행 

-- 성적표, 교육생정보 테이블을 처음 보는거니까 전체 출력 한번씩 진행해서
-- 안에 있는 데이터를 파악한 후 문제풀이 진행 

-- 1. 성적표 테이블에서 학생 별로 평균 점수를 출력
--      출력컬럼 : 학생ID, 평균성적(별칭) 

SELECT 학생ID, ROUND(AVG(성적)) AS 평균성적
  FROM 성적표
  GROUP BY 학생ID;
  
-- 2. 성적표 테이블에서 과목별로 최고 성적, 최저 성적출력 
--      출력컬럼 : 과목,최고성적(별칭),최저성적(별칭)

SELECT 과목, MAX(성적) AS 최고성적, MIN(성적) AS 최저성적
  FROM 성적표
  GROUP BY 과목;

-- 3. 교육생 정보 테이블에서 각 팀당 몇명이 있는 출력
--      출력 컬럼 : 팀, 팀별인원수 (별칭)

SELECT 팀, COUNT(팀) AS 팀별인원수
  FROM 교육생정보
  GROUP BY 팀;
  
-- 4. 성적표 테이블에서 학생별로 JAVA, DATABASE 성적의 평균 값을 출력 
--      이 때, 성적은 반올림 
--      출력 컬럼 : 학생ID, 2과목평균 (별칭)

SELECT 학생ID, ROUND(AVG(성적)) AS "2과목평균"
  FROM 성적표
 WHERE 과목 IN ('JAVA', 'DATABASE')
 GROUP BY 학생ID;


/*************************** HAVING *******************************/
-- GROUP BY 절을 통해서 그룹화된 결과 중 원하는 조건으로 필터링 하는 무법 
-- HAVING 절에는 GROUP BY 에 있는 컬럼과 집계함수만 사용 가능 

-- 문제 풀이 팁! 
-- 문제에서 조건을 뽑아낸 후, 집계함수가 조건에 포함되어있다? => HAVING 
-- 개별로 조건을 부여해줘야하는 경우? => WHERE 

-- 성적표 테이블에서 평균성적이 80점보다 높은 학생 출력

SELECT 학생ID ,ROUND(AVG(성적)) AS 평균성적
  FROM 성적표
  GROUP BY 학생ID
  HAVING AVG(성적) >= 80;
  
SELECT 학생ID, ROUND(AVG(성적)) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID
 HAVING 과목='PYTHON';

-- 실습
-- 교육생 정보에서 소속된 팀의 인원수가 3명 이상인 팀과 인원수를 출력 

SELECT 팀, COUNT(팀) AS 인원수
  FROM 교육생정보
  GROUP BY 팀
  HAVING COUNT(팀)>=3;
-- 직원 테이블 (EMPLOYEES) 에서 부서별 최고 연봉이 100,000 이상인 부서, 최고연봉 출력 

SELECT DEPARTMENT_ID, MAX(SALARY*12) AS 최고연봉
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12) >= 100000;
  
-- 성적표 테이블에서 학생별 평균 성적을 출력하되 평균 성적이 NULL이 아닌 값만 출력 

SELECT 학생ID, ROUND(AVG(성적)) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL;

/***************************ORDER BY*********************/
SELECT *
  FROM 성적표
  ORDER BY 학생ID, 성적 DESC;
  
--SELECT 절에 입력되지 않은 컬럼을 기준으로도 정렬 가능
SELECT EMPLOYEE_ID , SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL;
 ORDER BY SALARY DESC;

-- 단 GROUP BY 가 명시된 경우에는 GROUP BY 에 한정된 컬럼만 가능
-- 실행 순서가 GROUP BY -> HAVING -> SELECT -> ORDER BY 로 실행
-- GROUP BY 때문에 컬럼의 수가 제한됨

SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY EMPLOYEE_ID;

-- 오류: ORA-00979: not a GROUP BY expression

SELECT DEPARTMENT_ID, SUM(SALARY*12) AS 연봉
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY 연봉;


SELECT DEPARTMENT_ID, SUM(SALARY*12) AS 연봉
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY 2;






























