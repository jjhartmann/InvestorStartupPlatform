import React from 'react';
import {Router, Route, browserHistory  } from 'react-router';
import Test1 from '../startup/AboutApp';
import Test1 from '../startup/FAQ';

export default (
  <Router>
    <Route
      path="faq"
      component={FAQApp}/>
    <Route
      path="about"
      component={About}/>
  </Router>
);
