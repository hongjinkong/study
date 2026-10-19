# Database · SQL

Oracle HR 스키마와 별도 실습 테이블을 사용해 SQL의 조회, 가공, 정의, 조작, 트랜잭션을 순서대로 학습한 예제입니다.

## 학습 내용

| 파일 | 주요 내용 |
| --- | --- |
| `EX01SELECT.sql` | `SELECT`, `DISTINCT`, 별칭, `NULL`, 산술 연산 |
| `EX02WHERE.sql` | `WHERE`, 비교·논리 연산자, 범위와 패턴 조건 |
| `EX03FUNCTION.sql` | 문자·숫자·날짜·형 변환 함수 |
| `EX04GROUPBYHAVINGORDERBY.sql` | 그룹 함수, `GROUP BY`, `HAVING`, `ORDER BY` |
| `EX05DDL.sql` | `CREATE`, `ALTER`, `DROP`, PK·FK·UNIQUE·CHECK 제약조건 |
| `EX06DML.sql` | `INSERT`, `UPDATE`, `DELETE`와 제약조건 오류 확인 |
| `EX07TCL.sql` | 트랜잭션, `COMMIT`, `ROLLBACK`, 세션 간 데이터 확인 |
| `EX09심화.sql` | 단일·다중 행 서브쿼리와 `JOIN` |
| `HR-2.sql` | 교육생·성적표 실습 테이블 생성과 샘플 데이터 |

## 실행 방법

1. Oracle Database와 SQL Developer를 준비합니다.
2. 연습용 사용자 또는 HR 스키마에 접속합니다.
3. SQL 파일을 학습 순서대로 열어 문장 단위로 실행합니다.
4. 테이블 생성이 필요한 실습은 `HR-2.sql`을 먼저 실행합니다.

## 복습 포인트

- `WHERE`는 행을, `HAVING`은 그룹화된 결과를 필터링합니다.
- DDL은 데이터 구조를 정의하고 DML은 테이블의 데이터를 변경합니다.
- PK와 UNIQUE는 중복을 제한하지만 `NULL` 허용 여부가 다릅니다.
- 트랜잭션 변경사항은 `COMMIT` 전까지 다른 세션에서 보이지 않을 수 있습니다.

## 주의사항

일부 SQL은 테이블을 생성·수정·삭제하거나 데이터를 변경합니다. 운영 데이터베이스가 아닌 별도의 실습 스키마에서 실행하세요.

[저장소 메인으로 돌아가기](../README.md)
