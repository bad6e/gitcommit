class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def find_user_repos(user)
    parse(connection.get("users/#{user}/repos"))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
