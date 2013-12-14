class SearchController < ApplicationController
  def index
    @images = Phototag.with_query(params[:textval])
    @photos = Photo.all
   
    @marathons = Marathon.with_query(params[:textval])
    
    @searchvar = params[:search_var]
    @searchval = params[:textval]
  end
end
