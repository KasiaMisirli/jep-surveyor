require "rails_helper"

RSpec.describe "POST /ratingQuestions" do
  let(:new_title) { "Hello World" }
  let(:new_tag) { "new tag" }

  context "when the request has a body" do
    it "returns the new document" do
      post "/ratingQuestions", { title: new_title, tag: new_tag }.to_json
      question = JSON.parse(last_response.body)
      expect(last_response.status).to eq(201)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question.key?("id")).to eq(true)
      expect(question["title"]).to eq(new_title)
      expect(question["tag"]).to eq(new_tag)
    end
  end

  context "when the request has no body" do
    it "returns a 400 Bad Request" do
      post "/ratingQuestions"
      expect(last_response.status).to eq(400)
    end
  end

  context "when the request has a blank title" do
    it "returns a 422 Invalid Resource" do
      post "/ratingQuestions", { title: "" }.to_json
      expect(last_response.status).to eq(422)
      error = JSON.parse(last_response.body)
      expect(error).to eq({"errors"=>{"title"=>["can't be blank"]}})
    end
  end
end
