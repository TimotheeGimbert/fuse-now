# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attendance.destroy_all
Event.destroy_all
User.destroy_all

cities = ['Bordeaux', 'Rennes', 'Bruxelles', 'Paris', 'Pornic', 'Liège', 'Toulouse']

timo = User.create(
  first_name:'Timo',
  last_name: 'Gim',
  email: 'tim33270@yopmail.com',
  password: 'blabla',
  description: "Timo est le CTO de FuseNow."
)

nono = User.create(
  first_name:'Nono',
  last_name: 'Ma',
  email: 'tim33271@yopmail.com',
  password: 'blublu',
  description: "Nono est la responsable communication du pôle évènementiel de FuseNow."
)

bdx_liege = Event.create(
  administrator: timo,
  title: 'Flight to LIEGE !!!',
  start_date: DateTime.new(2021,11,15,22,55,0),
  duration: 120,
  location: 'Bordeaux',
  price: 110,
  description: "On part à Liège passer une semaine intense avec Nono la responsable communication !"
)
Attendance.create(
  event: bdx_liege,
  user_id: timo.id,
  stripe_customer_id: "###########"
)

mandingue = Event.create(
  administrator: nono,
  title: 'Mandingue de toi',
  start_date: DateTime.new(2021,11,22,19,00,0),
  duration: 130,
  location: 'Liège',
  price: 11,
  description: "La danse africaine est pleine de tonus et de joie de vivre!"
)
puts mandingue.title

Attendance.create(
  event: mandingue,
  user_id: nono.id,
  stripe_customer_id: "###########"
)
Attendance.create(
  event: mandingue,
  user_id: timo.id,
  stripe_customer_id: "###########"
)

22.times do 
  faker_name = Faker::Name.first_name
  faker_user = User.create(
    first_name: faker_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email(name: faker_name),
    password: Faker::Internet.password(min_length: 8),
    description: Faker::Lorem.paragraph(sentence_count: 4)
  )
  puts faker_user
end

22.times do
  faker_event = Event.create(
  administrator: User.all[rand(0..User.all.length)],
  title: Faker::Lorem.sentence(word_count: 3, supplemental: true),
  start_date: Faker::Date.forward(days: rand(3..99)),
  duration: 5 * rand(1..35),
  location: cities[rand(0..cities.length)],
  price: rand(1..88),
  description: Faker::Lorem.paragraph(sentence_count: 2)
  )
  puts faker_event
end

44.times do 
  attendance = Attendance.create(
  event: Event.all[rand(0..Event.all.length-1)],
  user_id: User.all.reject{|u| u.first_name == 'Timo' || u.first_name == 'Nono'}[rand(0..User.all.length-3)].id,
  stripe_customer_id: "###########"
  )
  puts attendance
end