class  Admin::CategoriesController <  Admin::BaseController
  def index
    @categories = Category.find_main
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @category.build_metatag
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @category.build_metatag if @category.metatag.blank?
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url, :notice => "Successfully destroyed category."
  end
end
