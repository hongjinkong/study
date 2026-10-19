import './App.css'
import { useState } from 'react'
import { Navigate, Route, Routes } from 'react-router-dom'
import HomePage from './page/HomePage.jsx'
import AboutPage from './page/AboutPage.jsx'
import BoardPage from './page/BoardPage.jsx'
import LoginPage from './page/LoginPage.jsx'
import MyPage from './page/MyPage.jsx'
import BoardDetail from './page/BoardDetail.jsx'
import BoardSearch from './page/BoardSearch.jsx'

// 컴포넌트를 App 바깥에 선언해야 App이 렌더링될 때마다 새로 생성되지 않는다.
// 인증되지 않은 사용자는 replace 옵션으로 로그인 페이지로 리다이렉트한다.
const PrivateRoute = ({auth}) => {
  return auth ? <MyPage /> : <Navigate to="/login" replace />
}

function App() {
  // 인증 정보를 가진 state. 새로고침하면 초기값(false)으로 돌아온다.
  const [auth, setAuth] = useState(false);

  return (
    // 사용자의 요청에 따른 컴포넌트를 묶어 놓는 컴포넌트
    <Routes>

      {/* 사용자가 요청에 맞는 컴포넌트를 이동하는 컴포넌트
        - path : url 경로
        - element : 실행할 컴포넌트
      */}
      <Route path='/' element={<HomePage/>} />
      <Route path='/about' element={<AboutPage/>} />
      <Route path='/board' element={<BoardPage/>} />

      {/* 고정 경로와 동적 세그먼트(:boardNo)를 이용한 경로 */}
      <Route path='/board/search' element={<BoardSearch/>} />
      <Route path='/board/:boardNo' element={<BoardDetail/>} />

      <Route path='/login' element={<LoginPage setAuth={setAuth}/>} />
      <Route path='/mypage' element={<PrivateRoute auth={auth}/>}/>
    </Routes>
  )
}

export default App
