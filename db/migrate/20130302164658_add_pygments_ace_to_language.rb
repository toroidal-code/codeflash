class AddPygmentsAceToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :ace_syntax, :string
    add_column :languages, :pygments_syntax, :string
    remove_column :languages, :syntax_highlighting, :string
  end
end
