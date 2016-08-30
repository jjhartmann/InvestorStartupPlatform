import React, { PropTypes } from 'react';
import Accordion from 'react-bootstrap/lib/Accordion';
import FAQQuestion from '../components/FAQQuestion';

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
          <FAQQuestion text={user.question} answer={user.answer} id={user.id} key={user.id}/>
      );
    });
    return (
      <Accordion>
        {userNodes}
      </Accordion>
    );
  }
}
