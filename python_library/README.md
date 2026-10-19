# Python 데이터 라이브러리

NumPy, Pandas, Matplotlib을 사용해 배열 연산부터 표 형태 데이터 처리와 시각화까지 학습한 노트북입니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `ex01_Numpy.ipynb` | 배열 생성, 차원·형태 확인, 난수 배열, 벡터 연산 |
| `ex01_Numpy2 .ipynb` | 인덱싱, 슬라이싱, Boolean 인덱싱, NumPy 함수 |
| `ex02_pandas(series).ipynb` | Series 생성, 연산, 조회, 추가·수정·삭제 |
| `ex03_pandas(dataframe).ipynb` | DataFrame, `loc`·`iloc`, 필터링, 병합, 파생 컬럼 |
| `ex04_matplotlib.ipynb` | Matplotlib 기반 데이터 시각화 |

`Data/`에는 키·몸무게와 성적 실습 데이터가 있습니다.

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter numpy pandas matplotlib
jupyter notebook
```

## 복습 포인트

- Python 리스트와 NumPy 배열의 연산 방식 차이
- Series와 DataFrame의 축, 인덱스, 컬럼 개념
- `loc`는 라벨, `iloc`는 정수 위치를 기준으로 조회한다는 점
- 원본 데이터를 보존하면서 필터링·병합·집계 결과를 만드는 방법

[저장소 메인으로 돌아가기](../README.md)
