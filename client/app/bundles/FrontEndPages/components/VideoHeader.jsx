import React, { PropTypes } from 'react';

export default class VideoHeader extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    text: PropTypes.string.isRequired,
  };
  render()
  {
    const { text } = this.props;
    return (
        <div className="name-test">{text}</div>
    );
  }
}
