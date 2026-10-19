import { useEffect, useState } from 'react'
import axios from 'axios'

// Vite에서 브라우저에 공개할 환경변수는 VITE_ 접두사가 필요하다.
// 실제 API 키가 들어 있는 .env 파일은 Git에 커밋하지 않는다.
const API_KEY = import.meta.env.VITE_MOVIE_API_KEY;
const targetDt = "20261015";
const movieUrl = `https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=${API_KEY}&targetDt=${targetDt}`;

const MovieList = () => {

    // 영화 정보를 보관하는 state
    // 렌더링에서 map()을 사용하므로 초기값도 배열이어야 한다.
    const [movieList, setMovieList] = useState([]);
    const [error, setError] = useState(
      API_KEY ? "" : "VITE_MOVIE_API_KEY를 .env 파일에 설정해주세요."
    );

    useEffect( ()=> {
      if (!API_KEY) return;

      // effect가 정리된 뒤 늦게 도착한 응답이 state를 변경하지 않도록 표시한다.
      let cancelled = false;

      // axios.get()은 Promise를 반환한다. 응답이 도착하면 필요한 필드만 추려낸다.
      axios.get(movieUrl)
        .then((response) => {
          if (cancelled) return;

          const dailyBoxOfficeList = response.data.boxOfficeResult.dailyBoxOfficeList;
          const result = dailyBoxOfficeList.map((movie) => ({
            rank: movie.rank,
            movieNm: movie.movieNm,
            openDt: movie.openDt
          }));

          setMovieList(result);
        })
        .catch((requestError) => {
          if (cancelled) return;

          console.error(requestError);
          setError("영화 정보를 불러오지 못했습니다.");
        });

      // 언마운트 시 실행되는 cleanup 함수다.
      return () => {
        cancelled = true;
      };
    }, [] );


  return (
    <div>
      <h1>영화목록</h1>
      {error && <p>{error}</p>}
      <div>
        {movieList.map( (movie) => (
          <div key={movie.rank}>
            {movie.rank}.{movie.movieNm} (개봉일 : {movie.openDt})
          </div>
        ))}
      </div>
    </div>

  )
}

export default MovieList
