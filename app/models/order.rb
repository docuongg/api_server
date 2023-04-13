class Order < ApplicationRecord
  has_many :purchased_products

  accepts_nested_attributes_for :purchased_products

  enum status: {pending: 0, confirm: 1, shipping: 2, received: 3, canceled: 4}

  scope :find_by_day, -> (day) {where(created_at: day.beginning_of_day..day.end_of_day)}
  scope :find_by_month, -> (month) {where(created_at: month.beginning_of_month..month.end_of_month)}
  scope :find_by_year, -> (year) {where(created_at: year.beginning_of_year..year.end_of_year)}

end
