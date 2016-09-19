import React from 'react'
import ReactOnRails from 'react-on-rails'
import ProfileInfo from '../components/ProfileInfo'

export default class UserProfileDetails extends React.Component {

  render()
  {
    return (
      <div className="main-start">
        <div className="box-tab">
          <div className="circle"><i aria-hidden="true" className="fa fa-user"></i></div>
          <h2><i aria-hidden="true" className="fa fa-user"></i>{this.props.data.name}</h2>
          <p>Loerm ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
          <ProfileInfo temp="Narola" text={this.props.industry} class="fa fa-industry"/>
          <ProfileInfo temp="Developer" text={this.props.profession} class="fa fa-briefcase"/>
          <ProfileInfo temp="ROR,PHP" text={this.props.skills} class="fa fa-graduation-cap"/>
          <ProfileInfo temp="SEO" text={this.props.somethingcool} class="fa fa-lightbulb-o"/>
          <div className="buttons">
            <a href="#"><div className="edit"><i className="fa fa-pencil" aria-hidden="true"></i></div>
          </a>
          <a href="#"><div className="edit share"><i className="fa fa-share" aria-hidden="true"></i></div></a>
        </div>
      </div>
    </div>
    )
  }
}
