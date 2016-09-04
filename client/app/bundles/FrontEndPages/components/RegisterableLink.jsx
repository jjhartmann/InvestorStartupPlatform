import React, { PropTypes } from 'react';

export default class RegisterationLinks extends React.Component {
render()
  {
    return (
      <li>
        <a href="#"><span className="fa fa-weixin"></span><span>{this.props.link_name}</span></a>
      </li>
    );
  }
}
