class Admin::OrdersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @waiting_orders = Order.waiting.order_date_desc
    .page(params[:page]).per Settings.per_page
    @accepted_orders = Order.accepted.order_date_desc
    .page(params[:page]).per Settings.per_page
    @rejected_orders = Order.rejected.order_date_desc
    .page(params[:page]).per Settings.per_page
  end

  def update
    @order.update_attributes status: params[:value]
    if @order.save
      flash[:success] = t "cuccess"
    else
      flash[:danger] = t "not_cuccess"
    end
    redirect_to :back
  end
end
