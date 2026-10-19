import { useRef, useState } from 'react';
import MovieCard from './MovieCard';

const MovieList2 = () => {

    // 검색어를 저장할 state 초기화
    const [keyword, setKeyword] = useState("");

    // 입력요소 값을 저장하는 ref 초기화
    // useRef(): 입력요소에 접근하기 위한 함수  ex) 로그인폼, 회원가입폼, 게시글작성폼 등
    // 사용방법)
    // 1. 객체생성 -> const ___Ref = useRef();
    // 2. 입력요소에 연결 -> <input type "__" ref={__Ref}/>
    // 3. 값 접근 -> __Ref.current.value
    const searchRef = useRef();

    const movies = [
            { id: 1, title: "인터스텔라", genre: "SF", rating: 9.2 },
            { id: 2, title: "어벤져스", genre: "액션", rating: 8.5 },
            { id: 3, title: "트랜스포머", genre: "액션", rating: 7.2 },
            { id: 4, title: "인셉션", genre: "SF", rating: 9.0 },
            { id: 5, title: "분노의 질주", genre: "액션", rating: 7.5 },
    ];

    const handleSearch = () => {
        console.log(searchRef);  // {current:input객체}
        console.log(searchRef.current.value);  // input객체의 value속성-> 실제 입력한 값

        // 입력값을 keyword state에 초기화(변경)
        setKeyword(searchRef.current.value);
    }

    // 평점 8점 이상인 영화만 필터링 -> filter()
    let good_movies = movies.filter( (movie) => {

        let ratingCondition = movie.rating >= 8;

        // 빈 문자열은 모든 문자열에 포함되므로 첫 화면에서는 평점 조건만 적용된다.
        // 검색어가 있으면 영화 제목 또는 장르에 포함되는지도 함께 검사한다.
        let searchCondition =
            movie.title.includes(keyword) || movie.genre.includes(keyword);

        return ratingCondition && searchCondition;
    } );

    // map() : 필터링된 영화를 MovieCard로 출력
    let result = good_movies.map( (movie) => {
        return <MovieCard key={movie.id} data={movie}/>
    } );

  return (
    <div>
        <div>
          <input type="text" ref={searchRef}/>
          <button onClick={handleSearch}>검색</button>
          <hr/>
        </div>
        <div>{result}</div>
    </div>
  )
}

export default MovieList2
