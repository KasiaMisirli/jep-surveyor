import * as React from "react";
import axios from "axios";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";
import Form from "./Form";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionsProps {
  questions: Question[];
  addQuestions?: Function;
}

interface RatingQuestionsState {
  questions: Question[];
}

class RatingQuestions extends React.Component<RatingQuestionsProps> {
  state = {
    questions: this.props.questions
  };
  addQuestion = question => {
    console.log("this is addQuestion" + question);
    let newQuestions = this.state.questions;
    newQuestions.push(question);
    this.setState({ questions: newQuestions });
  };

  deleteQuestion = id => {
    axios
      .delete(`http://localhost:3000/rating_questions/${id}`)
      .then((response: {}) => this.setNewAllQuestionsListAfterDelete(id))
      .catch((err: {}) => console.log(err));
  };
  setNewAllQuestionsListAfterDelete = id => {
    console.log(this.state.questions);
    const newArr = this.state.questions.filter(question => question.id !== id);
    console.log(newArr);
    this.setState({ questions: newArr });
  };

  render() {
    return (
      <div className={styles.mainBody}>
        <h1 className={styles.mainTitle}>Happiness at work survey</h1>
        <a className={styles.listOfQuestionsLink} href="/rating_questions/new">
          New Question
        </a>
        <Form addQuestion={this.addQuestion} update={false} />
        <div
          className={styles.listOfQuestions}
          data-automation-id="questions-list"
        >
          <div className={styles.wrapper} />
          {this.state.questions.map(question => (
            <RatingQuestion
              key={question.id}
              deleteQuestion={this.deleteQuestion}
              {...question}
            />
          ))}
        </div>
        <a className={styles.listOfQuestionsLink} href="/rating_questions">
          all questions
        </a>
      </div>
    );
  }
}

export default RatingQuestions;
