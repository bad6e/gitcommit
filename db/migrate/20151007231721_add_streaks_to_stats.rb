class AddStreaksToStats < ActiveRecord::Migration
  def change
    add_column :stats, :streaks, :integer
  end
end
