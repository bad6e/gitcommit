class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organizations, :text
  end
end
