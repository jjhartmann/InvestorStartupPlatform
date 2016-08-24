import React from 'react'
import ReactOnRails from 'react-on-rails'
import LinkWidget from '../../FrontPageHeader/components/Link'
import ShareableLinkWidget from '../components/ShareableLinks'

const FooterApp = (props, _railsContext) => {
  const reactComponent = (
    <footer>
        <div className="container">
            <div className="row">
                <div className="col-md-4">
                    <span className="copyright">Copyright &copy; Your Website 2016</span>
                </div>
                <div className="col-md-4">
                    <ul className="list-inline social-buttons">
                      <ShareableLinkWidget id="twitter" link={[<i className="fa fa-twitter" key="i-twitter"></i>]} />
                      <ShareableLinkWidget id="facebook" link={[<i className="fa fa-facebook" key="i-facebook"></i>]} />
                      <ShareableLinkWidget id="linkedin" link={[<i className="fa fa-linkedin" key="i-linkedin"></i>]} />
                    </ul>
                </div>
                <div className="col-md-4">
                    <ul className="list-inline quicklinks">
                      <LinkWidget name="Privacy Policy" path="#"/>
                      <LinkWidget name="Terms of Use" path="#"/>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ FooterApp });
