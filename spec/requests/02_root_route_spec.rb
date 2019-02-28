require "rails_helper"

RSpec.describe "GET /ratingQuestions" do
before do
  post "/rating_questions.json", params: { rating_question: { title: "Hello World"} }
  post "/rating_questions.json", params: { rating_question: { title: "Hello Mars"} }
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
