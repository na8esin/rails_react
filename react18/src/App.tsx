import { useCallback, useState } from 'react'
import './App.css'

type Pager = {
  page: number;
}

function App() {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Pager>();

  // 本当はquery-stringなどを使うとする
  const page = 1;

  const handleSubmit = async () => {
    console.log('helo');

    try {
      const response = await post('http://127.0.0.1:3000/api/sample', {page});
      const json = await response.json();
      setData(json)
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <div>
      {isLoading ? (
        <div>loding...</div>
      ) : (
        <div>hello!</div>
      )}
      </div>
      <button onClick={handleSubmit}>hello</button>
      <div>{data?.page}</div>
    </>
  )
}

async function post(url: string, data: any) {
  return await fetch(url, {
    method: "POST",
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      body: JSON.stringify(data),
    },
  });
}

export default App
