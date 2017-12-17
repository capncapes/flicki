require 'random_data'
require 'faker'

# Create Users
15.times do
    User.create!(
        email: Faker::Internet.unique.safe_email,
        password: Faker::Lorem.characters(10)
    )
end

# Create Wikis
50.times do
    Wiki.create!(
        title: RandomData.random_movie_title,
        director: Faker::Name.name,
        year: RandomData.random_year,
        description: Faker::Lorem.paragraph(10),
        private: [true, false].sample,
        user_id: User.all.sample
    )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"