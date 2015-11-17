class Product < ActiveRecord::Base

def product_list
end

def friendly_created_at
  return created_at.strftime("%B %e, %Y")
end

def sale_message
  if price.to_i < 2
    " Discount Item!"
    discount = 1
  else
    " On Sale!"
  end
end

def tax
  tax = price.to_f * 0.09
end

def total
  total = price + tax
end


end


# Create a model method called sale_message that does as follows: If an item is under $2, it returns the string “Discount Item!” - otherwise, it should return the string “On Sale!” Then, have this message appear on the product’s show page.