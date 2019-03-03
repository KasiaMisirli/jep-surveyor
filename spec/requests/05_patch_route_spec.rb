require "rails_helper"

RSpec.describe "PATCH /ratingQuestions/:id" do
  context "when the question exists" do
    let!(:question) do
      RatingQuestion.create!(title: "Hello World!", tag: "World")
    end
    it "returns a 200 OK" do
      patch "/rating_questions/#{question.id}.json", params: { rating_question: { tag: "Mars" } }
      new_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(new_body.is_a?(Hash)).to eq(true)
      expect(new_body["title"]).to eq("Hello World!")
      expect(new_body["tag"]).to eq("Mars")
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      patch "/rating_questions/i-will-never-exist",  params: { rating_question: { title: "New title", tag: "Mars" } }
      expect(response.status).to eq(404)
    end
  end
end
