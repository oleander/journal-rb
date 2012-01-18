class ChangeDateToDatetime < ActiveRecord::Migration
  def up
    change_column :posts, :started_at, :datetime
    change_column :posts, :ended_at, :datetime
  end

  def down
  end
end
