# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do
  Tag.create ({name: Faker:: GameOfThrones.house})
end

tags = Tag.all

10.times do
  Category.create({ title:     Faker::Book.genre })
end

5.times do
  User.create ({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    email: Faker::Internet.email, password: "123"})
  end

  users = User.all

puts Cowsay.say('Generated 10 categories', 'random')



10.times do
  p = Post.create({ title: Faker::Book.title,
                    body: Faker::Hipster.paragraph,
                    tags: tags.sample(rand(3) + 1),
                    category_id: rand(10) + 1
                    })
p.stars = users.map{|u| Star.new(star_count: rand(6), user: u, post: p)}
end

puts Cowsay.say('Generated 100 posts', 'random')
