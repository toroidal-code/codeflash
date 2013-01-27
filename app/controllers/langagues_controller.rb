class LangaguesController < ApplicationController
  # GET /langagues
  # GET /langagues.json
  def index
    @langagues = Langague.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @langagues }
    end
  end

  # GET /langagues/1
  # GET /langagues/1.json
  def show
    @langague = Langague.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @langague }
    end
  end

  # GET /langagues/new
  # GET /langagues/new.json
  def new
    @langague = Langague.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @langague }
    end
  end

  # GET /langagues/1/edit
  def edit
    @langague = Langague.find(params[:id])
  end

  # POST /langagues
  # POST /langagues.json
  def create
    @langague = Langague.new(params[:langague])

    respond_to do |format|
      if @langague.save
        format.html { redirect_to @langague, notice: 'Langague was successfully created.' }
        format.json { render json: @langague, status: :created, location: @langague }
      else
        format.html { render action: "new" }
        format.json { render json: @langague.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /langagues/1
  # PUT /langagues/1.json
  def update
    @langague = Langague.find(params[:id])

    respond_to do |format|
      if @langague.update_attributes(params[:langague])
        format.html { redirect_to @langague, notice: 'Langague was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @langague.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /langagues/1
  # DELETE /langagues/1.json
  def destroy
    @langague = Langague.find(params[:id])
    @langague.destroy

    respond_to do |format|
      format.html { redirect_to langagues_url }
      format.json { head :no_content }
    end
  end
end
