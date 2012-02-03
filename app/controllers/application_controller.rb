class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :setup_navigation, :get_w2
  

  def setup_navigation
      @main_items = Array.new

      Page.cropped.main.each do |topnav|
        @map_items = Array.new
        unless topnav.name == "sitemap"
          @sub_items = Array.new
          topnav.subpages.each do |subnav|
            @sub  = {"key" => subnav.name, "name" => subnav.navlabel, "url"=>viewer_sub_path(topnav.name,subnav.name.gsub("'","$").gsub(" ","_"))}
            @sub_items << @sub
          end 
          topnav.categories.each do |cat|
            @subsub_items = Array.new
            cat.subcategories.delete_if{|s| s.posts.published.count == 0}.each do |subcat|
              @subsub  = {"key" => subcat.navlabel, "name" => subcat.title+" (#{subcat.posts.count})", "url"=>viewer_index_subfiltered_posts_path(cat.page.name, cat.navlabel.gsub(" ","_"), subcat.navlabel.gsub("/","+"))}
              @subsub_items << @subsub
            end
            @sub  = {"key" => cat.navlabel, "name" => cat.title, "url"=>viewer_index_filtered_posts_path(cat.page.name, cat.navlabel.gsub("/","+").gsub("'","$").gsub(" ","_")), :items => @subsub_items}
            @sub_items << @sub
            
          end
          # if topnav.name == "home"          
            # Category.find_all_sub.delete_if{|ca| ca.maps.count == 0}.each do |c|
            #             @m = {"key" => c.title, "name" => c.title, "url"=>mapper_show_filtered_path(c.parent.page.name,c.parent.title.gsub(" ","_"),c.title.gsub("/","+"))}
            #           end
            #           @map_items << @m
          #   @item = {"key" => topnav.name, "name" => topnav.navlabel, "url"=>viewer_path(topnav.name), :items => @map_items}
          # else  
            @item = {"key" => topnav.name, "name" => topnav.navlabel, "url"=>viewer_path(topnav.name), :items => @sub_items}
          # end
          @main_items << @item
        end
      end
      @subgalleries = Array.new
      Category.find_sub(10).delete_if{|x|x.galleries.count == 0}.each do |c|
        subg = {"key" => c.title, "name" => c.title, "url"=>galleries_filtered_path(c.title.gsub(" ","_"))}
        @subgalleries << subg
      end  
      photo = {"key" => :galleries, "name" => "Galleries", "url"=>galleries_path, :items => @subgalleries}
      @main_items << photo
      # Category.find_all_sub.delete_if{|ca| ca.maps.count == 0}.each do |c|
      #   @m = {"key" => c.title, "name" => c.title, "url"=>mapper_show_filtered_path(c.parent.page.name,c.parent.title.gsub(" ","_"),c.title.gsub("/","+"))}
      # end
      # @map_items << @m
      #maps = {"key" => :maps, "name" => "Maps", "url"=>maps_path, :items => @map_items}
      # 
      #@main_items << maps
      # if admin_signed_in?
      #        backend = {"key" => :backend, "name" => "Back", "url"=>admin_root_path}
      #        @main_items << backend
      #      end            
  end

  def get_weather
    @doc = Nokogiri::XML(open("http://www.google.com/ig/api?weather=Isle%20of%20Iona&hl=en"))
    
    @weather =  @doc.xpath('//current_conditions')
    unless @weather.blank?
      @condition = @weather.xpath("condition").attribute("data")
      @image = "http://www.google.com"+@weather.xpath("icon").attribute("data")
      @temp = @weather.xpath("temp_c").attribute("data")
      @wind =  @weather.xpath("wind_condition").attribute("data")
    else
      @condition = "error"
      @image = "error"
      @temp ="error"
      @wind =  "error"
    end
  end
  def get_w2
     @doc = Nokogiri::XML(open("http://weather.yahooapis.com/forecastrss?w=24564&u=c"))

      @weather =  @doc.xpath('//yweather:condition')
      
      @wind =  @doc.xpath('//yweather:wind')
      unless @weather.blank?
        @condition = @doc.xpath("//yweather:condition").attribute("text")
        
        @image = "http://l.yimg.com/a/i/us/we/52/"+@doc.xpath("//yweather:condition").attribute("code")+".gif"
        
        @temp = @weather.attribute("temp")
        @wind_c =  @wind.attribute("speed").to_s+" Km/h"+@wind.attribute("direction").to_s
      else
        @condition = "error"
        @image = "error"
        @temp ="error"
        @wind =  "error"
      end

  end
end
