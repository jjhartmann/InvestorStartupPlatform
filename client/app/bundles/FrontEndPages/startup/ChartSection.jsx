import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import Chart from '../components/ChartComponent'

const ChartSection = (props, _railsContext) => {
  const reactComponent = (
    <section className="modify">
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
            <HeaderText about_text="Charts" />
            <Chart></Chart>
          </div>
        </div>
      </div>
    </section>
  );
  return reactComponent;
};

ReactOnRails.register( {ChartSection} );
