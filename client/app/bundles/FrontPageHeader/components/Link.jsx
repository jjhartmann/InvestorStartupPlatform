import React, { PropTypes } from 'react';

export default class LinkWidget extends React.Component {
render()
  {
    return (
      <div>
        <li>          
          <a className="page-scroll" href="#services">{this.props.name}</a>
        </li>
      </div>
    );
  }
}
