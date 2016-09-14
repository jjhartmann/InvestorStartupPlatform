import React, { PropTypes } from 'react'
import LinkWidget from '../components/Link'
import auth from '../containers/auth'
import {Router, Route, IndexRoute, Link} from 'react-router'

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
            window.location.pathname = "/home_pages";
            window.location.href = "/home_pages";
            }
        })
      }
    }

  render() {
    return (
      <div>
        <ul className="nav navbar-nav navbar-right">
          <li>
            <Link href={this.state.authenticated.signed_in ? "" : "/users/sign_in"}
                  to="#"
                  onClick={this.login.bind(this,this.state.authenticated.signed_in)}
                  method={this.state.authenticated.signed_in ? "post" : ""}>

                  {this.state.authenticated.signed_in == true ? "Logout" : "LogIn"}
            </Link>

          </li>
          <li>
            {this.state.authenticated.signed_in ? "" : <Link href="/users/sign_up" to="">join</Link> }
          </li>

        </ul>
      </div>
    );
  }
}
