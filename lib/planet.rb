class Planet

    @@all = []

    attr_accessor :name, :population, :id, :residents

    def initialize(name, population, residents, id)
        @name = name
        @population = population
        @id = id
        @residents = residents
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.find_or_create_new(name, population, residents, id)
    #     self.all.each do |p|
    #         return nil if p.name == name
    #     end
    #     self.new(name, population, residents, id)
    # end

    def self.find_by_id(id)
        self.all.each do |p|
            return p.name if p.id == id
        end
    end
end