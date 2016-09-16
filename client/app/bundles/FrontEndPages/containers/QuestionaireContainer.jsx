import React, { PropTypes } from 'react'
import ReactDOM from 'react-dom';
import SubmitButton from '../components/SubmitButton'
import QuestionaireComponent from '../components/QuestionaireComponent'

export default class QuestionaireContainer extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = { questions: this.props.data };
  }
  submit(e){
    e.preventDefault();
    $(".input-text").each(function(){
    console.log($(this).val());
    console.log(ReactDOM.findDOMNode(this).parentNode);
    })
    $.ajax({
      type: "GET",
      url: "/questionaries/save_questions",
      success: ()=>{
        alert("hello")
      }
    })
  }
  render() {
    var questionNodes = this.state.questions.map(function(question){
      return (
        <QuestionaireComponent key={question.id} question={question.question}/>
      );
    });
    return (
      <div className="question">
        <form onSubmit={this.submit.bind(this)}>
          <ul>
            {questionNodes}
          </ul>
          <SubmitButton/>
        </form>
      </div>
    );
  }
}
