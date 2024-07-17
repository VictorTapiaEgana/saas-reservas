import './App.css'

import 'bootstrap/dist/css/bootstrap.min.css';

import Button from 'react-bootstrap/Button';
import NavBar from './components/NavBar/NavBar';
import TabsServicios from './components/TabsServicios/TabsServicios';

function App() {  


  return (
    <>
        <NavBar />

        <section className='container'>
             <TabsServicios/>
        </section>

        <section className='container text-center'>
             <Button className='bg-info my-2'>Agendar Hora</Button>
        </section>
          
    </>
  )
}

export default App