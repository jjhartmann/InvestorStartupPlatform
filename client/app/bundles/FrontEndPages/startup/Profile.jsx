import React from 'react'
import ReactOnRails from 'react-on-rails'
import ProfilePage from '../containers/ProfilePage'

const Profile = (props, _railsContext) => {
  const reactComponent = (
      <div className="container">
        <ProfilePage {...props} />
      </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Profile} );
