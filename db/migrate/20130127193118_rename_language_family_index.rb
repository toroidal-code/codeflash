class RenameLanguageFamilyIndex < ActiveRecord::Migration
  def change
  	 rename_index :languages, 'index_langagues_on_language_family_id', 'index_languages_on_language_family_id'
  end
end
