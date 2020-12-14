
class API

    def initialize
        compile_characters
        compile_others
    end

    def get_data(url = "https://swapi.dev/api/people/?page=1")
        response = HTTParty.get(url)
        data = JSON.parse(response.body)
        return data
    end

    def compile_characters
        sw = get_data
        #data = []
        while sw["next"] != nil
            print ". "
            sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"], v["url"]) }
            sw = get_data(sw["next"])
        end
        sw["results"].each { |v| Character.new(v["name"], v["birth_year"], v["homeworld"], v["films"], v["url"]) }

    end

    def compile_others
        print "\n\n\nAlmost there."
        sw = get_data("https://swapi.dev/api/planets/")
        while sw["next"] != nil
            print ". "
            sw["results"].each { |v| Planet.new(v["name"], v["population"], v["residents"], v["url"]) }
            sw = get_data(sw["next"])
        end
        sw["results"].each { |v| Planet.new(v["name"], v["population"], v["residents"], v["url"]) }
        films = get_data("https://swapi.dev/api/films/")
        films["results"].each do |film|
            Film.new(film["title"], film["director"], film["opening_crawl"], film["url"])
        end
    end

end
