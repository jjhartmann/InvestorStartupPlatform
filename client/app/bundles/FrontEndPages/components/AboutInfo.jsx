import React, { PropTypes } from 'react';

export default class AboutInfo extends React.Component {
  static propTypes = {
    info: PropTypes.array.isRequired,
  };
  render()
  {
    const { info } = this.props;
    return (
        <li>
          {info}
        </li>
    );
  }
}
