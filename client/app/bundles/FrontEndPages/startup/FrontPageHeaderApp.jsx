import React from 'react'
import ReactOnRails from 'react-on-rails'
import Logo from '../containers/LogoContainer'
import Links from '../containers/LinksContainer'
import AuthenticationLink from '../containers/AuthenticationLinksContainer'

const HeaderApp = (props, _railsContext) => {
  const reactComponent = (
    <nav id="mainNav" className="navbar navbar-default navbar-custom navbar-fixed-top faq-container">
        <div className="container">
          <Logo></Logo>
          <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <Links/>
            <AuthenticationLink/>
          </div>
        </div>
    </nav>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ HeaderApp });
