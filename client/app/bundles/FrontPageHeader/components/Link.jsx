import React, { PropTypes } from 'react';

export default class LinkWidget extends React.Component {
render()
  {
    return (
        <li>
          <a className="page-scroll" href={this.props.path}>{this.props.name}</a>
        </li>
    );
  }
}
