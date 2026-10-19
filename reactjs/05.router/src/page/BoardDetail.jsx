import { useParams } from 'react-router-dom'

const BoardDetail = () => {
  // /board/:boardNo에서 :boardNo에 들어온 값을 문자열로 가져온다.
  const {boardNo} = useParams();

  console.log(boardNo);

  return (
    <div>{boardNo}번 게시글</div>
  )
}

export default BoardDetail
