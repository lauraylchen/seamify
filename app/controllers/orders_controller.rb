class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @seamstress = User.find(params[:user_id])
    @order.client = current_user
    @order.seamstress = @seamstress
    if @order.save
      redirect_to order_path(@order)
    else
      render "users/show"
    end
  end

  private

  def order_params
    params.require(:order).permit()
  end
end
