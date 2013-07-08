# Manages Problems and their public interfaces.
class ProblemsController < ApplicationController
  authorize_resource

  respond_to :html, :json, :js

  add_breadcrumb 'Problems', :problems_path

  # Lists all the problems in the database.
  #
  # GET /problems
  # GET /problems.json
  #
  # @return [String] the HTML/JSON for the problems page
  def index
    @problems = Problem.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')

    respond_with @problems
  end

  # Shows the page for the problem.
  #
  # GET /problems/1
  # GET /problems/1.json
  #
  # @return [String] the HTML/JSON for the problem.
  def show
    @problem = Problem.find_by_shortname(params[:id])
    @solutions = @problem.solutions.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
    add_breadcrumb @problem.name, problem_path(@problem)
    respond_with @problem
  end

  # Renders a new problem JSON.
  #
  # GET /problems/new
  # GET /problems/new.json
  #
  # @return [String] the HTML/JSON for the new problem.
  def new
    @problem = Problem.new
    add_breadcrumb 'New Problem'
    respond_with @problem
  end

  # Edits the values of a problem.
  #
  # GET /problems/1/edit
  #
  # @return [String] the HTML/JSON for the problem edit page
  def edit
    @problem = Problem.find_by_shortname(params[:id])
    add_breadcrumb "Edit #{@problem.name}"
  end

  # Creates and saves a new problem.
  #
  # POST /problems
  # POST /problems.json
  #
  # @return [String] the HTML/JSON for the saved problem
  def create
    @problem = Problem.new(problem_params)
    create_tags
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render 'new' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a problem.
  #
  # PUT /problems/1
  # PUT /problems/1.json
  #
  # @return [String] the HTML/JSON for the updated language
  def update
    @problem = Problem.find_by_shortname(params[:id])
    create_tags
    respond_to do |format|
      if @problem.update_attributes(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a language from the database.
  #
  # DELETE /problems/1
  # DELETE /problems/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the resource was
  # destroyed
  def destroy
    @problem = Problem.find_by_shortname(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end

  private

  def problem_params
    params[:problem].permit(:description, :points, :name, :shortname, :rendered_description)
  end

  def create_tags
    @problem.tags = Array.new
    tags = params[:tags].split(',')
    tags.each do |tag|
      if !Tag.exists?(name: tag)
        c = Tag.create(name: tag)
      else
        c = Tag.find_by_name(tag)
      end
      @problem.tags << c
    end
    @problem.save
  end
end
