require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

25.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
    )
end
items = Item.all 

member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{Item.count} items created"
puts "#{User.count} users created"