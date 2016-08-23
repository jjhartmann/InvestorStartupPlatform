import React, { PropTypes } from 'react'
import LogoWidget from '../components/LogoWidget'

// Simple example of a React "smart" component
export default class Logo extends React.Component {
  render() {
    return (
      <div>
        <LogoWidget/>
      </div>
    );
  }
}
