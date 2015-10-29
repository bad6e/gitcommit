require "rails_helper"

RSpec.feature "Vistor Can Login" do

  before do
    test_setup
    GithubPresenter.stub_chain(:new,:repos,:starred_repos).and_return("anything")
    GithubPresenter.stub_chain(:new,:starred_repos).and_return("anything")
    GithubPresenter.stub_chain(:new,:organizations).and_return("anything")
    GithubPresenter.stub_chain(:new,:commit).and_return("anything")
    GithubPresenter.stub_chain(:new,:followers).and_return("anything")
    GithubPresenter.stub_chain(:new,:followees).and_return("anything")
    GithubPresenter.stub_chain(:new,:year_commits).and_return("anything")
    GithubPresenter.stub_chain(:new,:current_streaks).and_return("anything")
    GithubPresenter.stub_chain(:new,:longest_streaks).and_return("anything")
    GithubPresenter.stub_chain(:new,:followers_activities).and_return("anything")
  end

  scenario "visitor can log in with oauth" do
    visit root_path
    click_link 'Login with Github'
    expect(page).to have_content("bad6e")
    expect(page).to have_content("bret@iscool.com")
  end

  scenario "vistor can see module github stats", js: true do
    visit root_path
    click_button "See Statistics"
    expect(page).to have_content("Leaderboard")
    expect(page).to have_content("Current Streak")
    expect(page).to have_content("Longest Streak")
    expect(page).to have_content("Bret Doucette")
  end
end

