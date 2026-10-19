import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
// import App from './App.jsx'
import App from './AppExam.jsx'

// main.jsx 역할
// - index.html과 App.jsx 를 연결해주는 역할

// StrictMode
// - 내부에 문제가 발생할만한 요소가 있는지 검사하는 기능
// - 개발 모드에서만 활성화, 프로덕트 모드에서는 무시됨
// - 렌더링에 영향을 주지 않지만, 개발 중에 경고를 표시함
// - 렌더링을 두번 실행해서 오류를 감지하는 방식

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
