class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "deleted"
      redirect_to users_path
    else
      flash[:danger] = t "error_destroy"
      redirect_to users_path
    end
  end
end
