import React, { PropTypes } from 'react';
import {Link} from 'react-router';

export default class ShareableLinkWidget extends React.Component {
render()
  {
    return (
      <li>
        <Link to={this.props.id}>{this.props.link}</Link>
      </li>
    );
  }
}
