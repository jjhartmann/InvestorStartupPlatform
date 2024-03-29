import React, { PropTypes } from 'react';
import ReactOnRails from 'react-on-rails';

export default class Error extends React.Component {
  static propTypes = {
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
