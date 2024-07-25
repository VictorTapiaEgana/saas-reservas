import Tab from 'react-bootstrap/Tab';
import Tabs from 'react-bootstrap/Tabs';
import { useQuery } from '@tanstack/react-query';
// import  Button  from 'react-bootstrap/Button';
import { useState } from 'react';

import Loading from '../../../components/Loading/Loading';

const fetchEmpresas = async() =>{
    // return await fetch('http://localhost:3010/datosiniciales',{credentials: "include"})
    return await fetch('http://localhost:3010/datosiniciales')
                 .then(async res =>{

                    if ( !res.ok)  throw new Error ('Error en la peticion')                    

                    return await res.json()
                 })
}

const TabsServicios = () => {
  
    const { isLoading, data } = useQuery({queryKey:['empresas'], 
                                          queryFn:  async()=> await fetchEmpresas()
                                        })
    
    const [selectedEmpresa, setSelectedEmpresa] = useState(null);

    const handleChange = (event) => {

        const selectedEmpresaNombre = event.target.value;
        const empresa = data.find(empresa => empresa.nombre === selectedEmpresaNombre);

        if (empresa) {
            setSelectedEmpresa(empresa);
        }

    };

    if ( isLoading ) return <Loading />

    return (
        
            <Tabs defaultActiveKey="servicios" id="uncontrolled-tab-example" className="mb-3 d-flex justify-content-center mt-3">

                {/* <Tab eventKey="servicios" title="Servicios"> */}
                    {/* SERVICIOS */}
                {/* </Tab> */}

                <Tab eventKey="empresas" title="Empresas">
                    <label htmlFor="exampleDataList" className="form-label">Listado Empresas</label>

                        <input className="form-control" list="datalistOptions" id="exampleDataList" placeholder="Escriba para buscar..." onChange={handleChange}/> 

                        <datalist id="datalistOptions">

                            {data.map(empresa =>{
                                return(
                                    <option key={empresa.id_empresa} value={empresa.nombre}/>   
                                )
                            })}                            

                        </datalist>

                        <section className='container text-center'>
                            {/* <Button className='bg-info my-2'>Seleccionar empresa</Button> */}
                            <a type="button" 
                               className="btn btn-info mt-5" 
                               href={selectedEmpresa ? `/empresa/${selectedEmpresa.id_empresa}` : "/"}>
                                Seleccionar empresa
                            </a>
                            
                        </section>
                    
                </Tab>

                {/* <Tab eventKey="contact" title="Contact">
                    Tab content for Contact
                </Tab> */}

        </Tabs>

    );
}

export default TabsServicios;