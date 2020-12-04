class CartItem < ApplicationRecord
    belongs_to :customers
    belongs_to :items
    
    validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
