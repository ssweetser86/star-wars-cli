class Film

    @@all = []

    attr_accessor :name, :director, :crawl, :id

    def initialize(name, director, crawl, id)
        @name = name
        @director = director
        @crawl = crawl
        @id = id
        @@all << self
    end

    def self.all
        @@all
    end

end