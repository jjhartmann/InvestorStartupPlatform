import React from 'react'
import ReactOnRails from 'react-on-rails'


export default class ProfileInfo extends React.Component {
  render(){
    return (
      <div>
        <div className="user-positon"><i aria-hidden="true" className={this.props.class}></i>{this.props.temp}</div>
      </div>
    )};
  }
