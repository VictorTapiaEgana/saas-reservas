const express = require('express');
const getUsers = require('./functions/getUsers');

const PORT = process.env.SERVER_PORT || 3003 ;

const app = express();


app.get('/', async(req,res)=>{

     const resulado = await getUsers();
     res.status(200).json(resulado);
     
})



























































































app.listen(PORT,()=>{

    console.clear();
    console.log(`Holiwis en port : ${PORT}`)

});