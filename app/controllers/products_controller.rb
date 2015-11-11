class ProductsController < ApplicationController

def products
  @productlist = Product.all
end

end
