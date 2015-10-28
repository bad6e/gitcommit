class UserPresenter

  attr_reader :user

  def initialize(user)
    @user ||= user
  end

  def repos
    if user.repos == "[]"
      ["You have no repositories!"]
    else
      user.repos.gsub("\"","").split(", ")[2..-2]
    end
  end

  def starred_repos
    if user.starred_repos == "[]"
      ["You have no starred repositories!"]
    else
      user.starred_repos
    end
  end

  def commit_mess
    if user.commit_messages == "[\"User has no commits\"]"
      ["You have no commit messages"]
    else
      user.commit_messages.gsub("\"","").split(", ")[2..-2]
    end
  end

  def organizations
    if user.organizations == "[]"
      ["You have no organizations!"]
    else
      user.organizations.gsub("\"","").split(", ")[2..-2]
    end
  end

  def followers
    if user.followers == "[]"
      ["You have no followers LOSER!"]
    else
      user.followers.gsub("\"","").split(", ")[2..-2]
    end
  end

  def followees
    if user.followees == "[]"
      ["You are not following anyone!"]
    else
      user.followees.gsub("\"","").split(", ")[2..-2]
    end
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
    if user.follower_messages == "{}"
      ["None of your friends are coding"]
    else
      user.follower_messages.gsub("\"","").gsub("\\","").gsub("{","").gsub("}","").split(", ")
    end
  end
end