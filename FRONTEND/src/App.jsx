import './App.css'

import 'bootstrap/dist/css/bootstrap.min.css';

// import Button from 'react-bootstrap/Button';
import NavBar from './components/NavBar/NavBar';
import TabsServicios from './pages/reservas/TabsServicios/TabsServicios';

function App() {  


  return (
    <>
        <NavBar />

        <section className='container'>
             <TabsServicios/>
        </section>       
          
    </>
  )
}

export default App