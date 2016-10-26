import React from 'react'
import ReactOnRails from 'react-on-rails'
import Register from '../containers/RegisterContainer'
import RegisterHeader from '../components/RegisterHeader'

const Registration = (props, _railsContext) => {
  const reactComponent = (
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
            <Register {...props} />
          </div>
        </div>
      </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Registration} );
