import React, { PropTypes } from 'react';

export default class TextField extends React.Component {
  handleChange(e) {
    const name = e.target.value;
    this.props.name;
  }
render()
  {
    return (
      <div className="form-group">
        <label>{this.props.labeltext}</label>
        <input name={this.props.name} type={this.props.type} placeholder={this.props.placeholder} className="form-control" onChange={e => this.handleChange(e)} />
      </div>
    );
  }
}
