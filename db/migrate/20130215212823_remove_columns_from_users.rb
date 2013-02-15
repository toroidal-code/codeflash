class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :provider
    remove_column :users, :uid
  end

  def down
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
