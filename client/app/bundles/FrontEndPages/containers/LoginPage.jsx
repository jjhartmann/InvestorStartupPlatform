import React from 'react'
import ReactOnRails from 'react-on-rails'
import LoginForgetPassword from '../components/LoginForgetPassword'
import TextField from '../components/TextField'
import SubmitButton from '../components/SubmitButton'

export default class LoginPage extends React.Component {
  render() {
    return (
        <form role='form' acceptCharset="UTF-8" action='/users/sign_in' method='post'>
          <input type='hidden' name='authenticity_token' value={this.props.data.authenticity_token} />
          <TextField placeholder="Enter UserName/Email" type="text" name="user[login]"></TextField>
          <TextField placeholder="Enter your Password" type="password" name="user[password]"></TextField>
          <LoginForgetPassword />
          <SubmitButton />
        </form>
    );
  }
}
