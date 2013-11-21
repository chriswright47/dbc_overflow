require 'spec_helper'

feature 'A question title can be clicked on and directed to question' do
  scenario 'from question index' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:question, :title => 'Spec Test', :body => 'Spec Body', user_id: user.id)
    visit "/questions"
    click_link "Spec Test"
    expect(page).to have_text("Spec Body")
  end
end