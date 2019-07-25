import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';
import IdeasIndex from './containers/ideas_index';
import IdeasShow from './containers/ideas_show';
import IdeasNew from './containers/ideas_new';
import NewIdeaButton from './NewIdeaButton';

class App extends Component {
  render(){
    return(
      <Router history={history}>
        <div className="container">
          <NewIdeaButton></NewIdeaButton>
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
