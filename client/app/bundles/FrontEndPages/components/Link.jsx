import React, { PropTypes } from 'react';
import {Router, Route, IndexRoute, Link} from 'react-router'

export default class LinkWidget extends React.Component {
render()
  {
    return (
      <li>
        <Link to={this.props.path} className="page-scroll">{this.props.name}</Link>
      </li>
    );
  }
}
