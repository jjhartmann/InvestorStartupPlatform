import React, { PropTypes } from 'react';
import ReactOnRails from 'react-on-rails';

export default class Error extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    error: PropTypes.string.isRequired,
  };

  

  render()
  {
    const { error } = this.props;
    return (
     <div className="alert alert-danger">
      {error}
    </div>
    );
  }
}
