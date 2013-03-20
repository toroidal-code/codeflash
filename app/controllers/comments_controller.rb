class CommentsController < ApplicationController
  authorize_resource

  # Creates a new comment
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

  # Adds an upvote
  def upvote
    vote true
  end

  # Adds a downvote
  def downvote
    vote false
  end

  private

  def comment_params
    params[:comment].permit(:body, :up_votes, :down_votes)
  end

  # Helper method for voting
  def vote up
    @problem = Problem.find_by_shortname(params[:problem_id])
    @comment = Comment.find(params[:id])
    begin
      path = @problem
      if !params[:solution_id].nil?
        @solution = Solution.find(params[:solution_id])
        path = problem_solution_path(@problem, @solution)
      end
      @comment.profiles_voted << current_user.profile
      @comment.save
      if up
        @comment.up_votes += 1
      else
        @comment.down_votes += 1
      end
      @comment.save!
    rescue => e
      flash[:error] = "You have already voted on this "
    end
    redirect_to path
  end
end
