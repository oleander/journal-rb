class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :project_id
      t.date :started_at
      t.date :ended_at
      t.text :body

      t.timestamps
    end
  end
end
