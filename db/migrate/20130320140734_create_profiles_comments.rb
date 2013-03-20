class CreateProfilesComments < ActiveRecord::Migration
  def change
    create_table :profiles_comments, id: false do |t|
      t.references :profile, null: false
      t.references :comment, null: false
    end

    add_index :profiles_comments , [:profile_id, :comment_id], unique: true
  end
end
