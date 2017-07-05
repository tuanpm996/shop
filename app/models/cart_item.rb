class CartItem < ApplicationRecord
	belongs_to :cart, class_name: "Cart"
	belongs_to :product, class_name: "Product" 
	validates :cart_id,presence: true, :allow_nil => false
	validates :product_id,presence: true, :alow_nil => false
	validates :quantity,presence: true, :allow_nil => false
end
