class ProductsController < ApplicationController

def index
  if params[:view] == "discounted"
    @products = Product.where("price < ?", 50)
  else
    @products = Product.all
  end
end

def new
end

def create
  name = params[:name]
  image = params[:image]
  price = params[:price]
  description = params[:description]
  Product.create(name: name, image: image, price: price, description: description)
  redirect_to "/products/#{}"
  flash[:success] = "Product Created: #{name}"
end

def show
  id = params[:id]
  @product = Product.find_by(id: id)
end

def edit
  id = params[:id]
  @product = Product.find_by(id: id)
end

def update
  id = params[:id]
  product = Product.find_by(id: id)

  name = params[:name]
  image = params[:image]
  price = params[:price]
  description = params[:description]
  product.update(name: name, image: image, price: price, description: description)
  flash[:success] = "Product Updated: #{name}"
  redirect_to "/products/#{product.id}"
end

def destroy
  id = params[:id]
  product = Product.find_by(id: id)
  product.destroy
  redirect_to "/products"
  flash[:danger] = "Product Deleted: #{product.name}"
end
end