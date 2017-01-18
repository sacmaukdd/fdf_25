class CartsController < ApplicationController
  def index
    @cart = session[:cart] ? session[:cart] : Hash.new
    get_product_cart
  end

  def new
    session[:cart] = nil
    redirect_to carts_path
  end

  def create
    id = params[:product_id]
    session[:cart] = session[:cart] ||= Hash.new
    quantity = params[:quantity].to_i
    @cart = session[:cart]
    quantity_change = params[:quantity_change].to_i + @cart[id].to_i
    if quantity > 0
      @cart[id] = quantity
    elsif quantity_change > 0
      @cart[id] = quantity_change
    else quantity_change < 1
      flash[:danger] = t "add_error"
    end
    get_product_cart
    respond_to do |format|
      format.js
    end
  end

  def destroy
    session[:cart].delete params[:id]
    flash[:success] = t "del_complete"
    redirect_to carts_path
  end

  def get_product_cart
    @products = @cart.map {|id, quantity| [Product.find_by(id: id), quantity]}
  end
end
