# Computer Vision

OpenCV 영상 처리 기초부터 YOLO 객체 탐지·세그멘테이션·추적·포즈 추정까지 학습한 Notebook과 Dataset입니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `ex01_OpenCV기초.ipynb` | 이미지 읽기·변환, 색상 공간, 이진화, OCR |
| `ex02_yolo기초(colab).ipynb` | Object Detection, YOLO 구조·평가지표, Ultralytics 학습 |
| `ex03_피카츄몬스터볼객체탐지(colab).ipynb` | Custom Dataset 학습과 클래스별 성능 해석 |
| `ex03.2_피카츄몬스터볼객체탐지동영상.ipynb` | 학습 모델을 이용한 동영상 객체 탐지 |
| `ex04_YOLO이미지세그먼트실습(colab).ipynb` | Image Segmentation과 차량 파손 영역 예측 |
| `ex05_객체추적.ipynb` | 동영상 Tracking과 Stream 기반 메모리 관리 |
| `ex06_포즈추정.ipynb` | YOLO Pose 모델과 Keypoint 추정 |
| `ex07_OpenCV게임만들기.ipynb` | 이미지 Blending을 활용한 OpenCV 게임 |

## 데이터 구성

- `ex01-1/`: 피카츄·몬스터볼 탐지용 Roboflow Dataset
  - `train/`, `valid/`, `test/`: 이미지와 YOLO Label
  - `data.yaml`: Dataset 경로와 Class 정보
- `data/`: 이미지·영상 실습 파일
- `runs/`: YOLO 학습·예측 결과
- 별도 이미지 수집 폴더와 모델 가중치 파일은 용량이 클 수 있습니다.

## 실행 방법

OpenCV 기본 실습은 로컬 Jupyter에서 실행할 수 있습니다.

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter opencv-python numpy matplotlib pillow pytesseract ultralytics
jupyter notebook
```

YOLO 학습, Segmentation, Pose 실습은 GPU가 있는 Google Colab을 권장합니다. `data.yaml`과 Notebook의 경로를 현재 환경에 맞게 변경하세요.

## 복습 포인트

- OpenCV는 BGR, Matplotlib·Pillow는 RGB를 기본으로 사용하는 차이에 주의합니다.
- 객체 탐지는 Class와 Bounding Box를, Segmentation은 Pixel 단위 영역을 예측합니다.
- Precision·Recall·mAP와 클래스별 Confusion Matrix로 탐지 성능을 평가합니다.
- 긴 동영상은 `stream=True`를 사용해 모든 Frame 결과가 메모리에 쌓이지 않게 합니다.

## 주의사항

- 모델 가중치, 학습 결과, 이미지 Dataset은 용량이 커 Git에서 제외될 수 있습니다.
- 사람 이미지와 영상은 초상권·개인정보·Dataset License를 확인합니다.
- OCR을 실행하려면 Python 패키지 외에 Tesseract 프로그램 설치가 필요합니다.

[저장소 메인으로 돌아가기](../README.md)
