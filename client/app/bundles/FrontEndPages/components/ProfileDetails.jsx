import React from 'react'
import ReactOnRails from 'react-on-rails'
import UserProfile from '../components/UserProfile'
import InvestorProfile from '../components/InvestorProfile'


export default class ProfileDetails extends React.Component {

  render()
  {
    var container_style = { width: 100% }
    return (
      <div className="container side-deatail" style={container_style}>
        <div className="col-xs-12">
          <div className="profile-tabs">
            <div className="tab-content">
              <div id="home" className="tab-pane fade in active">
                <div className="tab-title">Profile</div>
                {this.props.profiletype == "UserProfile" ? <UserProfile {...this.props}/> : <InvestorProfile {...this.props} />}

            </div>
          </div>
        </div>
      </div>
    </div>
  )};
}
