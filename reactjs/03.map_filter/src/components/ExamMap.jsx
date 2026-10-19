import NumberItem from './NumberItem';

const ExamMap = () => {

  let arr = [1,2,3,4,5];

  return (
    <div>
        {/* map()
            : 배열 내 데이터를 가져온 후 새로운 배열로 생성
            : 배열객체.map( (item, index) => { return 출력할 데이터 } )

            key속성(필수 정의)
            : 배열 내 데이터 변경이 발생했을 때, 구분하기 위한 고유 식별자
            : 추가, 수정, 삭제, 변경 등의 변화를 감지하여 식별자로 구분
            : 실제 데이터에 고유 id가 있다면 index보다 id를 key로 사용하는 것이 안전
        */}
        { arr.map( (number, index) => {
            return <NumberItem key={index} num={number} idx={index}/>
        } ) }
    </div>
  )
}

export default ExamMap
