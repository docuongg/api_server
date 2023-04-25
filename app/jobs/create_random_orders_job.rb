require 'faker'

class CreateRandomOrdersJob < ApplicationJob

  def perform
    num_orders = rand(1..5)

    (1..num_orders).each do |id|
      Order.create!(
          description: Faker::Movie.quote,
          total_price: rand(200..400),
          status: rand(0..4),
          user_id: rand(1..10),
          # created_at: Faker::Time.between(from: 1.months.ago, to: Time.now),
      )
    end
  end
end