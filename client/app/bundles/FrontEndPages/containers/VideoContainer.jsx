import React, { PropTypes } from 'react'
import VideoIFrame from '../components/VideoFrame'
import VideoText from '../components/VideoText'

export default class Video extends React.Component {
  render() {
    return (
      <div className="row video-test">
        <VideoIFrame
          source={this.props.source}>
        </VideoIFrame>
        <VideoText
          text={this.props.text}
          header={this.props.header}>
        </VideoText>
      </div>
    );
  }
}
