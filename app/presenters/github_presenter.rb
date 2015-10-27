class GithubPresenter

  attr_reader :user, :service

  def initialize(user)
    @service ||= GithubService.new(user)
    @user    ||= user
  end

  def repos
    repos = service.find_user_repos(user).map {|data| build_object(data)}
    repo_name = repos.map {|repo| repo.name }
    repo_name
  end

  def followers
    list = service.find_followers(user).map {|data| build_object(data)}
    followers = list.map {|follower| follower.login}
    followers
  end

  def followees
    list = service.find_user_follows(user).map {|data| build_object(data)}
    followees = list.map {|followee| followee.login}
    followees
  end

  def organizations
    list = service.find_user_organizations(user).map {|data| build_object(data)}
    organizations = list.map {|organization| organization.login }
    organizations
  end

  def year_commits
    list = service.find_user_total_commits(user).map {|data| build_object(data)}
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
