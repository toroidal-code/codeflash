class CreateLangagues < ActiveRecord::Migration
  def change
    create_table :langagues do |t|
      t.string :name
      t.references :language_family

      t.timestamps
    end
    add_index :langagues, :language_family_id
  end
end
