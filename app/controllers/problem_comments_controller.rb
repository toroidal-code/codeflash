class ProblemCommentsController < ApplicationController
  authorize_resource
  # Creates and saves a new solution comment.
  #
  # POST /problem/problem_id/comment
  #
  # @return [String] the HTML/JSON for the problem
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @comment = @problem.comments.create!(params[:problem_comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_path(@problem)
  end
end
