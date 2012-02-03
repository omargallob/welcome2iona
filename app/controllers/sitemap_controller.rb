class SitemapController < ApplicationController
  def index
    @parent = @page = Page.find_by_name("sitemap")
    
  end

end
