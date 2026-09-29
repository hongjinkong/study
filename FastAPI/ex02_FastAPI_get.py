# http 프로토콜 중 GET 방식으로 요청할 때
# -> 클라이언트가 서버의 데이터나 결과를 조회하기 위해 사용하는 방식

from fastapi import FastAPI
import uvicorn


app = FastAPI()
students = {
    1:"홍진성",
    2:"황서현",
    3:"이성재"
}

@app.get("/students/{student_id}")
def get_student(student_id:int):
    return student_id

@app.get("/student/{student_id}")
def student(student_id:int):
    return {
        "id": student_id,
        "name": students[student_id]
    }

# Query Parameter
@app.get('/search')
def search(keyword: str):
    return{
        "검색어": keyword
    }

@app.get('/products')
def products(category: str, price: int):
    return{
        'category': category,
        'price': price
    }

@app.get('/products1')
def products1(category:str = 'all'):
    return{
        'category': category
    }

# path+ query parameter
@app.get('/students1/{student_id}')
def get_student(student_id:int, detail:str):
    return {
        'student_id': student_id,
        'detail': detail
    }

@app.get("/recommend")
def recommend(subject:str,time:int):
    return {
        "recommendation": f"{subject}를 하루 {time}분씩 복습하는 것을 추천합니다!"
    }

@app.get('/')
def home():
    return "Hello World"

if __name__ == "__main__":
    uvicorn.run(
        "ex02_FastAPI_get:app",
        host="127.0.0.1", # 내 컴퓨터에서 실행중인 서버
        port=8000,
        reload=True
    )