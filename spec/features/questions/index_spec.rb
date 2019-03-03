require "rails_helper"
require 'pry'
RSpec.describe "display all questions" do
  it "display all question" do
    RatingQuestion.create!(title: "Is drinking water good?")
    RatingQuestion.create!( title: "Is playing games good?")
    RatingQuestion.create!( title: "Is swimming good?")
    all_questions = RatingQuestion.all.length
    visit "/rating_questions"
    expect(all_questions).to eq(3)
    expect(page).to have_content("Is drinking water good?")
    expect(page).to have_content("Is playing games good?")
    expect(page).to have_content("Is swimming good?")
  end
end
