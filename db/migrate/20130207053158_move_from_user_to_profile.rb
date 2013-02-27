class MoveFromUserToProfile < ActiveRecord::Migration
  def change

    rename_column :solutions, :user_id, :profile_id
    rename_column :problems, :user_id, :profile_id

  end
end
