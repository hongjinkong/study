# Streamlit 앱 실습

Python 코드만으로 입력 UI, 데이터 대시보드, AI 모델 추론 화면을 만드는 Streamlit 예제입니다.

## 예제 구성

| 폴더 | 주요 내용 |
| --- | --- |
| `ex01` | 제목, 텍스트, 입력, 버튼, 파일 업로드, 이미지, 표, 차트, Sidebar, Tab |
| `ex02` | Pandas·Matplotlib 기반 차트 대시보드와 요약 지표 |
| `ex03` | Hugging Face Pipeline을 이용한 한국어 문장 감정 분석 |
| `ex04` | Keras MNIST 모델과 이미지 업로드 기반 숫자 분류 |
| `ex05` | YOLO 실습 노트북 |
| `ex06` | YOLO Pose와 OpenCV를 이용한 실시간 박수 동작 인식 |
| `ex07` | 다음 실습을 위한 빈 앱 파일 |

## 실행 방법

```bash
python -m venv .venv
source .venv/bin/activate
pip install streamlit pandas matplotlib pillow
streamlit run ex01/app.py
```

AI 예제는 사용하는 기능에 따라 추가 패키지가 필요합니다.

```bash
pip install transformers tensorflow ultralytics opencv-python
```

## 복습 포인트

- Streamlit은 사용자 입력이 바뀔 때 스크립트를 위에서부터 다시 실행합니다.
- 비용이 큰 모델은 `st.cache_resource`로 캐싱해야 반복 로딩을 막을 수 있습니다.
- 업로드된 이미지는 모델 입력 크기와 채널 수에 맞게 전처리해야 합니다.
- 확률 배열의 Batch 축과 Class 축을 구분해야 올바른 결과를 출력할 수 있습니다.

## 모델 파일

`ex04/mnist_model.keras`와 `ex06/yolo11m-pose.pt`가 필요합니다. 모델 파일은 용량이 크므로 Git 대신 모델 저장소나 별도 배포 경로로 관리하는 것이 좋습니다.

[저장소 메인으로 돌아가기](../README.md)
