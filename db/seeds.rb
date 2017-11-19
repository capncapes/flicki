require 'random_data'

# Create Users
15.times do
    User.create!(
        email: RandomData.random_email,
        password: RandomData.random_word + "abc"
    )
end

# Create Wikis
50.times do
    Wiki.create!(
        title: RandomData.random_movie_title,
        director: RandomData.random_name,
        year: RandomData.random_year,
        description: RandomData.random_paragraph,
        private: [true, false].sample,
        user_id: User.find(:all).sample
    )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"