require 'spec_helper'

feature "Tags" do
	scenario "can be viewed" do
		visit '/'
		click_link "tags"
		expect(page).to have_text("Ruby")
	end

	scenario "can be used to filter questions" do
		FactoryGirl.create(:question)
		visit '/'
		click_link "tags"
		within('.span3') do
			click_link "Ruby"
		end
		expect(page).to have_text("Question Title")
	end
end
