class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :carted_products

  # validates :tax, :subtotal, :total, presence: true

  validate :at_least_one

 def at_least_one
    if quantity < 1
      errors.add(:quantity, "Hey, you need to only input 5, then it will be hella good.")
    end
  end

end
