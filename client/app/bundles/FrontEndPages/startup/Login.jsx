import React from 'react'
import ReactOnRails from 'react-on-rails'
import LoginPage from '../containers/LoginPage'
import RegisterHeader from '../components/RegisterHeader'

const Login = (props, _railsContext) => {
  const reactComponent = (
    <div className="login-set">
      <div className="container">
        <div className="row">
          <div className="col-sm-12">
            <div className="log-in box">
              <RegisterHeader header={["Login"]}/>
              <LoginPage {...props} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Login} );
