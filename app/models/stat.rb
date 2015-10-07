class Stat < ActiveRecord::Base
  validates :name, presence: true
  validates :commits, :numericality => { :greater_than => 0}, presence: true
end
