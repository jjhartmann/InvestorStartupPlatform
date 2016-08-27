import React from 'react'

export default class FAQQuestion extends React.Component {
  render() {
    return (
      <div>
        <button type="button" className="btn btn-info" data-toggle="collapse" data-target={"#" + this.props.data_id}>{this.props.text}<span className="icon-tab fa fa-angle-down"></span></button>
        <div data-id={this.props.data_id} className="collapse1">
            <p>{this.props.answer}</p>
        </div>
        </div>
    );
  }
}
