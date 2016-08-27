import React, { PropTypes } from 'react'
import FAQQuestion from '../components/FAQQuestion'
import FAQAnswer from '../components/FAQAnswer'

// Simple example of a React "smart" component
export default class FAQSet extends React.Component {
  render() {
    return (
      <div key={this.props.id}>
        <FAQQuestion text={this.props.que} data_id={this.props.id} answer={this.props.ans} />
      </div>
    );
  }
}
