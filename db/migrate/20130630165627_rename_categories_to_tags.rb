class RenameCategoriesToTags < ActiveRecord::Migration
  def change
    rename_table :categories, :tags
    change_table :categories_problems do |t|
      t.rename :category_id, :tag_id
    end
    rename_table :categories_problems, :problems_tags
  end
end
