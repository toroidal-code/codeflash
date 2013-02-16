class CreateProblemComments < ActiveRecord::Migration
  def change
    create_table :problem_comments do |t|
      t.references :problem
      t.references :user
      t.text :body
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps
    end
    add_index :problem_comments, :problem_id
    add_index :problem_comments, :user_id
  end
end
