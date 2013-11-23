require 'spec_helper'

feature "A user can create a question" do
  scenario "a particular user" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    # save_and_open_page
    click_link "Create Question"
    fill_in "question_title", :with => "Why can't Alex code"
    fill_in "question_body", :with => "Because he just can't."
    click_button "Create Question"
    # save_and_open_page
    expect(page).to have_text("Why can't Alex code")
    expect(page).to have_text("Because he just can't.")
    expect(page).to have_text("Chris")
  end

  scenario "and select one tag" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    visit '/'
    click_link 'Sign In'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    click_link "Create Question"
    fill_in "question_title", :with => "Why can't Alex code"
    fill_in "question_body", :with => "Because he just can't."
    page.check("Ruby")
    click_button "Create Question"
    expect(page).to have_text("Why can't Alex code")
    expect(page).to have_text("Because he just can't.")
    expect(page).to have_text("Chris")
    expect(page).to have_text("Ruby")
  end
end