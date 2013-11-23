require 'spec_helper'

feature "A user can vote on an answer" do
  scenario "when a user is signed in" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :user_id => user.id)
    answer = FactoryGirl.create(:answer, :user_id => user.id, :question_id => question.id)
    visit "/"
    click_link 'Sign In'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    visit question_path(question)
    # save_and_open_page
    expect{ click_on("upvote answer") }.to change{ answer.reload.vote_count }.by(1)
  end
end