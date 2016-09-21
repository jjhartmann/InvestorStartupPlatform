import React from 'react'
import ReactOnRails from 'react-on-rails'
import Header from '../components/Header'

export default class UserHeader extends React.Component{
  render() {
    return (
      <div>
        {this.props.user}
        <Header {...this.props} />
      </div>
    );
  }
}
