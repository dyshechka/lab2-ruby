class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def done
    order_id = params.permit(:order_id)[:order_id]
    order = current_user.orders.find(order_id)
    order.is_done = true
    order.save
    redirect_to orders_index_path
  end
end
