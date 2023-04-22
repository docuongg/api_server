# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..10).each do |id|
  User.create!(
      full_name: Faker::Name.name,
      user_name: Faker::Internet.email.split('@')[0],
      email: Faker::Internet.email,
      address: Faker::Movie.quote,
      password: "Cuongptit1.", 
      password_confirmation: "Cuongptit1.",
  )
end

(1..8).each do |id|
  Category.create!(
      name: Faker::Name.name,
      description: Faker::Movie.quote,
      thumbnail_url: Faker::Avatar.image
  )
end

(1..40).each do |id|
  Product.create!(
      name: Faker::Name.name,
      description: Faker::Movie.quote,
      thumbnail_url: Faker::Avatar.image,
      category_id: rand(1..8),
      price: rand(100..200)
  )
end

(1..100).each do |id|
  Order.create!(
      description: Faker::Movie.quote,
      total_price: rand(200..400),
      status: rand(0..4),
      user_id: rand(1..10),
      created_at: Faker::Time.between(from: 1.months.ago, to: Time.now),
  )
end

(1..400).each do |id|
  PurchasedProduct.create!(
      product_id: rand(1..40),
      order_id: rand(1..100),
      price: rand(100..200)
  )
end
