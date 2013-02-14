class AddShortnameToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :shortname, :string
  end
end
