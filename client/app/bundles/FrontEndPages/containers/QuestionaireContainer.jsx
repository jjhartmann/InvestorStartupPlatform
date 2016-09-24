import React, { PropTypes } from 'react'
import ReactDOM from 'react-dom';
import SubmitButton from '../components/SubmitButton'
import QuestionaireComponent from '../components/QuestionaireComponent'

export default class QuestionaireContainer extends React.Component {
  removeURLParameter(url) {
    //prefer to use l.search if you have a location/link object
    var urlparts= url.split('?');
    return urlparts[0];
}

  submit(e){
    e.preventDefault();
    var data = {
      questionaires: [],
      enterprise: this.props.data.params
    }
    this.props.data.question.map(map => {
      data.questionaires.push(this.refs[map.id].state)
    });
    console.log(this.props.data.params);
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
          console.log(this.props.data.params);
          if (this.props.data.params == ''){
            console.log(removeURLParameter(window.location));
            window.location.pathname = "/home_pages";
            window.loaction.href = "http://localhost:3000/home_pages";
            window.location.reload();
          }else{
            window.location.pathname = "/enterprises/"+data.enterprise;
            window.loaction.href = "http://localhost:3000/enterprises";
            window.location.reload();
          }
        }
      })
    }
  }
  render() {
    var questionNodes = this.props.data.question.map(questions => {
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
