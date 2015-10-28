class UpdateAllColumnsOnUser < ActiveRecord::Migration
  def change
    change_column :users, :follower_messages, :text, default: "No Commit Messages!"
    change_column :users, :longest_streak, :integer, default: 0
    change_column :users, :current_streak, :integer, default: 0
    change_column :users, :total_commits, :integer, default: 0
    change_column :users, :followees, :text, default: "You are not following anyone!"
    change_column :users, :followers, :text, default: "No one is following you - LOSER!"
    change_column :users, :commit_messages, :text, default: "You have no commit messages!"
    change_column :users, :starred_repos, :integer, default: 0
    change_column :users, :repos, :text, default: "You have no repositories!"
  end
end
