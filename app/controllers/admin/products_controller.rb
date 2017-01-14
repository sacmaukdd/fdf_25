class Admin::ProductsController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_category, only: [:new, :edit]

  def index
    if params[:select]
      if params[:select] == Settings.all
        @products = Product.order_alphabet.page(params[:page])
          .per Settings.per_page
      elsif params[:select] == Settings.suggest
        @products = Product.get_product_by_suggest.order_alphabet
          .page(params[:page]).per Settings.per_page
      else params[:select] == Settings.admin
        @products = Product.get_product_by_admin.order_alphabet
          .page(params[:page]).per Settings.per_page
      end
      respond_to do |format|
        format.js
      end
    end
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
    end
    render "_form_product"
  end

  def update
    if params[:check_suggest].to_i == Settings.check_suggest
      @product.update temp: Settings.accept
      @products = Product.get_product_by_suggest.order_alphabet
        .page(params[:page]).per Settings.per_page
      respond_to do |format|
        format.js
      end
    elsif @product.update_attributes product_params
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
      :category_id, :picture, :temp
  end

  def load_category
    @categories = Category.all
  end
end
