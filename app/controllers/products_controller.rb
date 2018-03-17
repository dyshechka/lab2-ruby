class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def add_item
    product_id = params.permit(:product_id)[:product_id]
    quantity = params.permit(:quantity)[:quantity].to_i
    product = Product.find(product_id)
    order = current_user.orders.where(is_done: false).last
    if order.nil?
      order = current_user.orders.new
    end
    item = order.order_items.where(product: product).first
    if item.nil?
      item = order.order_items.new
      item.product = product
      item.quantity = quantity
    else
      item.quantity = item.quantity + quantity
    end
    item.save
  end
end
