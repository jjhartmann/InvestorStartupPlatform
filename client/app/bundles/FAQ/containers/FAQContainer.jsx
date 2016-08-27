import React, { PropTypes } from 'react'
import FAQSet from '../containers/FAQSet'

// Simple example of a React "smart" component
export default class FAQBody extends React.Component {
  constructor(props, context) {
    super(props, context);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { users: this.props.data };
  }
  render() {
    var userNodes = this.state.users.map(function(user) {
      return (
        <li key={user.id}>
          <FAQSet que={user.question} ans={user.answer} id={user.id} key={user.id}/>
        </li>
      );
    });
    return (
      <div>
        {userNodes}
      </div>
    );
  }
}
