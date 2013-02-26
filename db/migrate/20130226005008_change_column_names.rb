class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :achievements, :point_value, :points
    rename_column :problems, :point_value, :points
    rename_column :problems, :problem_name, :name
  end
end
