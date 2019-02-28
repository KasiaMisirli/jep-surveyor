require "rails_helper"

RSpec.describe "DELETE /ratingQuestions/:id" do
  context "with an existing question" do
    let!(:question) do
      RatingQuestion.create!(title: "Hello World!", tag: "World")
    end
    it "actually deletes the question" do
      delete "/rating_questions/#{question.id}"
      get "/rating_questions/#{question.id}"
      expect(response.status).to eq(404)
    end
  end
end
