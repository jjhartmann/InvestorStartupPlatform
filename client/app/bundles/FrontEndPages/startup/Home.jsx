import React from 'react'
import ReactOnRails from 'react-on-rails'
import Contact from '../containers/Contact'

const HomeApp = (props, _railsContext) => {


  const reactComponent = (
    <div>

      <header>
          <div className="container">
              <div className="intro-text">
                  <div className="intro-lead-in"></div>
                  <div className="intro-heading"></div>
                  <a href="#services" className="page-scroll btn btn-xl">Tell Me More</a>
              </div>
          </div>
      </header>

      <section id="services">
          <div className="container">
              <div className="row">
                  <div className="col-lg-12 text-center">
                      <h2 className="section-heading">Services</h2>
                      <h3 className="section-subheading text-muted">We help investors and entrepreneurs create meaningful relationships. </h3>
                  </div>
              </div>
              <div className="row text-center">
                  <div className="col-md-6">
                      <span className="fa-stack fa-4x">
                          <i className="fa fa-circle fa-stack-2x text-primary"></i>
                          <i className="fa fa-cubes fa-stack-1x fa-inverse"></i>
                      </span>
                      <h4 className="service-heading">For Investors</h4>
                      <p className="text-muted">Investing Made Simple! Sign up with your preferences and get matched to your cup of tea.</p>
                      <p>Investing Made Simple! Sign up and view all the startups that match your investment portfolio, as well as getting notified when a matching startup signed up on our site! Our systems will assist you during the investment process, such as conducting online meetings with the founding team, providing interpretation assistance, and conducting preliminary due diligence.</p>
                      <a href="home_pages/for_investors" className="page-scroll btn btn-default">Tell Me More</a>
                  </div>
                  <div className="col-md-6">
                      <span className="fa-stack fa-4x">
                          <i className="fa fa-circle fa-stack-2x text-primary"></i>
                          <i className="fa fa-laptop fa-stack-1x fa-inverse"></i>
                      </span>
                      <h4 className="service-heading">For Startups</h4>
                      <p className="text-muted">Build your company profile and let investors find you! Gain access to various resources through the platform and stay connected to what’s going on in your circle.</p>
                      <p>Gain access to various resources such as up to date industry news in China, market entry strategies, business plan consulting, global partnership build-up, getting your project funded by a variety of investors from various industry background globally.</p>
                      <a href="home_pages/for_enterprises" className="page-scroll btn btn-default">Tell Me More</a>
                  </div>
              </div>
          </div>
      </section>


      <section id="image1"  className="bg-light-gray">
      </section>

    <section id="image2">
    </section>

    <section id="image3"  className="bg-light-gray">
    </section>

      <section id="contact">
          <div className="container">
              <div className="row">
                  <div className="col-lg-12 text-center">
                      <h2 className="section-heading">Contact Us</h2>
                      <h3 className="section-subheading text-muted">We are here to help.</h3>
                  </div>
                  <Contact {...props} />
              </div>
              <div className="row">
                  <div className="col-lg-12">
                      <form name="sentMessage" id="contactForm" noValidate>
                          <div className="row">
                              <div className="col-md-6">
                                  <div className="form-group">
                                      <input type="text" className="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name." />
                                      <p className="help-block text-danger"></p>
                                  </div>
                                  <div className="form-group">
                                      <input type="email" className="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address." />
                                      <p className="help-block text-danger"></p>
                                  </div>
                                  <div className="form-group">
                                      <input type="tel" className="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number." />
                                      <p className="help-block text-danger"></p>
                                  </div>
                              </div>
                              <div className="col-md-6">
                                  <div className="form-group">
                                      <textarea className="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                      <p className="help-block text-danger"></p>
                                  </div>
                              </div>
                              <div className="clearfix"></div>
                              <div className="col-lg-12 text-center">
                                  <div id="success"></div>
                                  <a href="#" className="submit-btn default-style">Submit</a>
                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </section>



    </div>
    );
  return reactComponent;
};

ReactOnRails.register({ HomeApp });
