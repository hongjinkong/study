from fastapi import FastAPI, HTTPException
import uvicorn

app = FastAPI()

books = {
    1: {
        "title": "파이썬 기초",
        "price": 20000
    },

    2: {
        "title": "파이썬 입문",
        "price": 25000
    },

    3: {
        "title": "머신러닝",
        "price": 30000
    }
}

# query parameter로 받은 keyword가 title에 포함된 책만 조회
@app.get('/search')
def search(keyword:str):
    result = []
    for book_id, book in books.items():
        if keyword in book["title"]:
            result.append(book)

    return {
        "result": result,
        "keyword": keyword
    }

# 책 전체 조회
@app.get('/books')
def get_books():
    return books

# path parameter로 받은 book_id로 책 한 권 조회
@app.get('/books/{book_id}')
def get_book(book_id:int):
    return books[book_id]

if __name__ == "__main__":
    uvicorn.run(
        "ex03_FastAPI_실습:app",
        host="127.0.0.1", # 내 컴퓨터에서 실행중인 서버
        port=8000,
        reload=True
    )