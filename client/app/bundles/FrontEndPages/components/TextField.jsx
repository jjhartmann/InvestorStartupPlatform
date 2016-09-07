import React, { PropTypes } from 'react';

export default class TextField extends React.Component {
  constructor(props) {
    super(props);
    this.state = { value: "" };
  }
  changeContent(e) {
      this.setState({value: e.target.value})
    }
  render()
  {
    return (
      <div className="form-group">
        <label>{this.props.labeltext}</label>
        <input name={this.props.name} type={this.props.type} placeholder={this.props.placeholder} className="form-control" onChange={e => this.handleChange(e)} value={this.value} />
      </div>
    );
  }
}
