# Machine Learning

Scikit-learn을 중심으로 분류와 회귀 문제의 전체 흐름을 학습한 Jupyter Notebook 모음입니다. 문제 정의부터 전처리, EDA, 모델 학습, 평가와 튜닝까지 단계별로 구성되어 있습니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `day01.ipynb` | 머신러닝 7단계, Iris 분류, 데이터 분리, KNN과 하이퍼파라미터 |
| `day02.ipynb` | 버섯 독성 분류, One-Hot Encoding, Decision Tree, 교차 검증, KNN Scaling |
| `day03.ipynb` | Titanic 생존 예측, 결측치·파생 변수, Random Forest, AdaBoost |
| `day04.ipynb` | 선형 회귀, MSE·RMSE·R², 경사하강법, Lasso와 Ridge |
| `day05.ipynb` | 심장질환 분류, Logistic Regression, SVM, 분류 지표와 임계값 |
| `test.ipynb` | 학습 내용을 확인하는 문제 풀이 |

## 폴더 구성

- `data/`: Iris 외 실습에 사용하는 BMI, 버섯, Titanic, Boston House, 심장질환 데이터
- `data/*.dot`: Decision Tree 시각화 결과
- `pdf/`: 일자별 수업 참고자료
- `tree_model_pred.csv`: 모델 예측 결과 예시

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter numpy pandas matplotlib seaborn scikit-learn graphviz
jupyter notebook
```

Decision Tree의 `.dot` 파일을 이미지로 변환하려면 Python 패키지와 별도로 Graphviz 프로그램이 필요할 수 있습니다.

## 복습 포인트

- 학습 데이터와 평가 데이터를 분리해 데이터 누수를 방지합니다.
- 분류 문제에서는 정확도 외에도 Precision, Recall, F1, Confusion Matrix를 확인합니다.
- Scaling이 거리 기반 모델과 선형 모델에 미치는 영향을 이해합니다.
- 회귀와 분류의 목표값, 손실 함수, 평가 지표를 구분합니다.

[저장소 메인으로 돌아가기](../README.md)
