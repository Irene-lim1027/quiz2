# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.destroy_all
User.destroy_all


PASSWORD = 'apples'



10.times do 
  first_name=Faker::Name.first_name
  last_name=Faker::Name.last_name

    User.create(
      first_name:first_name,
      last_name: last_name,
      email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
      password: PASSWORD
      )
end

users=User.all


100.times do
     created_at = Faker::Date.backward(days:365)

       Idea.create(
         title: Faker::Hacker.say_something_smart,
         description: Faker::Lorem.paragraph,
         created_at: created_at,
         updated_at: created_at,
         user: users.sample
         )
   end 

ideas = Idea.all


  ideas.each do |i|
    created_at = Faker::Date.backward(days:365)

  10.times do
    Review.create({
      body: Faker::Hacker.say_something_smart,
      created_at: created_at,
      updated_at: created_at,
      idea_id: i.id,
      user: users.sample
  })
  end
end

reviews = Review.all


puts Cowsay.say("Generated #{ideas.count} ideas", :dragon)
puts Cowsay.say("Generated #{users.count} users", :cow)
puts Cowsay.say("Generated #{reviews.count} reviews", :sheep)