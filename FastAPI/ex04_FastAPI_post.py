from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
app = FastAPI()

@app.post("/hello")
def hello():
    return {
        "message":"POST 요청 성공"
    }
class Student(BaseModel): #서버로 받을 학생의 데이터는 이런 형태이고, 이런 자료형을 가지고있어야한다!
    name: str
    age: int

@app.post("/students")
def create_student(student:Student):
    return {
        "name": student.name,
        "age": student.age
    }

class User(BaseModel):
    name:str
    age:int
    email:str
    passwd:str

@app.post("/register")
def register(user:User):
    return{
        "message":"회원가입 성공",
        "name":user.name,
        "age":user.age
    }

class Person(BaseModel):
    name:str
    age:int

users=[]
@app.post("/person")
def person(person: Person):
    users.append(person)
    return{
        "message":"인원등록완료",
        "user":person
    }

@app.get("/person")
def get_person():
    return{
        "user":users
    }

class Customer(BaseModel):
    name:str
    income:int

# 조건문을 추가해서 조건에 따른 결과값을 보여주기!
@app.post("/predict")
def predict(customer:Customer):
    # income > 300 이상이면 name님은 vip 입니다. 아니라면 name 님은 일반고객입니다.
    if customer.income > 3000:
        result = f'{customer.name} 님은 vip 입니다.'
    else:
        result = f'{customer.name} 님은 일반고객입니다.'
    return{
        "result" : result
    }
# 서버 실행
if __name__ == "__main__":
    uvicorn.run(
        "ex04_FastAPI_post:app",
        host="127.0.0.1",
        port=8000,
        reload=True
    )