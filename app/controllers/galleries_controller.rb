class GalleriesController < ApplicationController
  def index
    if params[:parent].blank?
      @galleries = Gallery.all
    else
      @galleries = Gallery.joins(:category).where("categories.title = ?", params[:parent].gsub("_"," "))
    end
  end

end
