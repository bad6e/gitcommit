class AddCurrentStreaksToStat < ActiveRecord::Migration
  def change
    add_column :stats, :current_streaks, :integer
  end
end
