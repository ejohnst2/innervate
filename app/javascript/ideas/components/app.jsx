import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';
import NavBar from 'nav_bar';
import IdeasIndex from '../containers/ideas_index';
import IdeasShow from '../containers/ideas_show';
import IdeasNew from '../containers/ideas_new';

class App extends Component {
  render(){
    return(
      <Router history={history}>
        <div className="container">
          <Switch>
            <Route path="/" exact component={IdeasIndex} />
            <Route path="/ideas/new" exact component={IdeasNew} />
            <Route path="/ideas/:id" component={IdeasShow} />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
