import { useNavigate } from 'react-router-dom'

const BoardPage = () => {

    // useNavigate는 버튼 클릭이나 로그인 완료처럼 로직 실행 후 이동할 때 사용한다.
    const navigate = useNavigate();

    const handleSearch = () => {
        // 특정 키워드를 조회하는 페이지로 이동
        navigate('/board/search?query=문의글')
    }

    const handleClick = () => {
        // 1번 게시글 페이지로 이동
        navigate('/board/1');
    }

    return (
    <div>
        <button onClick={handleClick}>1번 게시글 이동</button>
        <button onClick={handleSearch}>검색</button>
    </div>
    )
}

export default BoardPage
