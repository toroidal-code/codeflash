class AddMissingIndexes < ActiveRecord::Migration
  def change
  	add_column :problems, :user_id, :integer
  	add_column :languages, :solution_id, :integer
  	add_column :achievements, :solution_id, :integer
  	add_index :problems, :user_id
  	add_index :languages, :solution_id
  	add_index :achievements, :solution_id
  end
end
