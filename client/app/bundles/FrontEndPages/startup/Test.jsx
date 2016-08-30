import React from 'react'
import ReactOnRails from 'react-on-rails'
import {Router, Route, IndexRoute, Link} from 'react-router'

const Test = (props, _railsContext) => {
  const reactComponent = (
  <div>
    <Link to="test1">Test1</Link>
    <Link to="test2">Test2</Link>
  </div>
  );
  return reactComponent;
};

ReactOnRails.register({ Test });
