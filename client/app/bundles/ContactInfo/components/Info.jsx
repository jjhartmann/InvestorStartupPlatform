import React, { PropTypes } from 'react';

export default class Info extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    info: PropTypes.string.isRequired,
  };
  render()
  {
    const { info } = this.props;
    return (
        <div className="name-test">{info}</div>
    );
  }
}
