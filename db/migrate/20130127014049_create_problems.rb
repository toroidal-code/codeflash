class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :problem_number
      t.string :problem_name
      t.text :description
      t.integer :point_value

      t.timestamps
    end
  end
end
