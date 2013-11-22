require 'spec_helper'

feature "A user can edit an answer" do 
	scenario "when a user is the author of an answer" do 
		user = FactoryGirl.create(:user)
		question = FactoryGirl.create(:question, :user_id => user.id)
		answer = FactoryGirl.create(:answer, :user_id => user.id, :question_id => question.id)
		visit '/'
		click_link 'Sign In'
		fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
		visit question_path(question)
		click_link 'Edit Answer'
		expect(page).to have_text(answer.body)
		fill_in "answer_body", :with => "Here is the new answer to your question"
		click_button "Update Answer"
		expect(current_path).to eq question_path(question)
		expect(page).to have_text("Here is the new answer to your question")
	end
end