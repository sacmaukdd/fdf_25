class StaticpagesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.page(params[:page]).per Settings.per_product
  end
end
