import React, { PropTypes } from 'react';
import {Router, Route, IndexRoute, Link} from 'react-router'

export default class LinkWidget extends React.Component {
render()
  {
    return (
      <li>
        <Link href={this.props.path} to="">{this.props.name}</Link>
      </li>
    );
  }
}
