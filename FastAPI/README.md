# FastAPI 기초

Python의 FastAPI와 Uvicorn을 사용해 HTTP GET·POST 요청, 경로·쿼리 파라미터, 요청 본문 검증, HTML Form 연동을 학습한 예제입니다.

## 파일 구성

| 파일 | 주요 내용 |
| --- | --- |
| `ex01_FastAPI.py` | FastAPI 앱 생성과 기본 GET 엔드포인트 |
| `ex02_FastAPI_get.py` | Path Parameter, Query Parameter, 기본값 |
| `ex02_get.html` | GET 요청을 보내는 링크와 Form |
| `ex03_FastAPI_실습.py` | 도서 목록·상세 조회와 키워드 검색 |
| `ex04_FastAPI_post.py` | Pydantic 모델, JSON 요청 본문, 간단한 예측 응답 |
| `ex04_FastAPI_post_실습.py` | 학생 등록과 목록 조회 |
| `ex05_post.py`, `ex05_post.html` | `Form` 데이터 POST 요청 |
| `test.py`, `test2.py` | `__name__ == "__main__"`과 모듈 import 동작 |

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn pydantic python-multipart
uvicorn ex01_FastAPI:app --reload
```

파일마다 앱 모듈명이 다르므로 실행할 파일에 맞게 `ex01_FastAPI:app` 부분을 변경합니다. 일부 파일은 `python 파일명.py`로도 실행할 수 있습니다.

- 기본 주소: `http://127.0.0.1:8000`
- Swagger 문서: `http://127.0.0.1:8000/docs`
- ReDoc 문서: `http://127.0.0.1:8000/redoc`

## 복습 포인트

- Path Parameter는 리소스 식별에, Query Parameter는 검색·필터 조건에 적합합니다.
- Pydantic 모델은 요청 데이터의 구조와 자료형을 검사합니다.
- GET은 조회, POST는 새로운 데이터 전달·생성에 주로 사용합니다.
- 메모리 리스트와 딕셔너리에 저장한 데이터는 서버 재시작 시 사라집니다.

## 주의사항

이 폴더의 로그인·회원가입·예측 예제는 학습용입니다. 실제 서비스에서는 데이터베이스, 예외 처리, 비밀번호 해싱, 인증·인가가 추가로 필요합니다.

[저장소 메인으로 돌아가기](../README.md)
