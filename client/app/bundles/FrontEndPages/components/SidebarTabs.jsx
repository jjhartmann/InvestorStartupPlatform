import React from 'react'
import ReactOnRails from 'react-on-rails'


export default class SidebarTabs extends React.Component {
render()
  {
    return (
      <div className="tabing">
        <div className="close-open"><i className="fa fa-bars" aria-hidden="true"></i></div>
        <ul className="nav nav-pills">
          <li className="active"><a data-toggle="pill" href="#home"><i aria-hidden="true" className="fa fa-user"></i><span className="tab-name">Profile</span></a></li>
          <li><a data-toggle="pill" href="#menu1"><i aria-hidden="true" className="fa fa-newspaper-o"></i><span className="tab-name">news feed</span></a></li>
          <li><a data-toggle="pill" href="#menu2"><i aria-hidden="true" className="fa fa-bell"></i><span className="tab-name">notifications</span><div className="top-count notes">4</div></a></li>
          <li><a data-toggle="pill" href="#menu3"><i aria-hidden="true" className="fa fa-comments"></i><span className="tab-name">messages</span><div className="top-count">3</div></a></li>
          <li><a data-toggle="pill" href="#menu4"><i aria-hidden="true" className="fa fa-tachometer"></i><span className="tab-name">dashboard</span></a></li>
          <li><a data-toggle="pill" href="#menu4"><i className="fa fa-usd" aria-hidden="true"></i><span className="tab-name">proposals</span></a></li>
          <li><a data-toggle="pill" href="#menu6"><i aria-hidden="true" className="fa fa-tag"></i><span className="tab-name">offers</span></a></li>
          <li><a data-toggle="pill" href="#menu7"><i className="fa fa-american-sign-language-interpreting" aria-hidden="true"></i><span className="tab-name">interests</span></a></li>
          <li><a data-toggle="pill" href="#menu8"><i className="fa fa-calendar" aria-hidden="true"></i><span className="tab-name">meeting schedules</span></a></li>
        </ul>
      </div>
    );
  }
}
