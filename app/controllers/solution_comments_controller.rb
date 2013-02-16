class SolutionCommentsController < ApplicationController
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @solution = Solution.find(parmas[:solution_id])
    @comment = @solution.comments.create(params[:comment])
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to problem_solution_path(@problem, @solution)
  end
end
