import React from 'react'
import ReactOnRails from 'react-on-rails'
import ContactInfo from '../components/ContactInfo'

export default class Information extends React.Component {
  render() {
    return (
      <div>
        <ul className="our-background">
          <ContactInfo
            info={this.props.companyName}
            text={this.props.companyText}
          />
          <ContactInfo
            info={this.props.location}
            text={this.props.locationText}
          />
          <ContactInfo
            info={this.props.phoneNumber}
            text={this.props.phonetext} 
          />
          <ContactInfo
            info={this.props.email}
            text={this.props.emailText}
          />
      </ul>
      </div>
    );
  }
}
