import React, { PropTypes } from 'react';

export default class LoginUserName extends React.Component{
  render() {
    return (
      <div className="form-group login">
        <label htmlFor="Email"></label>
        <input type="text" className="form-control" placeholder="Enter email"/>
      </div>
    );
  }
}
