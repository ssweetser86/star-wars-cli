class Character

    @@all = []

    attr_accessor :name, :dob, :homeworld

    def initialize(name, dob, homeworld)
        @name = name
        @dob = dob
        @homeworld = homeworld
        @@all << self
    end

    def all
        @@all
    end

end