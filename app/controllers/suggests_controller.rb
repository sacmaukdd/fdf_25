class SuggestsController < ApplicationController
  before_action :load_product, only: [:edit, :update]

  def index
    @products = Product.get_suggest_by_user current_user.id
  end

  def new
    @product = Product.new
    render "_form_suggest"
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "suggest_success"
      @product.update temp: Settings.approve
      redirect_to suggests_path
    else
      flash[:danger] = t "suggest_not_create"
      render :new
    end
  end

  def edit
    render "_form_suggest"
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "update_product_success"
      redirect_to suggests_path
    else
      flash[:danger] = t "product_not_update"
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit :name, :picture, :price, :id_user_suggest
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "product_not_found"
      redirect_to request.referrer
    end
  end
end
