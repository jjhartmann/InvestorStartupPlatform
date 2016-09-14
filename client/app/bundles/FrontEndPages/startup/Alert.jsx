import React from 'react'
import ReactOnRails from 'react-on-rails'
import AlertMessage from '../containers/AlertMessage'

const Alert = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <AlertMessage {...props} />
    </div>
  );
  return reactComponent;
};

ReactOnRails.register({ Alert });
