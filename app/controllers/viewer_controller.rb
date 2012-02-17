class ViewerController < ApplicationController
  def index
    @parent = @page = Page.find_by_name(params[:name].gsub("_"," ")||"home")
    if @page.name =="home"
      @events = []
      Category.children(1).each do |t|
        t.posts.each do |p|
          @events << p
        end
    	end
    end
  end

  def show
    @page = Page.find_by_name(params[:name].gsub("_"," ")||"home")

    
    #@category = Category.find_by_title(params[:parent].gsub("_"," "))
 
  
    @parent = Page.find_by_name(params[:parent])

    unless @page.categories.count == 0 
      @posts = []
      if params[:subcat].blank?
        @page.categories.each do |c|
          c.subcategories.each do |s|
            s.posts.each do |p|
              @posts << p
            end
          end
        end
      else
        @c = Category.find_by_title(params[:subcat].gsub("+","/"))
        @c.posts.each do |p|
          @posts << p
        end
      end
    end  
    if params[:name] == "home"
      @up_coming_events = []
      @latest_news = []
      Category.children(1).each do |c|
        c.posts.each do |p|
          @up_coming_events << p
        end   
      end 
      @up_coming_events.delete_if{|a| a.start_at < Date.yesterday }
      
      Category.children(15).each do |c|
        c.posts.published.each do |p|
          @latest_news << p
        end   
      end

    end

    current_navigation "#{@page.name}"
  end

end
