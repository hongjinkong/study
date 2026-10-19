import ProductItem from './ProductItem';

const ExamFilter = () => {

    let products = [
        { pid: 1, prdName: "모니터", price: 320000 },
        { pid: 2, prdName: "GPU", price: 570000 },
        { pid: 3, prdName: "받침대", price: 19900 },
        { pid: 4, prdName: "키보드", price: 150000 },
        { pid: 5, prdName: "마우스", price: 99000 },
    ];

    // 10만원 미만의 제품 데이터를 필터링
    // filter() : 배열 내 데이터를 조건으로 판단하여 true인 데이터를 새로운 배열로 생성
    let new_products = products.filter( (prd) => prd.price < 100000 );
    console.log(new_products);

    // filter()로 생성된 배열을 map()으로 JSX 컴포넌트 배열로 변환한다.
    let result = new_products.map( (prd) => {
      return <ProductItem key={prd.pid} data={prd}/>

    } );

  return (
    <div>
        {result}
    </div>
  )
}

export default ExamFilter
