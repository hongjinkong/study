
const ProductItem = ({data:prd}) => {
  console.log(prd);


  return (
    <div>
      <h4>제품번호: {prd.pid} </h4>
      <p>제품명: {prd.prdName} </p>
      <p>판매가: {prd.price} </p>
    </div>
   )
}

export default ProductItem
