class GithubService
  attr_reader :connection

  def initialize(user)
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def find_user_repos(user)
    parse(connection.get("users/#{user.nickname}/repos"))
  end

  def find_followers(user)
    parse(connection.get("users/#{user.nickname}/followers"))
  end

  def find_user_follows(user)
    parse(connection.get("users/#{user.nickname}/following"))
  end

  def find_user_organizations(user)
    parse(connection.get("users/#{user.nickname}/orgs"))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
