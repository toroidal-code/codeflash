class SolutionsController < ApplicationController
  load_and_authorize_resource
  # GET /solutions
  # GET /solutions.json
  def index
    @problem = Problem.find(params[:problem_id])
    @solutions = @problem.solutions
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solutions }
    end
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/new
  # GET /solutions/new.json
  def new
    @solution = Solution.new
    @problem = Problem.find(params[:problem_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/1/edit
  def edit
    @solution = Solution.find(params[:id])
    @problem = @solution.problem
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.create(params[:solution])
    respond_to do |format|
      if @solution.save
        format.html { redirect_to problem_solution_path(@problem, @solution), notice: 'Solution was successfully created.' }
        format.json { render json: @problem, status: :created, location: @solution }
      else
        format.html { render action: "new" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /solutions/1
  # PUT /solutions/1.json
  def update
    @solution = Solution.find(params[:id])
    @problem = @solution.problem
    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html { redirect_to  problem_solution_path(@problem, @solution), notice: 'Solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
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
