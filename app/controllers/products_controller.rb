class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

def index
  @categories = Category.all
  if params[:view] == "discounted"
    @products = Product.get_discounted
  elsif params[:view] == "order_by_price"
    @products = Product.order(:price)
  elsif params[:view] == "order_by_price_desc"
    @products = Product.order(price: :desc)
  elsif params[:category]
    @products = Category.find_by(name: params[:category]).products
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
  if current_user && current_user.admin?
  @product = Product.new
  else
    redirect_to "/"
  end
end

def create
  @product = Product.new(id: params[:id], name: params[:name], price: params[:price], description: params[:description], rating: params[:rating], user_id: current_user.id)
  if @product.save
  flash[:success] = "Product made!"
  redirect_to "/products/#{@product.id}"
  else
    render :new
  end
end

def show
  id = params[:id]
  @product = Product.find_by(id: id)
  @carted_product = CartedProduct.new
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