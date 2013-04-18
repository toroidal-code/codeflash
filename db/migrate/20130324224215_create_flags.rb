class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :profile, index: true
      t.string :reason
      t.text :explanation
      t.references :flaggable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
