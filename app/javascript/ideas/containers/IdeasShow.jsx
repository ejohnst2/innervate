import React, { Component } from 'react';

import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchIdea } from '../actions';
import IdeaPanel from './IdeaPanel';


class IdeasShow extends Component {
  componentWillMount() {
    if (!this.props.idea) {
      this.props.fetchIdea(this.props.match.params.id);
    }
  }

  render() {
    if (!this.props.idea) {
      return <p>Loading...</p>;
    }

    return (
      <div>
        <div id="idea-box">
          <div className="post-item">
            <h3>{this.props.idea.channel}</h3>
            <p>{this.props.idea.content}</p>
          </div>
          <IdeaPanel />
        </div>
        <Link to="/">
          Back
        </Link>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  const idFromUrl = parseInt(ownProps.match.params.id, 10);
  const idea = state.ideas.find(p => p.id === idFromUrl);
  return { idea };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchIdea }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(IdeasShow);
