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
              <LinkWidget name="Services" path="#services"/>
              <LinkWidget name="Portfolio" path="#portfolio"/>
              <LinkWidget name="About" path="#about"/>
              <LinkWidget name="Team" path="#team"/>
              <LinkWidget name="Contact" path="#contact"/>
          </ul>
      </div>
    );
  }
}
