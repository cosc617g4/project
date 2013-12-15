class UserphotosController < ApplicationController
  def userphoto
    @u_id=current_user.id
    if(params[:photoid] !=nil)
      @ph_id=params[:photoid]
      @userphoto = Userphotos.create(userid:@u_id,photoid:@ph_id) 
    end   
      redirect_to userphotos_my_album_path
   
  end
  
  
  def my_album
     if user_signed_in?
       @photos= Photo.all
       @myalbum = Userphotos.all
    else
     redirect_to "/users/sign_in" 
   end
  end
end
