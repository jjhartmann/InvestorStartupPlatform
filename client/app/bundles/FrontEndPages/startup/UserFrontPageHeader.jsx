import React from 'react'
import ReactOnRails from 'react-on-rails'
import UserHeader from '../containers/UserHeader'

const UserFrontPageHeader = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <UserHeader {...props}/>
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ UserFrontPageHeader });
