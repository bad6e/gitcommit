class Addcolummntouser < ActiveRecord::Migration
  def change
    add_column :users, :commit_messages, :text
  end
end
