# Manages Languages and their public interfaces.
class LanguagesController < ApplicationController
  authorize_resource
  # Lists all languages in the database.
  #
  # GET /languages
  # GET /languages.json
  #
  # @return [String] the HTML/JSON for the languages page
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @languages }
    end
  end

  # Shows the page for the language.
  #
  # GET /languages/1
  # GET /languages/1.json
  #
  # @return [String] the HTML/JSON for the language
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language }
    end
  end

  # Renders a new language JSON.
  #
  # GET /languages/new
  # GET /languages/new.json
  #
  # @return [String] the HTML/JSON for the new language
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @language }
    end
  end

  # Edits the values of a language.
  #
  # GET /languages/1/edit
  #
  # @return [String] the HTML/JSON for the language edit page
  def edit
    @language = Language.find(params[:id])
  end

  # Creates and saves a new achievement.
  #
  # POST /languages
  # POST /languages.json
  #
  # @return [String] the HTML/JSON for the saved language
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'Language was successfully created.' }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { render "new" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a language.
  #
  # PUT /languages/1
  # PUT /languages/1.json
  #
  # @return [String] the HTML/JSON for the updated language
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a language from the database.
  #
  # DELETE /languages/1
  # DELETE /languages/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the resource
  # was destroyed
  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to languages_url }
      format.json { head :no_content }
    end
  end
end
