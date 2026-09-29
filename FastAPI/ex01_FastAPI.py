from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/") # http  규약에서 요청하는 방법 -> get : 서버야 이 정보를 줘!
                                        # post : 서버야 이 데이터를 줄테니 처리해줘
def home():
    return "Hello World"

@app.get("/number")
def number():
    return 100

@app.get("/students")
def students():
    return {
        "name": "홍진성",
        "age": 26,
        "gender": "male"
        }

if __name__ == "__main__":
    uvicorn.run(app,
                host="127.0.0.1", # 내 컴퓨터에서 실행중인 서버
                port=8000) # 포트번호

