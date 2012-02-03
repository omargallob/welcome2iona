class Admin::UsersController < Admin::BaseController
  def index
    @users = Admin.all
  end

  def show
  end
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admin_users_url, :notice => "Successfully destroyed admin."
  end
end
