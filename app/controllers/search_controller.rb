class SearchController < ApplicationController
  def index
    @images = Phototag.with_query(params[:tagnum])
    @photos = Photo.all
  end
end
