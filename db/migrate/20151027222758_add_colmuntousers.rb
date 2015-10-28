class AddColmuntousers < ActiveRecord::Migration
  def change
    add_column :users, :starred_repos, :integer
  end
end
