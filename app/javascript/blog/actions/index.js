export const FETCH_IDEAS = 'FETCH_IDEAS';
export const FETCH_IDEA = 'FETCH_IDEA';
export const IDEA_CREATED = 'IDEA_CREATED';

const ROOT_URL = '/api/v1';

export function createIdea(body, callback) {
  const request = fetch(`${ROOT_URL}/ideas`, {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  }).then(response => response.json())
    .then(callback);

  return {
    type: IDEA_CREATED,
    payload: request
  };
}

export function fetchIdea(id) {
  const promise = fetch(`${ROOT_URL}/ideas/${id}`)
    .then(response => response.json());

  return {
    type: FETCH_IDEA,
    payload: promise
  }
}

export function fetchIdeas() {
  // AJAX request
  const promise = fetch(`${ROOT_URL}/ideas`)
    .then(response => response.json());

  return {
    type: FETCH_IDEAS,
    payload: promise
  }
}

