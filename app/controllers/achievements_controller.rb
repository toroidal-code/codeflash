# Manages Achievements and their public interfaces.
class AchievementsController < ApplicationController
  authorize_resource
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Achievements", :achievements_path

  respond_to :html, :json, :js

  # Lists all achievements in the database.
  #
  # GET /achievements
  # GET /achievements.json
  #
  # @return [String] the HTML/JSON for the achievements page.
  def index
    @achievements = Achievement.all
    respond_with @achievements
  end

  # Shows the page for the achievement.
  #
  # GET /achievements/1
  # GET /achievements/1.json
  #
  # @return [String] the HTML/JSON for the achievement
  def show
    @solutions = @achievement.solutions.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    add_breadcrumb @achievement.name, achievement_path(@achievement)
    respond_with @achievement
  end

  # Renders a new achievment JSON.
  #
  # GET /achievements/new
  # GET /achievements/new.json
  #
  # @return [String] the HTML/JSON for the new achievement
  def new
    @achievement = Achievement.new
    add_breadcrumb "New Achievement"
    respond_with @achievement
  end

  # Edits the values of an achievement.
  #
  # GET /achievements/1/edit
  #
  # @return [String] the HTML/JSON for the achievement edit page
  def edit
    add_breadcrumb "Edit #{@achievement.name}"
  end

  # Creates and saves a new achievement.
  #
  # POST /achievements
  # POST /achievements.json
  #
  # @return [String] the HTML/JSON for the saved achievement
  def create
    @achievement = Achievement.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
        format.json { render json: @achievement, status: :created, location: @achievement }
      else
        format.html { render "new" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of an achievement.
  #
  # PUT /achievements/1
  # PUT /achievements/1.json
  #
  # @return [String] the HTML/JSON for the updated achievement resource
  def update
    respond_to do |format|
      if @achievement.update_attributes(achievement_params)
        format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes an achievement from the database.
  #
  # DELETE /achievements/1
  # DELETE /achievements/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the resource was
  # destroyed
  def destroy
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params[:achievement].permit(:description, :name, :points, :rendered_description)
  end
end
