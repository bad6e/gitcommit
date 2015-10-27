require "rails_helper"

feature "visitor can log in" do

  scenario "visitor can log in with oauth" do
    visit root_path
    click_link 'Login with Github'
    expect(page).to have_content("bad6e")
    expect(page).to have_content("bret@iscool.com")
  end
end