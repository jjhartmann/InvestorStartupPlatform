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
        <Information companyName={this.state.information.companyName} companyText={this.state.information.companyText}  location={this.state.information.location} locationText={this.state.information.locationText} phoneNumber={this.state.information.phoneNumber} phonetext={this.state.information.phonetext} email={this.state.information.email} emailText={this.state.information.emailText}/>
      </div>
    );
  }
}
