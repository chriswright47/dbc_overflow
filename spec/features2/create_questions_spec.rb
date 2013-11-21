require 'spec_helper'
require 'factories'

feature "A user can create a question" do
  scenario "a particular user" do
    user = FactoryGirl.create(:user)
    visit "/questions"
    click_link "Create a New Question"
    fill_in "question_title", :with => "Why can't Alex code"
    fill_in "question_body", :with => "Because he just can't."
    click_button "Create Question"
    # save_and_open_page
    expect(page).to have_text("Why can't Alex code")
    expect(page).to have_text("Because he just can't.")
    expect(page).to have_text("Chris")

  end
end