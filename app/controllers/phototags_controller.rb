class PhototagsController < ApplicationController
  # GET /phototags
  # GET /phototags.json
  def index
    @phototags = Phototag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phototags }
    end
  end

  # GET /phototags/1
  # GET /phototags/1.json
  def show
    @phototag = Phototag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phototag }
    end
  end

  # GET /phototags/new
  # GET /phototags/new.json
  def new
    @phototag = Phototag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phototag }
    end
  end

  # GET /phototags/1/edit
  def edit
    @phototag = Phototag.find(params[:id])
  end

  # POST /phototags
  # POST /phototags.json
  def create
    @phototag = Phototag.new(params[:phototag])

    respond_to do |format|
      if @phototag.save
        @photo = Photo.find(@phototag.photoid)
        format.html {redirect_to @photo}
      else
        format.html { render action: "new" }
        format.json { render json: @phototag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phototags/1
  # PUT /phototags/1.json
  def update
    @phototag = Phototag.find(params[:id])

    respond_to do |format|
      if @phototag.update_attributes(params[:phototag])
        format.html { redirect_to @phototag, notice: 'Phototag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phototag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phototags/1
  # DELETE /phototags/1.json
  def destroy
    @phototag = Phototag.find(params[:id])
    @phototag.destroy

    respond_to do |format|
      format.html { redirect_to phototags_url }
      format.json { head :no_content }
    end
  end
end
