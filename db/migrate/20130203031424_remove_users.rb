class RemoveUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
  	 create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.string :email
      t.integer :points
      t.name :string
      t.about_me :text

      t.timestamps
    end
  end
end
