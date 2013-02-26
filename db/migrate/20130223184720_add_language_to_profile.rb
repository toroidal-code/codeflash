class AddLanguageToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :language_id, :integer
    add_index :profiles, :language_id
    remove_column :profiles, :favorite_language
  end

  def down
    remove_index :profiles, :language
    remove_column :profiles, :language_id
    add_column :profiles, :favorite_language, :string
  end
end
