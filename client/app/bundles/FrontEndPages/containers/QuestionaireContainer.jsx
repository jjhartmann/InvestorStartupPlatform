import React, { PropTypes } from 'react'
import ReactDOM from 'react-dom';
import SubmitButton from '../components/SubmitButton'
import QuestionaireComponent from '../components/QuestionaireComponent'

export default class QuestionaireContainer extends React.Component {

  submit(e){
    e.preventDefault();
    var data = {
      questionaires: []
    }
    this.props.data.map(map => {
      data.questionaires.push(this.refs[map.id].state)
    });
    var flag = 0;
    $('input[type="text"]').each(function(){
      if ($(this).val() == ''){
        flag = 1;
        $(this).parent().find('span').css("display","block");
      }else{
        $(this).parent().find('span').css("display","none");
      }
    })
    if (flag == 1){
      // alert("Answers cannot be blank!!!");
    }else{
      $.ajax({
        type: "GET",
        url: "/questionaries/save_questions",
        data: data,
        dataType: 'json',
        success: ()=>{
          window.location.pathname = "/home_pages";
          window.loaction.href = "http://localhost:3000/home_pages";
          window.location.reload();
        }
      })
    }
  }
  render() {
    var questionNodes = this.props.data.map(questions => {
      return (
        <QuestionaireComponent question={questions.question} key={questions.id} id = {questions.id} ref={questions.id}/>
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
