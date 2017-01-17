class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger]= t "product_not_found"
      redirect_to request.referrer
    end
    @comment = Comment.new
  end
end
