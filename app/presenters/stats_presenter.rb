 class StatsPresenter
  def ordered_commits
    Stat.commit_order
  end

  def current_streak
    Stat.current_streak
  end

  def longest_streak
    Stat.streak
  end

  def list_names
    Stat.name_list
  end

  def commit_messages(user)
    if user.commit_messages == "[\"User has no commits\"]"
      ["You have no commit messages"]
    else
      user.commit_messages.gsub("\"","").split(", ").map do |r|
        r.gsub("[","").gsub("]","")
      end
    end
  end
end