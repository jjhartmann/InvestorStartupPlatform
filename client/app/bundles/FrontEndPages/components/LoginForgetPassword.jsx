import React, { PropTypes } from 'react';

export default class LoginPassword extends React.Component{
  render() {
    return (
      <div className="form-group">
        <a className="password-go" href="/users/password/new">{this.props.forgot_password}</a>
      </div>
    );
  }
}
