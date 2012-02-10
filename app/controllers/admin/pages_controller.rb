class Admin::PagesController < Admin::BaseController
  def index
    @pages = Page.main.all
  end

  def show
    @page = Page.find(params[:id])
    @simple = @page.simples.build
  end

  def new
    @page = Page.new
    @page.build_metatag
    @page.simples.build

     
  end
  def crop
     @page = Page.find(params[:page_id])
         render :layout => "crop" 
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save      
        if params[:page][:home].blank?
             redirect_to admin_page_path(@page.id)
          else
             redirect_to admin_page_crop_path(@page.id)                
          end        
    else
      render :action => 'new'
    end      
  end

  def edit
    @page = Page.find(params[:id])
        @page.build_metatag if @page.metatag.blank?
    @page.build_link  if @page.link.blank?
    @categories = Category.find_main
    @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}        
  end

  def update
    @page = Page.find(params[:id])
 
      
      if params[:page][:home].blank?
          if @page.update_attributes(params[:page])
           redirect_to admin_page_path(@page.id)
          else
            render :action => 'edit'
          end
          
        else
          @page.remove_home!
          if @page.update_attributes(params[:page])
           redirect_to admin_page_crop_path(@page.id)                
           else
             render :action => 'edit'
           end
           
        end      
  end

  def destroy
    @page = Page.find(params[:id])
    @page.remove_home!
    @page.destroy
    redirect_to admin_pages_url, :notice => "Successfully destroyed page."
  end
end
