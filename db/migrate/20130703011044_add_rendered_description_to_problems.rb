class AddRenderedDescriptionToProblems < ActiveRecord::Migration
  class Problem < ActiveRecord::Base
  end
  def change
    add_column :problems, :rendered_description, :text
    Problem.reset_column_information
    reversible do |dir|
      dir.up do
        Problem.all.each do |problem|
          problem.rendered_description = problem.description
          problem.save!
        end
      end
    end
  end
end
