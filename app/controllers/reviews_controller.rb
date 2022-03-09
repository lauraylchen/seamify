class ReviewsController < ApplicationController
  def new
    @review = Review.new
    define_service
     # raise
  end

  def create
    @review = Review.new(review_params)
    @review.client = current_user
    @review.seamstress = Order.find(params[:order_id]).seamstress
    @review.service = define_service
    # raise
    if @review.save
      redirect_to user_path(@review.seamstress)
    else
      render :new
    end
  end

  private

  def define_service
    @order = Order.find(params[:order_id])
    @item = @order.order_items.first
    @service = @item.service
    @service.name
  end
 
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
