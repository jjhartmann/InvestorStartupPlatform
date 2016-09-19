import React from 'react'
import ReactOnRails from 'react-on-rails'
import SidebarTab from '../components/SidebarTabs'
import Header from '../components/Header'
import ProfileDetails from '../components/ProfileDetails'

export default class ProfilePage extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = { profile_details: this.props.data,
      profilable: this.props.profilable,
    };
  }
  render() {
    return (
      <div>
        <SidebarTab />
        <ProfileDetails {...this.props} />
      </div>
    );
  }
}
