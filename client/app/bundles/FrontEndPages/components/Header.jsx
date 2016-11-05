import React from 'react'
import ReactOnRails from 'react-on-rails'


export default class Header extends React.Component {
render()
  {
    return (
      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="true" aria-controls="navbar">
              <span className="sr-only">Toggle navigation</span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <a className="navbar-brand 123" href="#"><img src='../app/assets/images/NetPlus_Logo.png'/></a>
          </div>
          <div id="navbar" className="navbar-collapse collapse in" aria-expanded="true">
            <ul className="nav navbar-nav">
              <li className="active"><a href="#">Home</a></li>
              <li><a href="#">Profile </a></li>
              <li><a href="#">Connections </a></li>
              <li className="dropdown">
                <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Company <span className="caret"></span></a>
                <ul className="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" className="divider"></li>
                  <li className="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul className="nav navbar-nav navbar-right">
              <li><a href="#"><i className="fa fa-user" aria-hidden="true"></i></a></li>
              <li><a href="#"><i aria-hidden="true" className="fa fa-comments-o"></i> </a></li>
              <li><a href="#"><i className="fa fa-bell" aria-hidden="true"></i></a></li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}
