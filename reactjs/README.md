# React 학습 예제

React와 Vite를 사용해 기초 문법부터 라우팅까지 단계별로 학습한 예제 모음입니다.

## 프로젝트 구성

| 폴더 | 학습 내용 |
| --- | --- |
| `01.basic` | JSX 문법, 조건부 렌더링, 인라인 스타일, 날짜 처리 |
| `02.component` | 컴포넌트 분리, Props, State, React 이벤트 |
| `03.map_filter` | 배열의 `map()`과 `filter()`, `key`, `useRef` 검색 |
| `04.lifecycle` | `useEffect`, cleanup, 파생 값, Axios API 통신 |
| `05.router` | `Route`, `Link`, `useNavigate`, URL 파라미터, 쿼리스트링, 보호된 라우트 |

## 실행 방법

실행하려는 프로젝트 폴더로 이동한 뒤 아래 명령어를 사용합니다.

```bash
npm install
npm run dev
```

예시:

```bash
cd 05.router
npm install
npm run dev
```

## 환경변수

`04.lifecycle`의 영화 API 예제를 실행하려면 해당 폴더에 `.env` 파일을 만들고 영화진흥위원회 API 키를 설정해야 합니다.

```env
VITE_MOVIE_API_KEY=발급받은_API_KEY
```

`.env`는 Git에 포함되지 않습니다. Vite에서 클라이언트 코드가 읽을 환경변수에는 `VITE_` 접두사가 필요합니다.

## 복습할 핵심 포인트

- 일반 변수와 State의 차이 및 State의 비동기적 업데이트
- 배열 렌더링 시 안정적인 `key`가 필요한 이유
- 다른 값으로 계산할 수 있는 데이터는 별도 State로 만들지 않는 원칙
- `useEffect`의 의존성 배열과 cleanup 함수의 실행 시점
- `Link`와 `useNavigate`의 사용 목적 차이
- 동적 세그먼트와 쿼리스트링의 차이
- 클라이언트 State만 사용한 인증 정보는 새로고침하면 초기화된다는 점
