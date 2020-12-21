class Planet

    extend Findable

    @@all = []

    attr_accessor :name, :population, :id, :residents

    def initialize(name, population, residents, id)
        self.name = name
        self.population = population
        self.id = id
        self.residents = residents
        @@all << self
    end

    def self.all
        @@all
    end
  
end