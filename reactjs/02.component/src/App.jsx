import './App.css'
import MenuBox from './components/MenuBox'
import BookBox from './components/BookBox'
import Count from './components/Count'

function App() {

  return (
    <>
      {/* 컴포넌트 적용 전 */}
      <div>
        <h2>아메리카노</h2>
        <p>가격 : 2000원</p>
      </div>
      <div>
        <h2>바닐라라떼</h2>
        <p>가격 : 2200원</p>
      </div>

      {/* 컴포넌트 적용 후 */}
      <hr/>

      {/*
        컴포넌트 사용 방법)
        - 컴포넌트 파일 생성 -> rafce 명령어로 틀 생성
        - 루트 컴포넌트에서 생성한 컴포넌트 사용

        컴포넌트 특징)
        - 대문자로 시작
        - 한 번 정의한 HTML태그 구조를 재사용
      */}
      <MenuBox menuNm="아메리카노" price="2000"/>
      <MenuBox menuNm="바닐라라떼" price="2200"/>

      {/* 컴포넌트 실습 - 도서 목록 출력 */}
      <hr/>
      <div>
        <h2>추천도서목록</h2>
      </div>
      <hr/>
      <BookBox bookNm="파이썬 입문" price="20000"/>
      <BookBox bookNm="자바스크립트 기초" price="25000"/>
      <BookBox bookNm="리액트 시작하기" price="30000"/>

      {/* state 실습 1 */}
      <Count/>



    </>
  )
}

export default App
