class Admin::BaseController < ApplicationController
  before_action :check_login
  before_action :check_admin

  def check_login
    unless user_signed_in?
      flash[:danger] = t "please_login"
      redirect_to new_user_session_path
    end
  end

  def check_admin
    unless current_user.admin?
      flash[:danger] = t "you_not_admin"
      redirect_to root_url
    end
  end
end
