class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    tax = product.tax * quantity
    subtotal = product.price * quantity
    total = tax + subtotal
    Order.create(quantity: quantity, user_id: current_user.id, product_id: product.id, subtotal: subtotal, tax: tax, total: total )
    redirect_to "/orders/#{order.id}"
  end

  def show
    id = params[:id]
    @order = Order.find_by(id: id)

  end

end