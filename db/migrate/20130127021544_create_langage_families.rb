class CreateLangageFamilies < ActiveRecord::Migration
  def change
    create_table :langage_families do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
