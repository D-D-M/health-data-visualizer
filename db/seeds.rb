# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
number_of_countries = 70

ISO3166::Country.all.shuffle.first(number_of_countries).each do |country|
  Country.create({name: country.name})
end

500.times do
  User.create({
    name: Faker::Name.name,
    age: rand(18..50),
    weight: rand(100..300),
    height: rand(155..210),
    gender: ['M', 'F'][rand(2)],
    country_id: rand(1..number_of_countries),
    created_at: rand(5.years.ago..Time.now),
  })
end
