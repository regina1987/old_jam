# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all
User.delete_all

User.create([{ name: 'Alice', email: 'alice@com', password: 123456 },
            { name: 'Bob', email: 'bo@com', password: 123456},
            {name: 'James', email: 'james@com', password: 123456}])

10.times do
  rand = rand(0..7)
  user = User.order('RANDOM()').first
  post = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraphs,
    image: Faker::LoremPixel.image(size: '300x200'),
    user: user
  )
  rand.times do
    post.comments.create(
      content: Faker::Lorem.sentence(word_count: 3),
      user: User.where.not(id: user.id).order('RANDOM()').first
    )
  post.save
  end
end
