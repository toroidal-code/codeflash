# Manages Solutions and their public interfaces.
class SolutionsController < ApplicationController
  authorize_resource
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
      @solutions = @problem.solutions
    else
      @solutions = Solution.all
    end
    respond_to do |format|
      format.html
      format.json { render json: @solutions }
    end
  end

  # Shows the page for the solution.
  #
  # GET /solutions/1
  # GET /solutions/1.json
  #
  # @return [String] the HTML/JSON for the solution
  def show
    @solution = Solution.find(params[:id])
    @problem = Problem.find_by_shortname(params[:problem_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
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
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  # Edits the values of a solution.
  #
  # GET /solutions/1/edit
  #
  # @return [String] the HTML/JSON for the solution edit page
  def edit
    @solution = Solution.find(params[:id])
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
    @solution = @problem.solutions.create(params[:solution])
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
    @solution = Solution.find(params[:id])
    @problem = @solution.problem
    respond_to do |format|
      if @solution.update_attributes(params[:solution])
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
    @solution = Solution.find(params[:id])
    @problem = @solution.problem
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to problem_solutions_url }
      format.json { head :no_content }
    end
  end
end
