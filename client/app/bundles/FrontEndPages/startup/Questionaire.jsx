import React from 'react'
import ReactOnRails from 'react-on-rails'
import QuestionaireContainer from '../containers/QuestionaireContainer'

const Questionaire = (props, _railsContext) => {
  const reactComponent = (
    <div className="container">
      <div className="col-xs-12">
        <h2>Questionaire</h2>
        <p>A little longer and you'll be there. Please fill this questionaire  so that we could serve you better.</p>
        <QuestionaireContainer {...props} />
      </div>
    </div>
  );
  return reactComponent;
};

ReactOnRails.register( {Questionaire} );
