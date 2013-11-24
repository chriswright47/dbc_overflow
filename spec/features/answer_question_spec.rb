require 'spec_helper'

feature "A user can create an answer to a question" do
	scenario "a particular user" do
		user = FactoryGirl.create(:user)
		question = FactoryGirl.create(:question, :user_id => user.id)
		visit "/"
		click_link 'Sign In'
		fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
		visit question_path(question)
		save_and_open_page
		click_button 'Answer Question'
		fill_in 'answer_body', :with => "I'm learning rails, woo hoo!"
		click_button "Submit Answer"
		expect(page).to have_text("#{question.title}")
		expect(page).to have_text("#{question.body}")
		expect(page).to have_text("I'm learning rails, woo hoo!")
		expect(current_path).to eq question_path(question)
	end
end