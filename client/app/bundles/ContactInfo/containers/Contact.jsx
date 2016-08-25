import React from 'react'
import ReactOnRails from 'react-on-rails'
import Information from '../containers/Information'

// Simple example of a React "smart" component
export default class Contact extends React.Component {
  constructor(props, context) {
    super(props, context);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { information: this.props.data };
  }
  render() {
    return (
      <div className="col-lg-12">
        <Information companyName={this.props.data.companyName} companyText={this.props.data.companyText}  location={this.props.data.location} locationText={this.props.data.locationText} phoneNumber={this.props.data.phoneNumber} phonetext={this.props.data.phonetext} email={this.props.data.email} emailText={this.props.data.emailText}/>
      </div>
    );
  }
}
