# Text Mining · NLP

한국어 텍스트의 정제·토큰화·특징 추출부터 TF-IDF와 Word2Vec을 이용한 감정 분석까지 학습한 Notebook입니다.

## 예제 구성

| 노트북 | 주요 내용 |
| --- | --- |
| `ex01_혐오데이터감성분석.ipynb` | 한국어 혐오 표현 데이터, 정제, 형태소 분석, TF-IDF, 분류·평가 |
| `ex02_감정분석(유사도,word2vec,내적값활용).ipynb` | 네이버 쇼핑 리뷰, 정규표현식, Kiwi·Okt, Word2Vec, 문서 벡터 |

## 데이터 구성

- `data/unsmile_train_v1.0.tsv`, `data/unsmile_valid_v1.0.tsv`: 혐오 표현 분석 데이터
- `data/naver_shopping.txt`: 쇼핑 리뷰 감정 분석 데이터
- 학습된 Word2Vec·분류 모델 파일은 크기가 크거나 재생성 가능해 Git에서 제외될 수 있습니다.

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter numpy pandas matplotlib scikit-learn gensim kiwipiepy konlpy
jupyter notebook
```

KoNLPy의 형태소 분석기는 Java 또는 별도 시스템 설정이 필요할 수 있습니다. Notebook의 설치 셀과 현재 운영체제 안내를 함께 확인하세요.

## NLP Workflow

1. 원본 텍스트와 Label 불러오기
2. 정규표현식을 이용한 정제
3. 형태소 분석과 불용어 제거
4. TF-IDF 또는 Word Embedding으로 수치화
5. 분류 모델 학습과 평가
6. 유사도·내적값을 이용한 결과 해석

## 복습 포인트

- 같은 문장도 Tokenizer와 품사 선택에 따라 결과가 달라집니다.
- TF-IDF는 문서별 중요도를, Word2Vec은 단어 간 분산 표현을 학습합니다.
- 감정·혐오 표현 데이터는 클래스 불균형과 Label Bias를 반드시 확인해야 합니다.
- 비속어·혐오 표현이 포함된 데이터의 열람과 공유에 주의합니다.

[저장소 메인으로 돌아가기](../README.md)
