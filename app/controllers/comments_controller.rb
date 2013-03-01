class CommentsController < ApplicationController
  authorize_resource

  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    commentable = @problem
    path = @problem
    if !params[:solution_id].nil?
      @solution = Solution.find(params[:solution_id])
      commentable = @solution
      path = problem_solution_path(@problem, @solution)
    end
    @comment = commentable.comments.create(comment_params)
    @comment.profile = current_user.profile
    @comment.save!
    redirect_to path
  end

  private

  def comment_params
    params[:comment].permit(:body, :up_votes, :down_votes)
  end
end
