# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS_TO_CREATE = 10_000

USERS_TO_CREATE.times do |i|
  puts "Creating user #{i + 1} out of #{USERS_TO_CREATE}" if (i % 100).zero?

  user = User.create phone_number: Faker::Number.number(10),
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    name: Faker::Name.name,
                    last_outbound_message_at: Time.now,
                    last_inbound_message_at: rand(27).hours.ago,
                    hour_to_send_message: 20 - rand(12)

  next unless user.persisted?

  user.create_subscription active: rand(4).zero? ? false : true

  user.create_contact phone_number: Faker::Number.number(10),
                      name: Faker::Name.name

  rand(100).times { user.inbound_messages.create from: user.phone_number, to: '+17039442823', text: Faker::Lorem.characters(rand 160)}
end
