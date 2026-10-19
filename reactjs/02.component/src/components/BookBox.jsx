const BookBox = (props) => {
  return (
    <div>
        <h2 className="b_title">{props.bookNm}</h2>
        <p>{props.price}원</p>
    </div>
  )
}

export default BookBox
