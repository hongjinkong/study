import streamlit as st
from diffusers import AutoPipelineForText2Image
import torch

@st.cache_resource
def load_model():
    # 사용할 장치 정의 (GPU(CUDA)를 사용할 수 있는지, 있으면 "cuda" 없으면 "cpu")
    # 삼항연산자    true일때 사용할 값 if 조건 else false일 때 사용할 값
    device = ("cuda" if torch.cuda.is_available() else "cpu")

    model = AutoPipelineForText2Image.from_pretrained(
        "stabilityai/sd-turbo", # 모델이름
        torch_dtype=(torch.float16 if device=="cuda" else torch.float32),
        #모델이 연산할 때 사용할 데이터 타입(float32(cpu)/float16(gpu))
        use_safetensors=True # 모델의 가중치를 저장하는 파일 형식 중하나 (안전 옵션)
    )

    # 불러온 모델을 실제 연산 장치(cpu/gpu) 로 이동
    return model.to(device)

st.title('AI 이미지 생성 서비스')

prompt = st.text_input('생성할 이미지를 설명하세요')
generate_button = st.button('이미지 생성')

# 모델 로드
model = load_model()

if generate_button:
    if not prompt:
        st.warning('이미지 설명을 입력하세요')
    else:
        with st.spinner('이미지 생성 중...'):
            # 모델 사용 생성된 이미지 받기
            result = model(
                prompt = prompt, # 생성하고 싶은 이미지에 대한 설명
                num_inference_steps = 1, # 노이즈 제거 반복 단계 수
                guidance_scale = 0.0 # 프롬포트를 얼마나 강하게 반영할지
            )
            #print(result)
            image = result.images[0]

        st.image(
            image,
            caption='생성된 이미지',
            use_container_width=True
        )