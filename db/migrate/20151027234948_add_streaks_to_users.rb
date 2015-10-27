class AddStreaksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_commits, :integer
    add_column :users, :current_streak, :integer
    add_column :users, :longest_streak, :integer
  end
end
