const pool  = require('../utils/db_config');

const getUsers = async() =>{

    let connection;

    try {

        connection = await pool.getConnection();
        const [results] = await connection.query('SELECT * FROM usuarios');
        
        if (Number(results.length) > 0){
            
            return results;

        } else {

            return ({'status':'sin resultado'}) 

        }        

    } catch (error) {

        console.error(`X Error al conectar a la base de datos : ${error.message}`);        

    } finally {

        if (connection) connection.release();

    }

};

module.exports = getUsers;