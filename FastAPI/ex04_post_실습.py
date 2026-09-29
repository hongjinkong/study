from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
app = FastAPI()
students = []

# 1.학생 데이터 형식을 정의하세요. -> name, age, major
class Student(BaseModel):
    name: str
    age: int
    major: str

# 2.POST /students를 만드세요.
@app.post("/students")
def create_student(student: Student):
    students.append(student)
    return {
        "message": "학생 등록 완료",
        "student": student
    }

# 3.GET /students를 만드세요.
@app.get("/students")
def get_students():
    return {
        "count": len(students),
        "students": students
    }

# 서버 실행
if __name__ == "__main__":
    uvicorn.run(
        "ex04_post_실습:app",
        host="127.0.0.1",
        port=8000,
        reload=True
    )
