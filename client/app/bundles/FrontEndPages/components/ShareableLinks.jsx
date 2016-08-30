import React, { PropTypes } from 'react';

export default class ShareableLinkWidget extends React.Component {
render()
  {
    return (
        <li>
          <a href="#" key={this.props.id}>{this.props.link}</a>
        </li>
    );
  }
}
