class Product < ApplicationRecord
  has_many :cartItems
  validates :name, presence: true, :allow_nil => false
  validates :description, presence: true, :allow_nil => false
  validates :price, presence: true, :allow_nil => false
end