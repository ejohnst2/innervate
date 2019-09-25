import React from 'react';
import { Link } from 'react-router-dom';
import './NewIdeaButton.css';

const NewIdeaButton = () => {
  return (
      <Link to="ideas/new" className="idea-btn">New Idea</Link>
  );
};

export default NewIdeaButton;
