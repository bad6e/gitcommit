class Github < OpenStruct
  def self.service
    @service ||= GithubService.new
  end

  def self.repos(user)
    repos = service.find_user_repos(user).map {|event| Github.new(event)}
    repo_name = repos.map {|repo| repo.name }
    repo_name
  end

  def self.followers(user)
    list = service.find_followers(user).map {|event| Github.new(event)}
    followers = list.map {|follower| follower.login}
    followers
  end

  def self.followees(user)
    list = service.find_user_follows(user).map {|event| Github.new(event)}
    followees = list.map {|followee| followee.login}
    followees
  end
end