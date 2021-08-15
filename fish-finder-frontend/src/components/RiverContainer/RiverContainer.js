import React, {useState, useEffect} from 'react'

export default function RiverContainer() {
  const [rivers, setRivers] = useState([]);
  const riversList = rivers.map(river => <li>{river.name}</li>);

  useEffect(() => {
    fetch('http://localhost:9393/rivers')
      .then(res => res.json())
      .then(setRivers);
  }, [])

  return (
    <div>
      <h1>Rivers</h1>
      <ul>
        {riversList}
      </ul>
    </div>
  )
}