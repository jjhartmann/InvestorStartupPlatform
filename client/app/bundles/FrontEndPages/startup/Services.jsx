import React from 'react'
import ReactOnRails from 'react-on-rails'
import VideoSection from '../containers/VideoSection'
import ChartSection from '../containers/ChartSection'
import BenefitsSection from '../containers/BenefitsSection'

const Services = (props, _railsContext) => {
  const reactComponent = (
    <div>
      <VideoSection />
      <BenefitsSection />
      <ChartSection />
    </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Services} );
