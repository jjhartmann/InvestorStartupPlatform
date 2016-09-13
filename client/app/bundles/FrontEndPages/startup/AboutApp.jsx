import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import AboutInfo from '../components/AboutInfo'

const About = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <header className="back-image">

      </header>
      <div className="container">
        <div className="row">
          <div className="col-xs-12 about">
            <HeaderText about_text="About" />
            <ul>
              <AboutInfo
                info={["AngelList is a platform for startups—started by the dudes who do ", <a href='#' key="1">Venture Hacks.</a>]}/>
              <AboutInfo
                info={["Meet the ", <a href='#' key="2">Venture Hacks.</a>, " and ", <a href='#' key="3">investors.</a>]}/>
              <AboutInfo
                info={["Browse ", <a href='#' key="4">startups</a>, " and ", <a href='#' key="5">investors.</a>]}/>
              <AboutInfo
                info={["Questions? Email ", <a href='#' key="6">us.</a>]}/>
              <AboutInfo
                info={["For questions about jobs & recruiting, email ", <a href='#' key="7">talent@angel.co.</a>]}/>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ About });
