require 'spec_helper'

feature "A user can delete an answer" do 
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
		expect(page).to have_text(answer.body)
		click_button 'Delete Answer'
		expect(page).to_not have_text(answer.body)
		expect(page).to have_text(question.title)
		expect(page).to have_text(question.body)
		expect(current_path).to eq question_path(question)
	end
end