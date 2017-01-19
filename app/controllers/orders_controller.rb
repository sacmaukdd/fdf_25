class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = current_user.orders.order_date_desc
    .page(params[:page]).per Settings.per_page
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build order_params
    if @order.save
      add_order_item
      flash[:success] = t "order_complete"
    else
      flash[:danger] = t "order_not_complete"
    end
      redirect_to orders_path
  end

  def show
    @order_items = @order.order_items
  end

  def destroy
    if @order.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "del_not_complete"
    end
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit :name, :phone, :address
  end

  def add_order_item
    @cart = session[:cart]
    @items = @cart.map {|id, quantity| [id, Product.find_by(id: id).price, quantity]}
    @items.each do |product_id, price, quantity|
      order_item = @order.order_items.create product_id: product_id,
        price: price, total_price: price * quantity, quantity: quantity
      unless order_item
        flash[:danger] = t "not_create_order_item"
      end
      session[:cart] = nil
      flash[:success] = t "order_item_create"
    end
    @order.total_price = Accounting.order_cost @order.order_items
    @order.save
  end
end
