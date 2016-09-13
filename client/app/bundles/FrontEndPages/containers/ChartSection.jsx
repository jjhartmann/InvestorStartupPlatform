import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import ChartWidget from '../components/ChartComponent'

export default class ChartSection extends React.Component {
  render() {
    return (
    <section className="modify">
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
            <HeaderText
              about_text="Charts"
            />
            <ChartWidget></ChartWidget>
          </div>
        </div>
      </div>
    </section>
  );
}
}
