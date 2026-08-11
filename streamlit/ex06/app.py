import streamlit as st
from ultralytics import YOLO
import cv2
import numpy as np

# yolo 모델 불러오기
@st.cache_resource
def load_model():
    return YOLO("yolo11m-pose.pt")

model = load_model()

# session_state : 이벤트 발생하더라도 특정 값을 초기화되지 않도록 저장해주는 공간
# - clap_count : 박수 횟수 (누적)
# - clap_flag : 손 모으고 있는 동안 연속 카운팅 방지
#             : 박수를 방금 친경우(true), 박수 치기 전/손 떼졌을 때 (false) 
if 'clap_count' not in st.session_state:
    st.session_state.clap_count = 0
    # 처음 시작하는 경우 clap_count 생성 후 0으로 초기화

if 'clap_flag' not in st.session_state:
    st.session_state.clap_flag = False
    # 처음 시작하는 경우 clap_flag 생성 후 False로 초기화

st.title("실시간 박수 인식 사이트")
st.write("웹캠 실행 버튼을 클릭하여 실시간으로 포즈 인식을 시작하세요.")

# 웹캠 실행 토글 스위치 -> 토글이 켜져있는 동안은 웹캠 실행을 반복함 (session_state)
run_webcam = st.toggle("웹캠 실행", key="run_webcam")
# key : session_state와 자동으로 연동해줌

# 비디오 프레임 빈공간 미리 할당
frame_placeholder = st.empty()

# run_webcam 토글 스위치가 켜졌을 때 (-> 웹 캠 사용)
if st.session_state.run_webcam:
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        st.error("웹캠을 사용할 수 없습니다")
    else:
        #cap open 되어 있고 토글스위치도 켜져있는 동안 무한 반복
        while cap.isOpened() and st.session_state.run_webcam:


            
            success, frame = cap.read()
        

            if not success:
                st.error("더이상 읽어올 프레임이 없습니다")
                break

            # 좌우 반전
            frame = cv2.flip(frame, 1) #1(좌우), 0(상하), -1(상하,좌우)

            # 모델에 반전된 이미지 넣어서 결과 받기
            results = model(frame)

            # 결과가 그려진 이미지 생성
            annotated_frame = results[0].plot()

            # keypoints(좌표) 가져오기
            keypoints = results[0].keypoints

            if keypoints is not None :
                #keypoint 좌표를 numpy 배열로 변환
                xy = keypoints.xy.cpu().numpy()

                if len(xy) > 0 : # 검출된 사람이 1명 이상인 경우
                    person = xy[0] #감지된 사람 중 첫번째 사람
                    left_wrist = person[9] #(300,200)
                    right_wrist = person[10] #(340,230)

                    # 유클리드 거리
                    # linear algebra (선형대수) -> 벡터크기, 행렬 연산 ...
                    # norm : 벡터의 크기(길이) -> 피타고라스 정리
                    dist = np.linalg.norm(left_wrist - right_wrist)

                    if dist < 50 : # 거리가 50px 보다 작으면 (가까워졌으면)
                        # clap_count 1 증가
                        # clap_flag True 변경 (false 였을 때만 변경)
                        if not st.session_state.clap_flag:
                            st.session_state.clap_count += 1
                            st.session_state.clap_flag = True

                        # 5번 마다 풍선 효과 실행
                        if st.session_state.clap_count % 5 == 0:
                            st.balloons()

                    else : # 거리가 50px 보다 클 때 (손이 멀어져 있을 때)
                        st.session_state.clap_flag = False

                    cv2.putText(
                        annotated_frame, # 글씨 쓰고 싶은 프레임
                        f"COUNT : {st.session_state.clap_count}", # 글씨
                        (30,60), # 위치 (왼쪽상단 0,0)
                        cv2.FONT_HERSHEY_SIMPLEX, # 기본 폰트
                        1, #폰트 크기
                        (0,0,255), #빨간색 (B,G,R)
                        2 #폰트 두께
                    )


            annotated_frame = cv2.cvtColor(annotated_frame, cv2.COLOR_BGR2RGB)
            # 할당 받아 놓은 공간에 최종 결과 이미지 출력
            frame_placeholder.image(annotated_frame)


        cap.release()
        cv2.destroyAllWindows()

else : # 토글 스위치가 꺼져있을 때
    st.write("버튼을 눌러 웹캠을 시작하세요.")