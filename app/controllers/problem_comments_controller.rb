class ProblemCommentsController < ApplicationController
  def create
    @problem = Post.find_by_shortname(params[:problem_id])
    @comment = @problem.comments.create(params[:comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_path(@problem)
  end
end
