import React from 'react'
import ReactOnRails from 'react-on-rails'
import Contact from '../containers/Contact'

const HomeApp = (props, _railsContext) => {
  const reactComponent = (
    <div>

      <header>
          <div className="container">
              <div className="intro-text">
                  <div className="intro-lead-in">Welcome to INP Global!</div>
                  <div className="intro-heading">Where investors and startups click.</div>
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
                          <i className="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                      </span>
                      <h4 className="service-heading">For Investors</h4>
                      <p className="text-muted">Investment made easy! Sign up with your preferences and get matched to your cup of tea.</p>
                      <a href="home_pages/for_investors" className="page-scroll btn btn-default">Tell Me More</a>
                  </div>
                  <div className="col-md-6">
                      <span className="fa-stack fa-4x">
                          <i className="fa fa-circle fa-stack-2x text-primary"></i>
                          <i className="fa fa-laptop fa-stack-1x fa-inverse"></i>
                      </span>
                      <h4 className="service-heading">For Startups</h4>
                      <p className="text-muted">Build your company profile and let investors find you! Gain access to various resources through the platform and stay connected to what’s going on in your circle.</p>
                      <a href="home_pages/for_enterprises" className="page-scroll btn btn-default">Tell Me More</a>
                  </div>
              </div>
          </div>
      </section>

      {/*<section id="portfolio" className="bg-light-gray">*/}
          {/*<div className="container">*/}
              {/*<div className="row">*/}
                  {/*<div className="col-lg-12 text-center">*/}
                      {/*<h2 className="section-heading">Portfolio</h2>*/}
                      {/*<h3 className="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>*/}
                  {/*</div>*/}
              {/*</div>*/}
              {/*<div className="row">*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal1" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/roundicons.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Round Icons</h4>*/}
                          {/*<p className="text-muted">Graphic Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal2" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/startup-framework.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Startup Framework</h4>*/}
                          {/*<p className="text-muted">Website Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal3" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/treehouse.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Treehouse</h4>*/}
                          {/*<p className="text-muted">Website Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal4" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/golden.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Golden</h4>*/}
                          {/*<p className="text-muted">Website Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal5" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/escape.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Escape</h4>*/}
                          {/*<p className="text-muted">Website Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
                  {/*<div className="col-md-4 col-sm-6 portfolio-item">*/}
                      {/*<a href="#portfolioModal6" className="portfolio-link" data-toggle="modal">*/}
                          {/*<div className="portfolio-hover">*/}
                              {/*<div className="portfolio-hover-content">*/}
                                  {/*<i className="fa fa-plus fa-3x"></i>*/}
                              {/*</div>*/}
                          {/*</div>*/}
                          {/*<img src="/assets/portfolio/dreams.png" className="img-responsive" alt=""></img>*/}
                      {/*</a>*/}
                      {/*<div className="portfolio-caption">*/}
                          {/*<h4>Dreams</h4>*/}
                          {/*<p className="text-muted">Website Design</p>*/}
                      {/*</div>*/}
                  {/*</div>*/}
              {/*</div>*/}
          {/*</div>*/}
      {/*</section>*/}

      <section id="whatwedo"  className="bg-light-gray">
          <div className="container">
              <div className="row">
                  <div className="col-lg-12 text-center">
                      <h2 className="section-heading">What We Do</h2>
                      <h3 className="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                  </div>
              </div>
              <div className="row">
                  <div className="col-lg-12">
                      <ul className="timeline">
                          <li>
                              <div className="timeline-image">
                                  <img className="img-circle img-responsive" src="/assets/about/1.jpg" alt=""></img>
                              </div>
                              <div className="timeline-panel">
                                  <div className="timeline-heading">
                                      <h4 className="subheading">Financing</h4>
                                  </div>
                                  <div className="timeline-body">
                                      <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                  </div>
                              </div>
                          </li>
                          <li className="timeline-inverted">
                              <div className="timeline-image">
                                  <img className="img-circle img-responsive" src="/assets/about/2.jpg" alt=""></img>
                              </div>
                              <div className="timeline-panel">
                                  <div className="timeline-heading">
                                      <h4 className="subheading">BP Review</h4>
                                  </div>
                                  <div className="timeline-body">
                                      <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <div className="timeline-image">
                                  <img className="img-circle img-responsive" src="/assets/about/3.jpg" alt=""></img>
                              </div>
                              <div className="timeline-panel">
                                  <div className="timeline-heading">
                                      <h4 className="subheading">Mentorship</h4>
                                  </div>
                                  <div className="timeline-body">
                                      <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                  </div>
                              </div>
                          </li>
                          <li className="timeline-inverted">
                              <div className="timeline-image">
                                  <img className="img-circle img-responsive" src="/assets/about/4.jpg" alt=""></img>
                              </div>
                              <div className="timeline-panel">
                                  <div className="timeline-heading">
                                      <h4 className="subheading">Entrepreneurship</h4>
                                  </div>
                                  <div className="timeline-body">
                                      <p className="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                  </div>
                              </div>
                          </li>
                          <li className="timeline-inverted">
                              <div className="timeline-image">
                                  <h4>Start Here!</h4>
                              </div>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </section>

      <section id="team" className="bg-light-gray">
          <div className="container">
              <div className="row">
                  <div className="col-lg-12 text-center">
                      <h2 className="section-heading">Our Amazing Team</h2>
                      <h3 className="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                  </div>
              </div>
              <div className="row">
                  <div className="col-sm-4">
                      <div className="team-member">
                          <img src="/assets/team/1.jpg" className="img-responsive img-circle" alt=""></img>
                          <h4>Kay Garland</h4>
                          <p className="text-muted">Lead Designer</p>
                          <ul className="list-inline social-buttons">
                              <li><a href="#"><i className="fa fa-twitter"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-facebook"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-linkedin"></i></a>
                              </li>
                          </ul>
                      </div>
                  </div>
                  <div className="col-sm-4">
                      <div className="team-member">
                          <img src="/assets/team/2.jpg" className="img-responsive img-circle" alt=""></img>
                          <h4>Larry Parker</h4>
                          <p className="text-muted">Lead Marketer</p>
                          <ul className="list-inline social-buttons">
                              <li><a href="#"><i className="fa fa-twitter"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-facebook"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-linkedin"></i></a>
                              </li>
                          </ul>
                      </div>
                  </div>
                  <div className="col-sm-4">
                      <div className="team-member">
                          <img src="/assets/team/3.jpg" className="img-responsive img-circle" alt=""></img>
                          <h4>Diana Pertersen</h4>
                          <p className="text-muted">Lead Developer</p>
                          <ul className="list-inline social-buttons">
                              <li><a href="#"><i className="fa fa-twitter"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-facebook"></i></a>
                              </li>
                              <li><a href="#"><i className="fa fa-linkedin"></i></a>
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
              <div className="row">
                  <div className="col-lg-8 col-lg-offset-2 text-center">
                      <p className="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
                  </div>
              </div>
          </div>
      </section>

      <aside className="clients">
          <div className="container">
              <div className="row">
                  <div className="col-md-3 col-sm-6">
                      <a href="#">
                          <img src="/assets/logos/envato.jpg" className="img-responsive img-centered" alt=""></img>
                      </a>
                  </div>
                  <div className="col-md-3 col-sm-6">
                      <a href="#">
                          <img src="/assets/logos/designmodo.jpg" className="img-responsive img-centered" alt=""></img>
                      </a>
                  </div>
                  <div className="col-md-3 col-sm-6">
                      <a href="#">
                          <img src="/assets/logos/themeforest.jpg" className="img-responsive img-centered" alt=""></img>
                      </a>
                  </div>
                  <div className="col-md-3 col-sm-6">
                      <a href="#">
                          <img src="/assets/logos/creative-market.jpg" className="img-responsive img-centered" alt=""></img>
                      </a>
                  </div>
              </div>
          </div>
      </aside>

      <section id="contact">
          <div className="container">
              <div className="row">
                  <div className="col-lg-12 text-center">
                      <h2 className="section-heading">Contact Us</h2>
                      <h3 className="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
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

      <div className="portfolio-modal modal fade" id="portfolioModal1" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Name</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/roundicons-free.png" alt=""></img>
                                  <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                  <p>
                                      <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p>
                                  <ul className="list-inline">
                                      <li>Date: July 2014</li>
                                      <li>Client: Round Icons</li>
                                      <li>Category: Graphic Design</li>
                                  </ul>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

      <div className="portfolio-modal modal fade" id="portfolioModal2" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Heading</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/startup-framework-preview.png" alt=""></img>
                                  <p><a href="http://designmodo.com/startup/?u=787">Startup Framework</a> is a website builder for professionals. Startup Framework contains components and complex blocks (PSD+HTML Bootstrap themes and templates) which can easily be integrated into almost any design. All of these components are made in the same style, and can easily be integrated into projects, allowing you to create hundreds of solutions for your future projects.</p>
                                  <p>You can preview Startup Framework <a href="http://designmodo.com/startup/?u=787">here</a>.</p>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

      <div className="portfolio-modal modal fade" id="portfolioModal3" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Name</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/treehouse-preview.png" alt=""></img>
                                  <p>Treehouse is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. This is bright and spacious design perfect for people or startup companies looking to showcase their apps or other projects.</p>
                                  <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/treehouse-free-psd-web-template/">FreebiesXpress.com</a>.</p>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

      <div className="portfolio-modal modal fade" id="portfolioModal4" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Name</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/golden-preview.png" alt=""></img>
                                  <p>Start Bootstrap's Agency theme is based on Golden, a free PSD website template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Golden is a modern and clean one page web template that was made exclusively for Best PSD Freebies. This template has a great portfolio, timeline, and meet your team sections that can be easily modified to fit your needs.</p>
                                  <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/golden-free-one-page-web-template/">FreebiesXpress.com</a>.</p>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

      <div className="portfolio-modal modal fade" id="portfolioModal5" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Name</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/escape-preview.png" alt=""></img>
                                  <p>Escape is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Escape is a one page web template that was designed with agencies in mind. This template is ideal for those looking for a simple one page solution to describe your business and offer your services.</p>
                                  <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/escape-one-page-psd-web-template/">FreebiesXpress.com</a>.</p>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

      <div className="portfolio-modal modal fade" id="portfolioModal6" tabIndex="-1" role="dialog" aria-hidden="true">
          <div className="modal-dialog">
              <div className="modal-content">
                  <div className="close-modal" data-dismiss="modal">
                      <div className="lr">
                          <div className="rl">
                          </div>
                      </div>
                  </div>
                  <div className="container">
                      <div className="row">
                          <div className="col-lg-8 col-lg-offset-2">
                              <div className="modal-body">
                                  <h2>Project Name</h2>
                                  <p className="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                  <img className="img-responsive img-centered" src="/assets/portfolio/dreams-preview.png" alt=""></img>
                                  <p>Dreams is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Dreams is a modern one page web template designed for almost any purpose. It’s a beautiful template that’s designed with the Bootstrap framework in mind.</p>
                                  <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/dreams-free-one-page-web-template/">FreebiesXpress.com</a>.</p>
                                  <button type="button" className="btn btn-primary" data-dismiss="modal"><i className="fa fa-times"></i> Close Project</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

    </div>
    );
  return reactComponent;
};

ReactOnRails.register({ HomeApp });
