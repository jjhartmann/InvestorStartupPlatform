import React, { PropTypes } from 'react';

export default class RegisterHeader extends React.Component {
render()
  {
    return (
      <div className="wel-com-tag">{this.props.header}</div>
    );
  }
}
