class Admin::ProductsController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_category, only: [:new, :edit]

  def index
    @products = Product.order_alphabet.page(params[:page]).per Settings.per_page
  end

  def new
    @product = Product.new
    render "_form_product"
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "add_product_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "product_not_create"
      render :new
    end
  end

  def edit
    @category = Category.find_by id: @product.category_id
    unless @category
      flash[:danger] = t "category_not_found"
      redirect_to request.referrer
    end
    render "_form_product"
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "update_product_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "product_not_update"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "delete_error"
    end
      redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :price, :classify,
      :category_id, :picture
  end

  def load_category
    @categories = Category.all
  end
end
