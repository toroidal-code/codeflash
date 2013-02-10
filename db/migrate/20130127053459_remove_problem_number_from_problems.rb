class RemoveProblemNumberFromProblems < ActiveRecord::Migration
  def up
    remove_column :problems, :problem_number
  end

  def down
    add_column :problems, :problem_number, :integer
  end
end
