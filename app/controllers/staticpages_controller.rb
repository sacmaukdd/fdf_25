class StaticpagesController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.search params[:q]
    @products = @q.result.page(params[:page]).per Settings.per_product
  end
end
