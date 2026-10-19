import { useSearchParams } from 'react-router-dom'

const BoardSearch = () => {

  // /board/search?query=문의글에서 query 값을 읽는다.
  // useSearchParams가 반환하는 첫 번째 값은 URLSearchParams 객체다.
  const [searchParams] = useSearchParams();
  const keyword = searchParams.get('query');

  return (
    <div>검색어: {keyword}</div>
  )
}

export default BoardSearch
