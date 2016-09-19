import React from 'react'
import ReactOnRails from 'react-on-rails'
import Header from '../components/Header'

const UserHeaderApp = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <Header />
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ UserHeaderApp });
