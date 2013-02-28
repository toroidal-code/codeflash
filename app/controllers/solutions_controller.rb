# Manages Solutions and their public interfaces.
class SolutionsController < ApplicationController
  authorize_resource

  before_filter :find_solution, only: [:show, :edit, :update, :destroy]

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
      @solutions =Solution.where(problem_id: @problem.id).paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
    else
      @solutions = Solution.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
    end

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
    @languages = Language.all
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
  end

  # Creates and saves a new solution.
  #
  # POST /solutions
  # POST /solutions.json
  #
  # @return [String] the HTML/JSON for the saved solution
  def create
    @problem = Problem.find_by_shortname(params[:problem_id])
    @solution = @problem.solutions.create(solution_params)
    @solution.profile = current_user.profile
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
  # PUT /solutions/1
  # PUT /solutions/1.json
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

  # Deletes a language from the database.
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

  def find_solution
    @solution = Solution.find(params[:id])
  end

  private

  def solution_params
    params[:solution].permit(:code, :language_id, :problem_id, :up_votes, :down_votes)
  end
end
