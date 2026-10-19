# LangChain · LangGraph

LLM 호출과 Prompt Engineering부터 RAG, Multimodal Agent, LangGraph 기반 Multi-Agent 구조까지 단계별로 학습한 Notebook 모음입니다.

## 학습 순서

| 노트북 | 주요 내용 |
| --- | --- |
| `LC01_LangChain_기초...ipynb` | LLM 연동, Prompt Template, Output Parser, Hugging Face 모델 |
| `LC02_FewShot프롬프팅...ipynb` | Zero·Few-shot, Streaming Callback, Example Selector, Chain 연결 |
| `LC03_LangChain_활용...ipynb` | Chat History, RAG, Vector Store, Multimodal 처리 |
| `LC04_LangGraph기반_RAG.ipynb` | State·Node·Edge 기반 Naive RAG Workflow |
| `ex02_Adaptive_RAG.ipynb` | Query Router, Web Search, Self Reflection을 포함한 Adaptive RAG |
| `ex03_Vision_Agent.ipynb` | 이미지·비디오 분석 Vision Agent와 CLIP |
| `new/LC05_Agent_Architecture...ipynb` | Single·Supervisor·Hierarchical Multi-Agent와 Handoff |

## 데이터 구성

- `data/`: RAG와 Multimodal 실습용 문서·이미지·텍스트
- `rag_files/`: CSV, Excel, PDF, PowerPoint, Word 등 다양한 Loader 실습 파일
- `.venv/`: 로컬 가상환경이며 저장소에 포함하지 않아야 합니다.

## 실행 방법

Notebook마다 사용하는 Provider와 Vector Store가 달라 설치 패키지가 다를 수 있습니다. 기본 환경은 다음과 같이 준비할 수 있습니다.

```bash
python -m venv .venv
source .venv/bin/activate
pip install jupyter langchain langchain-openai langgraph chromadb faiss-cpu pypdf
jupyter notebook
```

Notebook 상단의 설치 셀을 확인해 필요한 Loader, Embedding, Vision 관련 패키지를 추가로 설치합니다.

## API 키 관리

OpenAI 등 외부 서비스 키는 코드나 `key/*.txt` 파일로 저장소에 올리지 말고 환경변수 또는 `.env`로 관리합니다.

```env
OPENAI_API_KEY=발급받은_API_KEY
```

## 복습 포인트

- RAG는 문서 Load → Split → Embedding → Vector Store → Retrieve → Generate 순서로 구성됩니다.
- LangGraph의 State는 Node 간 공유되는 데이터 계약입니다.
- Agent에게 Tool을 줄 때 입력·출력 Schema와 실패 처리를 명확히 해야 합니다.
- Multi-Agent는 역할 분리의 이점과 호출 비용·복잡성 증가를 함께 고려해야 합니다.

[저장소 메인으로 돌아가기](../README.md)
