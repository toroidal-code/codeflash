class AddNameAndAboutMeToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :about_me, :text
  end
end
