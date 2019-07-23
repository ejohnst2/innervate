import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';
import logger from 'redux-logger';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';
import { reducer as formReducer } from 'redux-form';

import IdeasIndex from './containers/ideas_index';
import IdeasShow from './containers/ideas_show';
import IdeasNew from './containers/ideas_new';
import NavBar from './components/nav_bar';

import ideasReducer from './reducers/ideas_reducer';

const root = document.getElementById('root');
const initialState = { ideas: JSON.parse(root.dataset.ideas) };

const reducers = combineReducers({
  ideas: ideasReducer,
  form: formReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);

// render an instance of the component in the DOM
// history={history} add browser history back into router

ReactDOM.render(
  <Provider store={createStore(reducers, initialState, middlewares)}>
    <Router history={history}>
      <div className="container">
        <Switch>
          <Route path="/" exact component={IdeasIndex} />
          <Route path="/ideas/new" exact component={IdeasNew} />
          <Route path="/ideas/:id" component={IdeasShow} />
        </Switch>
      </div>
    </Router>
  </Provider>,
  document.getElementById('root')
);
