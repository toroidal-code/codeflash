class RemoveLanguageFamilies < ActiveRecord::Migration
  def up
  	drop_table :language_families
  	remove_index :languages, :language_family_id
  	remove_column :languages, :language_family_id
  end

  def down
  	create_table :langage_families do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    add_column :languages, :language_family_id, :integer
    add_index :lanaguages, :language_family_id
  end
end
