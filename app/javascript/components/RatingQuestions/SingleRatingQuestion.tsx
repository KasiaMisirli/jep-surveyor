import * as React from "react";
import * as styles from "./index.module.scss";
// import RatingQuestion from "./RatingQuestion";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface SingleRatingQuestionsProps {
  question: Question;
  deleteQuestion(id: string): void;
}

class SingleRatingQuestion extends React.Component<
  SingleRatingQuestionsProps,
  {}
> {
  render() {
    return (
      <div data-automation-id="questions-list">
        {/* <RatingQuestion
          deleteQuestion={this.props.deleteQuestion}
          key={this.props.question.id}
          {...this.props.question}
        /> */}
        {/* {this.props.title} */}
        <a href="/">All questions</a>
      </div>
    );
  }
}

export default SingleRatingQuestion;
