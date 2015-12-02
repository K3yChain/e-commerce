class CartedProductsController < ApplicationController

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    @subtotal = calculate_subtotal(@carted_products)
    @tax = calculate_tax(@carted_products)
    @total = @subtotal + @tax
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity]
    @carted_product = CartedProduct.new(quantity: quantity, product_id: @product.id, status: "carted", user_id: current_user.id)
    if @carted_product.save
      flash[:success] = "#{quantity} #{@product.name}(s) have been added to your shopping cart."
      redirect_to "/"
    else
      render template: "products/show"
    end
  end

end
