class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :code
      t.references :user_submitted
      t.integer :up_votes
      t.integer :down_votes
      t.references :problem

      t.timestamps
    end
    add_index :solutions, :user_submitted_id
    add_index :solutions, :problem_id
  end
end
