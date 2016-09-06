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
          <div className="col-xs-12 col-sm-6">
            <div className="log-in box">
              <RegisterHeader header={["Join Us", <br/>, "Register Now!!"]}/>
              <Register {...props} />
            </div>
          </div>
            <div className="col-xs-12 col-sm-6">
              <div className="log-in box">
                <div className="clearfix">
                  <div className="or-tag">or</div>
                  <RegisterHeader header={["Join Us", <br/>, "through.."]} />
                  <div className="social">
                    <ul>
                      <RegisterationLinks link_name="Wee Chat" key="we-chat"/>
                      <RegisterationLinks link_name="QQ" key="qq"/>
                      <RegisterationLinks link_name="Gmail" key="gmail"/>
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
