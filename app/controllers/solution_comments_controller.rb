class SolutionCommentsController < ApplicationController
  authorize_resource
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @solution = Solution.find(params[:solution_id])
    @comment = @solution.comments.create(params[:solution_comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_solution_path(@problem, @solution)
  end
end