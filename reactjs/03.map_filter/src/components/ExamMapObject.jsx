import ProductItem from './ProductItem';

const ExamMapObject = () => {

    let products = [
        { pid: 1, prdName: "모니터", price: 320000 },
        { pid: 2, prdName: "GPU", price: 570000 },
        { pid: 3, prdName: "받침대", price: 19900 },
        { pid: 4, prdName: "키보드", price: 150000 },
        { pid: 5, prdName: "마우스", price: 99000 },
    ];

    let new_products = products.map( (prd) => {
        return (<ProductItem key={prd.pid} data={prd}/>)
    } );

    return (
        <div>
            { new_products }

            { products.map( (prd) => {
                return <ProductItem
                                key={prd.pid}
                                data={prd} />

                // return (
                //     <div>
                //         <h4>제품번호: {prd.pid}</h4>
                //         <p>제품명: {prd.prdName}</p>
                //         <p>판매가: {prd.price}</p>
                //     </div>
                // )
             } ) }
        </div>
    )
}

export default ExamMapObject
