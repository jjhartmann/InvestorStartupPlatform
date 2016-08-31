import React, { PropTypes } from 'react';

export default class HeaderText extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    about_text: PropTypes.string.isRequired,
  };
  render()
  {
    const { about_text } = this.props;
    return (
        <h3>
          {about_text}
        </h3>
    );
  }
}
