class CategoriesProblems < ActiveRecord::Migration
  def change
    create_table :categories_problems, id: false do |t|
      t.references :category, null: false
      t.references :problem, null: false
    end
    add_index :categories_problems, [:category_id, :problem_id], unique: true
  end
end
