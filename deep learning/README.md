# Deep Learning

TensorFlow·Keras 기반 신경망의 기초부터 CNN, RNN, Transformer와 Hugging Face 파인튜닝까지 학습한 Notebook 모음입니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `ex00)딥러닝맛보기.ipynb` | 머신러닝과 딥러닝 비교, 기본 신경망 설계 |
| `ex01)데이터를 활용하여 이진분류 모델 설계.ipynb` | 퍼셉트론·MLP, 유방암 이진 분류, 활성화·최적화 함수 |
| `ex02) 오차 역전파.ipynb` | Backpropagation, MNIST 다중 분류, 기울기 소실 |
| `ex03)여러가지조합을통한다중분류실습.ipynb` | Fashion-MNIST, SGD·Momentum·Adagrad·Adam 비교 |
| `ex04)동물이미지...ipynb` | CNN 이미지 분류, VGG16 전이학습과 Fine-tuning |
| `ex05)RNN계열이해하기.ipynb` | 시퀀스 데이터, SimpleRNN, LSTM·GRU 개념 |
| `ex06)RNN계열실습_네이버영화리뷰데이터.ipynb` | 토큰화, 임베딩, RNN·LSTM 감정 분류 |
| `(배포용)_ex07)...ipynb` | Transformer와 Hugging Face Pipeline 활용 |
| `(배포용)_ex08...ipynb` | BERT 계열 한국어 모델 파인튜닝 Workflow |

## 데이터와 모델

- `data/student-mat.csv`: 기본 회귀·분류 비교 실습 데이터
- `model/best_model.keras`: 학습된 Keras 모델
- 이미지·자연어 실습 데이터는 Notebook의 경로 또는 별도 다운로드가 필요할 수 있습니다.

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter numpy pandas matplotlib scikit-learn tensorflow transformers datasets
jupyter notebook
```

CNN, Transformer 파인튜닝은 GPU가 있는 Google Colab 환경을 권장합니다.

## 복습 포인트

- 출력층의 Unit 수와 활성화 함수는 문제 유형에 맞춰야 합니다.
- 정답의 Encoding 방식에 따라 손실 함수를 선택합니다.
- CNN은 공간적 특징, RNN은 순서 정보를 다루는 데 적합합니다.
- 전이학습에서는 Feature Extractor 동결과 Fine-tuning 범위를 구분합니다.
- 학습·검증 지표 차이를 확인해 Overfitting을 판단합니다.

[저장소 메인으로 돌아가기](../README.md)
