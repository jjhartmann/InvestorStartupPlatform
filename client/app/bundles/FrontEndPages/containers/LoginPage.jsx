import React from 'react'
import ReactOnRails from 'react-on-rails'
import LoginForgetPassword from '../components/LoginForgetPassword'
import TextField from '../components/TextField'
import RegisterHeader from '../components/RegisterHeader'
import SubmitButton from '../components/SubmitButton'

export default class LoginPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {  user:
                  {
                    login: '',
                    password: ''
                  },
                  errors: {}
                };
  }

// TextBox's Onchange
  updateLogin(e) {
    var newUser = this.state.user;
    newUser.login = e.target.value;
    this.setState({user: newUser});
  }

  updatePassword(e) {
    var newUser = this.state.user;
    newUser.password = e.target.value;
    this.setState({user: newUser});
  }

  submitPage(e){
    e.preventDefault();
    var data = {
      user: this.state.user
    }
    console.log(data);
    // Submit form via jQuery/AJAX
    $.ajax({
        url: '/users/sign_in',
        type: 'POST',
        data: data,
        dataType: "json",
        success: (data) => {
          console.log("Logged In");
          console.log(data);
          this.setState({
            user: {
              login: '',
              password: '',
            },
            errors: {}
          });

          window.location.pathname = "/home_pages";
          window.location.href = "/home_pages";
          // location.reload();
        },
        error: (xhr) => {
          var jsonResponse = JSON.parse(xhr.responseText);
          console.log(jsonResponse);
          this.setState({errors: jsonResponse})
        }
      });
  }
  render() {
    return (
        <div className="registration col-xs-12">
          <form role='form' acceptCharset="UTF-8" action='/users/sign_in' method='post' onSubmit={this.submitPage.bind(this)}>
            <RegisterHeader header={["Login"]}/>
            <span style={{color: 'red'}}>{this.state.errors.error}</span>
            <input placeholder="Username" type="text" required="" name="user[login]" value={this.state.user.login} onChange={this.updateLogin.bind(this)} />
            <input placeholder="Password" type="password" required="" name="user[password]" value={this.state.user.password} onChange={this.updatePassword.bind(this)} />
            <LoginForgetPassword />
            <SubmitButton/>
          </form>
        </div>
    );
  }
}
