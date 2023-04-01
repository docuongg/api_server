class Order < ApplicationRecord
  has_many :purchased_products

  accepts_nested_attributes_for :purchased_products
end
