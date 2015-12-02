class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  belongs_to :user
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products

  validates :price, :name, :description, :inventory, presence: true
  validates :price, :inventory, numericality: true

def product_list
end

def friendly_created_at
  return created_at.strftime("%B %e, %Y")
end

def tax
  tax = price * 0.09
end

def in_stock
  if inventory > 0
    " * In Stock! *"
  else
    " * Sold Out! *"
  end
end

def total
  total = price + tax
end


end


# Create a model method called sale_message that does as follows: If an item is under $2, it returns the string “Discount Item!” - otherwise, it should return the string “On Sale!” Then, have this message appear on the product’s show page.