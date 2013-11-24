require 'spec_helper'

feature "A user should be able to delete their account" do
	scenario "when signed in" do
		user = FactoryGirl.create(:user)
		visit "/"
		click_link 'Sign In'
		fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button 'Sign In'
    click_link 'users'
    expect(page).to have_text("#{user.username}")
    click_link "My Profile"
    click_button "Delete Account"
    expect(page).to_not have_text("My Profile")
    expect(page).to_not have_text("Sign Out")
    expect(page).to have_text("Sign Up")
    expect(page).to have_text("Sign In")
    click_link 'users'
    expect(page).to_not have_text("#{user.username}")
	end
end
