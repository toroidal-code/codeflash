# Manages Profiles and their public interfaces.
class ProfilesController < ApplicationController
  authorize_resource

  respond_to :html, :json

  # Lists all the profiles in the database.
  #
  # GET /profiles
  # GET /profiles.json
  #
  # @return [String] the HTML/JSON for the profiles page
  def index
    @profiles = Profile.all

    respond_with @profiles
  end

  # Shows the page for the profile.
  #
  # GET /profiles/1
  # GET /profiles/username
  # GET /profiles/1.json
  #
  # @return [String] the HTML/JSON for the profile
  def show
    @user = User.find_by_username(params[:id])
    # @user = User.find_by_username(params[:id])
    @profile = @user.profile

    respond_with @profile
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

    respond_with @profile
  end

  # Edits the valuses of a profile.
  #
  # GET /profiles/1/edit
  # GET /profiles/username/edit
  #
  # @return [String] the HTML/JSON for the profile edit page
  def edit
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
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
  # PUT /profiles/1
  # PUT /profiles/1.json
  #
  # @return [String] the HTML/JSON for the updated profile
  def update
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
    authorize! :update, @profile
    respond_to do |format|
      if @user.update_attributes(params[:user]) && @profile.update_attributes(profile_params)
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
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
  def profile_params
    params[:profile].permit(:about_me, :favorite_language, :github, :name, :user_id)
  end
end
