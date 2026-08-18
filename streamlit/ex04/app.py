import streamlit as st
import numpy as np
import pandas as pd
import tensorflow as tf
from pathlib import Path
from PIL import Image, ImageOps

# 모델 파일 경로 (app.py 와 같은 폴더 기준 - 어디서 실행하든 안전하게)
MODEL_PATH = Path(__file__).parent / 'mnist_model.keras'

# 모델 로드
@st.cache_resource
def load_model():
    return tf.keras.models.load_model(MODEL_PATH)

model = load_model()

st.title('MNIST Classifier')

st.write('0~9 사이의 숫자를 쓴 이미지를 업로드하면 모델이 숫자를 예측합니다.')

uploaded_file = st.file_uploader(
    '손글씨 숫자 이미지를 업로드하세요',
    type=['png', 'jpg', 'jpeg']
)

# 이미지가 업로드 되었을 때만 분석 진행
if uploaded_file is not None:
    # 업로드한 이미지 열기
    original_image = Image.open(uploaded_file)

    # 원본 이미지 출력
    st.subheader('업로드한 원본 이미지')
    st.image(original_image, width = 300)

    # 예측 버튼
    if st.button("숫자 예측하기", type="primary"):
        # 업로드된 이미지 전처리
        # 1) 흑백 이미지(GrayScale)로 변환
        gray_image = original_image.convert("L") # L -> GrayScale

        # 2) 색상 반전 (흰->검정, 검정 -> 흰)
        gray_invert_image = ImageOps.invert(gray_image)

        # 3) 입력 크기 변경 (28*28)
        resized_image = gray_invert_image.resize((28,28))

        # 4) 이미지(Image 객체) -> Numpy 배열로 변환 (각 픽셀값(0~255) 를 가진 배열)
        image_array = np.array(resized_image)

        # 5) 모델 입력 형태로 변경
        #    이 모델은 CNN이 아니라 Flatten + Dense 구조이고, 입력층이 (28, 28) 이다
        #    -> (배치사이즈(한번에 넣는 데이터 개수 - 1장), 높이, 너비)
        #    ※ 픽셀값은 0~255 그대로 넣는다 (학습할 때 /255.0 정규화를 하지 않은 모델)
        input_data = image_array.reshape(1, 28, 28)

        # 예측
        # ※ model.predict() 는 Streamlit 안에서 멈춰버린다(데드락).
        #    predict() 는 내부적으로 배치 처리용 스레드를 돌리는데,
        #    Streamlit 이 스크립트를 실행하는 방식과 충돌한다.
        #    이미지 1장만 넣을 때는 모델을 함수처럼 직접 호출하는 게 맞고 더 빠르다.
        prediction = model(input_data, training=False).numpy()

        # 가장 높은 확률의 숫자 (인덱스)
        predicted_number = np.argmax(prediction)

        # 최고 확률(%)
        # prediction 은 (1, 10) 2차원 배열 -> [0] 으로 배치 축을 먼저 벗겨야 한다
        confidence = prediction[0][predicted_number] * 100

        st.success(f'예측 결과: 숫자 {predicted_number}')
        st.metric(label = '예측 확률', value = f'{confidence:.2f}%')

        st.subheader('모델 입력이미지')
        st.image(resized_image, width = 140)

        # 숫자별 예측 확률 표 형태 출력
        # prediction 은 (1, 10) 2차원이라 그대로 넣으면 DataFrame 이 못 받는다
        # -> prediction[0] 으로 1차원(10개)으로 만들어서 넣기
        # ※ 변수명으로 dict 는 피하기 (파이썬 내장 함수 dict 를 가려버린다)
        data = {
            '숫자': [number for number in range(10)],
            '확률': prediction[0] * 100
        }

        df = pd.DataFrame(data)
        st.dataframe(df, hide_index=True)

        # 바 그래프 출력
        bar_df = df.set_index('숫자')
        st.bar_chart(bar_df)