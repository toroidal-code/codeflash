#Manages comments
class CommentsController < ApplicationController
  authorize_resource

  before_action :set_comment, only: :show

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

  # Shows an existing comment
  def show
    @solution = @comment.commentable_type == 'Solution'
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

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :up_votes, :down_votes, :rendered_body)
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
      flash[:error] = "You have already voted on this comment."
    end
    redirect_to :back
  end
end
