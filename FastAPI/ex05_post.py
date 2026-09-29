from fastapi import FastAPI, Form
import uvicorn
app = FastAPI()

# 기본 hello 경로 만들어서 "post요청성공" 리턴값으로 받기

@app.post("/hello")
def hello():
    return "post 요청성공"

@app.post("/students")
def create_students(
    name:str=Form(),
    age:int=Form(),
):
    return{
        "name":name,
        "age":age
    }

if __name__ == "__main__":
    uvicorn.run(
        "ex05_post:app",
        host="127.0.0.1",
        port=8000,
        reload=True
    )