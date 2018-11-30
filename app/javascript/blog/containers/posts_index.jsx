import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchIdeas } from '../actions';

class PostsIndex extends Component {
  componentWillMount() {
    this.props.fetchIdeas();
  }

  renderPosts() {
    return this.props.ideas.map((idea) => {
      return (
        <Link to={`/ideas/${idea.id}`} key={idea.id}>
          <div className="post-item">
            <h3>{idea.channel}</h3>
            <p>{idea.content}</p>
          </div>
        </Link>);
    });
  }

  render() {
    return (
      <div>
        <div className="first-row">
          <h3>Blog</h3>
          <Link className="btn btn-primary btn-cta" to="/ideas/new">
            Let's write a post!
          </Link>
        </div>
        {this.renderPosts()}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    ideas: state.ideas
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchIdeas }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PostsIndex);
