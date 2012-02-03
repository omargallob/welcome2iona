class Admin::SimplesController < Admin::BaseController
  def create 
    @simple = Simple.new(params[:simple])
    @parent = Page.find(params[:page_id])
    if @simple.save    
      unless params[:simple][:image].blank?
        redirect_to admin_page_simple_crop_path(@parent.id,@simple.id)               
      else
        redirect_to admin_page_path(@parent)
      end 
    else
      flash.now[:notice] = 'Upload was not created.'
      redirect_to  admin_page_path(@parent)
    end
  end
  
  def edit
   @simple = Simple.find(params[:id])
   @parent = Page.find(params[:page_id])
  end 
  
  def crop
    @simple = Simple.find(params[:simple_id])
    #@album = @upload.album
    @page = Page.find(params[:page_id])
    render :layout => "crop"
  end
  def update
     @simple = Simple.find(params[:id])
     @page = Page.find(params[:page_id])

     if @simple.update_attributes(params[:simple])       
       if params[:simple][:image].blank?
        redirect_to admin_page_path(@page), :notice => "Successfully updated set."
       else
        redirect_to admin_page_simple_crop_path(@page.id,@simple.id)               
       end
      else 
        render :action => 'edit'
      end    
  end
  
  def destroy
     @simple = Simple.find(params[:id])
     @parent = Page.find(params[:page_id])
      @simple.destroy
      redirect_to admin_page_path(@parent), :notice => "Successfully destroyed post."
  end
end
