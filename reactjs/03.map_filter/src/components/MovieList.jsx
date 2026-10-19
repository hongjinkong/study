import MovieCard from './MovieCard';

const MovieList = () => {

    const movies = [
            { id: 1, title: "인터스텔라", genre: "SF", rating: 9.2 },
            { id: 2, title: "어벤져스", genre: "액션", rating: 8.5 },
            { id: 3, title: "트랜스포머", genre: "액션", rating: 7.2 },
            { id: 4, title: "인셉션", genre: "SF", rating: 9.0 },
            { id: 5, title: "분노의 질주", genre: "액션", rating: 7.5 },
    ];

    // 평점 8점 이상인 영화만 필터링 -> filter()
    let good_movies = movies.filter( (movie) => movie.rating >= 8 );

    // map() : 필터링된 영화를 MovieCard로 출력
    let result = good_movies.map( (movie) => {
        return <MovieCard key={movie.id} data={movie}/>
    } );

  return (
    <div>
        <h1>추천 영화 목록</h1>
        <p>평점 8점 이상인 영화만 표시합니다.</p>
        <hr/>
        {result}
    </div>
  )
}

export default MovieList
