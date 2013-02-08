class RemoveSolutionFromAchievements < ActiveRecord::Migration
  def up
    remove_index :achievements, :solution_id
    remove_column :achievements, :solution_id
  end

  def down
    add_column :achievements, :solution_id, :integer
    add_index :achievements, :solution
  end
end
