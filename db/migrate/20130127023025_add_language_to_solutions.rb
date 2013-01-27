class AddLanguageToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :language_id, :integer
  end
end
