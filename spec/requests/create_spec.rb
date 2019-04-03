require "rails_helper"

RSpec.describe "POST /ratingQuestions" do
  let(:title) { "Hello World" }
  let(:tag) { "new tag" }
  context "when the request has a body" do
    before do
      post "/rating_questions.json", params: {  rating_question: { title: "Hello World", tag: "new tag" }}
    end

    it "returns a 201 Created" do
      expect(response.status).to eq(201)
    end

    it "returns the new document" do
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question.key?("id")).to eq(true)
      expect(question["title"]).to eq(title)
      expect(question["tag"]).to eq(tag)
    end
  end

  context "when the request has no body" do
    it "returns a 400 Bad Request" do
      expect do
        post "/rating_questions.json", params: {  rating_question: {  }}
      end.to raise_error(ActionController::ParameterMissing)
    end
  end

  context "when the request has a blank title" do
    before do
      post "/rating_questions.json", params: {  rating_question: { title: "" }}
    end

    it "returns a 422 Invalid Resource" do
      expect(response.status).to eq(422)
    end

    it "shows errors that the title cannot be blank" do
      error = JSON.parse(response.body)
      expect(error).to eq({"errors" => {"title" => ["can't be blank"]}})
    end
  end
end
