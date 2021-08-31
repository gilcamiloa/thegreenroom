# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Venue.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Venue.table_name)

5.times do
  user = User.new(
    {
      email: Faker::Internet.email,
      username: Faker::Name.name,
      band_name: Faker::DcComics.villain,
      password: Faker::ChuckNorris.fact,
      is_band: true,
      band_description: Faker::Hipster.sentence
    }
  )
  user.save!

  venue = Venue.new(
    {
      user: user,
      description: Faker::Hipster.sentence,
      name: Faker::Hipster.word,
      capacity: Faker::Number.number(digits: 3),
      address: Faker::Address.full_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      available_dates: [Faker::Date.forward(days: 9), Faker::Date.forward(days: 12), Faker::Date.forward(days: 15)]
    }
  )
  venue.save!
end
