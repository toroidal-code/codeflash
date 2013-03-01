class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.references :profile, index: true
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
