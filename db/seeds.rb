# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password)
end

Pattern.create(user_id: 1, name: "Prayer Shawl", content: "Knit, knit and then knit some more.")
Pattern.create(user_id: 2, name: "Knit Afghan", content: "Knit and then knit some more and then purl.")
Pattern.create(user_id: 2, name: "Knit Scarf", content: "Knit until you get a scarf about 50 inches long.")
Pattern.create(user_id: 3, name: "Blanket", content: "Knit for a very long time.")
Pattern.create(user_id: 7, name: "Mittens", content: "Knit in a round and then make the thumb.")

Needle.create(us_size: "8", name: "24 inch circular", pattern_id: 1)
Needle.create(us_size: "7", name: "16 inch circular", pattern_id: 2)
Needle.create(us_size: "2", name: "straight", pattern_id: 3)
Needle.create(us_size: "10", name: "24 inch circular", pattern_id: 4)
Needle.create(us_size: "5", name: "Double Pointed", pattern_id: 5)

Yarn.create(name: "Sport Wool", weight: "Worsted", quantity: 10, pattern_id: 1)
Yarn.create(name: "Lion Brand Wool", weight: "Sport", quantity: 5, pattern_id: 2)
Yarn.create(name: "Red Heart Acyrlic", weight: "Boucle", quantity: 7, pattern_id: 3)
Yarn.create(name: "Sport Wool", weight: "Worsted", quantity: 8, pattern_id: 4)
Yarn.create(name: "Virgin Wool", weight: "Worsted", quantity: 4, pattern_id: 5)
