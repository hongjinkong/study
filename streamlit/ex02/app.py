import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# 한글 폰트 설정 (matplotlib 차트 글자 깨짐 방지)
plt.rcParams['font.family'] = 'Malgun Gothic'
plt.rcParams['axes.unicode_minus'] = False

# 제목, 설명
st.title('차트 대시보드')
st.write('차트 종류와 표시할 데이터를 선택')

# 시각화할 데이터
data = {
    "월": ["1월", "2월", "3월", "4월", "5월", "6월"],
    "매출": [120, 150, 170, 160, 210, 250],
    "방문자": [1000, 1300, 1500, 1400, 1800, 2200],
    "주문량": [45, 60, 72, 68, 90, 110]
}

# 딕셔너리 데이터 -> df 변환
df = pd.DataFrame(data)

# 표모양 출력
st.subheader('데이터 확인')
st.dataframe(df)

# 사이드바 구성
st.sidebar.header('차트 선택')

# 차트 종류 선택 드랍다운(selectbox)
chart_type = st.sidebar.selectbox(
    '차트 종류',
    ['막대 차트', '선 차트', '원형 차트', '영역차트', '산점도']
)

# 출력한 데이터 선택 드랍다운
column = st.sidebar.selectbox('표시할 데이터', ['매출', '방문자', '주문량'])

#print(chart_type)
#print(column)

st.subheader(f'{chart_type} - {column}')

if chart_type == '막대 차트':
    # 월을 인덱스로 설정
    chart_df = df.set_index('월')[[column]]
    st.bar_chart(chart_df)
    
elif chart_type == '선 차트':
    chart_df = df.set_index('월')[[column]]
    st.line_chart(chart_df)

elif chart_type == '원형 차트':
    fig, ax =plt.subplots()
    
    ax.pie(
        df[column], # 선택한 데이터 사용
        labels = df['월'], # 월을 라벨로 사용
        autopct = '%1.1f%%', # 소수점 1자리까지 표시
        startangle = 90 # 시작 각도
    )
    
    # 차트 제목
    ax.set_title(f'월별 {column} 비율')
    
    # 원이 찌그러지 않도록 비율 유지
    ax.axis('equal')
    
    st.pyplot(fig)
    
elif chart_type == '영역차트':
    chart_df = df.set_index('월')[[column]]
    st.area_chart(chart_df)

elif chart_type == '산점도':
    # 방문자 별로 매출이 증가하는지, 주문량이 얼마나 되는지
    st.scatter_chart(df, x='방문자', y=column, size = '주문량')

#else

st.subheader('데이터 요약')

# 컬럼 생성(3개)
col1, col2, col3 = st.columns(3)

with col1:
    st.metric(label = f'총{column}', value = f'{df[column].sum():,}')

with col2:
    st.metric(label = f'평균{column}', value = f'{df[column].mean():,.1f}')
    
with col3:
    # 선택한 컬럼에서 가장 큰 값을 가지고 있는 행 가져오기
    max_row = df.loc[df[column].idxmax()]
    st.metric(label = '가장 높은 월', value = max_row['월'], delta = f'{max_row[column]}')