module RandomData
    def self.random_email
        "#{random_word}@#{random_word}.#{random_word}"
    end
    
    def self.random_movie_title
        article = ["A", "The"].sample
        adj = ["Lonely", "Courageous", "Diligent", "Sensible", "Boorish", "Cantankerous", "Cunning", "Cynical", "Miserly", "Surly", "Vulgar"].sample
        noun = ["Man", "Woman", "American", "Dog", "Elephant", "Athlete", "Reporter", "President", "Programmer", "Salesman", "Chef", "Politician"].sample
        "#{article} #{adj} #{noun}"
    end
    
    def self.random_user_id
        User.all.sample
    end
    
    def self.random_name
        first_name = random_word.capitalize
        last_name = random_word.capitalize
        "#{first_name} #{last_name}"
    end
    
    def self.random_word
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0, rand(3..8)].join
    end
    
    def self.random_sentence
        strings = []
        rand(3..8).times do
            strings << random_word
        end
        sentence = strings.join(" ")
        sentence.capitalize << "."
    end
    
    def self.random_paragraph
        sentences = []
        rand(1..4).times do
            sentences << random_sentence
        end
        sentences.join(" ")
    end
    
    def self.random_year
        current_year = Date.today.year
        rand(1900..current_year)
    end
end