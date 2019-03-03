require "rails_helper"

RSpec.describe "PUT /ratingQuestions/:id" do
  context "when the question exists" do
    let!(:question) do
      RatingQuestion.create!(title: "Hello World!")
    end
    it "returns a 200 OK" do
      put "/rating_questions/#{question.id}.json", params: { rating_question: { title: "Hello Mars" } }
      expect(response.status).to eq(200)
      new_body = JSON.parse(response.body)
      expect(new_body.is_a?(Hash)).to eq(true)
      expect(new_body["title"]).to eq("Hello Mars")
      expect(new_body.key?("tag")).to be true
    end
  end

  context "asking to PUT a question that doesn't exist" do
    it "returns a 404 Not Found" do
      put "/rating_questions/i-will-never-exist", params: { rating_question: { title: "Hello Mars" } }
      expect(response.status).to eq(404)
    end
  end
end
