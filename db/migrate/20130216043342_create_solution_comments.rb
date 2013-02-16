class CreateSolutionComments < ActiveRecord::Migration
  def change
    create_table :solution_comments do |t|
      t.references :solution
      t.references :user
      t.text :body
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps
    end
    add_index :solution_comments, :solution_id
    add_index :solution_comments, :user_id
  end
end
