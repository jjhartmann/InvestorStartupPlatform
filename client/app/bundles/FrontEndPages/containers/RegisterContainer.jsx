import React, { PropTypes } from 'react'
import TextField from '../components/TextField'
import SubmitButton from '../components/SubmitButton'

// Simple example of a React "smart" component
export default class Register extends React.Component {
  constructor(props) {
    super(props);
    this.state = { authentication: this.props.data.authenticity_token,
    name: "",
    email: "",
    username: "" };
  }
  updateTextBox = (e) => {
    this.setState({inputContent: e.target.value})
  }
  render() {
    return (
      <form role='form' accept-charset="UTF-8" action='/users' method='post'>
        <input type='hidden' name='authenticity_token' value={this.state.authentication} />
        <TextField labeltext="Full Name" placeholder="Enter your Full Name" type="text" name="user[name]" value={this.state.name}></TextField>
        <TextField labeltext="Email Address" placeholder="Enter your Email Address" type="text" name="user[email]" value={this.state.email}></TextField>
        <TextField labeltext="User Name" placeholder="Enter your Desired User Name" type="text" name="user[username]" value={this.state.username}></TextField>
        <TextField labeltext="Password" placeholder="Enter your Password" type="password" name="user[password]"></TextField>
        <TextField labeltext="Confirm Password" placeholder="Confirm your Password" type="password" name="user[:confirm_password"></TextField>
        <SubmitButton />
      </form>
    );
  }
}
