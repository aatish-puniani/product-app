class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      user_id: current_user.id
    )
    flash[:success] = "Order created"
    redirect_to "/orders/#{@order.id}"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    # @order = Order.find_by(id: params[:id])
  end
end