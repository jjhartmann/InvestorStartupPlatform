import React, { PropTypes } from 'react';

export default class LogoWidget extends React.Component {
render()
  {
    return (
      <div className="navbar-header page-scroll">
          <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span className="sr-only">Toggle navigation</span> Menu <i className="fa fa-bars"></i>
          </button>          
          <a className="navbar-brand page-scroll" href="#page-top"></a>
      </div>
    );
  }
}
