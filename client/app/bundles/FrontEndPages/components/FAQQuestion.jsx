import React from 'react'
import Panel from 'react-bootstrap/lib/Panel';

export default class FAQQuestion extends React.Component {
  render() {
    return (
      <Panel
        header={this.props.text}
        eventKey={this.props.id}
        collapsible>
        {"Answer: " + this.props.answer}
      </Panel>
    );
  }
}
