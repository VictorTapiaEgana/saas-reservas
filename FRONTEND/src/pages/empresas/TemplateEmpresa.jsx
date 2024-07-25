import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import Loading from "../../components/Loading/Loading";
import CardEmpresa from "./components/CardEmpresa/CardEmpresa";
import NavBar from "../../components/NavBar/NavBar";


const ObternerDatosEmpresa = async(idEmpresa) =>{

    return await fetch(`http://localhost:3010/empresa/${idEmpresa}`)
    .then(async res =>{

      if ( !res.ok)  throw new Error ('Error en la peticion')                    

      return await res.json()
    })
}

const TemplateEmpresa = () =>{

   const { idEmpresa } = useParams();   

   const { isLoading , data } = useQuery({queryKey:['DatosEmpresa'],
                                          queryFn: async()=> await ObternerDatosEmpresa(idEmpresa)
                                        })
    
   
  if ( isLoading ) return <Loading />;
    
  return (

    
    <section>

      <NavBar />
    
      <section className="container">

          <CardEmpresa datosEmpresa = {data} />

      </section>

    </section>
  )
}

export default TemplateEmpresa;
