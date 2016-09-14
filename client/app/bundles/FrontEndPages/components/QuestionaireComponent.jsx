import React, {PropTypes} from 'react'

export default class QuestionaireComponent extends React.Component {
  static propTypes = {
    question: PropTypes.string.isRequired,
  };
  render() {
    const { question } = this.props;
    return (
      <li>
        <div className="box-sed">
          <div className="que-set">
            <span className="icon-ahead">
              <i aria-hidden="true" className="fa fa-question-circle"></i>
            </span>
            <h2>{question}</h2>
            <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500's, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
          </div>
          <div className="registration question-type">
            <input type="text" placeholder="Type answer" />
          </div>
        </div>
      </li>
    );
  }
}
