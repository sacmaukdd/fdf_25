class Admin::CategoriesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @categories = Category.order_date_desc.page(params[:page]).per Settings.per_page
    @category = Category.new
  end

  def create
    was_created = false
    @category = Category.find_or_create_by category_params do
      was_created = true
    end
    if was_created
      flash[:success] = t "create_category"
    else
      flash[:danger] = t "category_exist"
    end
    redirect_to :back
  end

  def edit
    @categories = Category.all
  end

  def update
    @categories = Category.all
    if @category.update_attributes category_params
      flash[:success] = t "category_updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "not_delete"
    end
      redirect_to request.referrer
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
