require 'spec_helper'

feature "Tags" do
	FactoryGirl.create(:ruby_tag)

	scenario "can be viewed" do
		visit '/'
		click_link "Tags"
		expect(page).to have_text("Ruby")
	end

	scenario "can be used to filter questions" do
		FactoryGirl.create(:question)
		visit '/'
		click_link "Tags"
		click_link "Ruby"
		expect(page).to have_text("Question Title")
	end
end
