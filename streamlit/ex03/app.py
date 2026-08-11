import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
# transformers : 별도 설치
# -> huggin face에 업로드된 ai 모델 불러오기
# torch : 별도 설치 (transformers 의 종속성)
# -> 불러온 모델이 실제 추론(연산)을 수행함
from transformers import pipeline

# 모델 불러오기 -> 캐시(임시 저장소)에 저장
@st.cache_resource
def load_model():
    return pipeline(
        task="text-classification",
        model="WhitePeak/bert-base-cased-Korean-sentiment",
        top_k=None
    )

classifier = load_model()

st.title('한국어 문장 감정 분석')

st.write('문장을 입력하면 Hugging Face 모델이 긍정과 부정확률을 분석')

# 문장 입력
st.text_area('문장 입력', value='오늘 하루는 너무 더웠어요', height=120)

