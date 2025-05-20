import React, {useEffect,useState} from 'react';

function App() {
  const [name, setName] = useState('')
  const [price, setPrice] = useState('0')
  const [data, setData] = useState(null)

  const handleAdd = async () => {
      try {
          fetch('http://localhost/create', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name: name, price: price })
          })

          const fetchData = async () => {
            const response = await fetch(`http://localhost/`)
            const newData  = await response.json()
            setData(newData)
            handleDisplay(newData)

          };

          fetchData()

      } catch (err) {
          console.log(err.message)
      }
  }
  function handleDisplay(data) {
      if (data) {
          console.log(data)
          return (
            <pre>{JSON.stringify(data, null,2)}</pre>
          )
      } else {
          return null;
      }

  }

  return (
      <div>
          <input className='name_id'  required="required" placeholder='Enter Name'  value={name} onChange={e => setName(e.target.value)} />
          <input className='price_id' required="required" placeholder='Enter Price' value={price} onChange={e => setPrice(e.target.value)} />


          <button type="submit" onClick={handleAdd} >Add</button>
          {handleDisplay(data)}
      </div>
  )

}

export default App;
