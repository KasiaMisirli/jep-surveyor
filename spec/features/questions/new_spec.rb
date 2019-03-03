require "rails_helper"
require 'pry'
RSpec.describe "display all questions" do
  it "displays form" do
    visit "/rating_questions/new"
    expect(page).to have_selector("label[for='rating_question_title']")
    expect(page).to have_selector("input[name='rating_question[title]']")
    expect(page).to have_selector("input[value='Create Rating question']")
    expect(page).to have_selector("a[href='/rating_questions']")
  end
end