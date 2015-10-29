require 'rails_helper'

RSpec.describe "Github API", type: :request do

  it "returns all repos by a user" do
    VCR.use_cassette("user repos") do
      service = GithubService.new(user).find_user_repos(user)
      expect(service[0][:name]).to eq "test_2"
    end
  end

  it "returns everyone following a user" do
    VCR.use_cassette("user followers") do
      service = GithubService.new(user).find_followers(user)
      expect(service.first[:login]).to eq "bad6e"
    end
  end

  it "returns everyone following a user" do
    VCR.use_cassette("user followers") do
      service = GithubService.new(user).find_followers(user)
      expect(service.first[:login]).to eq "bad6e"
    end
  end

  it "returns everyone the user is following" do
    VCR.use_cassette("who the user follows") do
      service = GithubService.new(user).find_user_follows(user)
      expect(service.first[:login]).to eq "jphoenix86"
    end
  end

  it "returns user's organizations" do
    VCR.use_cassette("user organization") do
      service = GithubService.new(user).find_user_organizations(user)
      expect(service).to eq []
    end
  end

  it "returns user's total commits" do
    service = GithubService.new(user).find_user_total_commits(user)
    expect(service).to eq 1
  end

  it "returns user's current streak" do
    service = GithubService.new(user).find_user_current_streak(user)
    expect(service).to eq 1
  end

  it "returns user's longest streak" do
    service = GithubService.new(user).find_user_longest_streak(user)
    expect(service).to eq 1
  end

  it "returns user's starred repos count" do
    VCR.use_cassette("user starred repos") do
      service = GithubService.new(user).total_starred_repos(user)
      expect(service.count).to eq 2
    end
  end

  it "returns user's commit messages" do
    VCR.use_cassette("user commit messages") do
      service = GithubService.new(user).commit_message(user)
      expect(service.first).to eq "Added Hello World"
    end
  end

  it "returns user's follower's commit messages" do
    VCR.use_cassette("user follower's commit messages") do
      service = GithubService.new(user).followers_activity(user)
      expect(service).to eq "jphoenix86"=>"Adds coveralls and simplecov for test coverage."
    end
  end

  context "#commit_message" do
    before do
        GithubStats.stub(:new).and_return(true)
         @fake_user ||= User.new(provider: 'github',
                       uid: '0000',
                       email: nil,
                       nickname: 'TEST',
                       image_url: "https://bret@iscool.com",
                       token: '1234ABcd')

         @fake_user ||= User.new(provider: 'github1',
                       uid: '0001',
                       email: nil,
                       nickname: 'TEST1',
                       image_url: "https://bret@iscool1.com",
                       token: '1234ABcd1')

      end

    context "user has no events" do
      it "returns an array with no events message" do
        expect_any_instance_of(GithubService).to receive(:parse).and_return("[]")
        expect(GithubService.new(@fake_user).commit_message(@fake_user)).to eq ["User has no events"]
      end
    end

    context "user has events" do
      it "calls find_events_from_list" do
        expect_any_instance_of(GithubService).to receive(:parse).and_return("[I have events!]")
        expect_any_instance_of(GithubService).to receive(:find_events_from_list).with("[I have events!]", @fake_user)
        GithubService.new(@fake_user).commit_message(@fake_user)
      end
    end
  end
end

