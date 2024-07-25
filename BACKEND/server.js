const express = require('express');
const getUsers = require('./functions/getUsers');
const getDatosIniciales = require('./functions/getDatosIniciales');
const ObtenerDatosEmpresa =  require('./functions/ObtenerDatosEmpresa')
const cors = require('cors');

const PORT = process.env.SERVER_PORT || 3003 ;

const app = express();
app.use(cors({ credentials: true, origin: 'http://localhost:5173' }));

// AGREGAR VALIDACION JWT TODAS LAS RUTAS

app.get('/users', async(req,res)=>{

     const resulado = await getUsers();
     res.status(200).json(resulado);
     
})

app.get('/empresa/:id',async(req,res)=>{

   const idEmpresa =  req.params.id;   

   try {

      const resulado =  await ObtenerDatosEmpresa(idEmpresa);
      res.status(200).json(resulado);
      
   } catch (error) {
      
      console.log(`X Error al obterner los datos (/empresas:id) :  ${error}`);

   }

});

app.get('/datosiniciales',async (req,res)=>{

     try {

        const resultado = await getDatosIniciales();
        res.status(200).json(resultado)
         
        
     } catch (error) {

        console.log(`X Error (/datosiniciales): ${error}`);
        
     }

})



























































































app.listen(PORT,()=>{

    console.clear();
    console.log(`Holiwis en port : ${PORT}`)

});