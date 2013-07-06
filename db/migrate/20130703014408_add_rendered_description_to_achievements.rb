class AddRenderedDescriptionToAchievements < ActiveRecord::Migration
  class Achievement < ActiveRecord::Base
  end
  def change
    add_column :achievements, :rendered_description, :text
    Achievement.reset_column_information
    reversible do |dir|
      dir.up do
        Achievement.all.each do |achievement|
          achievement.rendered_description = achievement.description
          achievement.save!
        end
      end
    end
  end
end
