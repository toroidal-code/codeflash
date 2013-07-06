class AddRenderedBodyToComments < ActiveRecord::Migration
  class Comment < ActiveRecord::Base
  end
  def change
    add_column :comments, :rendered_body, :text
    Comment.reset_column_information
    reversible do |dir|
      dir.up do
        Comment.all.each do |comment|
          comment.rendered_body = comment.body
          comment.save!
        end
      end
    end
  end
end
