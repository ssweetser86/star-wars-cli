class Character

    @@all = []

    attr_accessor :name, :dob, :homeworld, :films

    def initialize(name, dob, homeworld, films)
        @name = name
        @dob = dob
        @homeworld = homeworld
        @films = films
        @@all << self
    end

    def self.all
        @@all
    end

end