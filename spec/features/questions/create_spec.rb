require "rails_helper"

RSpec.describe "Creating questions" do
  let!(:question) { RatingQuestion.create!(title: "is rails great?") }
  it "creates a new question" do
    visit "/"
    fill_in "Title", with: "Is Capybara Cool?"
    click_button "Submit"
    # binding.pry
    within("[data-automation-id=questions-list]") do
      expect(page).to have_content("Is Capybara Cool?")
    end
  end
  # expect(RatingQuestion.count).to eq(1)

  # it "cannot create a new question without a title"
end
