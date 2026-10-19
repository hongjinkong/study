/*
    [실습문제]
    1. 사용자로부터 이름을 입력받는다. -> prompt()
    2. 현재 날짜를 가져온다. -> Date()
    3.  가져온 월에 따른 계절 분류
     - 3~5: 봄 | 6~8: 여름 | 9~11: 가을 | 12~2: 겨울
    4. 결과출력

*/

// 1. 이름 입력받기
// - 컴포넌트 밖에 두면 StrictMode의 두 번 렌더링과 상관없이 한 번만 실행됨
let name = prompt("이름을 말해주세요.");

function AppExam() {

    // 2. 현재 날짜 가져오기
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1; // 0~11월을 반환하기 때문에 +1하기
    let date = today.getDate();
    let day = today.getDay(); // 0~6의 숫자 반환(일~토)
    let dayArr = ["(일)", "(월)", "(화)", "(수)", "(목)", "(금)", "(토)"];

    // 3. 월에 따른 계절 분류
    let season;
    if (month >= 3 && month <= 5) {
        season = "봄";
    } else if (month >= 6 && month <= 8) {
        season = "여름";
    } else if (month >= 9 && month <= 11) {
        season = "가을";
    } else {
        season = "겨울";
    }

    // 4. 결과 출력
    // - <></> 대신 <div>로 감싸야 #root의 flex 영향을 받지 않아 구분선이 보임
    return (
        <>
            <h1>{year}.{month}.{date}.{dayArr[day]}.</h1>
            <hr></hr>
            <p>{name}님 지금은 {season}입니다. 좋은 하루 보내세요 :)</p>
        </>
    );

}

export default AppExam;
