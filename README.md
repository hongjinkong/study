# study

AI 에이전트 엔지니어 부트캠프에서 학습한 내용을 정리한 저장소입니다. Python 기초부터 데이터 분석, AI 모델링, 백엔드, 프론트엔드까지 단계별 실습 코드와 노트북을 기록합니다.

## 학습 분야

| 폴더 | 학습 내용 |
| --- | --- |
| `basic` | Python 기초 문법, 자료형, 조건문, 반복문, 함수 |
| `python_library` | NumPy, Pandas 등 Python 라이브러리 실습 |
| `DB` | 데이터베이스와 SQL 실습 |
| `web` | HTML, CSS, JavaScript 웹 기초 |
| `웹 크롤링` | 웹 데이터 수집과 크롤링 |
| `실데이터분석` | 실제 데이터를 활용한 분석 프로젝트 |
| `machine learning` | 전처리, 지도·비지도 학습, 모델 평가 |
| `deep learning` | 신경망, 분류 모델, 오차 역전파 등 딥러닝 실습 |
| `텍스트마이닝` | 자연어 처리, 감정 분석, Word2Vec 실습 |
| `컴퓨터비전` | OpenCV, OCR, YOLO 기반 이미지·영상 처리 |
| `FastAPI` | Python API 서버와 백엔드 개발 |
| `Lang chain` | LLM과 LangChain을 활용한 AI 애플리케이션 |
| `nodejs` | Node.js 내장 HTTP 서버, Express, Router, REST API |
| `n8n` | 자동화 연계를 위한 음성 분류 모델 파인튜닝 실습 |
| `streamlit` | 데이터·AI 결과를 보여주는 Streamlit 앱 |
| `reactjs` | JSX부터 컴포넌트, State, 배열 렌더링, 생명주기, 라우팅까지의 React 실습 |

## React 학습 과정

`reactjs` 폴더는 주제별 Vite 프로젝트로 구성되어 있습니다.

1. `01.basic` — JSX, 조건부 렌더링, 스타일
2. `02.component` — 컴포넌트, Props, State, 이벤트
3. `03.map_filter` — `map()`, `filter()`, `key`, `useRef`
4. `04.lifecycle` — `useEffect`, cleanup, Axios API 통신
5. `05.router` — React Router, 동적 URL, 쿼리스트링, 인증 라우트

자세한 실행 방법과 복습 내용은 [`reactjs/README.md`](reactjs/README.md)에서 확인할 수 있습니다.

## 저장소 이용 시 참고사항

- 각 프로젝트는 해당 폴더의 `README.md`와 소스 코드 주석을 참고합니다.
- API 키와 같은 민감 정보는 `.env`에 저장하며 Git에 커밋하지 않습니다.
- 설치 패키지, 모델 가중치, 대용량 데이터셋, 빌드 결과처럼 다시 생성할 수 있거나 용량이 큰 파일은 `.gitignore`로 제외합니다.
- 데이터나 API 키가 필요한 실습은 별도의 원본 데이터 또는 발급받은 키를 준비해야 합니다.
