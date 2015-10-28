class UserPresenter

  attr_reader :user

  def initialize(user)
    @user ||= user
  end

  def repos
    user.repos.gsub("\"","").split(", ")[2..-2]
  end

  def starred_repos
    user.starred_repos
  end

  def commit_mess
    user.commit_messages.gsub("\"","").split(", ")[2..-2]
  end

  def organizations
    user.organizations.gsub("\"","").split(", ")[2..-2]
  end

  def followers
    user.followers.gsub("\"","").split(", ")[2..-2]
  end

  def followees
    user.followees.gsub("\"","").split(", ")[2..-2]
  end

  def year_commits
    user.total_commits
  end

  def current_streaks
    user.current_streak
  end

  def longest_streaks
    user.longest_streak
  end

  def followers_activities
    user.follower_messages.gsub("\"","").gsub("\\","").gsub("{","").gsub("}","").split(", ")
  end
end