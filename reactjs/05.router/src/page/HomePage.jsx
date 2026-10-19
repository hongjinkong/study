import { Link, useNavigate } from 'react-router-dom'

const HomePage = () => {
    // Link는 사용자가 직접 누르는 링크, navigate는 이벤트 처리 후 이동할 때 사용한다.
    const navigate = useNavigate();

    const goToBoard = () => {
        navigate('/board');
    }

    return (
    <div>
        HomePage
        <br />
        <Link to="/about">About으로 이동하기</Link>
        <br />
        <Link to="/mypage">MyPage으로 이동하기</Link>
        <br />
        <Link to="/login">LoginPage으로 이동하기</Link>
        <br />
        <button onClick={goToBoard}>Board로 이동하기</button>
    </div>
    )
}

export default HomePage
