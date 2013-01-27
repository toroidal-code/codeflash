class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :solution
      t.string :name
      t.text :description
      t.integer :point_value

      t.timestamps
    end
    add_index :achievements, :solution_id
  end
end
