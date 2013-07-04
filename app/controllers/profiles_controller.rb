# Manages Profiles and their public interfaces.
class ProfilesController < ApplicationController
  authorize_resource

  before_action :find_profile, only: [:show, :edit, :update, :destroy]


  # Shows the page for the profile.
  #
  # GET /profiles/1
  # GET /profiles/username
  # GET /profiles/1.json
  #
  # @return [String] the HTML/JSON for the profile
  def show
    @solutions = @profile.solutions.paginate(page: params[:page], per_page: 10 ).order('created_at DESC')
  end

  # Renders a new language JSON.
  #
  # GET /profiles/new
  # GET /profiles/new.json
  #
  # @return [String] the HTML/JSON for the new profile
  def new
    @user = current_user
    @profile = Profile.new
  end

  # Edits the valuses of a profile.
  #
  # GET /profiles/1/edit
  # GET /profiles/username/edit
  #
  # @return [String] the HTML/JSON for the profile edit page
  def edit
    authorize! :edit, @profile
  end

  # Creates and saves a new profile.
  #
  # POST /profiles
  # POST /profiles.json
  #
  # @return [String] the HTML/JSON for the saved profile.
  def create
    @profile = Profile.new(profile_params)
    @user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a profile.
  #
  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  #
  # @return [String] the HTML/JSON for the updated profile
  def update
    authorize! :update, @profile
    respond_to do |format|
      if @user.update_attributes(params[:user].permit(:username)) && @profile.update_attributes(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a language from the database.
  #
  # DELETE /profiles/1
  # DELETE /profiles/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the resource
  # was destroyed
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  # Finds the profile for a given user
  # The before_filter method for show edit update and destroy
  def find_profile
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
  end

  private

  def profile_params
    params[:profile].permit(:about_me, :language_id, :github, :name, :user_id, :rendered_about_me)
  end
end
