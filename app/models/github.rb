class Github < OpenStruct
  attr_reader :service

  def self.service
    @service ||= GithubService.new
  end

  def self.repos(user)
    repos = service.find_user_repos(user).map {|event| Github.new(event)}
    repo_name = repos.map do |repo|
      repo.name
    end
    repo_name
  end
end