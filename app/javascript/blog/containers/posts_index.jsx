import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchIdeas } from '../actions';

import { Grid, Row, Col } from 'react-bootstrap';

import NavBar from '../components/nav_bar';

class PostsIndex extends Component {
  componentWillMount() {
    this.props.fetchIdeas();
  }

  renderPosts() {
    return this.props.ideas.map((idea) => {
      return (
        <Col sm={12} md={6} lg={4} >
          <Link to={`/ideas/${idea.id}`} key={idea.id}>
            <div className="post-item">
              <h3>{idea.content}</h3>
              <p>from: {idea.channel}</p>
            </div>
          </Link>
        </Col>
        );
    });
  }

  render() {
    return (
      <div>
        <NavBar />
        <div className="first-row">
          <h3>Idea Lab</h3>
          <Link className="btn btn-primary btn-cta" to="/ideas/new">
            I've got a great idea...
          </Link>
        </div>
        <Row>
          {this.renderPosts()}
        </Row>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    ideas: state.ideas
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchIdeas }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PostsIndex);
