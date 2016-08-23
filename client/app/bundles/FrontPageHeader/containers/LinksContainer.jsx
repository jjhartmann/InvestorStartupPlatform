import React, { PropTypes } from 'react'
import LinksWidget from '../components/HeaderLink'


// Simple example of a React "smart" component
export default class Links extends React.Component {
  render() {
    return (
      <div>
        <LinksWidget/>
      </div>
    );
  }
}
