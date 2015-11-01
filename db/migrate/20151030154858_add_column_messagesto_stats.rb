class AddColumnMessagestoStats < ActiveRecord::Migration
  def change
    add_column :stats, :commit_messages, :text
  end
end
