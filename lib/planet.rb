class Planet

    @@all = []

    attr_accessor :name, :population, :id

    def initialize(name, population, id)
        @name = name
        @population = population
        @id = id
        @@all << self
    end

    def self.all
        @@all
    end

end