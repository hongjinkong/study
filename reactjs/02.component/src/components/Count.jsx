import { useState } from 'react'

/*
    state 내용 정리
    - 컴포넌트 내에서 관리하는 변수(독립적인 변수)
    - JS변수와의 차이? 화면에 데이터를 출력(리렌더링)
      -> useState()를 통해서 state 변수값을 화면에 반영
    - 핵심 : state는 다음 렌더링에 반영됨!

    - 문법 형태 -> const [state변수명, 초기화함수명] = useState(초기값);
      * useState()가 import 되었는지 확인할 것!

    - 초기화함수 사용법 -> set이름((prev) => prev + __ )
      : 이전 state값에 새로운 값을 더해서 현재 state로 변경한다는 의미
*/

const Count = () => {

    // 일반 지역 변수는 렌더링할 때마다 다시 0으로 만들어진다.
    const count = 0;

    // state 초기화
    // let arr = [1, 2, 3];
    // let [a, b, c] = arr;
    const [count2, setCount2] = useState(0);

    const handleClick = () => {
      // 계산 결과를 출력해도 React에 변경 사실을 알리지 않으므로 화면은 바뀌지 않는다.
      console.log(count + 1);
    }

    const handleClick2 = () => {
      // 이전 값을 기준으로 변경해야 연속 업데이트에서도 안전하다.
      setCount2((prev) => prev + 1);
      // state 변경은 즉시 반영되지 않으므로 여기에는 변경 전 값이 출력된다.
      console.log(count2);
    }

  return (
    <div>
        <p>JS변수: {count}</p>
        {/*
          React Event
          - onClick, onChange와 같은 속성을 통해 함수를 연결하는 방식
          - 적용방식 : onClick={함수명} or onClick={() => ___ }
        */}
        <button onClick={handleClick}>클릭</button>

        <hr/>
        <p>state변수: {count2}</p>
        <button onClick={handleClick2}>클릭</button>
        {/* <button onClick={() => setCount2((prev)=>prev+1)}>클릭</button> */}
    </div>
  )
}

export default Count
