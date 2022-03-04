class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @seamstress = @order.seamstress
    @services = @order.order_items.map(&:service)
    @total = 0
    @services.each do |s|
      @total += s.price
    end
  end

  def create
    @order = Order.new(order_params)
    @seamstress = User.find(params[:user_id])
    @order.client = current_user
    @order.seamstress = @seamstress
    if @order.save
      redirect_to order_path(@order)
    else
      @errors = @order.errors.messages
      @message = @errors.values.flatten[0]
      render "users/show"
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: [:service_id])
  end
end
