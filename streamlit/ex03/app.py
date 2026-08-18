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
text = st.text_area('문장 입력', value='오늘 하루는 너무 더웠어요', height=120)

# 분석 버트( type -> 색깔지정)
if st.button('감정 분석하기', type='primary'):
    # 입력한 값이 없을 경우 -> '문장을 입력하세요' 경고 띄우기 -. 분석 x
    if not text.strip():
        st.warning('문장을 입력하세요')
    else:
        with st.spinner('분석중...'):
            result = classifier(text) # 허기페이스 모델 활용 감성분석

            # 라벨 (Label_0, Label_1) -> 한글형식 라벨( 부정, 긍정) 변환
            label_names = {
            'LABEL_0' : '부정',
            'LABEL_1' : '긍정'
            }

            # 데이터프레임 생성
            # result는 [[{...}, {...}]] 형태의 이중 리스트 -> result[0]으로 안쪽을 꺼내야 함
            result_df = pd.DataFrame(result[0])

            # 컬럼 추가('감정' -> label 컬럼을 label_names랑 매핑(map()활용)
            result_df['감정'] = result_df["label"].map(label_names)

            # 컬럼 추가('확률' -> score 컬럼값 *100)
            result_df['확률'] = result_df['score'] * 100

            result_df2 = result_df[['감정', '확률']]

            # 확률이 가장 높은 결과 (idxmax())
            max_row = result_df2.loc[result_df2['확률'].idxmax()]

        # 최종결과 출력
        st.success('분석이 완료되었습니다!')
        st.subheader('분석 결과')

        if max_row['감정'] == '부정':
            st.metric(
                label = '예측된 감정',
                value = '부정 🥶',
                delta = f'{max_row["확률"]:.1f}%'
            )
        else:
            st.metric(
                label = '예측된 감정',
                value = '긍정 🔥',
                delta = f'{max_row["확률"]:.1f}%'
            )

        # 바 그래프
        st.subheader('감정별 확률')
        chart_df = result_df2.set_index('감정')
        st.bar_chart(chart_df, y = '확률', horizontal = True)
        
        # 표그래프
        st.subheader('상세결과')
        st.dataframe(result_df2, hide_index=True)