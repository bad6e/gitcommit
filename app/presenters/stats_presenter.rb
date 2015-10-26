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
end