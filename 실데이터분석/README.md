# 실데이터 분석

Pandas와 시각화 라이브러리를 사용해 실제 데이터의 문제를 정의하고, 전처리·가설 검증·인사이트 도출까지 수행한 분석 Notebook 모음입니다.

## 주요 분석

| 노트북 | 주요 내용 |
| --- | --- |
| `[보충자료]pandas복습.ipynb` | Series·DataFrame 생성과 데이터 접근 복습 |
| `[보충자료]데이터병합.ipynb` | `concat()`과 `merge()`의 차이와 활용 |
| `apply함수활용법.ipynb` | 행·열 단위 사용자 함수 적용 |
| `DeveloperSalary데이터실습.ipynb` | 개발자 연봉·기술 데이터 처리, MultiIndex, Seaborn |
| `개발자연봉데이터분석.ipynb` | 학력·국적·기술 스택과 연봉 관계 가설 검증 |
| `육군신체정보데이터실습.ipynb` | 신체 측정 데이터와 결측치 처리 |
| `카페매장분석.ipynb` | 지역별 상품, 피크타임, 객단가 분석 |
| `카페매장_지역별맞춤전략_분석.ipynb` | 서비스 기획 3W와 지역별 운영 전략 도출 |

## 데이터 구성

- `data/`: 카페 판매, 개발자 연봉·기술, 스트레스, 성적, 신체 측정 데이터
- `도메인 챌린지별 제공 데이터/`: 교육·생활·소비·안전·인사 등 분야별 분석 데이터

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter numpy pandas matplotlib seaborn openpyxl
jupyter notebook
```

## 분석 Workflow

1. 문제 배경과 분석 목적 정의
2. 데이터 구조·품질 확인
3. 결측치와 이상치 처리
4. 파생 변수 생성과 데이터 병합
5. EDA와 시각화
6. 가설 검증과 결과 해석
7. 서비스 또는 운영 전략 제안

## 주의사항

데이터 파일의 출처와 이용 조건을 확인하고, 사람과 관련된 데이터는 개인정보가 노출되지 않도록 비식별화해야 합니다. Notebook 실행 경로에 따라 데이터 상대 경로를 조정해야 할 수 있습니다.

[저장소 메인으로 돌아가기](../README.md)
