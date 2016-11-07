import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import AboutInfo from '../components/AboutInfo'

const About = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <div className="container">
        <div className="row">
          <div className="col-xs-12 about">
            <HeaderText about_text="About" />
            <ul>
              <AboutInfo
                info={["iNetPlus is a platform for startups - started by a passsionate crew in", <a href='#' key="1">Vancouver.</a>]}/>
              <AboutInfo
                info={["Browse ", <a href='home_pages/for_enterprises' key="4">startups</a>, " and ", <a href='/home_pages/for_investors' key="5">investors.</a>]}/>
              <AboutInfo
                info={["Questions? Email ", <a href='mailto:contant@inp.global' key="6">us.</a>]}/>
              <AboutInfo
                info={["For questions about jobs & recruiting, email ", <a href='#' key="7">talent@inp.global</a>]}/>
            </ul>
            <p>
              INP is a global SaaS funding platform where entrepreneurs and investors can meet, and start the funding process in an easy and efficient way. INP platform provides comprehensive services to support entrepreneurs and investors, and aid deal flows from pitch and exit. INP is a feature brand under Uni-Innovation Group, which was established in 2013, with headquarters in Canada, Australia, France and China.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ About });
