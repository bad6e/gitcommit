require 'rails_helper'


RSpec.describe "User Dashboars", type: :request do
   user = User.new(nickname: "bad6e",
                   email: "bret@iscool.com",
                   provider: "github",
                   token: "ABC123",
                   uid: "123",
                   image_url: "test",
                   repos: "Another_repo",
                   starred_repos: 2,
                   commit_messages: "Added test",
                   organizations: "Turing",
                   followers: "bad6e",
                   followees: "justin",
                   total_commits: 100,
                   current_streak: 2,
                   longest_streak: 20,
                   follower_messages: "bad6e=>Added RSpec")

  it "returns all repos by a user" do
    service = UserPresenter.new(user).repos
    expect(service.first).to eq "Another_repo"
  end

  it "returns no repos" do
    user.repos = "[]"
    service = UserPresenter.new(user).repos
    expect(service.first).to eq "You have no repositories!"
  end

  it "returns user's starred repos count" do
    service = UserPresenter.new(user).starred_repos
    expect(service).to eq 2
  end

  it "returns user's commit messages" do
    service = UserPresenter.new(user).commit_mess
    expect(service.first).to eq "Added test"
  end

  it "returns user's commit messages" do
    user.commit_messages = "[\"User has no commits\"]"
    service = UserPresenter.new(user).commit_mess
    expect(service.first).to eq "You have no commit messages"
  end

  it "returns user's organizations" do
    service = UserPresenter.new(user).organizations
    expect(service).to eq ["Turing"]
  end

  it "returns user's organizations" do
    user.organizations = "[]"
    service = UserPresenter.new(user).organizations
    expect(service).to eq ["You have no organizations!"]
  end

  it "returns everyone following a user" do
    service = UserPresenter.new(user).followers
    expect(service.first).to eq "bad6e"
  end

  it "returns everyone following a user" do
    user.followers = "[]"
    service = UserPresenter.new(user).followers
    expect(service.first).to eq "You have no followers LOSER!"
  end

  it "returns everyone following a user" do
    service = UserPresenter.new(user).followees
    expect(service.first).to eq "justin"
  end

  it "returns everyone following a user" do
    user.followees = "[]"
    service = UserPresenter.new(user).followees
    expect(service.first).to eq "You are not following anyone!"
  end

  it "returns user's total commits" do
    service = UserPresenter.new(user).year_commits
    expect(service).to eq 100
  end

  it "returns user's current streak" do
    service = UserPresenter.new(user).current_streaks
    expect(service).to eq 2
  end

  it "returns user's longest streak" do
    service = UserPresenter.new(user).longest_streaks
    expect(service).to eq 20
  end

  it "returns user's follower's commit messages" do
    service = UserPresenter.new(user).followers_activities
    expect(service).to eq ["bad6e=>Added RSpec"]
  end

  it "returns user's follower's commit messages" do
    user.follower_messages = "{}"
    service = UserPresenter.new(user).followers_activities
    expect(service).to eq ["None of your friends are coding"]
  end
end
