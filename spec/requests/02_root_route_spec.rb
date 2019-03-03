require "rails_helper"

RSpec.describe "GET /ratingQuestions" do
let!(:question) do
  RatingQuestion.create!(title: "Hello World")
  RatingQuestion.create!(title: "Hello Mars")
end

  context "its getting all the results" do
    it "returns a 200 OK" do
      get "/rating_questions.json" 
      body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(body.is_a?(Array)).to eq(true)
    end
  end
end
