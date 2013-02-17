class AchievementsSolutions < ActiveRecord::Migration
  def change
    create_table :achievements_solutions, id: false do |t|
      t.references :achievement, null: false
      t.references :solution, null: false
    end
    add_index :achievements_solutions, [:achievement_id, :solution_id], unique: true
  end
end
