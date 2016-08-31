import React, { PropTypes } from 'react';

export default class VideoIFrame extends React.Component {
  static propTypes = {
    source: PropTypes.string.isRequired,
  };
  render()
  {
    const { source } = this.props;
    return (
      <div className="col-md-4">
        <div className="video">
          <iframe width="100%" height="200" src={source} frameBorder="0" allowFullScreen></iframe>
        </div>
      </div>
    );
  }
}
