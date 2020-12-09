class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item

    validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
