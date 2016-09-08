import React, { PropTypes } from 'react'
import SubmitButton from '../components/SubmitButton'

export default class Register extends React.Component {
  // Get Initial stae in ES5
  constructor(props) {
    super(props);
    this.state = {  user: {
                     name: '',
                     email: '',
                     username: '',
                     password: '',
                     password_confirmation: ''
                   },
                   errors: {}
                };
  }

// TextBox's Onchange
  updateName(e) {
    var newUser = this.state.user;
    newUser.name = e.target.value;
    this.setState({user: newUser});
  }

  updateEmail(e) {
    var newUser = this.state.user;
    newUser.email = e.target.value;
    this.setState({user: newUser});
  }

  updateUserName(e) {
    var newUser = this.state.user;
    newUser.username = e.target.value;
    this.setState({user: newUser});
  }

  updatePassword(e) {
    var newUser = this.state.user;
    newUser.password = e.target.value;
    this.setState({user: newUser});
  }

  updateConfirmPassword = (e) => {
    var newUser = this.state.user;
    newUser.password_confirmation = e.target.value;
    this.setState({user: newUser});
  }

  // Form Submit
  submit(e){
    e.preventDefault();
    var data = {
      user: this.state.user
    }
    console.log(data);
    // Submit form via jQuery/AJAX
    $.ajax({
        url: '/users',
        type: 'POST',
        data: data,
        dataType: "json",
        success: (data) => {
          // console.log(data);
          console.log(data);
          this.setState({
            user: {
              name: '',
              email: '',
              username: '',
              password: '',
              password_confirmation: ''
            },
            errors: {}
          });
        },
        error: (data) => {
          this.setState({errors: data.responseJSON.errors})
        }
      });
  }
  render() {
    return (
      <form onSubmit={this.submit.bind(this)}>
        <div className="form-group">
          <label>Full Name</label>
          <input type="text" placeholder="Enter your full name" className="form-control" value={this.state.user.name} onChange={this.updateName.bind(this)} />
          <span style={{color: 'red'}}>{this.state.errors.name}</span>
        </div>
        <div className="form-group">
          <label>Email Address</label>
          <input type="text" placeholder="Enter your Email-Address" className="form-control" value={this.state.user.email} onChange={this.updateEmail.bind(this)} />
          <span style={{color: 'red'}}>{this.state.errors.email}</span>
        </div>
        <div className="form-group">
          <label>User Name</label>
          <input type="text" placeholder="Enter your desired user name" className="form-control" value={this.state.user.username} onChange={this.updateUserName.bind(this)} />
          <span style={{color: 'red'}}>{this.state.errors.username}</span>
        </div>
        <div className="form-group">
          <label>Password</label>
          <input type="password" placeholder="Password" className="form-control" value={this.state.user.password} onChange={this.updatePassword.bind(this)} />
          <span style={{color: 'red'}}>{this.state.errors.password}</span>
        </div>
        <div className="form-group">
          <label>Confirm Password</label>
          <input type="password" placeholder="Confirm your Password" className="form-control" value={this.state.user.password_confirmation} onChange={this.updateConfirmPassword.bind(this)} />
          <span style={{color: 'red'}}>{this.state.errors.password_confirmation}</span>
        </div>
        <SubmitButton />
      </form>
    );
  }
}
