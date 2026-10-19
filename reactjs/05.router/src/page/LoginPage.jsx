import { useNavigate } from 'react-router-dom'

const LoginPage = ({setAuth}) => {

  const navigate = useNavigate();

  const handleClick = () => {
    // 부모(App)의 인증 상태를 변경한 다음 홈으로 이동한다.
    setAuth(true);
    navigate('/');
  }

  return (
    <div>
      <h2>로그인 화면</h2>
      <button onClick={handleClick}>로그인</button>
    </div>
  )
}

export default LoginPage
