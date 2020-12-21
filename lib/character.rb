class Character

    extend Findable

    @@all = []

    attr_accessor :name, :dob, :homeworld, :films, :id

    def initialize(name, dob, homeworld, films, id)
        self.name = name
        self.dob = dob
        self.homeworld = homeworld
        self.films = films
        self.id = id
        @@all << self
    end

    def self.all
        @@all
    end

end