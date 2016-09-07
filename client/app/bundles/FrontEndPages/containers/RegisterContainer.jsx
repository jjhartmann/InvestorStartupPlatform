import React, { PropTypes } from 'react'
// import TextField from '../components/TextField'
import SubmitButton from '../components/SubmitButton'

// Simple example of a React "smart" component
export default class Register extends React.Component {
  // Get Initial stae in ES5
  constructor(props) {
    super(props);
    this.state = { authentication: this.props.data.authenticity_token,
                   fullname: '',
                   email: '',
                   username: '',
                   password: '',
                   password_confirmation: '',
                   errors: {}
                };
  }

// TextBox's Onchange
  updateName = (e) => {
    this.setState({fullname: e.target.value})
  }

  updateEmail = (e) => {
    this.setState({email: e.target.value})
  }

  updateUserName = (e) => {
    this.setState({username: e.target.value})
  }

  updatePassword = (e) => {
    this.setState({password: e.target.value})
  }

  updateConfirmPassword = (e) => {
    this.setState({password_confirmation: e.target.value})
  }

  // Form Submit
  submit(e){
    e.preventDefault();
    console.log("this.state");
    var data = {
      authenticity_token: this.state.authentication,
      user: {
        name: this.state.fullname,
        email: this.state.email,
        username: this.state.username,
        password: this.state.password,
        password_confirmation: this.state.password
      }
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
          console.log(data[0]);
          this.setState({
            fullname: '',
            email: '',
            username: '',
            password: '',
            password_confirmation: '',
            errors: {}
          });
        },
        error: (xhr, status, err) => {          
          alert(xhr.responseText);
        }
      });
  }
  render() {
    return (
      <form onSubmit={this.submit.bind(this)}>
        <div className="form-group">
          <label>Full Name</label>
          <input type="text" placeholder="Enter your full name" className="form-control" value={this.state.fullname} onChange={this.updateName} />
          <span style={{color: 'red'}}>{this.state.errors.name}</span>
        </div>
        <div className="form-group">
          <label>Email Address</label>
          <input type="text" placeholder="Enter your Email-Address" className="form-control" value={this.state.email} onChange={this.updateEmail} />
          <span style={{color: 'red'}}>{this.state.errors.email}</span>
        </div>
        <div className="form-group">
          <label>User Name</label>
          <input type="text" placeholder="Enter your desired user name" className="form-control" value={this.state.username} onChange={this.updateUserName} />
          <span style={{color: 'red'}}>{this.state.errors.username}</span>
        </div>
        <div className="form-group">
          <label>Password</label>
          <input type="password" placeholder="Password" className="form-control" value={this.state.password} onChange={this.updatePassword} />
          <span style={{color: 'red'}}>{this.state.errors.password}</span>
        </div>
        <div className="form-group">
          <label>Confirm Password</label>
          <input type="password" placeholder="Confirm your Password" className="form-control" value={this.state.password_confirmation} onChange={this.updateConfirmPassword} />
          <span style={{color: 'red'}}>{this.state.errors.confirm_password}</span>
        </div>
        <SubmitButton />
      </form>
    );
  }
}
