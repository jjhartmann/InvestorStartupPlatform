import React from 'react'
import ReactOnRails from 'react-on-rails'
import Contact from '../containers/Contact'

const ContactInfo = (props, _railsContext) => {
  const reactComponent = (
    <Contact {...props} />
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ ContactInfo });
