# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..5).each do |id|
  Category.create!(
      name: Faker::Name.name,
      thumbnail_url: Faker::Avatar.image
  )
end

(1..20).each do |id|
  Product.create!(
      name: Faker::Name.name,
      thumbnail_url: Faker::Avatar.image,
      category_id: rand(1..5),
      price: rand(100.200)
  )
end
