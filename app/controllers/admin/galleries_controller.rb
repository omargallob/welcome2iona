class  Admin::GalleriesController < Admin::BaseController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @picture = Picture.new
  end

  def new
    @gallery = Gallery.new
    @gallery.pictures.build 
    @categories =  Category.find_sub(10)
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to admin_gallery_path(@gallery), :notice => "Successfully created gallery."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    
    @categories =  Category.find_sub(10)
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to  admin_gallery_path(@gallery), :notice  => "Successfully updated gallery."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to admin_galleries_url, :notice => "Successfully destroyed gallery."
  end
end
