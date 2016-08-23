import React, { PropTypes } from 'react'
import LinkWidget from '../components/Link'


// Simple example of a React "smart" component
export default class AuthenticationLink extends React.Component {
  render() {
    return (
    <div>
        <ul className="nav navbar-nav navbar-right">
            <LinkWidget name="Login"/>
            <LinkWidget name="Join"/>
        </ul>
      </div>
    );
  }
}
