class GithubPresenter

  attr_reader :user, :service

  def initialize(user)
    @service ||= GithubService.new(user)
    @user    ||= user
  end

  def repos
    repos = service.find_user_repos(user).map {|data| build_object(data)}
    repo_names = repos.map {|repo| repo.name }
  end

  #This who is following the user
  def followers
    list = service.find_followers(user).map {|data| build_object(data)}
    followers = list.map {|follower| follower.login}
  end

  #This is who the user follows
  def followees
    list = service.find_user_follows(user).map {|data| build_object(data)}
    followees = list.map {|followee| followee.login}
  end

  def organizations
    list = service.find_user_organizations(user).map {|data| build_object(data)}
    organizations = list.map {|organization| organization.login }
  end

  def year_commits
    list = service.find_user_total_commits(user)
  end

  def current_streaks
    list = service.find_user_current_streak(user)
  end

  def longest_streaks
    list = service.find_user_longest_streak(user)
  end

  def starred_repos
    list = service.total_starred_repos(user).map {|data| build_object(data)}
    list.count
  end

  def commit_messages
    list = service.commit_message(user)
  end

  def followers_activities
    service.followers_activity(user)
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end
