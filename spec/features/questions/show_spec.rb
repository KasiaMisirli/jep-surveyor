require "rails_helper"
require 'pry'
RSpec.describe "display all questions" do
  it "has all expected elements" do
    a = RatingQuestion.create!(title: "something")
    visit "/rating_questions/#{a.id}"
    expect(page).to have_selector("a[href='/rating_questions']")
    expect(page).to have_selector("h1[value='Single Question:']")
  end
end
