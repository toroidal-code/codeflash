# Manages Languages and their public interfaces.
class LanguagesController < ApplicationController
  authorize_resource

  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # Lists all languages in the database.
  #
  # GET /languages
  # GET /languages.json
  #
  # @return [String] the HTML/JSON for the languages page
  def index
    @languages = Language.all
  end

  # Shows the page for the language.
  #
  # GET /languages/1
  # GET /languages/1.json
  #
  # @return [String] the HTML/JSON for the language
  def show
  end

  # Renders a new language JSON.
  #
  # GET /languages/new
  # GET /languages/new.json
  #
  # @return [String] the HTML/JSON for the new language
  def new
    @language = Language.new
  end

  # Edits the values of a language.
  #
  # GET /languages/1/edit
  #
  # @return [String] the HTML/JSON for the language edit page
  def edit
  end

  # Creates and saves a new achievement.
  #
  # POST /languages
  # POST /languages.json
  #
  # @return [String] the HTML/JSON for the saved language
  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'Language was successfully created.' }
        format.json { render action: 'show', status: :created, location: @language }
      else
        format.html { render action: 'new' }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a language.
  #
  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  #
  # @return [String] the HTML/JSON for the updated language
  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
    @language.destroy

    respond_to do |format|
      format.html { redirect_to languages_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_language
    @language = Language.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def language_params
    params.require(:language).permit(:name, :created_at, :updated_at, :ace_syntax, :pygments_syntax)
  end
end
