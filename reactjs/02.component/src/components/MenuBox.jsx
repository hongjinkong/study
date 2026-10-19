/*
    Props 내용 정리
    - 상위 컴포넌트에서 하위 컴포넌트로 데이터를 전달하는 방식(단방향)
    - 전달되는 데이터 형태 : 객체 구조
    ex)
      [상위]
      <MenuBox menuNm="아메리카노" price="2000원"/>
      |
      {props:{menuNm:"아메리카노", price="2000원"}}
      |
      [하위]
      데이터 접근 1)
      - props.menuNm , props.price

      데이터 접근 2)
      - { menuNm, price }  --> 구조분해할당 방식

      * 구조분해할당 예시
      let menu = { name:"아메리카노", price:2500}
      let {name, price} = menu;
*/

// rafce 명령어 : 화살표 함수구조를 생성하는 명령어

// props 사용법
// const MenuBox = (props) => {
//   return (
//     <div>
//       <h2>{props.menuNm}</h2>
//       <p>가격: {props.price}원</p>
//     </div>
//   )
// }

// 객체명 사용법
const MenuBox = ( { menuNm, price } ) => {
  return (
    <div>
      <h2>{menuNm}</h2>
      <p>가격: {price}원</p>
    </div>
  )
}


export default MenuBox
