class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
    # connection.query[:access_token] = user.token
  end

  def find_user_repos(user)
    parse(connection.get("users/#{user}/repos"))
  end

  def find_followers(user)
    parse(connection.get("users/#{user}/followers"))
  end

  def find_user_follows(user)
    parse(connection.get("users/#{user}/following"))
  end

  def find_user_organizations(user)
    parse(connection.get("users/#{user}/orgs"))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
