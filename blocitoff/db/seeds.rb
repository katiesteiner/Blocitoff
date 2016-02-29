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

member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!

25.times do
  item = Item.create!(
    user: member,
    name: Faker::Lorem.sentence,
    )
  item.update_attribute(:created_at, rand(1.year).ago)
end
items = Item.all

25.times do
  item = Item.create!(
    user: member,
    name: Faker::Lorem.sentence,
    )
  item.update_attribute(:created_at, rand(1.day).ago)
end
items = Item.all



puts "Seed finished"
puts "#{Item.count} items created"
puts "#{User.count} users created"