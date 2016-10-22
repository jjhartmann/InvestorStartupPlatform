import React, { PropTypes } from 'react';

export default class LoginPassword extends React.Component{
  render() {
    return (
      <div className="checkbox">
        <label><input type="checkbox" /> Remember me</label>
        <div className="forgot"><a href="#">Forgot Password</a></div>
      </div>
    );
  }
}
