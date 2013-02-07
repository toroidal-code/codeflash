class RemoveNameAboutMeFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :about_me
  end

  def down
    add_column :users, :about_me, :text
    add_column :users, :name, :string
  end
end
