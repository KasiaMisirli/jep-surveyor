require "rails_helper"
require 'pry'
RSpec.describe "GET /ratingQuestions/:id" do
  context "when the question exists" do
    let!(:question) do
      RatingQuestion.create!(title: "Hello World!")
    end

    it "returns a 200 OK" do
      get "/rating_questions/#{question.id}.json"
      expect(response.status).to eq(200)
      
      new_body = JSON.parse(response.body)
      expect(new_body.is_a?(Hash)).to eq(true)
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      get "/rating_questions/i-will-never-exist"
      expect(response.status).to eq(404)
    end
  end
end
