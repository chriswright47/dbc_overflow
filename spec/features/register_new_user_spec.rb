require 'spec_helper'

feature "User registration" do
  let(:user) { User.create(username: "username", email: "email@email.com", password: "password")}

  scenario "user enters all fields, email is unique" do
    visit "/users/new"
    fill_in "Username", :with => "username"
    fill_in "Email", :with => "unique@unique.com"
    fill_in "Password", :with => "password"
    click_button "Create User"
  end

  scenario "user enters all fields except password" do
    visit "/users/new"
    fill_in "Username", :with => "username"
    fill_in "Email", :with => "email@email.com"
    click_button "Create User"

    within(".errors_explanation") do
      expect(page).to have_text("Password digest can't be blank")
    end
  end

end
