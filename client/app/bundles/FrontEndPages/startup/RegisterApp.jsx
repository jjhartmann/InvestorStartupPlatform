import React from 'react'
import ReactOnRails from 'react-on-rails'
import Register from '../containers/RegisterContainer'
import RegisterHeader from '../components/RegisterHeader'
import RegisterationLinks from '../components/RegisterableLink'

const Registration = (props, _railsContext) => {
  const reactComponent = (
    <div className="login-set registration">
      <div className="container">
        <div className="row">
          <div className="registration col-xs-12 col-sm-6">
            <div className="">
              <Register {...props} />
            </div>
          </div>
            <div className="registration col-xs-12 col-sm-6">
              <div className="">
                <div className="clearfix">
                  <div className="links">
                  <RegisterHeader header={["Join Us with"]}/>
                    <ul className="social">
                      <RegisterationLinks link_name="Wee Chat" key="we-chat"/>
                      <li><h6>OR</h6></li>
                      <RegisterationLinks link_name="QQ" key="qq"/>
                      <li><h6>OR</h6></li>
                      <RegisterationLinks link_name="Gmail" key="gmail"/>
                      <li><h6>OR</h6></li>
                      <RegisterationLinks link_name="Facebook" key="fb"/>
                    </ul>
                  </div>
                  </div>
               </div>
              </div>
            </div>
          </div>
        </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Registration} );
