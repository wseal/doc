import { useState } from 'react'

function App() {
  const [count, setCount] = useState(0)

  const handleClick = ()=>{
    const c = count + 1;
    setCount(c);
  }

  return (
    <>
      <h1 onClick={handleClick}>Vite + React {count}</h1>
    </>
  )
}

export default App
