import React, { PropTypes } from 'react';

export default class LoginPassword extends React.Component{
  render() {
    return (
      <div className="form-group password">
        <label htmlFor="Email"></label>
        <input type="password" className="form-control" placeholder="Enter your password"/>
      </div>
    );
  }
}
