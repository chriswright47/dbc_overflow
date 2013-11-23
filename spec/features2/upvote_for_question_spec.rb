require 'spec_helper'

feature "A user can vote on a question" do
  scenario "when a user is signed in" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit "/"
    click_link 'Sign In'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    visit question_path(question)
    expect{click_button 'upvote'}.to change{question.reload.vote_count}.by(1)
    #click('Button Value')
    expect(page).to have_text('You have just upvoted this question.')
    expect(page).to have_text(question.title)
    expect(page).to have_text(question.body)
    expect(current_path).to eq(question_path(question))
  end
end