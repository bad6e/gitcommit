class Stat < ActiveRecord::Base
  validates :name, presence: true
  validates :commits, :numericality => { :greater_than => 0}, presence: true

  def when_created
    created_at.strftime("%A, %B %d, %Y at %I:%M%p")
  end
end
