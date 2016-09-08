import React from 'react'
import ReactOnRails from 'react-on-rails'
import LoginPage from '../containers/LoginPage'

const Login = (props, _railsContext) => {
  const reactComponent = (
    <div className="container">
      <LoginPage {...props} />
    </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Login} );
