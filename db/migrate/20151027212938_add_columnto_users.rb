class AddColumntoUsers < ActiveRecord::Migration
  def change
    add_column :users, :repos, :string
  end
end
