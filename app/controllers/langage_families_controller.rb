class LangageFamiliesController < ApplicationController
  # GET /langage_families
  # GET /langage_families.json
  def index
    @langage_families = LangageFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @langage_families }
    end
  end

  # GET /langage_families/1
  # GET /langage_families/1.json
  def show
    @langage_family = LangageFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @langage_family }
    end
  end

  # GET /langage_families/new
  # GET /langage_families/new.json
  def new
    @langage_family = LangageFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @langage_family }
    end
  end

  # GET /langage_families/1/edit
  def edit
    @langage_family = LangageFamily.find(params[:id])
  end

  # POST /langage_families
  # POST /langage_families.json
  def create
    @langage_family = LangageFamily.new(params[:langage_family])

    respond_to do |format|
      if @langage_family.save
        format.html { redirect_to @langage_family, notice: 'Langage family was successfully created.' }
        format.json { render json: @langage_family, status: :created, location: @langage_family }
      else
        format.html { render action: "new" }
        format.json { render json: @langage_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /langage_families/1
  # PUT /langage_families/1.json
  def update
    @langage_family = LangageFamily.find(params[:id])

    respond_to do |format|
      if @langage_family.update_attributes(params[:langage_family])
        format.html { redirect_to @langage_family, notice: 'Langage family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @langage_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /langage_families/1
  # DELETE /langage_families/1.json
  def destroy
    @langage_family = LangageFamily.find(params[:id])
    @langage_family.destroy

    respond_to do |format|
      format.html { redirect_to langage_families_url }
      format.json { head :no_content }
    end
  end
end
