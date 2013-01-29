class RemoveSolutionIdFromAchievements < ActiveRecord::Migration
  def up
  	remove_index :achievements, :solution_id
  end

  def down
  	add_index :achievements, :solution_id
  end
end
