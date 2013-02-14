class ChangeColumnDefaults < ActiveRecord::Migration
  def change
    change_column(:solutions, :up_votes, :integer, :default => 0)
    change_column(:solutions, :down_votes, :integer, :default => 0)
  end
end
