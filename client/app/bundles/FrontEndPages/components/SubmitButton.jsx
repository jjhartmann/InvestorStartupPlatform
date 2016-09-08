import React, { PropTypes } from 'react';

export default class SubmitButton extends React.Component{


  render() {
    return (
      <div className="form-group">
        <div className="submit-btn">
          <input type="submit" className="btn-default btn"/>
        </div>
      </div>
    );
  }
}
