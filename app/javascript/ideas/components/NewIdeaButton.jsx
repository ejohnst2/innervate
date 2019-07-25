import React from 'react';
import { Link } from 'react-router-dom';

const NewIdeaButton = () => {
  return (
    <Link to="ideas/new">New Idea</Link>
  );
};

export default NewIdeaButton;
