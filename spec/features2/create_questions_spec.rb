require 'spec_helper'

feature "Question creates question" do
  scenario "creating a question on home page" do
    visit "/questions"
    click_link "Create a New Question"
    fill_in "Title", :with => "Question Title"
    fill_in "Body", :with => "Question Body"
    click_button "Create Question"
  end
end