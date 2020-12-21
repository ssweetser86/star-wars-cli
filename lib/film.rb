class Film

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

    def self.find_by_id(id)
        self.all.each do |f|
            return f.name if f.id == id
        end
    end

end