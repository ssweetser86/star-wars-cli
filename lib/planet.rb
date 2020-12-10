class Planet

    @@all = []

    attr_accessor :name, :population

    def initialize(name, population)
        @name = name
        @population = population
        @@all << self
    end

    def all
        @@all
    end

end