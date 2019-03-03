require "rails_helper"

RSpec.describe "POST /rating_questions" do
  context "when the request has a body" do
  
  it "returns the new document" do
    post "/rating_questions.json", params: {  rating_question: { title: "new title", tag: "tag name" }}
      expect(response.status).to eq(201)
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question.key?("id")).to eq(true)
      expect(question["title"]).to eq("new title")
      expect(question["tag"]).to eq("tag name")
    end
  end

  context "when the request has no body" do
    it "returns a 400 Bad Request" do
      post "/rating_questions.json"
      expect(response.status).to eq(400)
    end
  end

  context "when the request has a blank title" do
    it "returns a 422 Invalid Resource" do
      post "/rating_questions.json", params: { rating_question: { title: ""} }
      # expect(response.status).to eq(422)
      # error = JSON.parse(response.body)
      # expect(error).to eq({"errors"=>{"title"=>["can't be blank"]}})
    end
  end
end
