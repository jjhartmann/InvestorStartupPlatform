import React from 'react';
import ReactOnRails from 'react-on-rails';
import Panel from 'react-bootstrap/lib/Panel';
import Accordion from 'react-bootstrap/lib/Accordion';
import FAQBody from '../containers/FAQContainer';

const FAQApp = (props, _railsContext) => {
  const reactComponent = (
    <div>
    <header className="back-image">

    </header>
      <div className="container">
        <div className="row">
          <div className="col-xs-12 faq-tab">
            <h3>FAQ</h3>
            <FAQBody {...props} />
          </div>
        </div>
      </div>
    </div>
  );
  return reactComponent;
};

ReactOnRails.register({ FAQApp });
