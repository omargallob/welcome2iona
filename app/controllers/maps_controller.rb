class MapsController < ApplicationController
  def index
    @page = Page.find_by_name(params[:name])
    @map = Map.find_by_title("Welcome to Iona")
    @maps = Map.all
  end

  def show
    @category = Category.find_by_title(params[:subcat].gsub("+","/").gsub("_"," "))
    if params[:id].present?
      @map = Map.find(params[:id])
    elsif @category.present? 
      @map = Map.find_by_category_id(@category.id)
    end    
    @parent = @page = Page.find_by_name(params[:name])
    @maps = Map.all
  end

end
