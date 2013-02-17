class CreateProblemComments < ActiveRecord::Migration
  def change
    create_table :problem_comments do |t|
      t.references :problem
      t.references :profile
      t.text :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0

      t.timestamps
    end
    add_index :problem_comments, :problem_id
    add_index :problem_comments, :profile_id
  end
end
