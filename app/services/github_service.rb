require "hurley"
class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def find_user
    parse(connection.get("/users/treyx/events"))
    # GlobalConstants::USERS.map do |u|
    #   parse(connection.get("/users/#{u}/events"))
    # end
  end


  def find_users_commits

    #find_user.select { |u| u[:type] == "PushEvent" }
    # find_user.select { |u| u[:type] == "PushEvent" }
    # take the results from find_user
    # collect OR eliminate responses that are != [:type] == "PushEvent"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end