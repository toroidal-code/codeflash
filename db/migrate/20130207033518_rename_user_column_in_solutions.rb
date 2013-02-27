class RenameUserColumnInSolutions < ActiveRecord::Migration
  def change
    rename_column :solutions, :user_submitted_id, :user_id
  end
end
