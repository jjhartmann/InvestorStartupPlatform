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
            <a className="navbar-brand" href="/">Start Bootstrap</a>
          </div>
          <div id="navbar" className="navbar-collapse collapse in" aria-expanded="true">
            <ul className="nav navbar-nav">
              <li><a href={"/user_profiles/"+this.props.data.user.id}>Profile</a></li>
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
              <li className="dropdown">
                <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i aria-hidden="true" className="fa fa-user"></i></a>
                <ul className="dropdown-menu user-section">
                  <li><a href={"/user_profiles/"+this.props.data.user.id}>{this.props.data.user.name}</a></li>
                  <li className="divider" role="presentation"></li>
                  <li><a href="#">Settings</a></li>
                  <li><a href="#">create company profile</a></li>
                  <li><a href="#">Manage connections</a></li>
                  <li><a href="/users/sign_out" method="delete">Log Out</a></li>
                </ul>
              </li>
              <li><a href="#"><i aria-hidden="true" className="fa fa-comments-o"></i> </a></li>
              <li><a href="#"><i className="fa fa-bell" aria-hidden="true"></i></a></li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}
