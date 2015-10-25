class Stat < ActiveRecord::Base
  validates :name, presence: true
  validates :commits, :numericality => { :greater_than => 0}, presence: true

  def when_created
    created_at.strftime("%A, %B %d, %Y at %I:%M%p")
  end

  def commit_order
    Stat.order(commits: :desc)
  end

  def streak
    Stat.order(streaks: :desc)
  end

  def current_streak
    Stat.order(current_streaks: :desc)
  end

  def updated_at
    Stat.first.when_created
  end
end
