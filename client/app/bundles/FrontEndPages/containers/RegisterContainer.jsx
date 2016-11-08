import React, { PropTypes } from 'react'
import ReactDOM from 'react-dom';
import SubmitButton from '../components/SubmitButton'
import RegisterHeader from '../components/RegisterHeader'
import RegisterationLinks from '../components/RegisterableLink'
import Error from '../components/Error'

export default class Register extends React.Component {
  constructor(props) {
    super(props);
    this.state = {  user: {
                     name: '',
                     email: '',
                     username: '',
                     password: '',
                     password_confirmation: '',
                     profilable_type: 'UserProfile'
                   },
                   errors: {},
                   items: [],
                   translation: this.props.data.translation,
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

  handleOptionChange = (e) => {
    var newUser = this.state.user;
    newUser.profilable_type = e.target.value;
    this.setState({user: newUser});
  }

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
          window.location="https://netpluswebapp.herokuapp.com";
        },
        error: (data) => {
          this.setState({errors: data.responseJSON.errors})
          console.log(data.responseJSON.errors)
          this.show_error()
        }
      });
  }
  show_error = () => {
    this.state.items = []
    var pairs = this.state.items
    if (this.state.errors.name != null){
      this.state.errors.name.map(function(player){
        pairs.push("Name " + player);
      })
    }
    if (this.state.errors.email != null){
      this.state.errors.email.map(function(player){
        pairs.push("Email " + player);
      })
    }
    if (this.state.errors.username != null){
      this.state.errors.username.map(function(player){
        pairs.push("User Name " + player);
      })
    }
    if (this.state.errors.password != null){
      this.state.errors.password.map(function(player){
        pairs.push("Password " + player);
      })
    }
    if (this.state.errors.password_confirmation != null){
      this.state.errors.password_confirmation.map(function(player){
        pairs.push("Confirm Password " + player);
      })
    }
    this.setState({items: pairs})
    console.log(this.state.items);
  }

// Form Submit
  render() {
    var errors = this.state.items.map(function(item){
      return (
        <Error error={item} key={item}></Error>
      );
    });
    return (
      <div>
        <div id="floating_alert">
          {errors}
        </div>
        <div className="log-in-track">
          <div className="">
            <h3>Register Now</h3>
            <form onSubmit={this.submit.bind(this)}>
              <div className="form-group">
                <label>Full Name</label>
                <input className="form-control"
                        type="text"
                        value={this.state.user.name}
                        onChange={this.updateName.bind(this)}
                />
              </div>
              <div className="form-group">
                <label>Email</label>
                <input className="form-control"
                  type="text"
                  value={this.state.user.email}
                  onChange={this.updateEmail.bind(this)}
                />
              </div>
              <div className="form-group">
                <label>User Name</label>
                <input className="form-control"
                  type="text"
                  value={this.state.user.username}
                  onChange={this.updateUserName.bind(this)}
                />
              </div>
              <div className="form-group">
                <label>Password</label>
                <input className="form-control"
                  type="password"
                  value={this.state.user.password}
                  onChange={this.updatePassword.bind(this)} />
              </div>
              <div className="form-group">
                <label>Confirm Password</label>
                <input className="form-control"
                  type="password"
                  value={this.state.user.password_confirmation}
                  onChange={this.updateConfirmPassword.bind(this)}
                />
              </div>
              <div className="form-group radiocon">
                <div className="radio radio-item">
                  <label>
                    <input
                      type="radio"
                      value="UserProfile"
                      checked={this.state.user.profilable_type === 'UserProfile'}
                      onChange={this.handleOptionChange.bind(this)}
                    />
                  {this.state.translation.startup}
                  </label>
                </div>
                <div className="radio radio-item">
                  <label>
                    <input
                      type="radio"
                      value="InvestorProfile"
                      checked={this.state.user.profilable_type === 'InvestorProfile'}
                      onChange={this.handleOptionChange.bind(this)}
                    />
                  {this.state.translation.investor}
                  </label>
                </div>
              </div>
              <SubmitButton submit={this.state.translation.submit}/>
            </form>
          </div>
        </div>
      </div>
    );
  }
}
