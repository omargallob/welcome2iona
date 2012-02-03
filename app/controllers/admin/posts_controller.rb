class  Admin::PostsController <  Admin::BaseController
  # before_filter :set_navigation
  # authorize_resource
  def index
    @posts = Post.order("created_at desc").all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.albums.build
    #   @post.documents.build
    @categories = Category.find_main
    @post.build_metatag
    @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      if params[:post][:image].blank?
        redirect_to admin_post_path(@post), :notice => "Successfully created post."
      else
        redirect_to admin_post_crop_path(@post)
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.albums.count == 0
      @post.albums.build  
    end
    @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}
    # @post.build_metatag if @post.metatag.blank?
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      if params[:post][:image].blank?
        redirect_to admin_post_path(@post), :notice => "Successfully updated post."
      else
        redirect_to admin_post_crop_path(@post)
      end
      
    else
      @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_url, :notice => "Successfully destroyed post."
  end


  
  def set_navigation
    current_navigation :posts
  end
  
  def crop
    @post = Post.find(params[:post_id])
        render :layout => "crop"
  end

  def update_categories
    unless params[:id].blank?
      @subcategory  = Category.find(params[:id])
      @category = @subcategory.parent
      @subcategories = @category.subcategories   
    end 
    respond_to do |format|
      format.js 
    end   
  end

  def crop_update
    @post = Post.find(params[:id])
    @post.crop_x  = params[:post]["crop_x"]
    @post.crop_y  = params[:post]["crop_y"]

    @post.crop_h = params[:post]["crop_h"]
    @post.crop_w = params[:post]["crop_w"]
    @post.save
    redirect_to :action => 'update', :id =>@post.id
    # @picture.crop(params[:picture]["crop_x"].to_i,params[:picture]["crop_y"].to_i,params[:picture]["crop_h"].to_i,params[:picture]["crop_w"].to_i)
    #redirect_to admin_post_path(@post)
  end  
end
