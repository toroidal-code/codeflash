class CreateProfilesComments < ActiveRecord::Migration
  def change
    create_table :comments_profiles, id: false do |t|
      t.references :profile, null: false
      t.references :comment, null: false
    end

    add_index :comments_profiles , [:profile_id, :comment_id], unique: true
  end
end
