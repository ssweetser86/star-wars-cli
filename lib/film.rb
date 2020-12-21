class Film

    extend Findable

    @@all = []

    attr_accessor :name, :director, :crawl, :id

    def initialize(name, director, crawl, id)
        self.name = name
        self.director = director
        self.crawl = crawl
        self.id = id
        @@all << self
    end

    def self.all
        @@all
    end

end