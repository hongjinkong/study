import { useState } from 'react'

/*
    실습 - 참참참 게임 만들기

    1. 사용자는 공격, 컴퓨터는 수비 역할로 설정한다.
    2. 좌, 정면, 우 중 버튼 하나를 클릭하면 사용자와 컴퓨터 값을 비교한다.
    3. 사용자와 컴퓨터의 선택이 다르면 컴퓨터가 승리한다.

*/
const ChamChamCham = () => {

  // 사용자의 선택과 컴퓨터의 선택만 state로 관리한다.
  const [user, setUser] = useState("");
  const [com, setCom] = useState("");

  let arr = ["좌", "정면", "우"];

  const handleClick = (e) => {
    // e: 이벤트 객체 -> 이벤트가 발생한 정보를 가진 객체
    // e.target 속성: 이벤트가 발생한 요소 정보를 가진 속성
    // e.target.innerText: HTML요소의 콘텐츠를 보관하고 있는 속성
    console.log(e.target.innerText);

    let userChoice = e.target.innerText;

    let randomIdx = Math.floor(Math.random() * 3);
    let comChoice = arr[randomIdx];

    setUser(userChoice);
    setCom(comChoice);

  }

  let buttons = arr.map( (item, index) => <button key={index} onClick={handleClick}>{item}</button>);

  // result는 user와 com으로 바로 계산할 수 있는 파생 값이다.
  // 이런 값은 별도 state와 useEffect로 다시 저장하지 않아도 된다.
  const result = user === "" || com === ""
    ? ""
    : user === com ? "사용자 승리!" : "컴퓨터 승리!";

  return (
    <div>
      <h1>참참참 게임</h1>
      <h4>사용자: {user}</h4>
      <h4>컴퓨터: {com}</h4>
      <h4>게임결과: {result}</h4>

      {buttons}

    </div>
  )
}

export default ChamChamCham
