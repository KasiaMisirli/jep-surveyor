import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import Form from "./Form";
import axios from "axios";
import { Button, Icon } from "@cultureamp/kaizen-component-library";
// import SingleRatingQuestion from "./SingleRatingQuestion";
// import closeIcon from "@cultureamp/kaizen-component-library/icons/closeIcon.svg";

interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
  deleteQuestion(id: string): void;
}

interface RatingQuestionState {
  title: string;
  editingTitle: boolean;
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  state = {
    title: this.props.title,
    editingTitle: false
  };
  changeQuestion = value => {
    axios
      .put(this.props.url, {
        title: value
      })
      .then(response => this.setState({ title: value, editingTitle: false }));
  };

  beginEditing = () => {
    this.setState({ editingTitle: true });
    console.log("editing");
  };

  confirmDelete = () => {
    this.props.deleteQuestion(this.props.id);
  };
  render() {
    return (
      <div className={styles.wrapper}>
        <div className={styles.ratingQuestion}>
          <div>
            {/* <SingleRatingQuestion props={this.props.title} /> */}
            <a
              href={`/rating_questions/${this.props.id}`}
              className={styles.title}
            >
              <span>{this.state.title}</span>
            </a>
          </div>
          <Button label="Edit" automationId="demo-button">
            {" "}
            <a onClick={this.beginEditing}>{/* edit */}</a>
            {/* <Icon icon={closeIcon} title="Warning" /> */}
          </Button>
          {this.renderEditForm()}
          <Button label="Delete" automationId="demo-button-D">
            <a onClick={this.confirmDelete} className={styles.deleteButton}>
              delete
            </a>
          </Button>
        </div>
      </div>
    );
  }
  renderEditForm = () => {
    if (this.state.editingTitle) {
      return (
        <Form
          key={this.props.id}
          id={this.props.id}
          changeQuestion={this.changeQuestion}
          update={true}
          title={this.props.title}
        />
      );
    }
  };
}

export default RatingQuestion;
