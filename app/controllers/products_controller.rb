class ProductsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: [:show, :destroy]

  def show
    @comment = Comment.new
  end

  def destroy
    if @product.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "delete_error"
    end
      redirect_to suggests_path
  end
end
