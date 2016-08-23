import React, { PropTypes } from 'react';
import LinkWidget from '../components/Link'

export default class LinksWidget extends React.Component {
render()
  {
    return (
      <div>
          <ul className="nav navbar-nav navbar-left">
              <li className="hidden">
                  <a href="#page-top"></a>
              </li>
              <LinkWidget name="Services"/>
              <LinkWidget name="Portfolio"/>
              <LinkWidget name="About"/>
              <LinkWidget name="Team"/>
              <LinkWidget name="Contact"/>
          </ul>
      </div>
    );
  }
}
