import { useEffect } from 'react'

const Timer = () => {


    // UnMount : 앱이 종료되는 시점
    // - 자원이 많이 할당되는 서비스를 종료할 때 ex) 채팅앱(실시간 통신)
    // - 자주 사용되는 편은 아니다
    useEffect( () => {

        const interval = setInterval(() => {
            console.log("1초마다 실행");
        }, 1000);

        return () => {
            console.log("타이머 종료");
            clearInterval(interval);
        }

    }, []) // 빈 배열: 마운트할 때 한 번 등록하고 언마운트할 때 정리한다.

  return (
    <div>Timer</div>
  )
}

export default Timer
