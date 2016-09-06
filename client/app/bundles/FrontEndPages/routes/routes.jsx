import React, { Component } from 'react'
import { Router, Route, Link, IndexRoute, hashHistory, browserHistory, DefaultRoute } from 'react-router'
// import React from 'react';
// import {Router, Route, browserHistory  } from 'react-router';
// import Test1 from '../startup/AboutApp';
// import FAQApp from '../startup/FAQ';
import Services from '../startup/Services'
import Login from '../startup/Login'

// export default (
//   <Router>
//     <Route
//       path="faq"
//       component={FAQApp}/>
//     <Route
//       path="about"
//       component={About}/>
//     <Routes path="/home_pages/services" component={Services}/>
//   </Router>
// );
class App extends Component {
  render () {
    return (
      <Router history={hashHistory}>
        <Route path='/'>
          <Route path='services' component={Services} />
        </Route>
      </Router>
    )
  }
}
