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
    if user.organizations
      user.organizations.gsub("\"","").split(", ")[2..-2]
    end
  end

  def followers
    if user.followers
      user.followers.gsub("\"","").split(", ")[2..-2]
    end
  end

  def followees
    user.followees.gsub("\"","").split(", ")[2..-2]
  end
end