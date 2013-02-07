class RenameUserColumnInSolutions < ActiveRecord::Migration
  def change
    rename_column :solutions, :user_submitted_id, :user_id
    rename_index :solutions, "index_solutions_on_user_submitted_id", "index_solutions_on_user_id"
  end
end
