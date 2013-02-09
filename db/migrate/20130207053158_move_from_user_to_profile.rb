class MoveFromUserToProfile < ActiveRecord::Migration
  def change

    rename_column :solutions, :user_id, :profile_id
    rename_column :problems, :user_id, :profile_id

    rename_index :solutions, "index_solutions_on_user_id", "index_solutions_on_profile_id"
    rename_index :problems, "index_problems_on_user_id", "index_problems_on_profile_id"
  end
end
