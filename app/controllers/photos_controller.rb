class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  #

  
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @photos = Photo.all
      @userphotos = Userphotos.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @photos }
      end
    end
  end
  
  

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @comments = Comment.find(:all, :order=>"created_at DESC")
    @phototags = Phototag.all
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    if user_signed_in?
      @photo = Photo.new
      @marathons = current_user.marathons
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @photo }
      end
    else
    redirect_to "/users/sign_in"
  end  
  end
    
 

  # GET /photos/1/edit
  def edit
  if user_signed_in?
    @photo = Photo.find(params[:id])
   else
     redirect_to "/users/sign_in" 
   end  
  end
  
  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        @userphoto = Userphotos.create(userid:current_user.id,photoid:@photo.id) 
        format.html { redirect_to @photo, notice: @photo.id  }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def myphotos
    if user_signed_in?
       @photos = Photo.all
    else
     redirect_to "/users/sign_in" 
   end  
  end
  
  def setdefaultphoto
    @photo = Photo.find(params[:photoid])
    User.where(:id=>current_user.id).update_all(:default_photo_id => @photo)
    redirect_to profile_index_path
  end
  
 
  
  

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
 
    @photoid = params[:id]
    Userphotos.where(:photoid => @photoid).destroy_all
    
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
  end


