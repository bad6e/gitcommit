class AddFolloweesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :followees, :text
  end
end
