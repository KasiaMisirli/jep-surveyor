import * as React from "react";
import * as styles from "./Form.module.scss";
import axios from "axios";
import { Button, Text } from "@cultureamp/kaizen-component-library";

type UpdateFormProps = {
  update: true;
  id: string;
  title: string;
  changeQuestion(value: string): void;
};

type CreateFormProps = {
  update: false;
  addQuestion(data: string): void;
};

type FormProps = UpdateFormProps | CreateFormProps;

class Form extends React.Component<FormProps> {
  state = {
    title: "",
    value: ""
  };
  handleChange = event => {
    this.setState({ title: event.target.value });
  };

  addNew() {
    axios
      .post("http://localhost:3000/rating_questions.json", {
        title: this.state.title
      })
      .then(response =>
        (this.props as CreateFormProps).addQuestion(response.data)
      );
  }

  handleFormSubmit = event => {
    event.preventDefault();
    if (this.props.update) {
      this.props.changeQuestion(this.state.title);
    } else {
      this.addNew();
    }
  };

  render() {
    return (
      <div className={styles.formStyling}>
        <form onSubmit={this.handleFormSubmit}>
          <label>
            <Text tag="h1" className={styles.formTitle}>
              Title:
            </Text>
            <input
              className={styles.inputFieldStyling}
              type="text"
              defaultValue={this.state.value}
              onChange={this.handleChange}
              placeholder="Please input new rating question here"
            />
          </label>
          <Button label="Submit">
            <input
              className={styles.inputButtonStyling}
              type="submit"
              value="Submit"
            />
          </Button>
        </form>
      </div>
    );
  }
}

export default Form;
