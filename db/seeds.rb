# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

99.times do
  User.create({ first_name: Faker::Name.first_name ,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: 'qqqqqq',
                    password_confirmation: 'qqqqqq',
                    image: "http://coyotechronicle.net/wp-content/uploads/2015/02/facebook-logo.jpeg"
                  })
end
users = User.all

puts Cowsay.say 'Created 100 users', :dragon
