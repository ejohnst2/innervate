import { FETCH_IDEAS, FETCH_IDEA, IDEA_CREATED } from '../actions';

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_IDEAS:
      return action.payload;
    case FETCH_IDEA:
      // action.payload is an object
      return action.payload;
    case IDEA_CREATED:
      // TODO: push it to the array of posts
      return state;
    default:
      return state;
  }
}
