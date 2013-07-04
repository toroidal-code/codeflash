# Manages Solutions and their public interfaces.
class SolutionsController < ApplicationController
  authorize_resource

  before_action :find_solution, only: [:show, :edit, :update, :destroy]

  add_breadcrumb("Problems",:problems_path)

  respond_to :html, :json

  # Lists all the solutions to a given to the solution's problem
  # in the database
  #
  # GET /solutions
  # GET /solutions.json
  #
  # @return [String] the HTML/JSON for the solutions page
  def index
    if params[:problem_id]
      @problem = Problem.find_by_shortname(params[:problem_id])
      @solutions = @problem.solutions.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
      add_breadcrumb(@problem.name, problem_path(@problem))
    else
      @solutions = Solution.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
    end
    add_breadcrumb "Solutions", problem_solutions_path(@problem)
    respond_to :html, :json, :js
  end

  # Shows the page for the solution.
  #
  # GET /solutions/1
  # GET /solutions/1.json
  #
  # @return [String] the HTML/JSON for the solution
  def show
    @problem = Problem.find_by_shortname(params[:problem_id])
    breadcrumbs
    add_breadcrumb @solution.profile.user.username, problem_solution_path(@problem, @solution)
    respond_with @solution
  end

  # Renders a new solution JSON.
  #
  # GET /solutions/new
  # GET /solutions/new.json
  #
  # @return [String] the HTML/JSON for the new solution
  def new
    @solution = Solution.new
    @problem = Problem.find_by_shortname(params[:problem_id])
    breadcrumbs
    add_breadcrumb "New Solution"
    respond_with @solution

  end

  # Edits the values of a solution.
  #
  # GET /solutions/1/edit
  #
  # @return [String] the HTML/JSON for the solution edit page
  def edit
    @problem = @solution.problem
    @languages = Language.all
    breadcrumbs
    add_breadcrumb "Edit Solution"
  end

  # Creates and saves a new solution.
  #
  # POST /solutions
  # POST /solutions.json
  #
  # @return [String] the HTML/JSON for the saved solution
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @solution = @problem.solutions.create(solution_params) do |solution|
      solution.profile = current_user.profile
    end
    respond_to do |format|
      if @solution.save
        format.html { redirect_to problem_solution_path(@problem, @solution), notice: 'Solution was successfully created.' }
        format.json { render json: @problem, status: :created, location: @solution }
      else
        format.html { render "new" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a solution.
  #
  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  #
  # @return [String] the HTML/JSON for the updated solution
  def update
    @problem = @solution.problem
    respond_to do |format|
      if @solution.update_attributes(solution_params)
        format.html { redirect_to  problem_solution_path(@problem, @solution), notice: 'Solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a solution from the database.
  #
  # DELETE /solutions/1
  # DELETE /solutions/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the resource
  # was destroyed
  def destroy
    @problem = @solution.problem
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to problem_solutions_url }
      format.json { head :no_content }
    end
  end

  # Adds an upvote
  def upvote
    @solution = Solution.find(params[:id])
    begin
      @solution.profiles_voted << current_user.profile
      @solution.save
      @solution.up_votes += 1
      @solution.save
    rescue => e
      flash[:error] = "You have already voted on this solution."
    end
    redirect_to :back
  end

  # Adds a down vote
  def downvote
    @solution = Solution.find(params[:id])
    if @solution.profiles_voted.include?(current_user.profile)
      @solution.profiles_voted.delete(current_user.profile)
      @solution.save
      @solution.up_votes -= 1
      @solution.save
    else
      flash[:error] = "You have already voted on this solution."
    end
    redirect_to :back
  end

  # finds the solution based on params[:id]
  # before_filter method for show edit update and destroy
  def find_solution
    @solution = Solution.find(params[:id])
  end

  # adds the problem name breadcrumb and the problem's solutions breadcrumb
  def breadcrumbs
    add_breadcrumb(@problem.name, problem_path(@problem))
    add_breadcrumb "Solutions", problem_solutions_path(@problem)
  end

  private

  # Helper method for voting
  def vote up
  end

  def solution_params
    params[:solution].permit(:code, :language_id, :problem_id, :up_votes, :down_votes)
  end
end
