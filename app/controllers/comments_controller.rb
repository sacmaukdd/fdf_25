class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :load_product, only: :update

  def create
    @comment = current_user.comments.build comment_params
    @product = @comment.product
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "comment_not_create"
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t "comment_update"
    else
      flash[:danger] = t "comment_not_update"
    end
      redirect_to product_path @product.id
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "comment_not_delete"
    end
      redirect_to request.referrer
  end

  private
  def comment_params
    params.require(:comment).permit :content, :product_id
  end

  def load_product
    @product = Product.find_by id: @comment.product_id
    unless @product
      flash[:danger] = t "product_not_found"
      redirect_to request.referrer
    end
  end
end
