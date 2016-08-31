import React, { PropTypes } from 'react';

export default class VideoText extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    text: PropTypes.string.isRequired,
    header: PropTypes.string.isRequired,
  };
  render()
  {
    const { text } = this.props;
    const { header } = this.props;
    return (
      <div className="col-md-8 video-text-in">
        <h4>{header}</h4>
        <p>
          {text}
        </p>
      </div>
    );
  }
}
