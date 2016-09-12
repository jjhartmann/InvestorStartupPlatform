import React, { PropTypes } from 'react'
import LinkWidget from '../components/Link'
import auth from '../containers/auth'
import {Router, Route, IndexRoute, Link} from 'react-router'



// Simple example of a React "smart" component
export default class AuthenticationLink extends React.Component {

    constructor(props)
    {
      super(props);
      this.state = { authenticated: this.props.data};
    }

    login(login_status) {
      if (login_status == true){
        $.ajax({
          url: '/users/sign_out',
          type: 'DELETE',
          dataType: "json",
          success: () => {
            // alert("hello");
            }
        })
      }
    }
    // loggedIn: auth.loggedIn()
    // updateAuth(loggedIn) {
    //   this.setState({
    //     loggedIn
    //   });
    // }
    //
    // componentWillMount() {
    //   auth.onChange = this.updateAuth.bind(this)
    //   auth.login()
    // }

  render() {
    return (
      <div>
        <ul className="nav navbar-nav navbar-right">
          <li>
            <Link href={this.state.authenticated.signed_in ? "" : "/users/sign_in"}
                  to="#"
                  onClick={this.login(this.state.authenticated.signed_in)}>

                  {this.state.authenticated.signed_in == true ? "Logout" : "LogIn"}
            </Link>

          </li>
        </ul>
      </div>
    );
  }
}
