class RemoveProblemSolutionCommentTables < ActiveRecord::Migration
  def up
    drop_table :problem_comments
    drop_table :solution_comments
  end
  def down
    create_table :problem_comments do |t|
      t.references :problem, index: true
      t.references :profile, index: true
      t.text :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0

      t.timestamps
    end

    create_table :solution_comments do |t|
      t.references :solution, index: true
      t.references :profile, index: true
      t.text :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0

      t.timestamps
    end
  end
end
