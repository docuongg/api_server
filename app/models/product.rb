class Product < ApplicationRecord
  belongs_to :category
  has_many :purchased_products, dependent: :destroy
  has_many :orders, through: :purchased_products
end
