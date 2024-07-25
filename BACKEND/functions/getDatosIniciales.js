const pool = require ('../utils/db_config');

const getDatosIniciales =  async() =>{

    let connection;

    try {
        connection = await pool.getConnection();

        const [results] = await connection.query(`    
                                                  SELECT 
                                                       id_empresa,
                                                       nombre
                                                  FROM 
                                                      Empresas
                                                 ORDER BY nombre ASC;`)
        
       if (Number(results.length) > 0){
            
            return results;

        } else {

            return ({'status':'sin resultado'}) 

        }    
        
    } catch (error) {
        
        console.log(`X Error (getDatosIniciales) : ${error}`);
        
    } finally {

        if (connection) connection.release();

    }

};

module.exports = getDatosIniciales;