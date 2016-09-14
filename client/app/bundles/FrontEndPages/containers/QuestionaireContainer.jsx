import React, { PropTypes } from 'react'
import SubmitButton from '../components/SubmitButton'
import QuestionaireComponent from '../components/QuestionaireComponent'

export default class QuestionaireContainer extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = { questions: this.props.data };
  }
  render() {
    var questionNodes = this.state.questions.map(function(question){
      return (
        <QuestionaireComponent key={question.id} question={question.question}/>
      );
    });
    return (
      <div className="question">
        <ul>
          {questionNodes}
        </ul>
        <SubmitButton/>
      </div>
    );
  }
}
