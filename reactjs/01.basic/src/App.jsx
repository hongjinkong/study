import './App.css'

// App.jsx 역할
// - React App의 루트 컴포넌트
// - 다른 컴포넌트를 불러온 후 조합하는 방식

// JSX 문법 규칙
// - 기본 표기법 : {}
// - return문 내에서 JS 문법을 사용할 때 {} 활용
// ex) 변수를 출력할 때 -> { 변수명 }
//     조건에 따른 출력할 때 -> { 조건부 렌더링 문법 }

// - 반드시 부모요소는 하나여야 한다!
// ex) return <>hello react</> -> O
//     return <>hello react</><>hello react</> -> X
//     해결방법) return<><>hello react</><>hello react</></> -> O

// - 스타일 적용 방식 2가지로 구분
// 1) 객체 형태로 작성
//    ex)  <p style={ { 스타일속성:값, .... } }>
//         <p style={ style이 정의된 객체변수 }>

// 2) import로 css 파일을 불러오는 방식

function App() {

  let msg = "Hello React!";
  let isLogin = true;
  let major = "React";
  let result;

  // 스타일 속성이 많은 경우 객체로 만들어서 사용
  let style = {
    color:"green",
    fontWeight:"bold",
    fontSize:"50px"
  };

  // 조건식, 실행할 로직의 양일 많은 경우 조건문으로 처리
  // * if문, for문은 JSX 문법에서 지원하지 않음
  if(isLogin){
    result = "test님 환영합니다!";
  }else{
    result = "로그인해주세요.";
  }

  // 전체 코드 정렬 : Ctrl + A -> Ctrl + K F
  return (
    // return문 내 부모요소는 하나만 구성
    // 어떤 요소든 상관없으나 보통 <div> or <>를 사용
    <>
      <>
        hello react! <br></br>
        {/* JSX문법 표기 -> 중괄호{ JS문법 } */}
        {/* JS의 변수를 HTML에 적용하는 방법(중괄호 내 변수명 작성) */}
        {msg}
      </>
      <>
        {msg}
      </>
      {/* 조건부 렌더링 : 조건에 따라 실행하는 방식 */}
      {/* 조건식 && 렌더링할 요소 */}
      {isLogin && <p>로그인된 상태입니다..</p>}

      {/* 삼항연산자 */}
      { isLogin ? <p>로그인 상태</p> : <p>비로그인 상태</p> }

      { isLogin ? (<p>환영합니다.</p>)
      : major === "React" ? (
        <p>UI 라이브러리 첫 시간!</p>
      ) : (
        <p>로그인 해주세요!</p>
      ) }

      {/* 조건문 결과 출력 */}
      <h2>{ result }</h2>
      {/* 스타일 적용 방법 */}
      {/* style={ 객체표기 } */}
      <p style={ { color:"blue", fontWeight:"bold" } }>스타일 적용 실습</p>

      <p style={ style }>스타일 적용 실습 2</p>
    </>
  )
}

export default App
