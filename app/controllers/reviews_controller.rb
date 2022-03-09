class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @order = Order.find(params[:order_id])
  end

  def create
    @review = Review.new(review_params)
    @review.client = current_user
    @review.seamstress = Order.find(params[:order_id]).seamstress
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
