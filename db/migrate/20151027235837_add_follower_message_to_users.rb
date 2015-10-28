class AddFollowerMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follower_messages, :text
  end
end
