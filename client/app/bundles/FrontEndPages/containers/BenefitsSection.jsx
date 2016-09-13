import React from 'react'
import ReactOnRails from 'react-on-rails'
import HeaderText from '../components/SectionHeader'
import BenefitsList from '../containers/BenefitsList'

export default class BenefitsSection extends React.Component {
  render() {
    return (
      <section className="modify bg-light-gray">
        <div className="container">
          <div className="row">
            <div className="col-xs-12 about">
              <HeaderText about_text="Benefits" />
              <div className="row">
                <BenefitsList
                  header="Suspendisse sollicitudin diam"
                  text="Curabitur dui velit, faucibus tempus tincidunt non, feugiat id mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at vestibulum est, vel condimentum sem. Sed tincidunt enim ac bibendum sodales. Vivamus a dignissim elit. Suspendisse efficitur tincidunt odio quis tincidunt. Cras at turpis at quam sagittis ultrices sed quis lectus."
                />
                <BenefitsList
                  header="Quisque iaculis lectus id sem"
                  text="Proin venenatis nulla mi, non luctus libero fringilla vel. In a elementum tortor, non porttitor risus. Aliquam ullamcorper pharetra arcu, in consectetur eros porttitor vel. In iaculis in turpis at elementum. Nam faucibus arcu quis neque suscipit scelerisque. Phasellus odio felis, pellentesque dictum volutpat id, maximus id est."
                />
                <BenefitsList
                  header="Etiam vulputate bibendum"
                  text="Nullam posuere cursus risus, at porttitor risus euismod vel. Proin et ullamcorper felis, et feugiat lectus. Donec urna dolor, facilisis ac bibendum ac, dapibus ullamcorper nibh. Praesent dictum magna eu mi gravida congue. Suspendisse potenti. Nunc quis fermentum neque. Ut sit amet tincidunt ligula. Sed vestibulum fermentum euismod."
                />
              </div>
            </div>
          </div>
        </div>
      </section>
    );
  }
}
