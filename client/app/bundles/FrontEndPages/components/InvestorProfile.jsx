import React from 'react'
import ReactOnRails from 'react-on-rails'
import ProfileInfo from '../components/ProfileInfo'

export default class InvestorProfileDetails extends React.Component {

  render()
  {
    return (
      <div className="main-start">
        <div className="box-tab">
          <div className="circle"><i aria-hidden="true" className="fa fa-user"></i></div>
          <h2><i aria-hidden="true" className="fa fa-user"></i>{this.props.data.name}</h2>
          <p>Loerm ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            <ProfileInfo temp="Microsoft" text={this.props.tagline} class="fa fa-tag"/>
            <ProfileInfo temp="200000" text={this.props.fundstotransfer} class="fa fa-money"/>
            <ProfileInfo temp="Latest Project" text={this.props.description} class="fa fa-file"/>
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
