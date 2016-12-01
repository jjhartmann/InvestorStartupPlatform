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
                info={["iNETPLUS International ventures (INP) established a unique entrepreneurial ecosystem to empowering entrepreneurs grow their businesses based in", <a href='#' key="1">Vancouver.</a>]}/>
              <AboutInfo
                info={["Browse ", <a href='home_pages/for_enterprises' key="4">startups</a>, " and ", <a href='/home_pages/for_investors' key="5">investors.</a>]}/>
              <AboutInfo
                info={["Questions? Email ", <a href='mailto:info@inp.global' key="6">us.</a>]}/>
              <AboutInfo
                info={["For questions about jobs & recruiting, email ", <a href='#' key="7">talent@inp.global</a>]}/>
            </ul>
            <p>
              iNETPLUS International venture (INP), INP is a global SaaS funding platform where entrepreneurs and investors can meet, and start the funding process in an easy and efficient way. INP platform provides comprehensive services to support entrepreneurs and investors, and aid deal flows from pitch and exit. INP is a feature brand under Uni-Innovation Group, which was established in 2013, it has locations in Canada, Australia, France and China.
            </p>

            <h3>Vision</h3>
            <p>We devote our resources and capitals to people with great dreams and ideas and grow with them. </p>

            <h3>Mission</h3>
            <p>We are committed to the “technique + venture partners + capital + premium resources” model of operation to provide capital support, strategic partnership matchmaking, venture partners import, and management mentoring for entrepreneurs.</p>
          </div>
        </div>
      </div>
    </div>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ About });
