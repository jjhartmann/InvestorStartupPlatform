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
              <LinkWidget
                name="Services"
                path="/home_pages/services"
              />
              <LinkWidget
                name="FAQ"
                path="/home_pages/faq"
              />
              <LinkWidget
                name="About"
                path="/home_pages/about"
              />
              <LinkWidget
                name="Team"
                path="/home_pages/team"
              />
              <LinkWidget
                name="Contact"
                path="/home_pages/contact"
              />
          </ul>
      </div>
    );
  }
}
