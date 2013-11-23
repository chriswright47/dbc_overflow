require 'spec_helper'

feature "A user can votedown on a question" do
  scenario "when a user is signed in" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit "/"
    click_link 'Sign In'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    visit question_path(question)
    # click_on("downvote")

    expect{click_on("downvote")}.to change{ question.reload.vote_count }.by(-1)

  end
end