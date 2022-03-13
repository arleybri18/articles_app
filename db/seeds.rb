# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users and articles

20.times do |_|
  u = User.create(name: Faker::Name.name)
  u.articles.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraphs(number: 3).join())
end

# Add comments
Article.all.each do |article|
  u = User.all.shuffle.first
  article.comments.create(message: Faker::Lorem.sentence(word_count: 3), user: u)
end
