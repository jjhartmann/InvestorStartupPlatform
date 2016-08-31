import React from 'react'
import ReactOnRails from 'react-on-rails'
import SectionHeader from '../components/SectionHeader'

// Simple example of a React "smart" component
export default class BenefitsList extends React.Component {
  render() {
    return (
      <div className="col-md-4">
        <div className="box-tex text-center">
          <div className="circle">
            <span className="fa fa-clock-o"></span>
          </div>
          <SectionHeader about_text={this.props.header}/>
          <p>
            {this.props.text}
          </p>
        </div>
      </div>
    );
  }
}
