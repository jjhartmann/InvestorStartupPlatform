import React from 'react'
import ReactOnRails from 'react-on-rails'
import FAQBody from '../containers/FAQContainer'

const FAQApp = (props, _railsContext) => {
  const reactComponent = (
    <div className="container">
      <div className="row">
        <div className="col-xs-12 faq-tab">
          <h3>FAQ</h3>
          <ul>
            <FAQBody {...props}></FAQBody>
          </ul>
      </div>
    </div>
  </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ FAQApp });
