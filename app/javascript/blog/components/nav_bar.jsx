import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import { NavbarHeader, Nav, NavDropdown, NavItem, Navbar, MenuItem } from 'react-bootstrap';


export default class NavBar extends Component {
  render(){
    return(
      <div className="">
        <Navbar>
          <Navbar.Header>
            <Navbar.Brand>
              <a href="/">Thinkfish</a>
            </Navbar.Brand>
          </Navbar.Header>
          <Nav>
            <NavDropdown eventKey={3} title="Dropdown" id="basic-nav-dropdown">
              <MenuItem eventKey={3.1}>Action</MenuItem>
              <MenuItem eventKey={3.2}>Another action</MenuItem>
              <MenuItem eventKey={3.3} to="/ideas/new">Something else here</MenuItem>
              <MenuItem divider />
              <MenuItem eventKey={3.4}>Separated link</MenuItem>
            </NavDropdown>
            <NavItem eventKey={1} data-method="delete" href="/users/sign_out">
              Logout
            </NavItem>
            <NavItem eventKey={1}>
              <Link to="/ideas/new">
                I've got an idea
              </Link>
            </NavItem>
          </Nav>
        </Navbar>;
      </div>
    );
  }
}
