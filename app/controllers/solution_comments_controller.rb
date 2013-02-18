# Manages the creation of SolutionComments (comments on solutions).
class SolutionCommentsController < ApplicationController
  authorize_resource

  #Creates and saves a new solution comment.
  #
  # POST /solutions/comments
  #
  # @return [String] the HTML/JSON for the solution
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @solution = Solution.find(params[:solution_id])
    @comment = @solution.comments.create(params[:solution_comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_solution_path(@problem, @solution)
  end
end
