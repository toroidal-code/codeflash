class ProfilesController < ApplicationController
  authorize_resource
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/username
  # GET /profiles/1.json
  def show
    @user = User.find_by_username(params[:id])
    # @user = User.find_by_username(params[:id])
    @profile = @user.profile
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @user = current_user
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  # GET /profiles/username/edit
  def edit
    @user = User.find_by_username(params[:id])
    @profile = @user.profile
    authorize! :edit, @profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @user = User.find_by_username(params[:id]) 
    @profile = @user.profile
    authorize! :update, @profile
    respond_to do |format|
      if @user.update_attributes(params[:user]) && @profile.update_attributes(params[:profile]) 
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @user = User.find_by_username(params[:id]) 
    @profile = @user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
