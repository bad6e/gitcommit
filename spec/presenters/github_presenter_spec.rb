require 'rails_helper'

RSpec.describe "Github API", type: :request do

  it "returns all repos by a user" do
    VCR.use_cassette("user repos") do
      service = GithubPresenter.new(user).repos
      expect(service.first).to eq "test_2"
    end
  end

  it "returns everyone following a user" do
    VCR.use_cassette("user followers") do
      service = GithubPresenter.new(user).followers
      expect(service.first).to eq "bad6e"
    end
  end

  it "returns everyone following a user" do
    VCR.use_cassette("who the user follows") do
      service = GithubPresenter.new(user).followees
      expect(service.first).to eq "jphoenix86"
    end
  end

  it "returns user's organizations" do
    VCR.use_cassette("user organization") do
      service = GithubPresenter.new(user).organizations
      expect(service).to eq []
    end
  end

  it "returns user's total commits" do
    service = GithubPresenter.new(user).year_commits
    expect(service).to eq 2
  end

  it "returns user's current streak" do
    service = GithubPresenter.new(user).current_streaks
    expect(service).to eq 1
  end

  it "returns user's longest streak" do
    service = GithubPresenter.new(user).longest_streaks
    expect(service).to eq 1
  end

  it "returns user's starred repos count" do
    VCR.use_cassette("user starred repos") do
      service = GithubPresenter.new(user).starred_repos
      expect(service).to eq 2
    end
  end

  it "returns user's commit messages" do
    VCR.use_cassette("user commit messages") do
      service = GithubPresenter.new(user).commit
      expect(service.first).to eq "Added Hello World"
    end
  end

  it "returns user's follower's commit messages" do
    VCR.use_cassette("user follower's commit messages") do
      service = GithubPresenter.new(user).followers_activities
      expect(service).to eq "jphoenix86"=>"Adds coveralls and simplecov for test coverage."
    end
  end
end
