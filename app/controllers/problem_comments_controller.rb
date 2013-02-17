class ProblemCommentsController < ApplicationController
  authorize_resource
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @comment = @problem.comments.create!(params[:problem_comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_path(@problem)
  end
end
