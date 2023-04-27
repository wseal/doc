import React from 'react'
import ReactDOM from 'react-dom/client'

// init style pre load then all other css
import 'reset-css'

// UI style

// global style
import '@/assets/styles/global.scss'

// components sytele
import App from './App.tsx'

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
