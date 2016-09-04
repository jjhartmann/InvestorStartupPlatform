import React, { PropTypes } from 'react';

export default class TextField extends React.Component {
render()
  {
    return (
      <div className="form-group">
        <label>{this.props.labeltext}</label>
        <input type={this.props.type} placeholder={this.props.placeholder} className="form-control" />
      </div>
    );
  }
}
