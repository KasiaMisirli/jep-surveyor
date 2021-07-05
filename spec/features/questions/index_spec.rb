require 'rails_helper'

RSpec.feature 'Viewing questions' do
  context "when a question exists" do
    let!(:question) { RatingQuestion.create!(title: "Hello World") }

    scenario "the question appears on the page" do
      visit "/"
      within("[data-automation-id=questions-list]") do
        expect(page).to have_content("Hello World")
      end
    end
  end
end
