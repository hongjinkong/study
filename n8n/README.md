# Audio Model Fine-tuning

현재 이 폴더에는 Hugging Face Transformers 기반 음성 분류 모델을 파인튜닝하는 Colab 노트북이 있습니다. 추후 n8n 자동화 흐름과 연결할 수 있는 모델 학습 단계에 해당하며, n8n Workflow JSON은 아직 포함되어 있지 않습니다.

## 노트북 내용

`ex01_Transformers기반_Audiomodel_파인튜닝.ipynb`에서 다음 과정을 다룹니다.

1. Hugging Face Dataset 불러오기와 Train/Test 분리
2. 오디오 파형 확인과 16kHz 리샘플링
3. Wav2Vec2 Feature Extractor를 이용한 전처리
4. `AutoModelForAudioClassification` 모델 구성
5. `TrainingArguments`와 `Trainer`를 이용한 파인튜닝
6. 평가 지표 계산과 Hugging Face Hub 업로드
7. `pipeline`과 TorchAudio를 이용한 녹음 파일 추론

## 주요 기술

- Hugging Face `datasets`, `transformers`, `evaluate`, `huggingface_hub`
- Wav2Vec2 음성 표현 모델
- PyTorch, TorchAudio
- Google Colab과 Google Drive

## 실행 방법

GPU 사용이 가능한 Google Colab에서 노트북을 여는 것을 권장합니다. 노트북 안의 Google Drive 경로와 Dataset 이름, 모델 저장 경로는 본인 환경에 맞게 변경해야 합니다.

## 주의사항

- Hugging Face 로그인 토큰을 노트북이나 저장소에 직접 기록하지 않습니다.
- 음성 데이터에 개인정보나 타인의 목소리가 포함된 경우 수집·학습 권한을 확인합니다.
- 학습 결과와 체크포인트는 용량이 크므로 별도 저장소나 모델 Hub에서 관리합니다.

[저장소 메인으로 돌아가기](../README.md)
