import PropTypes from 'prop-types';

const CardEmpresa = ({datosEmpresa}) => {
    console.log(datosEmpresa[0].imagen_empresa)
  return (

    <section className="mx-auto my-5" style={{maxWidth: "23rem"}}>
      
    <div className="card">

        <div className="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
             <img src={`../logos/${datosEmpresa[0].imagen_empresa}.png`} className="img-fluid" />
                {/* <a href="#!">
                    <div className="mask" 
                        style={{backgrounColor: "rgba(251, 251, 251, 0.15)"}}>                
                    </div>
                </a> */}
        </div>


      <div className="card-body">
            <h5 className="card-title font-weight-bold"><a>La Sirena restaurant</a></h5>

                {/*  SISTEMA DE PUNTUACION PARA EMPRESAS */}
                {/* <ul className="list-unstyled list-inline mb-0">

                    <li className="list-inline-item me-0">
                          <i className="fas fa-star text-warning fa-xs"> </i>
                    </li>

                    <li className="list-inline-item me-0">
                        <i className="fas fa-star text-warning fa-xs"></i>
                    </li>

                    <li className="list-inline-item me-0">
                        <i className="fas fa-star text-warning fa-xs"></i>
                    </li>

                    <li className="list-inline-item me-0">
                        <i className="fas fa-star text-warning fa-xs"></i>
                    </li>

                    <li className="list-inline-item">
                        <i className="fas fa-star-half-alt text-warning fa-xs"></i>
                    </li>

                    <li className="list-inline-item">
                        <p className="text-muted">4.5 (413)</p>
                    </li>

                </ul> */}

        <p className="mb-2">$ • American, Restaurant</p>

        <p className="card-text"> `Some quick example text to build on the card title and make up the bulk of the card's content.`
        </p>
        
        <hr className="my-4" />

        <p className="lead"><strong>Tonight's availability</strong></p>
        
        <a href="#!" className="btn btn-info link-secondary p-md-1 mb-0">Button</a>

      </div>
    </div>
    
  </section>
  )
}

export default CardEmpresa;

CardEmpresa.propTypes = {
    datosEmpresa: PropTypes.arrayOf(
      PropTypes.shape({
        imagen_empresa: PropTypes.string.isRequired
      })
    ).isRequired
  };