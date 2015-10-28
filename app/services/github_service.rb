class GithubService
  attr_reader :connection

  def initialize(user)
    @connection                      = Hurley::Client.new("https://api.github.com")
    @connection.query[:access_token] = user.token
    @stats                           = GithubStats.new(user.nickname)
    @user                            = user
  end

  def find_user_repos(user)
    parse(connection.get("users/#{user.nickname}/repos"))
  end

  #This who is following the user
  def find_followers(user)
    parse(connection.get("users/#{user.nickname}/followers"))
  end

  #This is who the user follows
  def find_user_follows(user)
    parse(connection.get("users/#{user.nickname}/following"))
  end

  def find_user_organizations(user)
    parse(connection.get("users/#{user.nickname}/orgs"))
  end

  def find_user_total_commits(user)
    @stats.data.scores.reduce(:+)
  end

  def find_user_current_streak(user)
    @stats.streak.count
  end

  def find_user_longest_streak(user)
    @stats.longest_streak.count
  end

  def total_starred_repos(user)
    parse(connection.get("users/#{user.nickname}/starred"))
  end

  def commit_message(user)
    list = parse(connection.get("/users/#{user.nickname}/events"))
    if list == "[]"
      ["User has no events"]
    else
      find_events_from_list(list, user)
    end
  end

  def followers_commit_message(name)
    list = parse(connection.get("/users/#{name}/events"))
    if list == []
      ["User has no events"]
    else
      find_events_from_list(list, name)
    end
  end

  def find_events_from_list(list, user_id)
    events = list.select { |item| item[:type] == "PushEvent" }
    if events == []
      ["User has no Push Events"]
    else
      find_commits_from_events(events, user_id)
    end
  end

  def find_commits_from_events(events, user_id)
    commits = events.map{ |event| event[:payload][:commits] }.flatten!
    if commits.nil?
      ["User has no commits"]
    else
      user_redirect(commits, user_id)
    end
  end

  def user_redirect(commits, user_id)
    if @user == user_id
        find_messages_from_commits_user(commits)
    else
        find_messages_from_commits(commits)
    end
  end

  def find_messages_from_commits_user(commits)
    messages  = commits.collect{ |commit| commit[:message] }
    if messages == "[]"
      ["User has no commit messages"]
    else
      messages[0..9]
    end
  end

  def find_messages_from_commits(commits)
    messages  = commits.collect{ |commit| commit[:message] }
    if messages == "[]"
      ["User has no commit messages"]
    else
      messages[0]
    end
  end

  def followers_activity(user)
    names = find_user_follows(user).collect {|item| item[:login] }
    messages = names.map do |name|
      followers_commit_message(name)
    end
    follower_messages = names.zip(messages)
    results           = Hash[follower_messages.map {|key, value| [key, value]}]
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
