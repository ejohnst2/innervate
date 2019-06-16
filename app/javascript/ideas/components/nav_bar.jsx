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
