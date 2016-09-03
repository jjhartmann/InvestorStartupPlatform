import React, { PropTypes } from 'react'
import TextField from '../components/TextField'

// Simple example of a React "smart" component
export default class Register extends React.Component {
  render() {
    return (
      <form>
        <TextField labeltext="Full Name" placeholder="Enter your Full Name" type="text"></TextField>
        <TextField labeltext="Email Address" placeholder="Enter your Email Address" type="text"></TextField>
        <TextField labeltext="User Name" placeholder="Enter your Desired User Name" type="text"></TextField>
        <TextField labeltext="Password" placeholder="Enter your Password" type="password"></TextField>
        <TextField labeltext="Confirm Password" placeholder="Confirm your Password" type="password"></TextField>
        <div className="form-group">
          <div className="submit-btn">
            <button type="submit" className="btn btn-default">Submit</button>
          </div>
        </div>
      </form>
    );
  }
}
