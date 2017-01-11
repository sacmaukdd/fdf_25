module ApplicationHelper
  def index_continue object, index, per_page
    (object.to_i - 1) * per_page.to_i + index + 1
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end
end
