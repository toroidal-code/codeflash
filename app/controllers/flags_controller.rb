# The controller for the flags
class FlagsController < ApplicationController
  authorize_resource
  before_action :set_flag, only: [:show, :destroy]
  before_action :set_path, except: :index

  # GET /flags
  def index
    @flags = Flag.all
  end

  # GET /flags/1
  def show
  end

  # GET /flags/new
  def new
    @should = false
    if @comment.nil?
      should_new_flag @solution
    else
      should_new_flag @comment
    end
    if !@should
      flash[:error] = 'You have already reported this.'
      redirect_to @path
    end
  end

  # POST /flags
  def create
    @should = false
    if @comment.nil?
      should_create_flag @solution
    else
      should_create_flag @comment
    end
    if !@should
      flash[:error] = 'You have already reported this.'
      redirect_to @path
    elsif @flag.save
      redirect_to @path, notice: 'Flag was successfully created.'
    else
      render action: 'new'
    end
  end

  # DELETE /flags/1
  def destroy
    @flag.destroy
    redirect_to flags_path, notice: 'Flag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params[:id])
    end

    #Sets the path instance variable for a fath
    def set_path
      @comment = Comment.find(params[:comment_id]) if !params[:comment_id].nil?
      @solution = Solution.find(params[:solution_id]) if !params[:solution_id].nil?
      @problem = Problem.find_by_shortname(params[:problem_id])
      if @solution.nil?
        @path = problem_path(@problem)
      else
        @path = problem_solution_path(@problem, @solution)
      end
    end

    def should_new_flag flaggable
      if Flag.where(profile: current_user.profile, flaggable: flaggable).count == 0
        @flag = Flag.new
        @should = true
      end
    end

    def should_create_flag flaggable
      if Flag.where(profile: current_user.profile, flaggable: flaggable).count == 0
        @flag = flaggable.flags.create(flag_params)
        @flag.profile = current_user.profile
        @should = true
      end
    end

    # Only allow a trusted parameter "white list" through.
    def flag_params
      params.require(:flag).permit(:profile_id, :reason, :explanation)
    end
end
