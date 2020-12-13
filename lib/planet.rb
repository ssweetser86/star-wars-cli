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

    def self.find_or_create_new(name, population, id)
        self.all.each do |p|
            return nil if p.name == name
        end
        self.new(name, population, id)
    end

    def self.find_by_id(id)
        self.all.each do |p|
            return p.name if p.id == id
        end
    end
end