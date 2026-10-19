import { useEffect, useState } from 'react'
import Timer from './Timer';

const Count = () => {

    const [cnt, setCnt] = useState(0);
    const [cnt2, setCnt2] = useState(1);
    const [showTimer, setShowTimer] = useState(true);

    const handleClick = () => {
      setCnt( (prev) => prev + 1 );
    }

    const handleClick2 = () => {
      setCnt2( (prev) => prev + 2 );
    }

    // Mount : App이 처음 실행되었을 때 동작하는 시점
    // - 외부 API 연동관련 로직
    useEffect( () => {
      console.log("Count 컴포넌트 앱 실행!");
    }, [] );

      // Update : state에 변화가 생겼을 때 동작하는 시점
      // - state변경에 따른 컴포넌트 호출, 조건에 따른 처리 등...

    // useEffect( () => {
    //   console.log("cnt 업데이트 발생!");
    // }, [cnt] );

    // useEffect( () => {
    //   console.log("cnt2 업데이트 발생!");
    // }, [cnt2]);

    useEffect( () => {
      console.log("cnt or cnt2 업데이트 발생!");
    }, [cnt, cnt2]);

  return (
    <div>
        <h1>useEffect() 실습</h1>
        <h2>{cnt}</h2>
        <h2>{cnt2}</h2>

        <button onClick={handleClick}>cnt + 1</button>
        <button onClick={handleClick2}>cnt2 + 2</button>

        <hr/>

        {showTimer && <Timer/>}
        <button onClick={ () => setShowTimer( (prev) => !prev) }>타이머</button>

    </div>
  )
}

export default Count
