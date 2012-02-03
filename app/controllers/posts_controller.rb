class PostsController < ApplicationController
  def index
     @parent = @page = Page.find_by_name(params[:name]||"home")
     if params[:subcat].blank?
       @category = Category.find_by_navlabel(params[:parent].gsub("$","'").gsub("_"," "))
       if @category.parent == nil
         @posts = Array.new
         Category.children(@category.id).uniq.each do |c| 
           c.posts.published.each do |p|
             @posts << p
           end
         end
        @posts = @posts.sort_by(&:published_on).reverse
        @posts =  Kaminari.paginate_array(@posts).page(params[:page]).per(5)
      else
        @category = Category.find_by_title(params[:parent].gsub("_"," "))
        @posts = @category.posts.published
           @posts = @posts.sort_by(&:published_on).reverse
           @posts =  Kaminari.paginate_array(@posts).page(params[:page]).per(5)
      end
    
     else
       @category = Category.find_by_title(params[:subcat].gsub("+","/"))

       @posts = @category.posts.published
       @posts = @posts.sort_by(&:published_on).reverse
       @posts =  Kaminari.paginate_array(@posts).page(params[:page]).per(5)
     end
  end
  
  def show
  end

end
