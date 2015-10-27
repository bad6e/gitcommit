class GithubService
  attr_reader :connection

  def initialize(user)
    @connection = Hurley::Client.new("https://api.github.com")
    @connection.query[:access_token] = user.token
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

  def find_user_total_commits(user)
    parse(connection.get("repos/#{user.nickname}/gitcommit/stats/commit_activity"))
  end

  def total_starred_repos(user)
    parse(connection.get("users/#{user.nickname}/starred"))
  end

  def commit_message(user)
    list      = parse(connection.get("/users/#{user.nickname}/events"))
    events    = list.select { |item| item[:type] == "PushEvent" }
    commits   = events.map{ |event| event[:payload][:commits] }.flatten!
    messages  = commits.collect{ |commit|  commit[:message] }
    messages[0..9]
  end

  def followers_commit_message(name)
    list      = parse(connection.get("/users/#{name}/events"))
    events    = list.select { |item| item[:type] == "PushEvent" }
    commits   = events.map{ |event| event[:payload][:commits] }.flatten!
    messages  = commits.collect{ |commit|  commit[:message] }
  end

  def followers_activity(user)
    list = find_followers(user)
    names = list.collect {|item| item[:login] }
    messages = names.map do |name|
      followers_commit_message(name)
    end
    limited_messages = messages.map do |m|
      m[0..2]
    end
    final = names.zip(limited_messages)
    final
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
