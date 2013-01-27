class FixLanguageTypos < ActiveRecord::Migration
  def change
    # Rename the langagues table
    rename_table :langagues, :languages

    # Rename the langage_families table
    rename_table :langage_families, :language_families
  end
end
