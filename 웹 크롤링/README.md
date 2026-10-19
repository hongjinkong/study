# 웹 크롤링

Requests·BeautifulSoup 기반 정적 페이지 수집부터 Selenium 브라우저 자동화와 이미지 데이터 수집까지 학습한 Notebook 모음입니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `ex01요청라이브러리.ipynb` | HTTP 요청·응답, 상태 코드, BeautifulSoup, CSS Selector |
| `ex02네이버뉴스수집.ipynb` | 뉴스 데이터와 여러 페이지 수집 |
| `ex03멜론차트Top100.ipynb` | 순위·곡명·가수 데이터 수집과 CSV 저장 |
| `ex04네이버블로그수집.ipynb` | 검색 결과와 `iframe` 구조 처리 |
| `ex05브라우저제어.ipynb` | Selenium 요소 탐색과 브라우저 제어 |
| `ex06도시락정보수집하기.ipynb` | 메뉴 정보 수집과 Excel 저장 |
| `ex07이미지데이터수집.ipynb` | 네이버 이미지 검색 결과 수집 |

수집 결과는 CSV·Excel 파일과 이미지 폴더에 저장되어 있습니다.

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter requests beautifulsoup4 pandas openpyxl selenium
jupyter notebook
```

Selenium 예제는 Chrome과 브라우저 버전에 맞는 WebDriver 환경이 필요합니다.

## 복습 포인트

- `requests`는 HTTP 응답을 받고 BeautifulSoup은 HTML 구조를 탐색합니다.
- 여러 페이지를 수집할 때 URL Parameter와 반복 종료 조건을 확인합니다.
- 동적으로 생성되는 화면은 Selenium 같은 브라우저 자동화가 필요할 수 있습니다.
- 수집 결과를 표 형태로 정리한 뒤 CSV·Excel로 저장합니다.

## 주의사항

- 사이트의 이용약관, `robots.txt`, 저작권과 개인정보 규정을 확인합니다.
- 과도한 요청을 피하고 요청 간격과 재시도 정책을 둡니다.
- 웹사이트 구조가 바뀌면 Selector와 수집 코드도 수정해야 합니다.

[저장소 메인으로 돌아가기](../README.md)
