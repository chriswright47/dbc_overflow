require 'spec_helper'

feature "A user can create a question" do
  scenario "a particular user" do
    visit 'users'
    click_link 'Sign Up'
    fill_in "username", :with => "Chris"
    fill_in "email", :with => "chris@mail.com"
    fill_in "phase", :with => 3
    fill_in "password", :with => "password"
    click_button "Create User"
    click_link 'Create a New Question'
    fill_in "title", :with => "Why can't Alex code"
    fill_in "body", :with => "Because he just can't."
    click_button "Create Question"
    # question = Question.create(title: 'Title', body: 'body', user_id: user.id)
    # thing = mock(question, :title => 'Title')
    # visit "/questions"
    # # save_and_open_page
    # click_link "#{thing.title}"
    expect(page).to have_text("Why can't Alex code")
    expect(page).to have_text("Because he just can't.")
    expect(page).to have_text("Chris")
  end


end