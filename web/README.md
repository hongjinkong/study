# Web 기초

HTML, CSS, JavaScript의 기본 문법부터 DOM 조작과 브라우저 저장소를 이용한 게시판까지 학습한 예제입니다.

## 파일 구성

| 파일 | 주요 내용 |
| --- | --- |
| `01text.html` | 제목, 문단 등 텍스트 태그 |
| `02table.html` | 표 구조와 행·열 작성 |
| `03img.html` | 이미지 경로와 이미지 태그 |
| `04input.html` | 입력 요소와 Form |
| `05selector.html` | CSS 선택자 |
| `06style.html` | CSS 스타일 적용 방식 |
| `07JS기초.html` | 변수, 배열, 객체 등 JavaScript 기초 |
| `08JS문법.html` | 반복문, 함수, 화살표 함수 |
| `09dom.html` | DOM 탐색, 이벤트 등록, 화면 내용 변경 |
| `index.html`, `script.js`, `style.css` | 작성·조회·검색·삭제 기능이 있는 자유 게시판 |

## 실행 방법

단순 예제는 HTML 파일을 브라우저에서 직접 열 수 있습니다. 상대 경로와 브라우저 동작을 안정적으로 확인하려면 VS Code Live Server 같은 로컬 서버 사용을 권장합니다.

게시판 예제는 `index.html`을 실행합니다. 작성한 글은 브라우저 `localStorage`에 저장됩니다.

## 복습 포인트

- HTML은 문서 구조, CSS는 표현, JavaScript는 동작을 담당합니다.
- 이벤트 처리 전 DOM 요소를 올바르게 선택해야 합니다.
- 사용자 입력을 HTML로 출력할 때는 스크립트 삽입을 막기 위한 escaping이 필요합니다.
- `localStorage` 데이터는 같은 브라우저와 주소에서만 유지되며 서버 데이터베이스가 아닙니다.

[저장소 메인으로 돌아가기](../README.md)
