class Admin::UploadsController < Admin::BaseController
  def new
    @album = Album.find(params[:album_id])
    @upload = @album.uploads.build
  end

  def edit
  end

  def crop
    @upload = Upload.find(params[:upload_id])
    @album = @upload.album
    @post = Post.find(params[:post_id])
    render :layout => "crop"
  end

  def create 
    @upload = Upload.new(params[:upload])
    @album = @upload.album
    if @upload.save
     redirect_to admin_post_album_upload_crop_path(@upload.album.albumable_id,@upload.album.id,@upload.id)
    else
      flash.now[:notice] = 'Upload was not created.'
      render :action => 'new'
    end

  end 
  def update
     @upload = Upload.find(params[:id])
     #@upload = Upload.find(params[:upload_id])
     @album = @upload.album
     @post = Post.find(params[:post_id])
     if @upload.update_attributes(params[:upload])       
        redirect_to admin_post_path(@post), :notice => "Successfully updated post."
      else 
        render :action => 'crop'
      end
    
  end
  
  def destroy
     @upload = Upload.find(params[:id])
     @upload.remove_image!
       @upload.destroy
       redirect_to admin_post_url(@upload.album.albumable_id), :notice => "Successfully destroyed upload."
  end
    
end
