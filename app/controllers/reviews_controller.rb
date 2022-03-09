class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @order = Order.find(params[:order_id])
    @item = @order.order_items.where(order_id: @order.id)
    @service = Service.where(id: @item[0].service_id)[0]
    # raise
  end

  def create
    @review = Review.new(review_params)
    @review.client = current_user
    @review.seamstress = Order.find(params[:order_id]).seamstress
    @review.service = @services[0]
    if @review.save
      redirect_to user_path(@review.seamstress)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
