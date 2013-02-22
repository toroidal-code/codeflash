class AddShToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :syntax_highlighting, :string
  end
end
