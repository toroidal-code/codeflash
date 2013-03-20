class CreateProfilesSolutions < ActiveRecord::Migration
  def change
    create_table :profiles_solutions, id: false do |t|
      t.references :profile
      t.references :solution
    end
    add_index :profiles_solutions, [:profile_id, :solution_id], unique: true
  end
end
