class LanguageFamiliesController < ApplicationController
  # GET /language_families
  # GET /language_families.json
  def index
    @language_families = LanguageFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @language_families }
    end
  end

  # GET /language_families/1
  # GET /language_families/1.json
  def show
    @language_family = LanguageFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language_family }
    end
  end

  # GET /language_families/new
  # GET /language_families/new.json
  def new
    @language_family = LanguageFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @language_family }
    end
  end

  # GET /language_families/1/edit
  def edit
    @language_family = LanguageFamily.find(params[:id])
  end

  # POST /language_families
  # POST /language_families.json
  def create
    @language_family = LanguageFamily.new(params[:language_family])

    respond_to do |format|
      if @language_family.save
        format.html { redirect_to @language_family, notice: 'Language family was successfully created.' }
        format.json { render json: @language_family, status: :created, location: @language_family }
      else
        format.html { render action: "new" }
        format.json { render json: @language_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /language_families/1
  # PUT /language_families/1.json
  def update
    @language_family = LanguageFamily.find(params[:id])

    respond_to do |format|
      if @language_family.update_attributes(params[:language_family])
        format.html { redirect_to @language_family, notice: 'Language family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @language_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_families/1
  # DELETE /language_families/1.json
  def destroy
    @language_family = LanguageFamily.find(params[:id])
    @language_family.destroy

    respond_to do |format|
      format.html { redirect_to language_families_url }
      format.json { head :no_content }
    end
  end
end
