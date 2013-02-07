class SolutionLanguageSwap < ActiveRecord::Migration
  def up
    remove_index :languages, :solution_id
    remove_column :languages, :solution_id
    add_index :solutions, :language_id
  end

  def down
    add_column :languages, :solution_id, :integer
    add_index :languages, :solution_id
    remove_index :solutions, :language_id
  end
end
