import React from 'react'

export default class FAQAnswer extends React.Component {
  render() {
    return (
      <div data-id={this.props.data_id} className="collapse1">
        <p>{this.props.text}</p>
      </div>
    );
  }
}
