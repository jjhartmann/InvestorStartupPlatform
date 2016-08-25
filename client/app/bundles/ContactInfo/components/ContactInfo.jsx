import React, { PropTypes } from 'react';
import InfoText from '../components/InfoText';
import Info from '../components/Info';

export default class ContactInfo extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    info: PropTypes.string.isRequired,
    text: PropTypes.string.isRequired,
  };
  render()
  {
    const { info } = this.props;
    const { text } = this.props;
    return (
      <div>
        <li>
          <InfoText text={text}/>
          <Info info={info}/>
        </li>
      </div>
    );
  }
}
