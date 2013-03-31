class FlagsController < ApplicationController
  authorize_resource
  before_action :set_flag, only: [:show, :destroy]
  before_action :set_path

  # GET /flags
  def index
    @flags = Flag.all
  end

  # GET /flags/1
  def show
  end

  # GET /flags/new
  def new
    @flag = Flag.new
  end

  # POST /flags
  def create
    if @comment.nil?
      @flag = @solution.flags.create(flag_params)
    else
      @flag = @comment.flags.create(flag_params)
    end
    if @flag.save
      redirect_to @path, notice: 'Flag was successfully created.'
    else
      render action: 'new'
    end
  end

  # DELETE /flags/1
  def destroy
    @flag.destroy
    redirect_to @path, notice: 'Flag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params[:id])
    end

    def set_path
      @comment = Comment.find(params[:comment_id]) if !params[:comment_id].nil?
      @solution = Solution.find(params[:solution_id]) if !params[:solution_id].nil?
      @problem = Problem.find_by_shortname(params[:problem_id])
      if @solution.nil?
        @path = problem_comment_path(@problem, @comment)
      elsif @comment.nil?
        @path = problem_solution_path(@problem, @solution)
      else
        @path = problem_solution_comment_path(@problem, @solution, @comment)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def flag_params
      params.require(:flag).permit(:profile_id, :reason, :explanation)
    end
end
