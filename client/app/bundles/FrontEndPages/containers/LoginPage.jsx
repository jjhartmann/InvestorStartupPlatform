import React from 'react'
import ReactOnRails from 'react-on-rails'
import LoginForgetPassword from '../components/LoginForgetPassword'
import TextField from '../components/TextField'
import RegisterHeader from '../components/RegisterHeader'
import SubmitButton from '../components/SubmitButton'

export default class LoginPage extends React.Component {
  render() {
    return (
        <form role='form' acceptCharset="UTF-8" action='/users/sign_in' method='post'>
          <RegisterHeader header={["Login"]}/>
          <input type='hidden' name='authenticity_token' value={this.props.data.authenticity_token} />
          <input placeholder="Username" type="text" required="" name="user[login]"/>
          <input placeholder="Password" type="password" required="" name="user[password]" />
          <LoginForgetPassword />
          <SubmitButton />
        </form>
    );
  }
}
