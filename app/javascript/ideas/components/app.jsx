import React from 'react';
import ReactDOM from 'react-dom';

import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';

import PostsIndex from './containers/posts_index';
import PostsShow from './containers/posts_show';
import PostsNew from './containers/posts_new';
import NavBar from 'nav_bar';


class App extends Component {
  render(){
    return(
      <Router history={history} >
        <div className="container">
          <Switch>
            <Route path="/" exact component={PostsIndex} />
            <Route path="/ideas/new" exact component={PostsNew} />
            <Route path="/ideas/:id" component={PostsShow} />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
