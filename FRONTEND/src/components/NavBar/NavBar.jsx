import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
// import NavDropdown from 'react-bootstrap/NavDropdown';
import Logo from './images/logo_fondo_blanco.png'
import ('./NavBar.css')

function NavBar() {
  return (
    <Navbar expand="lg" className="bg-info">
      <Container>

        {/* <Navbar.Brand href="#home">ReservaFácil</Navbar.Brand> */}
        
        <Navbar.Brand href="/">
            <img
                id='logoNavbar'  
                alt=""
                src={Logo}
                width="30"
                height="30"
                className="d-inline-block align-top"
            />{' '}
            ReservaFácil
          </Navbar.Brand>

        
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            {/* <Nav.Link href="/"></Nav.Link> */}
            <Nav.Link href="#link">Link</Nav.Link>
            {/* <NavDropdown title="Dropdown" id="basic-nav-dropdown">
              <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
              <NavDropdown.Item href="#action/3.2">
                Another action
              </NavDropdown.Item>
              <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action/3.4">
                Separated link
              </NavDropdown.Item>
            </NavDropdown> */}
          </Nav>
        </Navbar.Collapse>

      </Container>
    </Navbar>
  );
}

export default NavBar;