class Admin::PicturesController <  Admin::BaseController
  def crop
    @picture = Picture.find(params[:picture_id])
    @gallery = Gallery.find(params[:gallery_id])
    render :layout => "crop"
  end

  def create 
    @picture = Picture.new(params[:picture])
    @gallery = Gallery.find(params[:gallery_id])
    if @picture.save
         redirect_to admin_gallery_picture_crop_path(@picture.gallery.id,@picture.id)               
    else
      flash.now[:notice] = 'Upload was not created'
      render nil => true #:controller => "galleries",:action => 'show', :id=>@gallery.id
    end
  end
  
    def update
       @picture = Picture.find(params[:id])
       #@upload = Upload.find(params[:upload_id])
       @gallery = @picture.gallery
      
       if @picture.update_attributes(params[:picture])
         redirect_to admin_gallery_path(@gallery), :notice => "Successfully updated picture."
       else
         render :action => 'crop'
        end
    end
    
    def destroy
       @picture = Picture.find(params[:id])
         @picture.destroy
         redirect_to admin_gallery_url(@picture.gallery.id), :notice => "Successfully destroyed picture."
    end
end
