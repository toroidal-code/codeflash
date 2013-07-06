class AddRenderedAboutMeToProfile < ActiveRecord::Migration
  class Profile < ActiveRecord::Base
  end
  def change
    add_column :profiles, :rendered_about_me, :text
    Profile.reset_column_information
    reversible do |dir|
      dir.up do
        Profile.all.each do |profile|
          profile.rendered_about_me = profile.about_me
          profile.save!
        end
      end
    end
  end
end
