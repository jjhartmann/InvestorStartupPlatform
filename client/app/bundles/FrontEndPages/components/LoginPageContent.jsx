import React, { PropTypes } from 'react';
import LoginPageHeader from '../components/LoginPageHeader'
import LoginUserName from '../components/LoginUserName'
import LoginPassword from '../components/LoginPassword'
import LoginForgetPassword from '../components/LoginForgetPassword'
import LoginSubmit from '../components/LoginSubmit'

export default class LoginPageContent extends React.Component {
  render()
  {
    return (
      <div className="login-set">
        <div className="container">
          <div className="row">
            <div className="col-sm-12">
              <div className="log-in box">
                <form>
                  <LoginPageHeader />
                  <LoginUserName />
                  <LoginPassword />
                  <LoginForgetPassword />
                  <LoginSubmit />
              </form>
              </div>
            </div>
          </div>
        </div>
      </div>

    );
  }
  }
