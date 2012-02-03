class Admin::MapsController < Admin::BaseController
  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
  end

  def new
    @map = Map.new
    @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}    
  end

  def create
    @map = Map.new(params[:map])
    if @map.save
      redirect_to admin_map_path(@map), :notice => "Successfully created map."
    else
      render :action => 'new'
    end
  end

  def edit
    @map = Map.find(params[:id])
    @subcategories = Category.find_all_sub.map{|m|["#{m.parent.title} - #{m.title}",m.id]}    
  end

  def update
    @map = Map.find(params[:id])
    if @map.update_attributes(params[:map])
      redirect_to admin_map_path(@map), :notice  => "Successfully updated map."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to admin_maps_url, :notice => "Successfully destroyed map."
  end
end
