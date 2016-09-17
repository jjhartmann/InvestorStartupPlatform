import React from 'react'
import ReactOnRails from 'react-on-rails'

export default class AlertMessage extends React.Component {
  constructor(props) {
    super(props);

    this.state = { slideUp: false };
  }
  componentWillMount() {
    setTimeout(() => {
      this.setState({ slideUp: true });
    }, 3500);
  }

  render () {
        if(this.state.slideUp) {
          return (
            <div className={`alert header-alert alert-message slideup alert-${this.props.data.type}`}>
              {this.props.data.message}
            </div>
          );
        }
        else {
          return (
            <div className={`alert header-alert alert-message alert-${this.props.data.type}`}>
              {this.props.data.message}
            </div>
          );
        }
    }
  }
