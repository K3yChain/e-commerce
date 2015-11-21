class ProductsController < ApplicationController

def index
  if params[:view] == "discounted"
    @products = Product.where("price < ?", 50)
  elsif params[:view] == "low_price"
    @products = Product.order(price: :asc)
  elsif params[:view] == "high_price"
    @products = Product.order(price: :desc)
  elsif params[:view] == "random"
    @products = Product.order("RAND()")
  else
    @products = Product.all
  end
end

def search
    search_term = params[:search]
    @products = Product.where("name LIKE '%#{search_term}%' OR description LIKE '%#{search_term}%'")
    render :index
end

def new
end

def create
  name = params[:name]
  image = params[:image]
  price = params[:price]
  description = params[:description]
  inventory = params[:inventory]
  Product.create(name: name, image: image, price: price, description: description, inventory: inventory)
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
  inventory = params[:inventory]
  product.update(name: name, image: image, price: price, description: description, inventory: inventory)
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