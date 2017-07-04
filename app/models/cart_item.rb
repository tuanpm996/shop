class CartItem < ApplicationRecord
	belongs_to :cart, class_name: "Cart"
	belongs_to :product, class_name: "Product" 
	validates :cart_id,presence: true
	validates :product_id,presence: true
end
