class AddColumnFollowestoUsers < ActiveRecord::Migration
  def change
    add_column :users, :followers, :text
  end
end
