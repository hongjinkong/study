const MovieCard = ({data}) => {
  return (
    <div>
        <h2>{data.title}</h2>
        <p>장르 : {data.genre}</p>
        <p>평점 : {data.rating}점</p>
        <hr/>
    </div>
  )
}

export default MovieCard
