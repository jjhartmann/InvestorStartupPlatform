import React, { PropTypes } from 'react'
import LinkWidget from '../components/Link'
import auth from '../containers/auth'


// Simple example of a React "smart" component
export default class AuthenticationLink extends React.Component {

    constructor(props)
    {
      super(props);
      this.state = { loggedIn: "ioj" }
    }

    updateAuth(loggedIn) {
      this.setState({
        loggedIn
      })
    }

    componentWillMount() {

    }
  render() {
    return (
    <div>
        <ul className="nav navbar-nav navbar-right">          
          {this.state.loggedIn ? (
            <LinkWidget name="Login" path="/users/sign_in"/>
            ) : (
              <LinkWidget name="Logout" path="/"/>
            )
          }
            <LinkWidget name="Join" path="/users/sign_up"/>
        </ul>
      </div>
    );
  }
}
