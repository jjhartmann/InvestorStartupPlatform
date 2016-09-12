import React, { PropTypes } from 'react';
import Auth from '../startup/AuthServices'

export default class SubmitButton extends React.Component{


  login(e) {
      e.preventDefault();
      Auth.login(this.state.user, this.state.password)
        .catch(function(err) {
          alert("There's an error logging in");
          console.log("Error logging in", err);
        });
    }

  render() {
    return (
      <div className="form-group">
        <div className="submit-btn">
          <input type="submit" className="btn-default btn" onClick={this.login.bind(this)}/>
        </div>
      </div>
    );
  }
}
