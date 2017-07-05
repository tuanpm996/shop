class Cart < ApplicationRecord
  has_many :cartItems, class_name: "CartItem",
                      foreign_key: "cart_id",
                      dependent: :destroy
  has_many :products, through: :cartItems, source: :product
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :cartItems, allow_destroy: true
end
