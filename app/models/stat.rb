class Stat < ActiveRecord::Base
  validates :name, presence: true
  validates :commits, :numericality => { :greater_than => 0}, presence: true

  def when_created
    created_at.strftime("%A, %B %d, %Y at %I:%M%p")
  end

  def self.commit_order
    order(commits: :desc)
  end

  def self.current_streak
    order(current_streaks: :desc)
  end

  def self.streak
    order(streaks: :desc)
  end

  def self.updated_at
    first.when_created
  end
end
