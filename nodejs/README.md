# Node.js · Express

Node.js 내장 모듈로 HTTP 서버를 만드는 과정부터 Express 미들웨어와 Router를 이용한 REST API 구조까지 학습한 예제입니다.

## 학습 순서

| 폴더 | 주요 내용 |
| --- | --- |
| `1_node_basic` | CommonJS 모듈, `http`, 요청·응답 객체, `fs` 파일 전송 |
| `2_get` | URL Query String을 읽는 GET 로그인 실습 |
| `3_post` | 요청 Body 스트림과 `querystring`을 이용한 POST 처리 |
| `4_express/1_basic` | Express 서버, 정적 파일, `sendFile()` |
| `4_express/2_login` | 미들웨어, Form Body 파싱, GET·POST 로그인, Redirect |
| `4_express/3_restapi` | 페이지 Router와 API Router 분리, JSON 응답 |
| `nodejs.sql` | Node.js 예제와 연결하기 위한 데이터베이스 실습 SQL |

## 실행 방법

실행하려는 예제 폴더로 이동해 의존성을 설치한 뒤 서버 파일을 실행합니다.

```bash
cd 4_express/3_restapi
npm install
node app.js
```

기본 실습 서버는 대부분 `http://localhost:3000`을 사용합니다. 같은 포트의 서버를 동시에 실행할 수 없으므로 기존 서버를 종료한 뒤 다음 예제를 실행하세요.

## 복습 포인트

- `req`에는 요청 정보가, `res`에는 클라이언트로 보낼 응답이 담깁니다.
- POST Body는 한 번에 도착한다고 보장되지 않아 스트림의 `data`와 `end` 이벤트를 이해해야 합니다.
- Express 미들웨어는 요청과 응답 사이에서 공통 작업을 처리합니다.
- 페이지 라우팅과 데이터 API를 분리하면 서버 구조가 명확해집니다.

## 주의사항

- 예제의 `admin`/`1234` 로그인은 흐름 학습용이며 실제 인증 방식이 아닙니다.
- 비밀번호는 평문으로 비교하거나 로그에 출력하면 안 됩니다.
- `node_modules`는 저장소에 올리지 않고 `package.json`과 Lock 파일로 다시 설치합니다.

[저장소 메인으로 돌아가기](../README.md)
