import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Row, Col } from 'react-bootstrap';

// import redux actions
import { fetchIdeas } from '../actions';
// import components
import NavBar from '../components/nav_bar';

class IdeasIndex extends Component {
  componentWillMount() {
    this.props.fetchIdeas();
  }



  renderIdeas() {
    return this.props.ideas.map((idea) => {
      return (
        <Col sm={12} md={6} lg={4}>
          <Link to={`/ideas/${idea.id}`} key={idea.id}>
            <div className="post-item">
              <h3>{idea.content}</h3>
              <p>from: {idea.channel}</p>
              <p>category: {idea.category}</p>
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
        <Row>
          {this.renderIdeas()}
        </Row>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    ideas: state.ideas,
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchIdeas }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(IdeasIndex);
