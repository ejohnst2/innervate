import React from 'react';
import IdeasGrid from './IdeasGrid';
import NewIdeaButton from '../../components/NewIdeaButton';

const IdeasIndex = () => {
  return (
    <React.Fragment>
      <NewIdeaButton />
      <IdeasGrid />
    </React.Fragment>
  );
};

export default IdeasIndex;
