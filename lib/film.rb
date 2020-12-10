class Film

    @@all = []

    attr_accessor :name, :director, :crawl

    def initialize(name, director, crawl)
        @name = name
        @director = director
        @crawl = crawl
        @@all << self
    end

    def all
        @@all
    end

end