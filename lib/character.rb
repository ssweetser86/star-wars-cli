class Character

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

    def self.find_by_id(id)
        self.all.each do |c|
            return c.name if c.id == id
        end
    end

end