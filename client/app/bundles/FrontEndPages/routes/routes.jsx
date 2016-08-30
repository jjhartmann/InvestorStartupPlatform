import React from 'react';
import {Router, Route, browserHistory  } from 'react-router';
import Test1 from '../startup/Test1';
import Test1 from '../startup/Test2';

export default (
  <Router>
    <Route
      path="test1"
      component={Test1}/>
    <Route
      path="test2"
      component={Test2}/>
  </Router>
);
