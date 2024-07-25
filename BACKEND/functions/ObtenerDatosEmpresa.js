const pool = require('../utils/db_config');

const ObtenerDatosEmpresa = async(idEmpresa) =>{

    let connection;

    try {
         connection = await pool.getConnection();
         const [ results ] = await connection.query(`SELECT 
                                                        E.id_empresa,
                                                        E.nombre AS nombre_empresa,
                                                        E.tipo AS tipo_empresa,
                                                        E.direccion AS direccion_empresa,
                                                        E.telefono AS telefono_empresa,
                                                        E.descripcion AS descripcion_empresa,
                                                        E.imagen AS imagen_empresa,
                                                        S.id_servicio,
                                                        S.nombre AS nombre_servicio,
                                                        S.descripcion AS descripcion_servicio,
                                                        S.precio AS precio_servicio,
                                                        S.duracion AS duracion_servicio,
                                                        P.id_prestador,
                                                        P.nombre AS nombre_prestador,
                                                        P.especialidad AS especialidad_prestador,
                                                        P.telefono AS telefono_prestador,
                                                        P.imagen AS imagen_prestador
                                                    FROM 
                                                        Empresas E
                                                    LEFT JOIN 
                                                        Servicios S ON E.id_empresa = S.id_empresa
                                                    LEFT JOIN 
                                                        Prestadores P ON E.id_empresa = P.id_empresa
                                                    WHERE 
                                                        E.id_empresa = ? 
                                                    ORDER BY 
                                                        E.id_empresa, S.id_servicio, P.id_prestador;`
                                                    , [idEmpresa]
          );

        //   console.table(`Dentro del funcion : ${results}`)

          if (results.length > 0){

            // AGRUPAR Y ORDENAR RESULTADOS
                    const agrupados = {};

                    results.forEach(row => {
                        
                        if (!agrupados[row.id_empresa]) {
                            agrupados[row.id_empresa] = {
                                id_empresa: row.id_empresa,
                                nombre_empresa: row.nombre_empresa,
                                tipo_empresa: row.tipo_empresa,
                                descripcion_empresa :row.descripcion_empresa,
                                direccion_empresa: row.direccion_empresa,
                                telefono_empresa: row.telefono_empresa,
                                imagen_empresa: row.imagen_empresa,
                                servicios: {}
                            };
                        }
                        
                        if (!agrupados[row.id_empresa].servicios[row.id_servicio]) {
                            agrupados[row.id_empresa].servicios[row.id_servicio] = {
                                id_servicio: row.id_servicio,
                                nombre_servicio: row.nombre_servicio,
                                descripcion_servicio: row.descripcion_servicio,
                                prestadores: []
                            };
                        }
                        
                        agrupados[row.id_empresa].servicios[row.id_servicio].prestadores.push({
                            id_prestador: row.id_prestador,
                            nombre_prestador: row.nombre_prestador,
                            especialidad_prestador: row.especialidad_prestador,
                            telefono_prestador: row.telefono_prestador,
                            imagen_prestador: row.imagen_prestador,
                            precio_servicio: row.precio_servicio,
                            duracion_servicio: row.duracion_servicio
                        });
                    });
                    
                    const resultadoFinal = Object.values(agrupados).map(empresa => {
                        empresa.servicios = Object.values(empresa.servicios);
                        return empresa;
                    });

                 return resultadoFinal;

          } else {
            
            return ({'status':'sin resultados'})

          }     

        
    } catch (error) {
        
        console.log(`X Error al conectar al base de datos : ${error}`);

    } finally {

        if (connection) connection.release();

    }


};

module.exports = ObtenerDatosEmpresa;