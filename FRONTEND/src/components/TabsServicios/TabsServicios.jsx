import Tab from 'react-bootstrap/Tab';
import Tabs from 'react-bootstrap/Tabs';

function TabsServicios() {
  return (
    
        <Tabs defaultActiveKey="servicios" id="uncontrolled-tab-example" className="mb-3 d-flex justify-content-center">

            <Tab eventKey="servicios" title="Servicios">
                Tab content for Home
            </Tab>

            <Tab eventKey="empresas" title="Empresas">
                Tab content for Profile
            </Tab>

            {/* <Tab eventKey="contact" title="Contact">
                Tab content for Contact
            </Tab> */}

    </Tabs>

  );
}

export default TabsServicios;